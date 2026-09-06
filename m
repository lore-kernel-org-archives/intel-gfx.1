Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18CFC79F8C
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Sep 2026 06:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71CA10E16C;
	Sun,  6 Sep 2026 06:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uu/djXPC";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142BC10E16C
 for <intel-gfx@lists.freedesktop.org>; Sun,  6 Sep 2026 06:02:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B7F80400D6;
 Sun,  6 Sep 2026 06:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F63F1F00A3A;
 Sun,  6 Sep 2026 06:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788674547;
 bh=acFcw/f9m4b2Qtk87ckEAkY6FVJwpDoNsrdEWk6s+gI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Uu/djXPC7CEXaLW3RWyMYJPJNgD1+izjdk+Y5+9rWcCs0ze0U1U1a30ceRID+kmqS
 wlYaOIJQc1JX4iveK6MRK2CBomQD3E6+4CPFyRhF2EKxjCJz8BV2xVBr8WTj4Pdm54
 zftMhJTlfrh8xr6T8e9Jc9hzOMgGmVnwfOlicF0qhmbxgqHJ1kQjH9ylMmPTVkDqgZ
 +PXVyEvHFvCgUqzOU1kNpUXAzTFtuNSKkSy1HnSH3rfiXctbFl2R08tK3cosO09Nl/
 YMRAcCQAZxivbIcm92bt6rhoFuorqoYMsxiebUPLGnAHVPcoVWE4SafNkL29jmaiT5
 AONXInRSclcsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON
 devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260906054239.854844-1-xiaolu.xie@intel.com>
References: <20260906054239.854844-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 06:02:27 +0000
Message-Id: <20260906060227.6F63F1F00A3A@smtp.kernel.org>
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
- [High] Bypassing `intel_dp_dsc_get_slice_config()` leaves `slice_config` =
zero-initialized, causing a divide-by-zero kernel panic in `intel_dsc_compu=
te_params()`.
- [High] An existing early return prevents the new DSC passthrough capabili=
ty detection from executing for passthrough-only PCONs.
- [High] Unconditional DPCD capability checks will fail and abort modesets =
or zero limits for passthrough PCONs with an all-zero `dsc_dpcd`.
- [High] Bypassing `intel_dp_dsc_get_slice_config()` ignores Intel VDSC har=
dware constraints by selecting slice counts based exclusively on the HDMI s=
ink.
- [High] The `pcon_dsc_passthrough` capability flag is evaluated and cached=
 before the EDID is parsed, using uninitialized or stale display data.
- [Medium] Assignment to a nonexistent struct member `slice_count` in `stru=
ct intel_crtc_state`'s `dsc` struct causes a compilation failure.
--

commit 542b41d19d507f8a0d3cdb73bcd6ff8c7a8d22d5
Author: Xiao Lu <xiaolu.xie@intel.com>
Subject: drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

