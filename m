Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45846C624D6
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2026 13:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A572610ECE7;
	Tue,  1 Sep 2026 13:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZPOnM/rh";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6882610ECE6
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 13:25:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 02507401BB;
 Tue,  1 Sep 2026 13:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B790E1F00ADB;
 Tue,  1 Sep 2026 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788269101;
 bh=Eih4Dlf0c3Vnk4LN34AkAKfqFKD4PcFmmm59Nuhqw4M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZPOnM/rhmMiGaNz/SG09421ToSxor6HL1GmfB/NfnB10U0/Vuf/ilsOnW+FvG62dO
 qA5wWV/jnAMqChOOEzZuItcekyhFU7ScZh3xDqoe3J4tJUj6z/FonK0s2OrJX2KlXq
 zPjzRANoisxpPdjm4UohqyAoimVRIlt5MHeKGaWSjgm1Rtq580OeMmT6ErQBpCBiHl
 s6ugfRXvoiae0dK2TNkaOkqUxbMYG+c+WhTDP04ffDvZxa8GOhazfhgkIST7PFJQVa
 K25OLtxk7a58Zozg6xVKqAsPS7eXw+W6bVLSk9pBCE66eTctqm33sIzDZARMIWoAjY
 ECuViMzPG68XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/display: send null DRM infoframe when ending
 HDR transmission
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260901130415.236800-1-xiaolu.xie@intel.com>
References: <20260901130415.236800-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 13:25:01 +0000
Message-Id: <20260901132501.B790E1F00ADB@smtp.kernel.org>
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
- [Medium] Stateless implementation of the CTA-861-H 2-second requirement c=
auses indefinite transmission, premature termination, and spurious state mi=
smatches.
--

commit 78df3126b776d1f0e5455dd977f44bfe09013697
Author: xiaolu <xiaolu@intel.com>

drm/i915/display: send null DRM infoframe when ending HDR transmission

This commit aims to fix color errors on SDR content when transitioning from
HDR to SDR by sending a null DRM infoframe for at least 2 seconds as requir=
ed
by CTA-861-H.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 6b60e0a1c8eef..7680594ae6702 100644
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

[Severity: Medium]
Could this introduce a regression where the zeroed DRM infoframe is either
transmitted indefinitely or terminated prematurely depending on subsequent
commits?

This logic in intel_dp_compute_hdr_metadata_infoframe_sdp() enables the
zeroed infoframe during the HDR to SDR modeset, but does not provide a
mechanism to disable it after 2 seconds. If the compositor does not perform
another commit, the infoframe transmission appears to continue indefinitely.

Conversely, if the compositor performs an unrelated atomic commit (for
example, updating a cursor plane) within 2 seconds of the HDR transition,
won't this immediately disable the infoframe? The recalculation of the state
would see no HDR metadata in the old state and skip setting the enable bit,
terminating the infoframe prematurely and violating the CTA-861-H requireme=
nt.

>  		return;
> +	}
> =20
>  	ret =3D drm_hdmi_infoframe_set_hdr_metadata(drm_infoframe, conn_state);
[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 9b637e38a1a51..bdacad8ea30a3 100644
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

[Severity: Medium]
Does this face the same stateless implementation regression as the DP path?

Like in intel_dp_compute_hdr_metadata_infoframe_sdp(), this logic in
intel_hdmi_compute_drm_infoframe() indefinitely prolongs the transmission if
there are no further commits, or truncates it if rapid modesets occur within
the 2-second window.

>  		return true;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901130415.2368=
00-1-xiaolu.xie@intel.com?part=3D1
