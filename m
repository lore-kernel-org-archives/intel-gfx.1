Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E39C624D5
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2026 13:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E5310ECE6;
	Tue,  1 Sep 2026 13:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BNNEXbS9";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A888C10ECE6
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 13:26:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B80686020D;
 Tue,  1 Sep 2026 13:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFA21F000E9;
 Tue,  1 Sep 2026 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788269194;
 bh=pr/g3oSbtsDKpgE+XeXDM/1xq80FFVN4EbLNMxFFpKs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BNNEXbS9sRQfJTbONcFLIUZ+v7lHY9GVwJAqoopbWhy7WJZHUo5VJWdOGij+Tdaw9
 o53J18GgMasWIK04Ey1HHHBjnYa+nHfdwB3trgAEZGRWKPwfhtlCYXHX5I4yMfE9Lo
 TCNPBRAzgqZFS9wjL3Gsand+KdQxGZSgKGfFOPj5Rrs3T0uoL0S3fHZ0BGjLD6llmU
 MLr7GbvI+eaX+15VoBsbMptoRi/pLvFLi1sGV76ShKVK3zwfrc19Ouf9vvmRGYK7dT
 X1Dz4YPrA7sKymY4x6DKWZWCvFWo97H0ufxos1fI09ArzJr59TlbPSFGhnBrQ2y0w3
 8WwuSgRv6g9TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/display: send null DRM infoframe when ending
 HDR transmission
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260901130649.237080-1-xiaolu.xie@intel.com>
References: <20260901130649.237080-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 13:26:33 +0000
Message-Id: <20260901132634.4BFA21F000E9@smtp.kernel.org>
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
- [Medium] The implementation fails to enforce the CTA-861-H 2-second minim=
um duration for zero-filled DRM infoframes and leaves them enabled indefini=
tely during normal SDR operation.
--

commit 36a317ecec2b669b256a0c4c50d72b83f1882ac8
Author: Xiao Lu <xiaolu.xie@intel.com>
Subject: drm/i915/display: send null DRM infoframe when ending HDR transmis=
sion

This commit aims to fix color errors on DP-to-HDMI converters during the
HDR-to-SDR transition. It implements the CTA-861-H requirement to send a
null DRM infoframe for at least 2 seconds before stopping the transmission
entirely.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 6b60e0a1c8eef..7680594ae6702 100644
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

[Severity: Medium]
How is the 2-second minimum duration enforced here?

The infoframe transmission is tied to the transient atomic state transition
where old_conn_state->hdr_output_metadata is true. Since the crtc_state
persists until the next commit, wouldn't the null infoframe transmit
indefinitely during normal SDR operation, rather than stopping after 2 seco=
nds?

Additionally, if a subsequent userspace commit (like a page flip or resolut=
ion
change) occurs within 2 seconds, old_conn_state->hdr_output_metadata will be
false for that new commit. Doesn't this mean the infoframe will abruptly st=
op,
violating the 2-second minimum requirement?

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
This appears to have the same issue for the native HDMI path. Tying the
transmission requirement to an event-based atomic commit means the 2-second
minimum duration isn't guaranteed by a timer or delayed worker.=20

Could this result in the null infoframe either being disabled too early (if
another commit happens quickly) or remaining enabled forever?

>  		return true;
> +	}
> =20
>  	crtc_state->infoframes.enable |=3D
>  		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901130649.2370=
80-1-xiaolu.xie@intel.com?part=3D1
