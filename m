Return-Path: <SRS0=QofO=EU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF39C55ABD
	for <intel-gfx@archiver.kernel.org>; Sat, 14 Nov 2020 00:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87C62225E
	for <intel-gfx@archiver.kernel.org>; Sat, 14 Nov 2020 00:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A87C62225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525026E8BB;
	Sat, 14 Nov 2020 00:37:54 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463E46E8B7
 for <Intel-gfx@lists.freedesktop.org>; Sat, 14 Nov 2020 00:37:47 +0000 (UTC)
IronPort-SDR: 0d2YCQNEcgLWV/6GKnecYmtHGgPRCMaWyB804+xcKd8/rE5beGzx1iRIaUob4Hb5R5JjgbhLQ0
 /zvFYGlhtGFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="158328327"
X-IronPort-AV: E=Sophos;i="5.77,477,1596524400"; d="scan'208";a="158328327"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 16:37:20 -0800
IronPort-SDR: afpg6v+dw/kgDZvkdEVLLbhSdpKLJDcuAMOwNjbebcxyTJau+IT4j+Z47OGvFV+J6UX1qNIy2w
 eDTlTFMq1B8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,477,1596524400"; d="scan'208";a="474848576"
Received: from sean-virtualbox.fm.intel.com ([10.105.158.96])
 by orsmga004.jf.intel.com with ESMTP; 13 Nov 2020 16:37:19 -0800
From: Sean Z Huang <sean.z.huang@intel.com>
To: sean.z.huang@intel.com,
	Intel-gfx@lists.freedesktop.org
Date: Fri, 13 Nov 2020 16:37:12 -0800
Message-Id: <20201114003716.4875-23-sean.z.huang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201114003716.4875-1-sean.z.huang@intel.com>
References: <20201114003716.4875-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] [PXP CLEAN PATCH v06 23/27] mei: bus: enable pavp
 device.
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
Cc: Tomas Winkler <tomas.winkler@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tomas Winkler <tomas.winkler@intel.com>

Enable protected audio video path client on mei client
bus.

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/misc/mei/bus-fixup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/mei/bus-fixup.c b/drivers/misc/mei/bus-fixup.c
index 4e30fa98fe7d..042399b397c9 100644
--- a/drivers/misc/mei/bus-fixup.c
+++ b/drivers/misc/mei/bus-fixup.c
@@ -33,6 +33,9 @@ static const uuid_le mei_nfc_info_guid = MEI_UUID_NFC_INFO;
 #define MEI_UUID_HDCP UUID_LE(0xB638AB7E, 0x94E2, 0x4EA2, \
 			      0xA5, 0x52, 0xD1, 0xC5, 0x4B, 0x62, 0x7F, 0x04)
 
+#define MEI_UUID_PAVP UUID_LE(0xfbf6fcf1, 0x96cf, 0x4e2e, 0xA6, \
+			      0xa6, 0x1b, 0xab, 0x8c, 0xbe, 0x36, 0xb1)
+
 #define MEI_UUID_ANY NULL_UUID_LE
 
 /**
@@ -488,6 +491,7 @@ static struct mei_fixup {
 	MEI_FIXUP(MEI_UUID_MKHIF_FIX, mei_mkhi_fix),
 	MEI_FIXUP(MEI_UUID_HDCP, whitelist),
 	MEI_FIXUP(MEI_UUID_ANY, vt_support),
+	MEI_FIXUP(MEI_UUID_PAVP, whitelist),
 };
 
 /**
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
