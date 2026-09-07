Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88730C79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 04:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0275D10E439;
	Mon,  7 Sep 2026 04:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hKlFM4I1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B077110E439
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 04:54:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 33A6B60052;
 Mon,  7 Sep 2026 04:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05761F00A3A;
 Mon,  7 Sep 2026 04:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788756858;
 bh=Q8znB9oewQ+h5rv6QpHj3GDkSJw28g9Q0B7Hw2os/rE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hKlFM4I1AeNbMOFDFUNRkbnFMoiMRKPWIiK4+BoUicMHI5RfzX512l/sBK9s17H0O
 3lpZCDGLKPWHb5be/HyFChn/mMQ6mdNe/0LSEi8cVSoVUzFG/qw1s5iwofXX8rSQyR
 mYv8r3F1Cz5HXgsV2eRw4mc7H/UECGDe2vwTPPh3XB7A+2sjwk6fXXpwdM6o4EjGN3
 wesfHhcZiUstX8r5cL3f3RYMN5k1Y3W8Wfz+gQe26MOgK6YCe8tIWWpO6YBnmVIy59
 sdJEHsFUYcRfF0YWI+fMbJy5kHoo+rzN8ouhH1pcDa38L6qwJRQuE14dL3UkMUhPus
 7ywo/twoFSEwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual
 DPCD in DP-to-DP topology
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907044410.1368008-2-xiaolu.xie@intel.com>
References: <20260906094156.1057767-1-xiaolu.xie@intel.com>
 <20260907044410.1368008-1-xiaolu.xie@intel.com>
 <20260907044410.1368008-2-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 04:54:18 +0000
Message-Id: <20260907045418.B05761F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing DPCD_Revision check causes false positive virtual DPCD det=
ection for standard legacy converters
--

commit e68ed6d2cec8654867cd8f6c00fc3632759c424a
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/dp/mst: recognize DP-to-HDMI PCON as virtual DPCD in DP-to-DP topology

This commit modifies the drm_dp_mst_is_virtual_dpcd() function to accept
DP_PEER_DEVICE_DP_LEGACY_CONV downstream ports as virtual DPCDs on DP-to-DP
branches. This is intended to support DP-to-HDMI PCON devices using VESA SCR
Option 2.

> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 7ce9e212770ad..5f15d9313a20e 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -6047,7 +6047,8 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_d=
p_mst_port *port)
>  	    port->mstb &&
>  	    port->mstb->num_ports =3D=3D 2) {
>  		list_for_each_entry(downstream_port, &port->mstb->ports, next) {
> -			if (downstream_port->pdt =3D=3D DP_PEER_DEVICE_SST_SINK &&
> +			if ((downstream_port->pdt =3D=3D DP_PEER_DEVICE_SST_SINK ||
> +			     downstream_port->pdt =3D=3D DP_PEER_DEVICE_DP_LEGACY_CONV) &&

[Severity: High]
The commit message states that PCON devices advertise a non-zero DPCD_Revis=
ion
in the link address reply, but this code block appears to check only the pdt
without validating downstream_port->dpcd_rev !=3D 0.

Does this cause standard legacy DP-to-HDMI/VGA adapters (which also report
DP_PEER_DEVICE_DP_LEGACY_CONV but with dpcd_rev =3D=3D 0) to be incorrectly
identified as virtual DPCDs?

If a standard legacy converter is falsely identified as a virtual DPCD,
drm_dp_mst_dsc_aux_for_port() might skip the mandatory FEC capability check
for that branch. Could this cause DSC to be enabled on paths without FEC
support, leading to link training failures and black screens when users plug
standard adapters into MST hubs?

>  			    !downstream_port->input) {
>  				mutex_unlock(&port->mgr->lock);
>  				return true;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907044410.1368=
008-1-xiaolu.xie@intel.com?part=3D1
