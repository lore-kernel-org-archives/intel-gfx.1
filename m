Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE4C79F9E
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 05:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013BC10E45D;
	Mon,  7 Sep 2026 05:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QqY/VjEr";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DE910E45D
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 05:03:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7716A60AB5;
 Mon,  7 Sep 2026 05:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C54A1F00A3A;
 Mon,  7 Sep 2026 05:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788757425;
 bh=v27d3t+NpVjSr/tnVexTF47XpP/mJX8xHbfNCmmFpnQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QqY/VjEr1WfjbCsPYQ8VYhQn4eJrS/zYLClkU3TtRdBCM45Ri7SHgcod1Kf5Wf5Fo
 QPuTRHtB7sRRrCj0dilRtDoBL3jvMA5UU3lusULEyMuUMf7Wu5jaCznbwIUkLdU1ph
 8ZJSlt1WtRNAXx3xf43DkZgZmuSiQpgOAZUW0UZk1k1RbgEXisO9MBoz2J3AqBC2UX
 uwmjTCTzfYZaoXDC/U34YJr9Gm+cwu64yoelouJxcCIT1AYKhKEPiz9aKW2drz8BcA
 QishcEiA/alJUtKoxss2jhvBee19jyhpzUgRjLOnOrFQ4QorfutJ1kGgjsnRQYYiIc
 TD3rKj5tLtlWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907043922.1367673-2-xiaolu.xie@intel.com>
References: <20260907043922.1367673-1-xiaolu.xie@intel.com>
 <20260907043922.1367673-2-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 05:03:44 +0000
Message-Id: <20260907050345.0C54A1F00A3A@smtp.kernel.org>
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
- [High] PCON DSC passthrough is enabled without verifying the Intel displa=
y source supports DSC 1.2, forcing an incompatible bitstream on older platf=
orms.
- [High] DSC modes are incorrectly rejected for passthrough PCONs during mo=
de validation due to reliance on zeroed DPCD capabilities.
- [High] Data race on bitfield resulting in lost updates for connector->dp.=
dsc_decompression_enabled and pcon_dsc_passthrough.
--

commit f0cec5b3c63643b719cd4fdc47fea560e78d2d25
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

HDMI 2.1 PCON devices (e.g. Parade PS196) that do not have an internal
DSC encoder can still forward a DSC-compressed stream from the DP source
to the downstream HDMI 2.1 sink unchanged (passthrough mode). The HDMI
sink (e.g. Lenovo ThinkVision Pro 27UD-10) then decompresses the stream
itself.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index 5f0fe18c0614e..90d77aa4d2346 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -564,6 +564,7 @@ struct intel_connector {
>  		u8 dsc_hblank_expansion_quirk:1;
>  		u8 dsc_throughput_quirk:1;
>  		u8 dsc_decompression_enabled:1;
> +		u8 pcon_dsc_passthrough:1; /* PCON DSC PT supported and HDMI sink DSC =
1.2 */

[Severity: High]
Could this introduce a data race on the bitfield, resulting in lost updates=
 for
connector->dp.dsc_decompression_enabled and pcon_dsc_passthrough?

Concurrent read-modify-write operations can occur when hotplug/probe
(where intel_dp_pcon_set_dsc_passthrough_cap() executes) races with
asynchronous modeset commit tail operations that modify adjacent bits like
dsc_decompression_enabled.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..fb81cbfcdff6d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -2524,10 +2563,20 @@ bool intel_dp_mode_valid_with_dsc(struct intel_co=
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
Will this evaluate to 0 because the PCON's dsc_dpcd is zeroed?

For a passthrough-only PCON, its decoder dsc_dpcd is zeroed. As a result,
drm_dp_dsc_sink_max_slice_count() will return 0, which makes dsc_slice_coun=
t 0
and guarantees the mode will be rejected downstream.

Additionally, during mode validation, intel_dp_mode_valid_format() calls
intel_dp_dsc_compute_max_bpp(), which relies on align_max_sink_dsc_input_bp=
p().
Since the DPCD capabilities are zeroed, this also returns 0, causing modes
requiring DSC to be incorrectly rejected.

[ ... ]
> @@ -4298,6 +4387,116 @@ void intel_dp_check_frl_training(struct intel_dp =
*intel_dp)
>  	}
>  }
> =20
> +/*
> + * intel_dp_pcon_set_dsc_passthrough_cap - cache PCON DSC passthrough ca=
pability
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
> +
> +	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
> +		return;
> +
> +	if (!(connector->dp.dsc_dpcd[0] & DP_DSC_PASSTHROUGH_IS_SUPPORTED))
> +		return;
> +
> +	info =3D &connector->base.display_info;
> +	connector->dp.pcon_dsc_passthrough =3D info->hdmi.dsc_cap.v_1p2;

[Severity: High]
Does this enable passthrough without verifying the Intel display source
supports DSC 1.2?

If the source is older (e.g., pre-DISPLAY_VER 14 like Tiger Lake), it only
supports DSC 1.1. Later in intel_dp_dsc_compute_params(), the VDSC engine
will be configured for DSC 1.1:

	vdsc_cfg->dsc_version_minor =3D min(intel_dp_source_dsc_version_minor(disp=
lay), 2);

Could this result in sending a DSC 1.1 bitstream to an HDMI 2.1 sink that
mandates DSC 1.2a, leading to corrupted output or display failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907043922.1367=
673-1-xiaolu.xie@intel.com?part=3D2