This patch adds explicit driver control of PCON DSC passthrough for HDMI 2.1
devices. It detects the passthrough capability from DPCD and the HDMI sink
EDID, skipping the PCON's own DSC decompression to forward the stream
unchanged.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 113d767e62e9c..ad55b08ecdea6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -2403,7 +2412,21 @@ int intel_dp_dsc_compute_config(struct intel_dp *i=
ntel_dp,
>  		}
>  	}
> =20
> -	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
> +	if (intel_dp->attached_connector->dp.pcon_dsc_passthrough) {

[Severity: High]
Since passthrough-only PCONs have an all-zero dsc_dpcd, won't the=20
unconditional call to intel_dp_dsc_supports_format() at the beginning of=20
intel_dp_dsc_compute_config() parse the empty DPCD and return -EINVAL
immediately?=20

Similarly, in intel_dp_compute_config_limits(), won't the unconditional call
to align_max_sink_dsc_input_bpp() parse the empty dsc_dpcd and clamp the
limits to 0?

> +		/*
> +		 * PCON passthrough: no PCON encoder DPCD, derive slice count
> +		 * from the downstream HDMI 2.1 sink DSC capabilities.
> +		 */
> +		u8 pt_slice_count =3D
> +			intel_dp_pcon_passthrough_dsc_slice_count(intel_dp,
> +								  pipe_config);
> +		if (!pt_slice_count) {
> +			drm_dbg_kms(display->drm,
> +				    "PCON DSC passthrough: no valid slice count\n");
> +			return -EINVAL;
> +		}
> +		pipe_config->dsc.slice_count =3D pt_slice_count;

[Severity: Medium]
Does pipe_config->dsc contain a member named slice_count? It looks like
the slice_count member actually resides in the nested struct
drm_dsc_config config, which would cause a build failure here.

[Severity: High]
By taking this branch and bypassing intel_dp_dsc_get_slice_config(),
pipe_config->dsc.slice_config is left zero-initialized. Could this cause a
divide-by-zero kernel panic later in intel_dsc_compute_params() when it
executes:

vdsc_cfg->slice_width =3D DIV_ROUND_UP(vdsc_cfg->pic_width,
    intel_dsc_line_slice_count(&pipe_config->dsc.slice_config));

because intel_dsc_line_slice_count() returns 0 for a zeroed struct?

> +	} else if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crt=
c_clock,
>  					   adjusted_mode->crtc_hdisplay, num_joined_pipes,
>  					   &pipe_config->dsc.slice_config))
>  		return -EINVAL;

[ ... ]

> @@ -4297,6 +4360,71 @@ void intel_dp_check_frl_training(struct intel_dp *=
intel_dp)
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
> +{
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info;
> +
> +	if (!connector)
> +		return;
> +
> +	connector->dp.pcon_dsc_passthrough =3D false;
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

[Severity: High]
This capability cache relies on connector->base.display_info, but it is
called from intel_dp_detect_dsc_caps() which executes before=20
intel_dp_set_edid() populates display_info. Does this cause the check to
read uninitialized memory or stale EDID data from a previously connected
monitor?

> +static u8
> +intel_dp_pcon_passthrough_dsc_slice_count(struct intel_dp *intel_dp,
> +					  const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const struct drm_display_info *info =3D &connector->base.display_info;
> +	int hdmi_throughput =3D info->hdmi.dsc_cap.clk_per_slice;
> +	int hdmi_max_slices =3D info->hdmi.dsc_cap.max_slices;
> +	int num_slices;
> +
> +	/*
> +	 * Passthrough: no PCON encoder constraints, use only the HDMI sink
> +	 * DSC caps from EDID. Pass hdisplay for pcon_max_slice_width so that
> +	 * constraint is effectively unconstrained.
> +	 */
> +	num_slices =3D intel_hdmi_dsc_get_num_slices(crtc_state,
> +						   hdmi_max_slices,
> +						   crtc_state->hw.adjusted_mode.hdisplay,
> +						   hdmi_max_slices,
> +						   hdmi_throughput);

[Severity: High]
By passing hdmi_max_slices as the src_max_slices parameter, this discards
all source VDSC constraints. If the HDMI sink supports up to 16 slices but
the source VDSC only supports a maximum of 4 slices per pipe, could this
result in misconfiguring the source VDSC with a slice count it physically
cannot generate?

[ ... ]

> @@ -4565,6 +4694,8 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
>  	if (drm_dp_has_quirk(desc, DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) &&
>  	    desc->ident.hw_rev =3D=3D 0x10)
>  		connector->dp.dsc_throughput_quirk =3D true;
> +
> +	intel_dp_pcon_set_dsc_passthrough_cap(intel_attached_dp(connector));
>  }

[Severity: High]
Earlier in intel_dp_get_dsc_sink_cap(), there is an early return:

    if (!(connector->dp.dsc_dpcd[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED))
        return;
       =20
Since passthrough-only PCONs lack a DSC decoder and do not set
DP_DSC_DECOMPRESSION_IS_SUPPORTED, doesn't this early return prevent
intel_dp_pcon_set_dsc_passthrough_cap() from ever executing for these
devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906054239.8548=
44-1-xiaolu.xie@intel.com?part=3D1
