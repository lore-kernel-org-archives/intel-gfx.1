Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1BDC79F8C
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2026 04:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E296010EEA3;
	Wed,  9 Sep 2026 04:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FecfI6uI";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9879510EEA3
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 04:20:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5983D41863;
 Wed,  9 Sep 2026 04:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118FB1F00A3A;
 Wed,  9 Sep 2026 04:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788927646;
 bh=4otRgk1mpJNyLXP5BEVB1xiW5vLjJTmfPXFbRXB/NZ8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FecfI6uIWuXxP8UTq+Vf/MlsR1z1ShzATdgBdqWi26shjzI6lNRDHe5gvKkja+/NN
 X/bm1BRdjjhws22Gk03Qvmcpx2MHdoFdheeuW4hoLE/G/OX1TKVb5zbWfM44ndWtOv
 usp6hjP3kFe50zdTa2kpuiLzK7PspENlYJ9w3ekZ6N01tDeG1AaDHLJ43JYcwNz9bp
 fk0YKIkxp7IePdDQcnJrM7/987NoFDLciBjSkHDBHsmBiwbQUDodLQUd10AFt0e2jq
 Q2BqR0ZwFEHENJkeUDKjxFEj3YzfvOcsi6xzadf0zZEa6ZSQVhB9iaYTd6LN5vwSny
 V5x5LhLhBOWqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual
 DPCD in DP-to-DP topology
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260909041041.244531-1-xiaolu.xie@intel.com>
References: <20260909033518.158995-1-xiaolu.xie@intel.com>
 <20260909041041.244531-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 04:20:45 +0000
Message-Id: <20260909042046.118FB1F00A3A@smtp.kernel.org>
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
- [High] drm_dp_mst_is_virtual_dpcd() unconditionally accepts DP_PEER_DEVIC=
E_DP_LEGACY_CONV as a virtual DPCD without checking for a non-zero DPCD rev=
ision.
--

commit 7fdc1d351cc143b9e4d9acdb9eabc2fbc5bb1fee
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/dp/mst: recognize DP-to-HDMI PCON as virtual DPCD in DP-to-DP topology

This commit attempts to correctly identify DP-to-HDMI PCON devices as having
a virtual DPCD within DP-to-DP topologies. It updates the peer device check
to accept legacy converters as valid downstream peer types.

> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
[ ... ]
> @@ -6047,7 +6047,8 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_d=
p_mst_port *port)
>  	    port->mstb &&
>  	    port->mstb->num_ports =3D=3D 2) {
>  		list_for_each_entry(downstream_port, &port->mstb->ports, next) {
> -			if (downstream_port->pdt =3D=3D DP_PEER_DEVICE_SST_SINK &&
> +			if ((downstream_port->pdt =3D=3D DP_PEER_DEVICE_SST_SINK ||
> +			     downstream_port->pdt =3D=3D DP_PEER_DEVICE_DP_LEGACY_CONV) &&
>  			    !downstream_port->input) {

[Severity: High]
Does this code also need to check for a non-zero DPCD revision?

The commit message specifies that PCON devices indicating a virtual DPCD
advertise DP_PEER_DEVICE_DP_LEGACY_CONV with a non-zero DPCD_Revision (VESA
SCR Option 2). However, this new condition accepts any downstream port with
the legacy converter peer type without verifying that=20
downstream_port->dpcd_rev !=3D 0.

Standard legacy converters (like DP-to-VGA or standard DP-to-HDMI adapters)
with an internal MST branch will typically have a DPCD revision of 0. By
omitting the dpcd_rev !=3D 0 check, these standard legacy converters might =
be
falsely identified as having a virtual DPCD.=20

If this happens, drm_dp_mst_dsc_aux_for_port() treats the adapter as having=
=20
a virtual DPCD and attempts a remote DPCD read on the legacy port. Since=20
the legacy port has no virtual DPCD, the remote DPCD read receives a NAK=20
and returns -EIO, causing drm_dp_mst_dsc_aux_for_port() to return NULL and=
=20
potentially disable DSC for the port entirely.

>  				mutex_unlock(&port->mgr->lock);
>  				return true;
>  			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909041041.2445=
31-1-xiaolu.xie@intel.com?part=3D1
