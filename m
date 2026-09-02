Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98832C624D3
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 05:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2FE10EFEB;
	Wed,  2 Sep 2026 05:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cuN2xHhg";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E7810EFEB
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 05:30:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D606560229;
 Wed,  2 Sep 2026 05:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637B41F000E9;
 Wed,  2 Sep 2026 05:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788327047;
 bh=35V8LP7stcHUw6v4FpweMqdQWSAUT7fNLvGMMfB0PMI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cuN2xHhgxv+Lyu4/QUSdRe22sh0U3IUAkpqW1s2feQl9/v80YaR+2MhSsKISjZD/m
 sowjLUM4hFfHnudhBjt9UyZ1OzmOoscpc5sSMxykdqC5P7+ZDPHZ/rYorpGUbImwzj
 yONpp7D0K1fyf6CW/4vcS41FohREO1Lf2y5gfJ/taiiBQmEmNs09osBJwxNCh/4lbS
 qXaKUNLY/6zsKh2eXyhIfmvJ5JTARw5PtycoRxp0s5azcdL78Ps+zpfPN95JTJlSk+
 zNxq1S1NLco7xZ61dgMXk++HMyq68rTbMlk4edwpSZ1j2TqJJh13WHb/L2OPQgr9mr
 /IKh5M+nOryRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] drm/i915/display: Enable VRR/HDR over MST
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260902050926.264000-1-xiaolu.xie@intel.com>
References: <20260901132601.239131-1-xiaolu.xie@intel.com>
 <20260902050926.264000-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 05:30:46 +0000
Message-Id: <20260902053047.637B41F000E9@smtp.kernel.org>
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
- [High] Sleeping in Atomic Context via DPCD reads/writes
- [Medium] Stale Cached Hardware State for MSA timing par ignore capability
- [Low] Duplicated block of comments for vrr_capable_property
--

commit 3a17e2d16d11206d1e9f75d12cdff011a2baaa07
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/display: Enable VRR/HDR over MST

This commit enables Variable Refresh Rate (VRR) and High Dynamic Range (HDR)
metadata over DisplayPort Multi-Stream Transport (MST). It removes the hard
MST block in the VRR capability check, utilizes DPCD reads to determine MSA
timing ignore capability, and manages related connector properties.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c

[ ... ]

