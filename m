Return-Path: <SRS0=GkMm=FA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2257C6379D
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 07:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB71206C0
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 07:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB71206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933A46E85F;
	Thu, 26 Nov 2020 07:52:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576A06E856;
 Thu, 26 Nov 2020 07:51:59 +0000 (UTC)
IronPort-SDR: GRJIzAqwtaKvrFFeF5wr7DJk4MoSKS9YYn9VeHcAAsHw3JWTN56Ah6sP2dd//1MiH8JcD7630S
 H7c3pLwQ7gaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="152084968"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="152084968"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:51:59 -0800
IronPort-SDR: WJ04aUR2axLjqr8W5nvMeFV8VmN4XqmNxyMW0hh2t3arEQTH+pnvWdIUr8NjxBYBLtJNykqrgV
 d6H+8nkOkbrw==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="535652563"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:51:56 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Thu, 26 Nov 2020 13:07:17 +0530
Message-Id: <20201126073722.19107-14-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126073722.19107-1-anshuman.gupta@intel.com>
References: <20201126073722.19107-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v6 13/18] drm/hdcp: Max MST content streams
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
Cc: jani.nikula@intel.com, seanpaul@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Let's define Maximum MST content streams up to four
generically which can be supported by modern display
controllers.

Cc: Sean Paul <seanpaul@chromium.org>
Cc: Ramalingam C <ramalingam.c@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 include/drm/drm_hdcp.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index fe58dbb46962..ac22c246542a 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -101,11 +101,11 @@
 
 /* Following Macros take a byte at a time for bit(s) masking */
 /*
- * TODO: This has to be changed for DP MST, as multiple stream on
- * same port is possible.
- * For HDCP2.2 on HDMI and DP SST this value is always 1.
+ * TODO: HDCP_2_2_MAX_CONTENT_STREAMS_CNT is based upon actual
+ * H/W MST streams capacity.
+ * This required to be moved out to platform specific header.
  */
-#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	1
+#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	4
 #define HDCP_2_2_TXCAP_MASK_LEN			2
 #define HDCP_2_2_RXCAPS_LEN			3
 #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
