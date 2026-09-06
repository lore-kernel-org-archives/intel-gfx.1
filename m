Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F66C79F99
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Sep 2026 08:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7626310E237;
	Sun,  6 Sep 2026 08:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eEaXBuCu";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AA610E237
 for <intel-gfx@lists.freedesktop.org>; Sun,  6 Sep 2026 08:30:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E4E1C600AA;
 Sun,  6 Sep 2026 08:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771BA1F00A3A;
 Sun,  6 Sep 2026 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788683402;
 bh=rafP6L57+XRnb0m5pzA4lU/4YDYxienxns6ltATb6Bs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=eEaXBuCu48+WfCwIaSrIAydVRIM+prLjclfnuS7Drmrc7qanQxOp30+wRpYyvnG3r
 bbVXQoAMHQgFLIIGqDkbVNoTKaxg0O2F8F1wgaimO4qRRNRRcNEIn/DAaea9XNW5jl
 0loCouXjI7OiTQXZ6QnoTAPLiSYkGA2UWxDK0dc7YQ6AddFVtk0HrhS+Nzmw4uEYLu
 GrxGCMxhuQOR9aY+zsIHeBITw6TaM+WO+zQj0PRXm1of+FyW7u4FfBsAl7XXDovdFm
 mY6U+6NrVjbI1Lp3+6oTMgMey+7DbvZ95NUhTlB1uh8lbpFJ1DTLTGDyu7xPpnFn0A
 eGLc0WR6ACUyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260906080845.1047081-1-xiaolu.xie@intel.com>
References: <20260906080845.1047081-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 08:30:00 +0000
Message-Id: <20260906083002.771BA1F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Logic Error: `align_max_sink_dsc_input_bpp()` unconditionally over=
rides `limits->pipe.max_bpp` to 0 for PCON passthrough.
- [High] Logic Error / State Mismatch: Inconsistent connector context (`int=
el_dp->attached_connector`) used for MST streams breaks passthrough skippin=
g and EDID derivations.
- [High] Functional Bug: PCON passthrough DSC computation aborts due to mis=
sing bypasses for zeroed DPCD capabilities in `intel_dp_dsc_compute_config(=
)` and `intel_dp_dsc_compute_params()`.
- [Low] Compilation Failure: `intel_hdmi_dsc_get_num_slices()` is called wi=
th 5 arguments instead of 6.
--

commit bcc24c289e2fb41a9b6176abaf305ef6fb96a79e
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

This patch adds explicit driver control of PCON DSC passthrough. It detects
passthrough capability, derives DSC parameters from the HDMI sink's EDID,
and explicitly enables DP_DSC_PASSTHROUGH_EN on the PCON.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..98602964b2339 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -2393,7 +2403,19 @@ int intel_dp_dsc_compute_config(struct intel_dp *i=
ntel_dp,
>  		}
>  	}
> =20
> -	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
> +	if (intel_dp->attached_connector->dp.pcon_dsc_passthrough) {

[Severity: High]
Will this configuration abort early before reaching the new passthrough
logic?

Earlier in intel_dp_dsc_compute_config(), there is an existing check:

    if (!intel_dp_dsc_supports_format(connector, pipe_config->output_format=
))
        return -EINVAL;

Since PCON passthrough devices have an all-zero DSC DPCD, does
intel_dp_dsc_supports_format() evaluate to false and return -EINVAL here?

Similarly, in intel_dp_dsc_compute_params(), line_buf_depth is extracted
from the zeroed DPCD, which also results in 0 and an immediate abort:

    vdsc_cfg->line_buf_depth =3D min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH,
                           drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc=
_dpcd));
    if (!vdsc_cfg->line_buf_depth) {
        ...
        return -EINVAL;
    }

Are bypasses needed for these checks when doing PCON passthrough?

