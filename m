Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C8BC624D0
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 03:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B3E10E424;
	Wed,  2 Sep 2026 03:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YQN70yZL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005E010E424
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 03:18:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C4F5B600D1;
 Wed,  2 Sep 2026 03:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2631F000E9;
 Wed,  2 Sep 2026 03:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788319089;
 bh=yXgYYWisCQ9wZOu/4HvG55ob6Oacz/mxD5lQDB2R1yU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=YQN70yZLSm9a2L9bgp1qY4RPCfVs06HTA26IE5EKjZgf9vgkh70454JanYG/+xDAl
 4mvlsVKuF97ZcxZl8YN/hDQ7dWa9Kolp08ao8Rn/bVDoHhRZfMCTuRTuSGEVDL7/FD
 r//+xwG+SDoCsvzXZFwMzwxo6/e77wPrIXbj/MoMi/lKYTWJLDE3NZjnBKoispueER
 t/9NoI+9ldpxvnSbaeCRMA2p3tmQIV+yGdxYgtNTnBxC5k93OWxFllt6oAY1yEtBb6
 5uqtRlBTyBUHfCsVNzB/OUMXWGqCFG8tWEdpKyrfPt3S+mWHE2bTE1U0jx898Vg6Uo
 rhdi8bSDP7YDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/i915/display: Enable VRR/HDR over MST
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260902030042.258193-1-xiaolu.xie@intel.com>
References: <20260901132601.239131-1-xiaolu.xie@intel.com>
 <20260902030042.258193-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 03:18:08 +0000
Message-Id: <20260902031809.5C2631F000E9@smtp.kernel.org>
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
- [High] Live hardware DPCD read over MST sideband during the atomic check =
phase causes severe latency and potential Denial of Service.
- [Medium] The `vrr_capable` property value cannot be updated for MST conne=
ctors because `connector->base.vrr_capable_property` is never assigned.
- [Medium] VRR and AS-SDP are incorrectly allowed for PCONs (DP-to-HDMI ada=
pters) connected via MST hubs, bypassing the explicit restriction against b=
ranch devices.
--

commit a21faad85b4c3ba1fae63f3e870858e7080a68a3
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/display: Enable VRR/HDR over MST

This commit enables Variable Refresh Rate (VRR) and HDR metadata over MST
in the i915 driver. It retrieves the downstream port's MSA timing
capabilities to support VRR and transmits AS-SDP and HDR metadata
infoframes over MST streams.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 113d767e62e9c..4b196d26d27f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -3107,9 +3110,12 @@ static bool intel_dp_needs_as_sdp(struct intel_dp =
*intel_dp,
>  		return false;
> =20
>  	/*
> -	 * #TODO: Add AS SDP v1 support for PCONs (DP branch devices).
> +	 * AS-SDP is not yet supported for PCONs (DP-to-HDMI converters).
> +	 * MST hubs are also branch devices but do support AS-SDP forwarding
> +	 * to downstream sinks; allow it for MST streams.
>  	 */
> -	if (drm_dp_is_branch(intel_dp->dpcd))
> +	if (drm_dp_is_branch(intel_dp->dpcd) &&
> +	    !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST))
>  		return false;

[Severity: Medium]
Does this blanket exception for MST streams allow AS-SDP to be sent to
explicitly unsupported branch devices (like PCONs) that are downstream of an
MST hub?

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 3be1643f8d030..e66f9508cb720 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c

[ ... ]

> @@ -1451,6 +1492,15 @@ static int mst_connector_get_ddc_modes(struct drm_=
connector *_connector)
> =20
>  	ret =3D intel_connector_update_modes(&connector->base, drm_edid);
> =20
> +	if (HAS_VRR(display)) {
> +		bool vrr_capable =3D intel_vrr_is_capable(connector);
> +
> +		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
> +			    connector->base.base.id, connector->base.name,
> +			    str_yes_no(vrr_capable));
> +		drm_connector_set_vrr_capable_property(&connector->base, vrr_capable);
> +	}
> +

[Severity: Medium]
Will this call to drm_connector_set_vrr_capable_property() silently do
nothing because connector->base.vrr_capable_property is never assigned for
MST connectors?

The property is attached to the DRM object in
mst_topology_add_connector_properties(), but the pointer itself remains
NULL, which makes the feature invisible to userspace.

[ ... ]

> @@ -1745,6 +1799,23 @@ static int mst_topology_add_connector_properties(s=
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
> +	if (HAS_VRR(display) && intel_dp->attached_connector &&
> +	    intel_dp->attached_connector->base.vrr_capable_property)
> +		drm_object_attach_property(&connector->base.base,
> +					   intel_dp->attached_connector->base.vrr_capable_property,
> +					   0);
> +

[Severity: Medium]
Should this also explicitly assign connector->base.vrr_capable_property so
that later updates to the property work correctly?

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 51e4f3309b8b1..13cd5701bf2c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c

[ ... ]

> @@ -55,8 +55,27 @@ bool intel_vrr_is_capable(struct intel_connector *conn=
ector)
>  			return false;
>  		fallthrough;
>  	case DRM_MODE_CONNECTOR_DisplayPort:
> -		if (connector->mst.dp)
> -			return false;
> +		if (connector->mst.dp) {
> +			u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +
> +			/*
> +			 * Use cached MSA timing ignore capability from the DFP
> +			 * sink's virtual DPCD, set during connector init.
> +			 */
> +			if (!connector->dp.mst_msa_timing_par_ignore)
> +				return false;
> +
> +			/*
> +			 * Also verify live via LCT=3D2 REMOTE_DPCD_READ to the
> +			 * DFP sink's actual DPCD 0x007.
> +			 */
> +			if (drm_dp_read_dpcd_caps(&connector->mst.port->aux, dpcd) < 0)
> +				return false;

[Severity: High]
Can this live hardware DPCD read over the MST sideband cause latency and
potential Denial of Service during the atomic check phase?

Since mst_stream_compute_config() calls intel_vrr_compute_config(), which
in turn calls intel_vrr_is_capable(), this adds a blocking sideband I/O
transaction to the hot KMS atomic_check path. Untrusted userspace
applications spamming DRM_IOCTL_MODE_ATOMIC with the TEST_ONLY flag could
exploit this to saturate the CPU and MST sideband communication channel.

> +			if (!drm_dp_sink_can_do_video_without_timing_msa(dpcd))
> +				return false;
> +
> +			break;

[Severity: Medium]
Is there a missing check for drm_dp_is_branch(dpcd) here?

By omitting it for MST streams, branch devices like PCONs connected behind
MST hubs might be incorrectly considered VRR-capable, bypassing the explicit
restriction against branch devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902030042.2581=
93-1-xiaolu.xie@intel.com?part=3D1
