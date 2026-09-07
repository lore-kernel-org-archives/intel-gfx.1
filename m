Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A5AC79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 04:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A4210E42D;
	Mon,  7 Sep 2026 04:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f1EGHK3O";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655CC10E42D
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 04:53:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6BE4460052;
 Mon,  7 Sep 2026 04:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CEA1F00A3D;
 Mon,  7 Sep 2026 04:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788756818;
 bh=WrnuYHkPNCA4tvCKgU+E38ZT1wstAO0xFwrbLCeHBCI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=f1EGHK3OHn4Mnw9gKOZ2+I5ZZT78zPTAI8BV7reZFQ1K1upaJ1RCTbTnOzmQRViqj
 2DEoj5IxYyWTaDfIIEK/wyYE8yhz5cq1dIAUpIaei8+s12egYqJIE9DQfH4wxxJJok
 tcCi2PeKQciHnKBaxrO7SDVkcq3EOQYUjQ/ZZmsynqe3cQ0CPf2UbQw74X7+EPMG38
 U4TNdS6OB0AGxQk23RiFmVDVAuKpc6QBLpv6nEYyJBvThz5XueNdX+jmBQecg5gGVv
 aOff2+n93zlmas3OV1WfXwJ8VX9NBsNNExlgIhO509tCqZS1WvoavwzS48MUKmI7RL
 WtMYpHt4GeyAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual
 DPCD in DP-to-DP topology
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907044140.1367870-1-xiaolu.xie@intel.com>
References: <20260906094156.1057767-1-xiaolu.xie@intel.com>
 <20260907044140.1367870-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 04:53:37 +0000
Message-Id: <20260907045337.E8CEA1F00A3D@smtp.kernel.org>
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
- [Medium] The logic for identifying a Virtual DPCD downstream port misses =
the required DPCD_Revision check, causing standard legacy converters to be =
incorrectly identified as Virtual DPCDs.
--

commit 659313a54262ef8ae8960a7c3b7925da1958206b
Author: Xiao Lu <xiaolu.xie@intel.com>

    drm/dp/mst: recognize DP-to-HDMI PCON as virtual DPCD in DP-to-DP topol=
ogy

This commit updates drm_dp_mst_is_virtual_dpcd() to accept legacy converters
as a valid downstream peer type. This allows the driver to correctly identi=
fy
PCON devices that advertise their downstream HDMI sink port using
DP_PEER_DEVICE_DP_LEGACY_CONV.

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
>  			    !downstream_port->input) {
>  				mutex_unlock(&port->mgr->lock);
>  				return true;

[Severity: Medium]
Will this incorrectly identify standard legacy converters as Virtual DPCDs?

The commit message notes that Virtual DPCD presence for legacy converters
is indicated by a non-zero DPCD_Revision (VESA SCR Option 2), but the added
logic accepts DP_PEER_DEVICE_DP_LEGACY_CONV without verifying if
downstream_port->dpcd_rev !=3D 0.

Could this cause the driver to improperly set passthrough_aux and attempt
DPCD reads on a standard DP-to-VGA/DVI/HDMI converter (with dpcd_rev =3D=3D=
 0)
connected to a 2-port MST branch device, resulting in AUX timeouts or link
training failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907044140.1367=
870-1-xiaolu.xie@intel.com?part=3D1
