Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619C1C79FAD
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2026 05:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D427610EEC5;
	Wed,  9 Sep 2026 05:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Chy0n8Ne";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F3610EEC5
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 05:29:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 14B5241370;
 Wed,  9 Sep 2026 05:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EEF1F00A3A;
 Wed,  9 Sep 2026 05:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788931752;
 bh=CZN3gi9zgMNy3lNgLSMsdAoY16C8AVYhgT2GpYdMqAs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Chy0n8NeJ1UHL+N/ZDVmZzLgY9p/fz2U1uGXq2hK/stcX/FHRQN5UhcIUTxBgSD4E
 1u1iW5HdDjCHDRcdm4hh2m8tDUIG+tE/pubi2C78ntA2uLpWN+FG152Yhnm2PfhoBp
 2jnk5rhFm3L8d63n6HFMDJlXFLqUTfAMm34UkdLrVYwwUJYUE5bSfWfY7lIyEBqC7c
 783aLFkYYiSj3ltQndq962SaQMUTk2Yi/9+2gqIBI6JqY67/UnKL3/iD/z9meA1jUY
 Awp1cbzJE1xQO9kL7nXRzY5UY3n5l16xEDuQLsiToQFn05eOew4vuT8s6XXPVVwSv6
 DG7mLHjqri0gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8] drm/i915/dp: enable DSC passthrough for HDMI 2.1
 PCON devices
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260909051308.388381-1-xiaolu.xie@intel.com>
References: <20260909041041.244531-2-xiaolu.xie@intel.com>
 <20260909051308.388381-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 05:29:11 +0000
Message-Id: <20260909052911.C2EEF1F00A3A@smtp.kernel.org>
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
- [High] Incorrect connector reference in MST DSC slice configuration cause=
s unconditional failure.
- [Medium] PCON hardware maximum slice limit is ignored during passthrough =
configuration.
--

commit 76a629f18177f4364fe642d6c3207fc584a095ea
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
> index 0cd5e6b5034cf..e0e90219a150d 100644
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

[Severity: High]
Does this code correctly handle MST topologies? The caller
intel_dp_dsc_compute_config() already has the correct connector available, =
but
does not pass it down. Instead, intel_dp_pcon_passthrough_dsc_slice_config()
derives it via intel_dp->attached_connector.

For an MST topology, this points to the physical root connector (the hub), =
not
the virtual MST connector corresponding to the display. The root connector's
display_info lacks the downstream HDMI sink's DSC capabilities from EDID, w=
hich
causes info->hdmi.dsc_cap.max_slices and clk_per_slice to be zero, leading
intel_hdmi_dsc_get_num_slices() to fail unconditionally.

Should intel_dp_pcon_passthrough_dsc_slice_config() accept an explicit
struct intel_connector * parameter from its caller to ensure MST streams use
the correct EDID capabilities?

> +
> +	/*
> +	 * Derive the required slice count from the downstream HDMI 2.1 sink
> +	 * DSC capabilities in EDID (not from the PCON encoder DPCD which is
> +	 * all-zero for passthrough-only devices).
> +	 */
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

[Severity: Medium]
Does this configuration respect the PCON adapter's passthrough limits?

While intel_dp_mode_valid_with_dsc() properly caps the validated slice count
using the PCON's own passthrough limit from dsc_dpcd, this function directly
passes hdmi_max_slices as the src_max_slices parameter to
intel_hdmi_dsc_get_num_slices().

If the HDMI 2.1 sink supports a higher maximum DSC slice count than the
intermediate PCON adapter, the source VDSC engine could be configured with a
slice count that the PCON cannot forward.

Should this be bounded by the PCON's DPCD slice limit to ensure the source =
is
not programmed beyond the adapter's capabilities?

> +	if (!target_slices)
> +		return false;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909051308.3883=
81-1-xiaolu.xie@intel.com?part=3D1
