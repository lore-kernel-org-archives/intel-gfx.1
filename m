Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976F1C79FAD
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2026 04:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E3910EEA5;
	Wed,  9 Sep 2026 04:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cz0xrH2Z";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AA910EEA5
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 04:21:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4AC9C601FB;
 Wed,  9 Sep 2026 04:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64A91F00A3A;
 Wed,  9 Sep 2026 04:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788927707;
 bh=E9JRK1wBYmsgOzJWtJuLGFZdp3/EZQAmVRUZPwjj9lc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Cz0xrH2ZxZh1P2PWJ2xMkcHKGkqH2kr0hZ+gJDSEJyKJ8dUYt/bw4+/FjjDLTidAr
 jgsObEqsYRdU0XgoL10C8kVqusABuuLesplAWCv8peVnSJcidbLhIOEuhXnSnFmbML
 fO4Wk9W19BciM8/YmYLP6UkPtykmYQRqIscD276coHg/yGMJvoRN0qt5leT0RE0Oop
 sS2a9R9UxJlrIELtfLuNuM7xipSCCgWvdH/UWRr4no5bMFSTZMadvNyQ5aXjLKAl3Z
 euEVJ6mbJOAisBnCW1IJhVRMsoL/W7ryg62W8nQRwjcDLK/o+nssDqoifaN+a7Uh5Q
 zXrP/eykjM7CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260909041041.244531-2-xiaolu.xie@intel.com>
References: <20260909033518.158995-1-xiaolu.xie@intel.com>
 <20260909041041.244531-1-xiaolu.xie@intel.com>
 <20260909041041.244531-2-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 04:21:46 +0000
Message-Id: <20260909042146.D64A91F00A3A@smtp.kernel.org>
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
- [High] Incorrect connector context used for MST streams, causing root con=
nector state corruption and broken MST passthrough.
- [High] Mode rejection due to unhandled all-zero PCON `dsc_dpcd` evaluatin=
g to 0 `dsc_slice_count`.
- [High] Stale early return guards prevent PCON passthrough from functionin=
g over MST and risk hardware misconfiguration.
- [High] `intel_dp_dsc_compute_config` unconditionally fails because it cal=
ls `intel_dp_dsc_supports_format` with an all-zero DPCD.
- [Low] Implicit declaration of static function causing a build failure acr=
oss translation units.
- [Low] Unused static helper function `intel_dp_pcon_dsc_enc_slice_height`.
--

commit e900995cfc29f9b4c87a5f8c6c73b97d623e0e33
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

