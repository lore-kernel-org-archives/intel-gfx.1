Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97C8C79F8C
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2026 05:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAD010EECB;
	Wed,  9 Sep 2026 05:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VdaLDcjh";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0373B10EECB
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 05:57:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F0AB060211;
 Wed,  9 Sep 2026 05:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856F01F00A3D;
 Wed,  9 Sep 2026 05:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788933438;
 bh=erEsE54XZv2tYqlQ0CHEZ/7qxqclYX2v+Fbuu9OMpig=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VdaLDcjhENthG3vBkzNH0UyYxoqauR7qK5YqV/oAFHCZY6nJJWjeGPFhYFf9Gdem4
 06UMhXsoS58CZbS4OfP7jO/FCUHXjU/HNUgsuL3vmIc++GNa6iAhvMXQ0bOpaBzd17
 zjvYkBDKvSuMiYXxCgUBRMPyzWCHi/no+cvQ1OEJ53NzWEgLyR0YOfCOa5zLJWpnAE
 cj2e9k48Km2wKNUDKT1+T3ZsX/cK4tqHqou87P3WRAR4+lY6pwcI7idrrJwfNGoggx
 2GkH02DJD5P1aM+lQ7HzDrF9q/kRLxqFEHVB1YO0iq6XPaUoTwx+MxminOpG7FKzdh
 wkxnd/Da7MF+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260909054225.456573-1-xiaolu.xie@intel.com>
References: <20260909041041.244531-2-xiaolu.xie@intel.com>
 <20260909054225.456573-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 05:57:18 +0000
Message-Id: <20260909055718.856F01F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `intel_dp_pcon_passthrough_dsc_slice_config()` unconditionally fai=
ls for passthrough-only PCONs due to passing a zero slice count to `intel_h=
dmi_dsc_get_num_slices()`.
- [High] `intel_dp_sink_set_dsc_passthrough()` skips enabling DSC passthrou=
gh on intermediate MST hubs when a PCON is connected.
- [High] Incorrect uncompressed dotclk validation applied to DSC passthroug=
h modes due to zero slice count.
--

commit 8ca09416b752ce965e92cfcd6a72b6d5b9efeae5
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

This commit enables explicit driver control of DSC passthrough for HDMI 2.1
PCON devices that lack an internal DSC encoder. It derives DSC parameters
from the HDMI sink's EDID and writes the appropriate passthrough enable bit=
s.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..939c707d34316 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -2524,10 +2569,27 @@ bool intel_dp_mode_valid_with_dsc(struct intel_co=
nnector *connector,
>  							 num_joined_pipes,
>  							 output_format,
>  							 pipe_bpp, INT_MAX);
> -	int dsc_slice_count =3D intel_dp_dsc_get_slice_count(connector,
> -							   mode_clock,
> -							   mode_hdisplay,
> -							   num_joined_pipes);
> +	int dsc_slice_count;
> +
> +	if (connector->dp.pcon_dsc_passthrough) {
> +		/*
> +		 * For PCON passthrough, use the HDMI sink EDID max_slices
> +		 * capped by the PCON's own slice capability from dsc_dpcd.
> +		 * If the PCON dsc_dpcd is all-zero, fall back to EDID only.
> +		 */
> +		const struct drm_display_info *info =3D &connector->base.display_info;
> +		int pcon_max =3D drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpc=
d,
> +							       false);
> +
> +		dsc_slice_count =3D pcon_max ?
> +			min_t(int, info->hdmi.dsc_cap.max_slices, pcon_max) :
> +			info->hdmi.dsc_cap.max_slices;

[Severity: High]
While the slice count is calculated correctly here with a fallback, does th=
is
leave callers like intel_dp_mode_valid_format() and
mst_connector_mode_valid_ctx() with an incorrect slice count?

Those outer functions obtain the slice count by calling
intel_dp_dsc_get_slice_count() directly. For passthrough-only PCONs with an
all-zero DPCD, this returns 0. When intel_dp_dotclk_valid() is later called
with a slice count of 0, will it incorrectly evaluate DSC passthrough modes
against uncompressed dotclock limits?

> +	} else {
> +		dsc_slice_count =3D intel_dp_dsc_get_slice_count(connector,
> +							       mode_clock,
> +							       mode_hdisplay,
> +							       num_joined_pipes);
> +	}