> +		/*
> +		 * PCON passthrough: no PCON encoder DPCD, derive slice config
> +		 * from the downstream HDMI 2.1 sink DSC capabilities in EDID.
> +		 */
> +		if (!intel_dp_pcon_passthrough_dsc_slice_config(intel_dp,
> +								pipe_config,
> +								&pipe_config->dsc.slice_config)) {
> +			drm_dbg_kms(display->drm,
> +				    "PCON DSC passthrough: no valid slice config\n");
> +			return -EINVAL;
> +		}
> +	} else if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crt=
c_clock,
>  					   adjusted_mode->crtc_hdisplay, num_joined_pipes,
>  					   &pipe_config->dsc.slice_config))
>  		return -EINVAL;
[ ... ]
> @@ -2722,8 +2744,33 @@ intel_dp_compute_config_limits(struct intel_dp *in=
tel_dp,
>  		return false;
>  	}
> =20
> -	if (dsc && !intel_dp_dsc_compute_pipe_bpp_limits(connector, limits))
> -		return false;
> +	if (dsc) {
> +		if (connector->dp.pcon_dsc_passthrough) {
> +			/*
> +			 * PCON passthrough: PCON has no DSC encoder DPCD so
> +			 * intel_dp_dsc_compute_pipe_bpp_limits() would see
> +			 * all-zero dsc_dpcd and fail.  Use the downstream HDMI
> +			 * sink DSC bpc cap to constrain the pipe bpp instead.
> +			 */
> +			const struct drm_display_info *info =3D
> +				&connector->base.display_info;
> +			u8 hdmi_max_bpc =3D info->hdmi.dsc_cap.bpc_supported ?: 8;
> +			int dsc_min_bpc =3D intel_dp_dsc_min_src_input_bpc();
> +			int dsc_max_bpc =3D min_t(int,
> +						intel_dp_dsc_max_src_input_bpc(display),
> +						hdmi_max_bpc);
> +
> +			limits->pipe.min_bpp =3D max(limits->pipe.min_bpp,
> +						   dsc_min_bpc * 3);
> +			limits->pipe.max_bpp =3D min(limits->pipe.max_bpp,
> +						   dsc_max_bpc * 3);
> +
> +			if (limits->pipe.min_bpp > limits->pipe.max_bpp)
> +				return false;
> +		} else if (!intel_dp_dsc_compute_pipe_bpp_limits(connector, limits)) {
> +			return false;
> +		}
> +	}

[Severity: High]
Will the calculated limits->pipe.max_bpp be overridden to 0 later in this
function?

At the end of intel_dp_compute_config_limits(), there is an unconditional
check:

    if (dsc)
        limits->pipe.max_bpp =3D align_max_sink_dsc_input_bpp(connector,
                                                            limits->pipe.ma=
x_bpp);

Since align_max_sink_dsc_input_bpp() reads the empty PCON dsc_dpcd, won't it
return 0 and override the valid passthrough max_bpp calculation?

[ ... ]
> +static void
> +intel_dp_pcon_set_dsc_passthrough_cap(struct intel_dp *intel_dp)
> +{
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info;
> +
> +	if (!connector)
> +		return;
> +
> +	connector->dp.pcon_dsc_passthrough =3D false;
> +
> +	/*
> +	 * PCON DSC passthrough is only supported for SST direct connections.
> +	 * In MST topologies the intermediate hub may report incorrect virtual
> +	 * DPCD for the downstream PCON port, leading to mismatched DSC
> +	 * parameters.  Skip passthrough for MST until hub firmware correctly
> +	 * reflects the PCON's capabilities.
> +	 */
> +	if (connector->mst.port)
> +		return;

[Severity: High]
Does this correctly identify MST topologies?

Since intel_dp->attached_connector points to the root SST connector,
connector->mst.port will always be NULL here. Will this cause the intended
MST bypass to fail and incorrectly attempt passthrough on MST streams?

> +
> +	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
> +		return;
> +
> +	if (!(connector->dp.dsc_dpcd[0] & DP_DSC_PASSTHROUGH_IS_SUPPORTED))
> +		return;
> +
> +	info =3D &connector->base.display_info;
> +	connector->dp.pcon_dsc_passthrough =3D info->hdmi.dsc_cap.v_1p2;
> +}
> +
> +static bool
> +intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state,
> +					   struct intel_dsc_slice_config *config_ret)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info =3D &connector->base.display_info;

[Severity: High]
Does this fetch the correct EDID for MST streams?

Using intel_dp->attached_connector fetches the display info from the root
connector rather than the active MST branch connector. If the MST bypass
above fails, will this derive capabilities from the wrong EDID?

> +	int num_joined_pipes =3D intel_crtc_num_joined_pipes(crtc_state);
> +	int hdmi_throughput =3D info->hdmi.dsc_cap.clk_per_slice;
> +	int hdmi_max_slices =3D info->hdmi.dsc_cap.max_slices;
> +	int target_slices;
> +	int slices_per_pipe;
> +
> +	/*
> +	 * Derive the required slice count from the downstream HDMI 2.1 sink
> +	 * DSC capabilities in EDID (not from the PCON encoder DPCD which is
> +	 * all-zero for passthrough-only devices).
> +	 */
> +	target_slices =3D intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjuste=
d_mode,
> +						      hdmi_max_slices,
> +						      crtc_state->hw.adjusted_mode.hdisplay,
> +						      hdmi_max_slices,
> +						      hdmi_throughput);

[Severity: Low]
Does this call have the correct number of arguments?

intel_hdmi_dsc_get_num_slices() requires 6 arguments (including
output_format), but only 5 are provided here. Will this cause a compilation
failure?

> +	if (!target_slices)
> +		return false;
> +
> +	drm_dbg_kms(display->drm,
> +		     "PCON DSC passthrough: target %d slices from HDMI sink EDID cap"
> +		     " (max_slices=3D%d clk_per_slice=3D%d MHz)\n",
> +		     target_slices, hdmi_max_slices, hdmi_throughput);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906080845.1047=
081-1-xiaolu.xie@intel.com?part=3D1