This commit enables explicit driver control of PCON DSC passthrough for
HDMI 2.1 sinks that decompress the stream themselves. It adds paths to
detect capability, compute DSC parameters from the EDID instead of PCON
DPCD, and correctly configure passthrough via DPCD.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..e23e4e8b32bf2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -2393,7 +2424,19 @@ int intel_dp_dsc_compute_config(struct intel_dp *i=
ntel_dp,
>  		}
>  	}
> =20
> -	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
> +	if (connector->dp.pcon_dsc_passthrough) {

[Severity: High]
Earlier in this function, intel_dp_dsc_supports_format() is called. Since
passthrough-only PCONs have an all-zero cached dsc_dpcd, does that check
unconditionally return false and abort the configuration with -EINVAL
before reaching this passthrough logic?

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
> @@ -2524,10 +2567,20 @@ bool intel_dp_mode_valid_with_dsc(struct intel_co=
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
> +		const struct drm_display_info *info =3D &connector->base.display_info;
> +
> +		dsc_slice_count =3D min_t(int, info->hdmi.dsc_cap.max_slices,
> +					drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd,
> +									false));

[Severity: High]
Since passthrough-only PCONs lack a DSC decoder, their dsc_dpcd array is
all zeros, which makes drm_dp_dsc_sink_max_slice_count() return 0.=20

Does this cause the min_t() to evaluate to 0, resulting in valid modes
being unconditionally rejected?=20

The v7 changelog mentions falling back to EDID max_slices when pcon_max is
zero, but the code appears to use a direct min_t comparison.

> +	} else {
> +		dsc_slice_count =3D intel_dp_dsc_get_slice_count(connector,
> +							       mode_clock,
> +							       mode_hdisplay,
> +							       num_joined_pipes);
> +	}
[ ... ]
> @@ -3755,6 +3833,10 @@ intel_dp_sink_set_dsc_decompression(struct intel_c=
onnector *connector,
>  {
>  	struct intel_display *display =3D to_intel_display(connector);
> =20
> +	/* PCON passthrough: PCON forwards the stream, sink decompresses. */
> +	if (!connector->mst.dp && connector->dp.pcon_dsc_passthrough)
> +		return;

[Severity: High]
Does this guard inadvertently prevent the short-circuit for PCON
passthrough over MST?=20

The v7 changelog indicates the !connector->mst.dp check was removed to
support MST, but it appears to still be present here. If an MST connection
is used, DP_DECOMPRESSION_EN might be erroneously written to a passthrough
device that does not support decompression.

> +
>  	if (write_dsc_decompression_flag(connector->dp.dsc_decompression_aux,
>  					 DP_DECOMPRESSION_EN, enable) < 0)
>  		drm_dbg_kms(display->drm,
[ ... ]
> @@ -4298,6 +4391,116 @@ void intel_dp_check_frl_training(struct intel_dp =
*intel_dp)
>  	}
>  }
> =20
> +/*
> + * intel_dp_pcon_set_dsc_passthrough_cap - cache PCON DSC passthrough ca=
pability
> + *
> + * Called once at connect time (from intel_dp_get_dsc_sink_cap()) after
> + * dsc_dpcd and the HDMI sink EDID have been read. Caches the result in
> + * connector->dp.pcon_dsc_passthrough so modeset paths can read it cheap=
ly
> + * without repeating the DPCD and EDID lookups.
> + *
> + * A PCON supports DSC passthrough when it explicitly advertises
> + * DP_DSC_PASSTHROUGH_IS_SUPPORTED (DPCD 0x060 bit1) and the downstream
> + * HDMI 2.1 sink supports DSC 1.2. The compressed stream produced by the
> + * source VDSC engine is forwarded unchanged through the PCON to the HDMI
> + * sink for decompression (DP_DSC_ENABLE bit1 on the PCON).
> + */
> +static void
> +intel_dp_pcon_set_dsc_passthrough_cap(struct intel_dp *intel_dp)

[Severity: Low]
Does intel_dp_pcon_set_dsc_passthrough_cap() need to be non-static?=20

The v7 changelog mentions it was made non-static to fix a build failure,
but it remains static here. Compiling this might fail with an implicit
declaration error when called from
drivers/gpu/drm/i915/display/intel_dp_mst.c.

> +{
> +	struct intel_connector *connector =3D intel_dp->attached_connector;

[Severity: High]
Could this cause state corruption for MST streams?

In an MST topology, intel_dp->attached_connector resolves to the root SST
connector, not the leaf MST connector. The v7 changelog notes that this
was fixed by accepting an explicit connector parameter, but it seems
intel_dp->attached_connector is still being used here.

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
Does this early return explicitly disable passthrough capability checking
for MST connectors?

The v7 changelog indicates the !connector->mst.port early-return was
removed to support MST topologies, but it is still present in this patch.

[ ... ]
> +static bool
> +intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state,
> +					   struct intel_dsc_slice_config *config_ret)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info =3D &connector->base.display_info;

[Severity: High]
Similar to the issue above, does this read the root connector's display
info instead of the MST sink's EDID?

If this is executed for an MST stream, it will use the root connector's
HDMI capabilities (or lack thereof) instead of the actual downstream sink,
which might lead to invalid DSC slice configurations.

[ ... ]
> +static int
> +intel_dp_pcon_dsc_enc_slice_height(const struct intel_crtc_state *crtc_s=
tate)
> +{
> +	int vactive =3D crtc_state->hw.adjusted_mode.vdisplay;
> +
> +	return intel_hdmi_dsc_get_slice_height(vactive);
> +}

[Severity: Low]
Is intel_dp_pcon_dsc_enc_slice_height() intended to be used?=20

It appears to be newly defined as a static helper but is not called
anywhere in this patch, which might increase binary size or cause compiler
warnings for unused functions.

[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 6a869d0f6ffc0..2653f2347f235 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1451,6 +1451,13 @@ static int mst_connector_get_ddc_modes(struct drm_=
connector *_connector)
> =20
>  	ret =3D intel_connector_update_modes(&connector->base, drm_edid);
> =20
> +	/*
> +	 * Re-evaluate PCON DSC passthrough capability now that the MST
> +	 * connector's EDID has been parsed and display_info.hdmi.dsc_cap
> +	 * is populated.
> +	 */
> +	intel_dp_pcon_set_dsc_passthrough_cap(intel_dp);

[Severity: Low]
Because intel_dp_pcon_set_dsc_passthrough_cap() remains static in
intel_dp.c, will this cross-file call trigger a build failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909041041.2445=
31-1-xiaolu.xie@intel.com?part=3D2