[ ... ]

> @@ -3767,8 +3858,22 @@ intel_dp_sink_set_dsc_passthrough(const struct int=
el_connector *connector,
>  				  bool enable)
>  {
>  	struct intel_display *display =3D to_intel_display(connector);
> -	struct drm_dp_aux *aux =3D connector->mst.port ?
> -				 connector->mst.port->passthrough_aux : NULL;
> +	struct drm_dp_aux *aux =3D NULL;
> +
> +	if (connector->dp.pcon_dsc_passthrough) {
> +		/*
> +		 * HDMI 2.1 PCON passthrough: write DP_DSC_PASSTHROUGH_EN
> +		 * directly to the PCON so it forwards the compressed stream
> +		 * to the HDMI sink. For SST use the root port aux; for MST
> +		 * use the MST port aux which routes via REMOTE_DPCD_WRITE.
> +		 */
> +		if (connector->mst.port)
> +			aux =3D &connector->mst.port->aux;
> +		else
> +			aux =3D &intel_attached_dp((struct intel_connector *)connector)->aux;
> +	} else if (connector->mst.port) {
> +		aux =3D connector->mst.port->passthrough_aux;
> +	}

[Severity: High]
When connecting a PCON through an MST hub, doesn't the driver need to instr=
uct
both the intermediate MST hub (passthrough_aux) and the PCON
(connector->mst.port->aux) to pass through the DSC stream?

The mutually exclusive if/else if structure here appears to force the driver
to write DP_DSC_PASSTHROUGH_EN only to the PCON, bypassing the MST hub
configuration entirely. Can this prevent the compressed stream from being
properly forwarded?

> =20
>  	if (!aux)
>  		return;

[ ... ]

> @@ -4298,6 +4403,112 @@ void intel_dp_check_frl_training(struct intel_dp =
*intel_dp)
> +static bool
> +intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
> +					   const struct intel_connector *connector,
> +					   const struct intel_crtc_state *crtc_state,
> +					   struct intel_dsc_slice_config *config_ret)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	const struct drm_display_info *info =3D &connector->base.display_info;
> +	int num_joined_pipes =3D intel_crtc_num_joined_pipes(crtc_state);
> +	int hdmi_throughput =3D info->hdmi.dsc_cap.clk_per_slice;
> +	int hdmi_max_slices =3D info->hdmi.dsc_cap.max_slices;
> +	/*
> +	 * Use the PCON's own DSC passthrough capability (from its virtual
> +	 * DPCD) as the source constraint, mirroring what
> +	 * intel_dp_pcon_dsc_enc_slices() does for encoder mode. This handles
> +	 * multi-hop topologies (e.g. MST hub -> PCON) where the intermediate
> +	 * hub virtual DPCD may be more restrictive than the HDMI sink EDID.
> +	 */
> +	int pcon_max_slices =3D drm_dp_dsc_sink_max_slice_count(connector->dp.d=
sc_dpcd, false);
> +	int target_slices;
> +	int slices_per_pipe;
> +
> +	/*
> +	 * src_max_slice_width: pass INT_MAX so the HDMI spec limit of 2720px
> +	 * applies; the source VDSC HW limit (5120px) is not the binding constr=
aint.
> +	 * src_max_slices: use PCON dsc_dpcd slice capability as upper bound.
> +	 */
> +	target_slices =3D intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjuste=
d_mode,
> +						      crtc_state->output_format,
> +						      pcon_max_slices, INT_MAX,
> +						      hdmi_max_slices,
> +						      hdmi_throughput);

[Severity: High]
If a passthrough-only PCON has an all-zero DPCD DSC capability,
drm_dp_dsc_sink_max_slice_count() will evaluate to 0 for pcon_max_slices.

Does this cause intel_hdmi_dsc_get_num_slices() to unconditionally fail and
return 0, since it requires src_max_slices >=3D 1? Should there be a fallba=
ck to
EDID slice limits (e.g. pcon_max_slices ? pcon_max_slices : hdmi_max_slices)
to prevent this?

> +	if (!target_slices)
> +		return false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909054225.4565=
73-1-xiaolu.xie@intel.com?part=3D1
