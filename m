Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0DDC61DD3
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 01:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5508C10E41A;
	Wed,  2 Sep 2026 01:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DK4w0VyX";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406E810E41A
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 01:48:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 12E9043E51;
 Wed,  2 Sep 2026 01:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCCB1F000E9;
 Wed,  2 Sep 2026 01:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788313722;
 bh=nG3Ilno/RVKbtmm8kJVXhqm7exIvzzwLh2k/qZWY7PU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DK4w0VyX9/7v11cpLROG5QAMqUPnT+FZiWE9qSpzHSxrQSZwhU76BvjwAs2mMUiFI
 euTaLi006K3JO1yYbUda95IbG0kabAo+VZnDSuV1ntjFQC0rPrjaxJO6UqB42r/Wqd
 m4Vijnb3FyB/X/g9lywYrVolwB4ZHfGeK6B6uwAQIF+aGq7GLNf96jtINOSgOB29Sw
 LU/FwzBpwpE3ExPOAiv3QzrWL8XR+0XQx2brVjcKYomhYbN3Ngm7iJD9/47hyXVcPd
 R8zaWYy8mT9kFAaod0Z3KScUAu4FckhyHUixsMs8GcgjLFWD4RWtABYqRVJ5rluAmT
 I36IMdTyMtmsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/i915/display: Enable VRR/HDR over MST
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260902012852.250993-1-xiaolu.xie@intel.com>
References: <20260901132601.239131-1-xiaolu.xie@intel.com>
 <20260902012852.250993-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 01:48:41 +0000
Message-Id: <20260902014841.BDCCB1F000E9@smtp.kernel.org>
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
- [High] AS-SDP computation is broken for MST streams because the branch de=
vice check unconditionally returns false.
- [High] VRR capability caching is incorrectly tied to DSC support, silentl=
y breaking VRR on MST monitors that lack DSC.
- [High] DP_MSA_TIMING_PAR_IGNORE_EN is unconditionally enabled based on ca=
pability rather than active VRR state.
- [High] Dynamic creation of `vrr_capable_property` after device registrati=
on during MST hotplug triggers a kernel WARN_ON and leaks memory.
--

commit 67043be5215717a8902d6610575b918e36e9945a
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/display: Enable VRR/HDR over MST

This commit introduces VRR and HDR metadata support over MST display stream=
s.
It caches the downstream port's MSA timing par ignore capability and enables
AS-SDP and VSC SDP computation and transmission for MST connectors.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 6a869d0f6ffc0..657440e2cb648 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c

[ ... ]

> @@ -793,6 +793,9 @@ static int mst_stream_compute_config(struct intel_ato=
mic_state *state,
>  			bxt_dpio_phy_calc_lane_lat_optim_mask(pipe_config->lane_count);
> =20
>  	intel_vrr_compute_config(pipe_config, conn_state);
> +	intel_dp_compute_as_sdp(intel_dp, pipe_config);

[Severity: High]
Will this AS-SDP computation actually run for MST topologies?

In intel_dp_compute_as_sdp() (which calls intel_dp_needs_as_sdp()), there is
an existing check that unconditionally disables AS-SDP for branch devices:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_needs_as_sdp()
    if (drm_dp_is_branch(intel_dp->dpcd))
        return false;

Since the primary DP device in an MST topology is always a branch device
(the MST hub), this check will always return false, silently aborting the
AS-SDP logic you are enabling here.

[ ... ]

> @@ -1274,6 +1295,24 @@ static void mst_stream_pre_enable(struct intel_ato=
mic_state *state,
> =20
>  	drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.port, t=
rue);
> =20
> +	if (intel_vrr_is_capable(connector)) {
> +		u8 val;
> +		ssize_t ret;
> +
> +		ret =3D drm_dp_mst_dpcd_read(&connector->mst.port->aux,
> +					   DP_DOWNSPREAD_CTRL, &val, 1);
> +		if (ret < 0) {
> +			drm_dbg_kms(display->drm,
> +				    "[CONNECTOR:%d:%s] Failed to read DP_DOWNSPREAD_CTRL: %zd\n",
> +				    connector->base.base.id,
> +				    connector->base.name, ret);
> +		} else {
> +			val |=3D DP_MSA_TIMING_PAR_IGNORE_EN;
> +			drm_dp_mst_dpcd_write(&connector->mst.port->aux,
> +					      DP_DOWNSPREAD_CTRL, &val, 1);
> +		}
> +	}

[Severity: High]
Does this alter the sink behavior unconditionally, even when VRR is not act=
ive?

The DP_MSA_TIMING_PAR_IGNORE_EN bit is being written based solely on
intel_vrr_is_capable(connector), bypassing any check for whether VRR is
actually enabled for this atomic state (e.g. crtc_state->vrr.enable).

This will program the sink to ignore MSA video timings even when a fixed
refresh rate is active. Could this lead to display corruption or sync loss
on monitors that expect strict MSA timings during fixed-refresh operation?

[ ... ]

> @@ -1745,6 +1799,14 @@ static int mst_topology_add_connector_properties(s=
truct intel_dp *intel_dp,
>  	if (connector->base.max_bpc_property)
>  		drm_connector_attach_max_bpc_property(&connector->base, 6, 12);
> =20
> +	/*
> +	 * Reuse the vrr_capable prop from the eDP connector (which is always
> +	 * initialized during driver load before device registration), because
> +	 * we're not allowed to create new props after device registration.
> +	 */
> +	if (HAS_VRR(display))
> +		drm_connector_attach_vrr_capable_property(&connector->base);

[Severity: High]
Does this safely reuse the property without triggering a kernel WARN_ON?

Although the comment mentions reusing the vrr_capable property, the code
does not seed connector->base.vrr_capable_property with the shared property
pointer before calling drm_connector_attach_vrr_capable_property().

Because it is unseeded, drm_connector_attach_vrr_capable_property() will
try to allocate a new property via drm_property_create_bool(). Creating
new properties after device registration is forbidden and triggers a
WARN_ON in __drm_mode_object_add().

This will also permanently leak a DRM property object in the device's
global property list on every MST hotplug.

[ ... ]

> @@ -1761,6 +1823,9 @@ intel_dp_mst_read_decompression_port_dsc_caps(struc=
t intel_dp *intel_dp,
>  	if (drm_dp_read_dpcd_caps(connector->dp.dsc_decompression_aux, dpcd_cap=
s) < 0)
>  		return;
> =20
> +	connector->dp.mst_msa_timing_par_ignore =3D
> +		drm_dp_sink_can_do_video_without_timing_msa(dpcd_caps);

[Severity: High]
Will VRR be disabled on MST monitors that do not support DSC decompression?

The flag mst_msa_timing_par_ignore is populated here, but this function has
an early return higher up:

    if (!connector->dp.dsc_decompression_aux)
        return;

For non-DSC MST displays, this flag remains uninitialized (false). Later,
intel_vrr_is_capable() relies on this cached value to determine VRR
support:

drivers/gpu/drm/i915/display/intel_vrr.c:intel_vrr_is_capable()
    if (!connector->dp.mst_msa_timing_par_ignore)
        return false;

This will cause intel_vrr_is_capable() to unconditionally reject VRR for
any MST display that lacks a DSC decompression AUX port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902012852.2509=
93-1-xiaolu.xie@intel.com?part=3D1
