Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D718C79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 04:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B5210E630;
	Mon,  7 Sep 2026 04:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MlqRtJFY";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BB010E630
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 04:56:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8A96F60A96;
 Mon,  7 Sep 2026 04:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5651F00A3A;
 Mon,  7 Sep 2026 04:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788756986;
 bh=+kKijo74IcpYSx6w2OLd4jznb/EgMUTvZyqnnzx7Bi4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MlqRtJFYjnO15TJ8rudoLv/y3dtzQvn00RJ5Huk4gTHErpBuI8Jpky4V70SAefbSc
 XSkzbqK1p2KErckwDHlPEZ6Lu5lQe87eeLEs85ThieSiqu0P1Crj10jVb2PbpyyTS8
 2FsN7oWJqr730MiFo84dj+4yVImIckd9wwCxLZ8yx3cPaYphmJnPbvwYmvz09/6+sT
 79YEUTJOFF2XgD4i8jyoAInxEJjkTREAqSvI+FESoZTqjsUkYPfae78EEBSlh0YwTh
 hSKgHzPLAdC6osUeepg6C86Z23ALLB7drwQDhPic53SOhc25b+DC1lBKvezmhj1j9U
 80DZBofb8co0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907044140.1367870-2-xiaolu.xie@intel.com>
References: <20260906094156.1057767-1-xiaolu.xie@intel.com>
 <20260907044140.1367870-1-xiaolu.xie@intel.com>
 <20260907044140.1367870-2-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 04:56:25 +0000
Message-Id: <20260907045626.1D5651F00A3A@smtp.kernel.org>
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
- [High] Slice count calculation for passthrough-only PCONs evaluates to 0,=
 unconditionally rejecting valid DSC modes.
- [Low] Call to intel_hdmi_dsc_get_num_slices uses an incorrect function si=
gnature, causing a build failure and potential out-of-bounds read if coerce=
d.
--

commit 143c11b20062c81b5ac2377b90407f1c60975424
Author: Xiao Lu <xiaolu.xie@intel.com>
drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

This commit adds explicit driver control for PCON DSC passthrough
capabilities, allowing HDMI 2.1 PCON devices to forward compressed streams
to a downstream HDMI sink for decompression. It detects passthrough support,
overrides DSC configuration paths to use the HDMI sink's capabilities, and
writes appropriate registers to enable passthrough instead of relying on
autonomous fallbacks.

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
Does this regression artificially cap the slice count to zero for passthrou=
gh
PCONs?

As noted in the commit message, the PCON encoder DPCD fields are all-zero f=
or
passthrough-only devices. Because connector->dp.dsc_dpcd is zeroed out,
calling drm_dp_dsc_sink_max_slice_count() will evaluate to 0.

Since this is passed into min_t(), wouldn't dsc_slice_count evaluate to 0
and unconditionally reject valid DSC modes downstream in this function?

>  	} else {
>  		dsc_slice_count =3D intel_dp_dsc_get_slice_count(connector,
[ ... ]
> @@ -4297,6 +4386,116 @@ void intel_dp_check_frl_training(struct intel_dp =
*intel_dp)
>  	}
>  }
> =20
> +/*
> + * intel_dp_pcon_set_dsc_passthrough_cap - cache PCON DSC passthrough ca=
pability
[ ... ]
> +static bool
> +intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state,
> +					   struct intel_dsc_slice_config *config_ret)
> +{
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
Can this regression cause a build failure or memory issues?

The call to intel_hdmi_dsc_get_num_slices() passes 6 arguments, and the fir=
st
argument is passed as &crtc_state->hw.adjusted_mode.

Looking at the actual definition of intel_hdmi_dsc_get_num_slices() in
drivers/gpu/drm/i915/display/intel_hdmi.c:

int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
                                  int src_max_slices, int src_max_slice_wid=
th,
                                  int hdmi_max_slices, int hdmi_throughput)

It still expects 5 arguments, with the first being a const struct
intel_crtc_state *. Could this result in an out-of-bounds read if the
compiler coerces the smaller drm_display_mode struct into an
intel_crtc_state?

> +	if (!target_slices)
> +		return false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907044140.1367=
870-1-xiaolu.xie@intel.com?part=3D2
