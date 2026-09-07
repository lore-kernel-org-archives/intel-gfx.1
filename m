Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A77C79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 05:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDA210E635;
	Mon,  7 Sep 2026 05:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rk6KE9Ny";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67A10E635
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 05:04:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D71D141E50;
 Mon,  7 Sep 2026 05:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DB61F00A3A;
 Mon,  7 Sep 2026 05:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788757496;
 bh=GqRG2uqQjtnjpWIbPa6Jdk8h0jpV6H5SGvVpI39EhKU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Rk6KE9Ny+n4NkX/hl9mooIvn9t3MJF0/qBTLfQALjE0Bz8sU1cH6ZOoAMZnvcIJDX
 0+hwhOmXZWB1p54XytQ+ram309bSb6iaEwgw0Pm5PQX9jH504U02ZkcnWj3IPUipNF
 LCjz2xc3KjcYCh7eeWhLF6goheRYChBXe+D6axaq0ERetlgl19Q35K6xSwl3SaRkPC
 TRuRsH1e6FCN0NhuUpx0dz01TwnJ4oE/frGX3TV4IZEi1tBBxZmIDhDX1L4UOSoB1k
 otheDJEfThXLEu0bztm1wmTOFtJcqHRarL2+fRbDIkgvOtseFlxbi54LNq69YqKU/3
 SeXxeiOXGvdsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907044410.1368008-3-xiaolu.xie@intel.com>
References: <20260906094156.1057767-1-xiaolu.xie@intel.com>
 <20260907044410.1368008-1-xiaolu.xie@intel.com>
 <20260907044410.1368008-3-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 05:04:56 +0000
Message-Id: <20260907050456.97DB61F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mode validation unconditionally rejects all DSC modes for passthro=
ugh PCONs because it derives limits from an all-zero DPCD.
- [Low] Compilation error: `intel_hdmi_dsc_get_num_slices` is called with 6=
 arguments but defined with 5.
--

commit 3c5cccb0470ef014fba8e2a861fd6cfffd5b223d
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

This patch adds explicit driver control of PCON DSC passthrough. It detects
passthrough capability at connect time and treats the PCON as DSC-capable.
DSC parameters are now derived from the downstream HDMI sink's EDID DSC
capabilities rather than the PCON encoder DPCD.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 113d767e62e9c..53d4d884f726b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -2534,10 +2573,20 @@ bool intel_dp_mode_valid_with_dsc(struct intel_co=
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
Does this logic unintentionally reject all DSC modes for passthrough PCONs?

Because connector->dp.dsc_dpcd is all-zero for passthrough PCONs, calling
drm_dp_dsc_sink_max_slice_count() on it will return 0. This results in
dsc_slice_count being capped at 0, which will cause the mode validation to
fail and reject high-bandwidth modes.

Additionally, could a similar issue occur in intel_dp_mode_valid_format()
where it computes pipe_bpp via intel_dp_dsc_compute_max_bpp()? That function
also relies on the all-zero dsc_dpcd array for passthrough PCONs, returning=
 0
and causing a cascading failure that rejects the mode.

> +	} else {
> +		dsc_slice_count =3D intel_dp_dsc_get_slice_count(connector,
> +							       mode_clock,
> +							       mode_hdisplay,
> +							       num_joined_pipes);
> +	}

[ ... ]

> @@ -4297,6 +4386,116 @@ void intel_dp_check_frl_training(struct intel_dp =
*intel_dp)

[ ... ]

> +	/*
> +	 * src_max_slice_width: pass INT_MAX so the HDMI spec limit of 2720px
> +	 * applies; the source VDSC HW limit (5120px) is higher so it is not
> +	 * the binding constraint here.
> +	 * src_max_slices: use hdmi_max_slices as the binding upper limit since
> +	 * the PCON passthrough capability bit (already checked) is the gate;
> +	 * the for-loop below further constrains to what the Intel VDSC HW can
> +	 * actually produce.
> +	 */
> +	target_slices =3D intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjuste=
d_mode,
> +						      crtc_state->output_format,
> +						      hdmi_max_slices, INT_MAX,
> +						      hdmi_max_slices,
> +						      hdmi_throughput);

[Severity: Low]
Does this code introduce a build failure?

The function intel_hdmi_dsc_get_num_slices() is called here with 6 argument=
s,
but its definition only accepts 5 arguments.

> +	if (!target_slices)
> +		return false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907044410.1368=
008-1-xiaolu.xie@intel.com?part=3D2
