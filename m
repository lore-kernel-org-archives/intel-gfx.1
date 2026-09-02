Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB5AC61DD3
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 03:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9508310EFBE;
	Wed,  2 Sep 2026 03:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QiqR0phE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CE610EFBE
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 03:38:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8557B600C8;
 Wed,  2 Sep 2026 03:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F991F000E9;
 Wed,  2 Sep 2026 03:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788320326;
 bh=vwBXXM16HkocxWLmUsUcTgY/Dt66pqoCt51BlphckEI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QiqR0phEoBrsLuVof2IwXEFObncRoP+9UvQFaB0hdQogAA7sqxFErWZwXrpW2l44M
 CDA+629BfRExDuf3F00xt+Ff9N0yoxIOsKXZwium1L0x3bozATKMy+joNTWZcQE1rs
 nd6lZuT/7ewAifE6Dpmaa74SxojnxlrSz2qX/TrXGlhXs+7gL5n+sYlyRJA8t9w90p
 52QUgaIjaiYYQrGRMjmSnaOyaYCum0IbJYasmk8ChZmJsvwo4CVralbn+24bkYlXIp
 KhoQTRkti9gZReDpevhJQGmKAWugE6LHKvY9WzDBVIh1He9Jg3+qwQMLaz9b57vOCd
 nwueuJT/p8Cuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] drm/i915/display: Enable VRR/HDR over MST
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260902032207.259156-1-xiaolu.xie@intel.com>
References: <20260901132601.239131-1-xiaolu.xie@intel.com>
 <20260902032207.259156-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 03:38:45 +0000
Message-Id: <20260902033846.19F991F000E9@smtp.kernel.org>
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
- [Medium] Bypassing the DP branch device check for MST streams enables VRR=
 and AS-SDP on MST leaf ports that are PCONs, which is explicitly unsupport=
ed.
- [Low] Triply duplicated comment block explaining the reuse of the vrr_cap=
able_property.
--

commit 0a351efb0934b17f15e6de16fd0583d3287db2d9
Author: Xiao Lu <xiaolu.xie@intel.com>
Subject: drm/i915/display: Enable VRR/HDR over MST

This commit enables Variable Refresh Rate (VRR) and HDR metadata transmissi=
on
over DisplayPort Multi-Stream Transport (MST). It introduces caching of the=
 MSA
timing ignore capability to avoid hot path sideband reads. It also reuses S=
ST
properties for MST streams and lifts previous pipe_bpp caps.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 113d767e62e9c..4b196d26d27f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
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
Does this explicit exemption of MST streams enable AS-SDP packets even if t=
he
downstream MST leaf port is an unsupported PCON?

Because MST streams are exempted from the branch device block here, AS-SDP
packets will be sent to MST streams even when the leaf port is a PCON that
doesn't fully support it.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 3be1643f8d030..021d86b0ed833 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1745,6 +1799,34 @@ static int mst_topology_add_connector_properties(s=
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
This isn't a bug, but it looks like the comment block explaining the reuse =
of
the vrr_capable_property was duplicated three times.

> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 51e4f3309b8b1..9737a19c1899f 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
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
> +
> +			break;
> +		}

[Severity: Medium]
Will this early break for MST streams incorrectly bypass the branch device
check for PCONs?

By breaking out early for MST streams here, the function skips the subseque=
nt
drm_dp_is_branch() check. This means MST leaf ports that are PCONs are
treated as direct VRR-capable sinks if they advertise MSA timing ignore in
their virtual DPCD, which is explicitly unsupported.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902032207.2591=
56-1-xiaolu.xie@intel.com?part=3D1
