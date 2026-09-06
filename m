Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746AFC79F9E
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Sep 2026 10:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAE610E334;
	Sun,  6 Sep 2026 10:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bPKYcInZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D4D10E334
 for <intel-gfx@lists.freedesktop.org>; Sun,  6 Sep 2026 10:00:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CC9D43D7C;
 Sun,  6 Sep 2026 10:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3E11F00A3A;
 Sun,  6 Sep 2026 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788688856;
 bh=gn+CYwd0XHUSpwjmOHKN8PqPydj5TzNymr5FJ0W0/5I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bPKYcInZKelaKkgib4C3WWUR6uJrfFgY5cNLIjS5kuH8fj93w9HSMJ1SlKg1H6e3W
 cckyC3Ik3pvSR8uuTlj1mblqNBqE95MfcOc16hynAgdBwdtCclo9nFh4N+AdU5Ized
 Nelba/oOfcX0rbEfT2mjGBHNil15HvgTO7GUDNTm99sYv+O6XlMVTMcGgrPxzzjcGV
 eo8Pwz4yKLRVEE3YXmkkOcEoCb7VwYVDX4ZeuuAZtF/zqBq8mTybW8ckrsWgb00EIc
 5gzuSpx10MysWlKT5rvWOebAtpYEG6ZUfekpR/nZ0hmjE6xdN4Q+symWcAmjyk8MJ6
 A7ro5cyxsoCqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260906094156.1057767-1-xiaolu.xie@intel.com>
References: <20260906094156.1057767-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 10:00:55 +0000
Message-Id: <20260906100056.3D3E11F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] PCON DSC passthrough slice calculation bypasses source and DP link=
 minimum slice requirements.
- [High] `intel_dp_pcon_set_dsc_passthrough_cap` incorrectly updates the ro=
ot connector's state when probing MST streams, causing data races.
- [High] Unconditional RGB conversion for all PCON passthrough streams corr=
upts YCbCr formats.
- [High] Passing `hdisplay` as `src_max_slice_width` prevents 1-slice DSC c=
onfigurations for all standard resolutions.
- [High] PCON DSC passthrough modes are incorrectly rejected during mode va=
lidation because `intel_dp_mode_valid` relies on the all-zero PCON DPCD.
- [High] Missing horizontal display width divisibility check for DSC slice =
count in PCON DSC passthrough.
--

commit 78dd30c6b107d4f8cce9fa9760f0a389a8f18b26
Author: Xiao Lu <xiaolu.xie@intel.com>

    drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices
   =20
    HDMI 2.1 PCON devices (e.g. Parade PS196) that do not have an internal
    DSC encoder can still forward a DSC-compressed stream from the DP source
    to the downstream HDMI 2.1 sink unchanged (passthrough mode). The HDMI
    sink (e.g. Lenovo ThinkVision Pro 27UD-10) then decompresses the stream
    itself. This mode is signalled by DP_DSC_PASSTHROUGH_IS_SUPPORTED (DPCD
    0x060 bit1) on the PCON.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..90a2ba6122e46 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1259,8 +1259,14 @@ bool intel_dp_has_dsc(const struct intel_connector=
 *connector)
>  	    connector->panel.vbt.edp.dsc_disable)
>  		return false;
> =20
> -	if (!drm_dp_sink_supports_dsc(connector->dp.dsc_dpcd))
> -		return false;
> +	if (!drm_dp_sink_supports_dsc(connector->dp.dsc_dpcd)) {
> +		/*
> +		 * PCON passthrough: PCON has no DSC decoder so dsc_dpcd is
> +		 * zero, but if pcon_dsc_passthrough is set (cached at connect
> +		 * time) the downstream HDMI 2.1 sink will decompress instead.
> +		 */
> +		return connector->dp.pcon_dsc_passthrough;
> +	}
> =20
>  	return true;
>  }

[Severity: High]
This update handles the all-zero PCON DPCD for capabilities, but is there a
similar update missing in intel_dp_mode_valid() and
intel_dp_mode_valid_with_dsc()?

During mode validation, intel_dp_mode_valid() calls
intel_dp_dsc_compute_max_bpp() and intel_dp_dsc_get_slice_count(), which st=
ill
rely on the all-zero PCON DPCD. For passthrough-only PCONs,
connector->dp.dsc_dpcd is entirely zeroes, causing
intel_dp_dsc_get_slice_count() to find 0 slices. This results in
dsc_slice_count =3D=3D 0 inside intel_dp_mode_valid_with_dsc(), which immed=
iately
returns false and silently rejects valid DSC modes during EDID probing.