> @@ -1157,6 +1160,24 @@ static void mst_stream_post_disable(struct intel_a=
tomic_state *state,
>  	 * Power down mst path before disabling the port, otherwise we end
>  	 * up getting interrupts from the sink upon detecting link loss.
>  	 */
> +	if (old_crtc_state->vrr.enable) {
> +		u8 val;
> +		ssize_t ret;
> +
> +		ret =3D drm_dp_mst_dpcd_read(&connector->mst.port->aux,
> +					   DP_DOWNSPREAD_CTRL, &val, 1);

[Severity: High]
Encoder atomic callbacks like mst_stream_post_disable() execute in atomic
context where sleeping is forbidden. Does the new drm_dp_mst_dpcd_read()
function sleep?

It appears to rely on a call chain that can sleep:

drm_dp_mst_dpcd_read()
   drm_dp_send_dpcd_read()
      kzalloc_obj() // Uses implicit GFP_KERNEL allocations
      drm_dp_mst_wait_tx_reply() // Uses sleepable wait primitives

Will this cause a kernel splat (e.g., "BUG: sleeping function called from
invalid context") or system hang during a modeset?

[ ... ]

> @@ -1274,6 +1295,24 @@ static void mst_stream_pre_enable(struct intel_ato=
mic_state *state,
> =20
>  	drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.port, t=
rue);
> =20
> +	if (pipe_config->vrr.enable) {
> +		u8 val;
> +		ssize_t ret;
> +
> +		ret =3D drm_dp_mst_dpcd_read(&connector->mst.port->aux,
> +					   DP_DOWNSPREAD_CTRL, &val, 1);

[Severity: High]
Similarly, mst_stream_pre_enable() executes in atomic context. Does calling
drm_dp_mst_dpcd_read() here also violate the atomic context sleeping
prohibition?

[ ... ]

> @@ -1745,6 +1811,34 @@ static int mst_topology_add_connector_properties(s=
truct intel_dp *intel_dp,
>  	if (connector->base.max_bpc_property)
>  		drm_connector_attach_max_bpc_property(&connector->base, 6, 12);
> =20
> +	/*
> +	 * Reuse the vrr_capable prop from the eDP connector (which is always
> +	 * initialized during driver load before device registration), because
> +	 * we're not allowed to create new props after device registration.
> +	 */
> +	/*
> +	 * Reuse the vrr_capable property from the root intel_dp SST connector
> +	 * which was created during driver load (before device registration).
> +	 * MST connectors are created after device registration, so we cannot
> +	 * create new properties here - we must attach the existing one.
> +	 */
> +	/*
> +	 * Reuse the vrr_capable property from the root intel_dp SST connector
> +	 * which was created during driver load (before device registration).
> +	 * MST connectors are created after device registration, so we cannot
> +	 * create new properties here - we must attach the existing one.
> +	 * Also assign connector->vrr_capable_property so that
> +	 * drm_connector_set_vrr_capable_property() can update the value.
> +	 */

[Severity: Low]
this isn't a bug, but you've duplicated this comment block multiple times.
Was this pasted by accident?

[ ... ]

> @@ -1755,6 +1849,18 @@ intel_dp_mst_read_decompression_port_dsc_caps(stru=
ct intel_dp *intel_dp,
>  	u8 dpcd_caps[DP_RECEIVER_CAP_SIZE];
>  	struct drm_dp_desc desc;
> =20
> +	/*
> +	 * Read MSA timing par ignore capability from the sink's virtual DPCD.
> +	 * This is independent of DSC support so read it before the DSC check.
> +	 */
> +	{
> +		u8 mst_dpcd[DP_RECEIVER_CAP_SIZE];
> +
> +		if (drm_dp_read_dpcd_caps(&connector->mst.port->aux, mst_dpcd) =3D=3D =
0)
> +			connector->dp.mst_msa_timing_par_ignore =3D
> +				drm_dp_sink_can_do_video_without_timing_msa(mst_dpcd);
> +	}

[Severity: Medium]
Because intel_dp_mst_read_decompression_port_dsc_caps() is only called duri=
ng
connector initialization, can this result in stale capabilities being cache=
d?

If a user hot-swaps a downstream sink on an MST branch device, the MST
topology manager might reuse the existing connector without destroying it or
re-running its initialization callbacks.

Will connector->dp.mst_msa_timing_par_ignore retain the stale capability of
the previously connected monitor?

> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c

[ ... ]

> @@ -55,8 +55,19 @@ bool intel_vrr_is_capable(struct intel_connector *conn=
ector)
>  			return false;
>  		fallthrough;
>  	case DRM_MODE_CONNECTOR_DisplayPort:
> -		if (connector->mst.dp)
> -			return false;
> +		if (connector->mst.dp) {
> +			/*
> +			 * Use cached MSA timing ignore capability from the DFP
> +			 * sink's virtual DPCD, set during connector init in
> +			 * intel_dp_mst_read_decompression_port_dsc_caps().
> +			 * Avoid live sideband reads here as this function is
> +			 * called from the atomic check path.
> +			 */
> +			if (!connector->dp.mst_msa_timing_par_ignore)
> +				return false;

[Severity: Medium]
As mentioned above, if the cached mst_msa_timing_par_ignore value becomes
stale due to a hotplug event, could intel_vrr_is_capable() mistakenly enable
or disable VRR functionality for the new monitor based on the old monitor's
capabilities?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902050926.2640=
00-1-xiaolu.xie@intel.com?part=3D1
