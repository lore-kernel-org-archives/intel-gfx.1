Return-Path: <SRS0=gTf0=HS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53183C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Feb 2021 12:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D56B64D9A
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Feb 2021 12:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D56B64D9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866E26E14B;
	Tue, 16 Feb 2021 12:34:54 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E95D6E14B;
 Tue, 16 Feb 2021 12:34:53 +0000 (UTC)
IronPort-SDR: lRV6N+s6bgBJF0UkAehAPdHwr0RmsnltXaUJY3c0C/UVUH0Y4Nlo1yqeOKoXHp51nWG25bxkVB
 KDYAZPxFsQ/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="202061447"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="202061447"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 04:34:52 -0800
IronPort-SDR: +fWkh9qmwuRIHAdYg/Q5ZLUygdoyXBYiJ6iD8V9vHuWcgDsV1R3P0cCM08yu2RdTgT/eEy9FNZ
 LE9SdGtCjXQQ==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="399486632"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 04:34:51 -0800
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 16 Feb 2021 14:34:48 +0200
Message-Id: <20210216123448.410545-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/dp_mst: Tune down the WARN modesetting a
 port with full_pbn=0
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

It's possible to modeset a connector/mst port that has a 0 full_pbn
value: if the sink on the port deasserts its HPD and a branch device
reports this via a CSN with the port's ddps=0 and pdt!=NONE the driver
clears full_pbn, but the corresponding connector can be still
modesetted.

This happened on a DELL U2719D monitor as the branch device and an LG
27UL650-W daisy-chained to it, the LG monitor generating a long HPD
pulse (doing this for some reason always when waking up from some power
saving state).

Tune down the WARN about this scenario to a debug message.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/1917
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 0a54506c27738..dcaf4bf9b62f6 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5118,11 +5118,15 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 		if (!found)
 			return 0;
 
-		/* This should never happen, as it means we tried to
-		 * set a mode before querying the full_pbn
+		/*
+		 * This could happen if the sink deasserted its HPD line, but
+		 * the branch device still reports it as attached (PDT != NONE).
 		 */
-		if (WARN_ON(!port->full_pbn))
+		if (!port->full_pbn) {
+			drm_dbg_kms(port->mgr->dev, "[MSTB:%p] [MST PORT:%p] no BW available for the port\n",
+				    port->parent, port);
 			return -EINVAL;
+		}
 
 		pbn_used = vcpi->pbn;
 	} else {
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
