Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C709C61DD6
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 01:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8056910E3D9;
	Wed,  2 Sep 2026 01:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Knj6QFRF";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9C010E3D9
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 01:58:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7C8B543B7F;
 Wed,  2 Sep 2026 01:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7331F000E9;
 Wed,  2 Sep 2026 01:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788314320;
 bh=0IxTXEalaKT9+CSs84CNyFwTUVf3WJiIko2C8GgtmJg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Knj6QFRFpCkETXYpvya8rBKPYmYCWABP/6wiuS4P2JJfMxaWNRc93zTqu+WSJ0yoh
 f1Qr4osHNKDuyaTKweFm58X7uE+qS8eQ5COWhNtNTXyjefm0QH8ZxFkHgrSvE3UBvT
 wn8v+ifx/eYHHR+fdziB50gIFY0yljYf6Q2cqLGFfx66i9iA94O8xqGsQOuMokiAdw
 DZWfp49Jt0k3SBJeZKOyEitO5hbuW7GprP6HFstnw36ifGfkOcUcTzQ3OL855c+FSL
 aG/1uKqP+ffZIL6H+qoiGtxQxa7Qj5Kbi5om9tPz7iXq5Xcyj+SWT6lYqICAOWrl9k
 87WRoSuTJv5Yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/i915/display: send null DRM infoframe when
 ending HDR transmission
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260902014146.251988-1-xiaolu.xie@intel.com>
References: <20260901130649.237080-1-xiaolu.xie@intel.com>
 <20260902014146.251988-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 01:58:39 +0000
Message-Id: <20260902015840.3D7331F000E9@smtp.kernel.org>
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
- [High] The logic intended to send a null DRM infoframe for 2 seconds fail=
s to enforce the CTA-861-H requirement, either transmitting the infoframe i=
ndefinitely during SDR operation or stopping prematurely on subsequent mode=
sets, and forces an unnecessary full modeset.
--

commit 76ba1f2a6961be364a75dece13a26afe2ad6b08f
Author: Xiao Lu <xiaolu.xie@intel.com>
Subject: drm/i915/display: send null DRM infoframe when ending HDR transmis=
sion

This commit modifies the DP and HDMI display paths to send a zeroed DRM
infoframe when transitioning from HDR to SDR. This intends to fulfill the
CTA-861-H requirement to send this null infoframe for at least 2 seconds
rather than abruptly stopping HDR metadata transmission.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..f71e2a021663a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
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
Does this logic fulfill the 2-second CTA-861-H requirement mentioned in the
comment? The zeroed infoframe is enabled here when transitioning from HDR to
SDR, but it doesn't appear to be disabled by a timer after 2 seconds. Can
this lead to indefinite transmission of the null infoframe during SDR
operation if no subsequent commits occur?

Furthermore, because this logic strictly relies on
old_conn_state->hdr_output_metadata, won't the very next atomic commit
involving the connector evaluate this as false? That would drop the DRM
infoframe enable bit, causing intel_pipe_config_compare() to flag a mismatch
in infoframes.enable. Will this force an unexpected full modeset on the
subsequent commit?

>  		return;
> +	}

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 9b637e38a1a51..bdacad8ea30a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
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
Similarly for the HDMI path in intel_hdmi_compute_drm_infoframe(), does this
suffer from the same indefinite transmission and fastset mismatch issues on
subsequent atomic commits as the DP path?

>  		return true;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902014146.2519=
88-1-xiaolu.xie@intel.com?part=3D1