[ ... ]
> @@ -1866,28 +1872,42 @@ static int intel_dp_dsc_compute_params(const stru=
ct intel_connector *connector,
>  	if (ret)
>  		return ret;
> =20
> -	vdsc_cfg->dsc_version_major =3D
> -		(connector->dp.dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT] &
> -		 DP_DSC_MAJOR_MASK) >> DP_DSC_MAJOR_SHIFT;
> -	vdsc_cfg->dsc_version_minor =3D
> -		min(intel_dp_source_dsc_version_minor(display),
> -		    intel_dp_sink_dsc_version_minor(connector->dp.dsc_dpcd));
> -	if (vdsc_cfg->convert_rgb)
> -		vdsc_cfg->convert_rgb =3D
> -			connector->dp.dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
> -			DP_DSC_RGB;
> -
> -	vdsc_cfg->line_buf_depth =3D min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH,
> -				       drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd));
> -	if (!vdsc_cfg->line_buf_depth) {
> -		drm_dbg_kms(display->drm,
> -			    "DSC Sink Line Buffer Depth invalid\n");
> -		return -EINVAL;
> -	}
> +	if (connector->dp.pcon_dsc_passthrough) {
> +		/*
> +		 * For PCON passthrough the HDMI 2.1 sink decompresses, not the
> +		 * PCON. The PCON dsc_dpcd fields reflect passthrough device
> +		 * constraints and are not valid for configuring the source VDSC
> +		 * engine. Use DSC 1.2 sink defaults instead.
> +		 */
> +		vdsc_cfg->dsc_version_major =3D 1;
> +		vdsc_cfg->dsc_version_minor =3D min(intel_dp_source_dsc_version_minor(=
display), 2);
> +		vdsc_cfg->convert_rgb =3D true;

[Severity: High]
Does this unconditional assignment override the correctly computed convert_=
rgb
value for YCbCr pipelines?

intel_dsc_compute_params() correctly sets vdsc_cfg->convert_rgb =3D false f=
or
YCbCr formats. Unconditionally overwriting it with true here will cause the
VDSC engine to apply RGB-to-YCoCg conversion to data that is already in YCb=
Cr
format, corrupting the colors.

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
Does this incorrectly update the root connector's state when probing MST
streams, causing data races?

When intel_dp_get_dsc_sink_cap() is called during MST port probing, it pass=
es
intel_attached_dp(connector), which returns the root port's intel_dp. Here,
intel_dp->attached_connector resolves to the root SST connector instead of =
the
MST connector.

Because the root connector isn't an MST port, the connector->mst.port early
return fails. This causes the code to read and modify the shared root
connector's pcon_dsc_passthrough flag, potentially concurrently with other
operations on every MST display hotplug or EDID read.

[ ... ]
> +static bool
> +intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state,
> +					   struct intel_dsc_slice_config *config_ret)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info =3D &connector->base.display_info;
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
> +						      crtc_state->output_format,
> +						      hdmi_max_slices,
> +						      crtc_state->hw.adjusted_mode.hdisplay,

[Severity: High]
Does passing hdisplay as src_max_slice_width prevent 1-slice DSC
configurations for all standard resolutions?

intel_hdmi_dsc_get_num_slices() limits max_slice_width to
min(MAX_HDMI_SLICE_WIDTH, src_max_slice_width). By passing hdisplay as
src_max_slice_width, max_slice_width becomes exactly hdisplay.

When evaluating 1 slice, slice_width =3D hdisplay. The loop condition
if (slice_width >=3D max_slice_width) evaluates to if (hdisplay >=3D hdispl=
ay),
which is always true. This immediately increments min_slices and rejects the
1-slice configuration for any resolution where hdisplay <=3D 2720 (e.g., 10=
80p,
1440p), forcing an unnecessary fallback to 2+ slices.

> +						      hdmi_max_slices,
> +						      hdmi_throughput);
> +	if (!target_slices)
> +		return false;
> +
> +	drm_dbg_kms(display->drm,
> +		     "PCON DSC passthrough: target %d slices from HDMI sink EDID cap"
> +		     " (max_slices=3D%d clk_per_slice=3D%d MHz)\n",
> +		     target_slices, hdmi_max_slices, hdmi_throughput);
> +
> +	for (slices_per_pipe =3D 1; slices_per_pipe <=3D 4; slices_per_pipe++) {
> +		struct intel_dsc_slice_config config;
> +
> +		if (!intel_dsc_get_slice_config(display,
> +						num_joined_pipes, slices_per_pipe,
> +						&config))
> +			continue;
> +
> +		if (intel_dsc_line_slice_count(&config) =3D=3D target_slices) {

[Severity: High]
Are we missing a validation against the source VDSC engine's minimum slice
requirements here?

This strict equality check enforces the HDMI sink's minimum slice count, bu=
t it
completely bypasses intel_dp_dsc_min_slice_count() which enforces Intel's
source VDSC hardware limits. Any display mode where the VDSC engine requires
more slices than the HDMI link minimum will be misconfigured.

[Severity: High]
Is a horizontal display width divisibility check also missing here?

The loop accepts the configuration without verifying that the active display
width is perfectly divisible by the slice count (i.e.
mode_hdisplay % target_slices =3D=3D 0). If the width isn't divisible, frac=
tional
slice widths will be programmed into the VDSC hardware, leading to
unrecoverable pipe underruns and GPU hangs.

> +			*config_ret =3D config;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906094156.1057=
767-1-xiaolu.xie@intel.com?part=3D1
