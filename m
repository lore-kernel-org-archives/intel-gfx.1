Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C72C61DD3
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 03:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E0310E899;
	Wed,  2 Sep 2026 03:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c4GURqkA";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189B810E899
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 03:20:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 590316020B;
 Wed,  2 Sep 2026 03:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E438D1F00A3A;
 Wed,  2 Sep 2026 03:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788319256;
 bh=klv2mERNoVXnu0Hxh6l8k4ZzegE+n9hA8en/EKD5CQU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=c4GURqkAiQeDaP9YH1ATm+j8LaC35o86sPDIeU8ZAT4byH0VyHicS4ferVRh4FeUF
 /qb8ITIwJSsiG8FdUQTwDxBoG3HilyoqTTMoQxmzKtXPEdZFWqJbqwnlDLkdHlyz3X
 Ijv1EOoskXKSCddxzDcjKknpAHhYFyENauZNznMPEfnW4/mT3ffx0k/rZ5pvZ75vQD
 m5W/CkBJOXS76m2XlfrBjlXSxbrfih72V1d7haAbStG48aRXmJ624wxXshe39Aa1ur
 8MoXn5HePXZ0mpTvRbThPp+wsfPpX1iyw/KxZbBgSk5aKmkWcZFT8fjx5Jtu5ex19u
 kYhhrVgqbZ5Qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] drm/i915/display: send null DRM infoframe when
 ending HDR transmission
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260902030411.258603-1-xiaolu.xie@intel.com>
References: <20260901130649.237080-1-xiaolu.xie@intel.com>
 <20260902030411.258603-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 03:20:55 +0000
Message-Id: <20260902032055.E438D1F00A3A@smtp.kernel.org>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The logic to send a zeroed DRM infoframe fails to enforce the CTA-=
861-H 2-second duration, risks premature termination, and causes unintended=
 full modesets on subsequent atomic commits.
--

commit 1fa58c4612bfbba739489ee34fd7b6bc9eeeb05e
Author: Xiao Lu <xiaolu.xie@intel.com>
drm/i915/display: send null DRM infoframe when ending HDR transmission

This commit updates the driver to send a null DRM infoframe (EOTF=3D0) when
transitioning from HDR to SDR to comply with CTA-861-H. This prevents=20
DP-to-HDMI converters from latching previous HDR metadata on SDR content.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 113d767e62e9c..d5ed96ba7e7ba 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -3231,14 +3231,29 @@ intel_dp_in_hdr_mode(const struct drm_connector_s=
tate *conn_state)
>  static void
>  intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
>  					    struct intel_crtc_state *crtc_state,
> -					    const struct drm_connector_state *conn_state)
> +					    const struct drm_connector_state *conn_state,
> +					    const struct drm_connector_state *old_conn_state)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	int ret;
>  	struct hdmi_drm_infoframe *drm_infoframe =3D &crtc_state->infoframes.dr=
m.drm;
> =20
> -	if (!conn_state->hdr_output_metadata)
> +	if (!conn_state->hdr_output_metadata) {
> +		/*
> +		 * CTA-861-H requires ending HDR metadata transmission by
> +		 * sending a DRM infoframe with EOTF=3D0 and all fields zero
> +		 * for at least 2 seconds, rather than abruptly stopping.
> +		 * Abruptly stopping causes DP-to-HDMI converters to latch
> +		 * the previous HDR metadata and forward it to the HDMI sink,
> +		 * resulting in color errors on SDR content.
> +		 */
> +		if (old_conn_state && old_conn_state->hdr_output_metadata) {
> +			hdmi_drm_infoframe_init(drm_infoframe);
> +			crtc_state->infoframes.enable |=3D
> +				intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA);
> +		}

[Severity: High]
Does this logic correctly enforce the 2-second transmission requirement?=20

Since this ties the lifecycle of the zeroed DRM infoframe to atomic commit=
=20
boundaries rather than time, it appears the transmission could be terminate=
d=20
prematurely if userspace performs a subsequent atomic commit (such as a=20
cursor update) within 2 seconds. In that case, both old_conn_state->hdr=20
and conn_state->hdr would be false, so the DRM bit in=20
crtc_state->infoframes.enable would be computed as cleared.

Additionally, could this cause an unintended full modeset?=20

When that subsequent commit occurs, intel_pipe_config_compare() will check=
=20
the active hardware state (which still has the DRM bit set) against the new=
=20
state (which clears it). The mismatch might force a full screen blanking=20
for a simple SDR cursor update.

>  		return;
> +	}
> =20
>  	ret =3D drm_hdmi_infoframe_set_hdr_metadata(drm_infoframe, conn_state);
[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 8a019d3574df2..9fb9be302d35b 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
[ ... ]
> @@ -856,8 +856,25 @@ intel_hdmi_compute_drm_infoframe(struct intel_encode=
r *encoder,
>  	if (!crtc_state->has_infoframe)
>  		return true;
> =20
> -	if (!conn_state->hdr_output_metadata)
> +	if (!conn_state->hdr_output_metadata) {
> +		const struct drm_connector_state *old_conn_state =3D
> +			drm_atomic_get_old_connector_state(conn_state->state,
> +							   conn_state->connector);
> +		/*
> +		 * CTA-861-H requires ending HDR metadata transmission by
> +		 * sending a DRM infoframe with EOTF=3D0 and all fields zero
> +		 * for at least 2 seconds, rather than abruptly stopping.
> +		 * Abruptly stopping causes DP-to-HDMI converters to latch
> +		 * the previous HDR metadata and forward it to the HDMI sink,
> +		 * resulting in color errors on SDR content.
> +		 */
> +		if (old_conn_state && old_conn_state->hdr_output_metadata) {
> +			hdmi_drm_infoframe_init(frame);
> +			crtc_state->infoframes.enable |=3D
> +				intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM);
> +		}

[Severity: High]
The native HDMI path in intel_hdmi_compute_drm_infoframe() appears to share=
=20
the same lifecycle vulnerability as the DP path.=20

Without a timer or workqueue to manage the 2-second timeout, do we risk=20
prematurely aborting the infoframe and triggering unintended modesets on=20
subsequent SDR commits?

>  		return true;
> +	}
> =20
>  	crtc_state->infoframes.enable |=3D
>  		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902030411.2586=
03-1-xiaolu.xie@intel.com?part=3D1
