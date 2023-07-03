Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E288FEB64DD
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Jul 2023 10:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9DD10E200;
	Mon,  3 Jul 2023 10:14:23 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07B410E200
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 Jul 2023 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688379261; x=1719915261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TdiTx9AUAjQlUMtA0huUQ3uvqlAr3liEpKph9J5faTU=;
 b=nNqxuWD9zZt642KZpQg3ZOnCeeVbUiy8pvJ/IWGSd/7fcEh4QTlO5JCu
 bto0y87O4gUU8UUp2FsZDtvAAb4FV1m8GseBhRQIqdg31G75ccGEzs8lw
 dzvKV2Lw1gSKbNJ3bjI/avBTlOqoIuy7ML7Vslt6FbkdlAn58GR6t97KK
 jSEWVyqVZ9mr4tQfLASrZPi48qOX2zqnGgOuVnlQ8fUYen5IM+ZMYcRSU
 zdD+brbIr1Ssj/xTWKlEsvsf0MmN5JDQUcEulC1YJ+9t9EYvr5hrrjC+k
 PrrzX4YGvVmWaQAfXIC1S1/Po+kv+vk4ubpCrwJMRG9s5fX1366zmt+Z1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="393586716"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="393586716"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 03:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="721716047"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="721716047"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga007.fm.intel.com with ESMTP; 03 Jul 2023 03:14:20 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  3 Jul 2023 15:42:43 +0530
Message-Id: <20230703101244.2489790-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230703101244.2489790-1-suraj.kandpal@intel.com>
References: <20230703101244.2489790-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 2/3] drm/i915/drm: Fix comment for YUV420 qp
 table declaration
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Fix comment for YUV420 qp table declaration of max value
where the min value is 4 and the max value is 12/15/18
depending on bpc.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_qp_tables.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_qp_tables.c b/drivers/gpu/drm/i915/display/intel_qp_tables.c
index 6e86c0971d24..7997d673def7 100644
--- a/drivers/gpu/drm/i915/display/intel_qp_tables.c
+++ b/drivers/gpu/drm/i915/display/intel_qp_tables.c
@@ -17,13 +17,17 @@
 /* from BPP 6 to 36 in steps of 0.5 */
 #define RC_RANGE_QP444_12BPC_MAX_NUM_BPP	61
 
-/* from BPP 6 to 24 in steps of 0.5 */
+/* For YUV420 the bits_per_pixel sent in PPS params
+ * is double the target bpp. The below values represent
+ * the target bpp.
+ */
+/* from BPP 4 to 12 in steps of 0.5 */
 #define RC_RANGE_QP420_8BPC_MAX_NUM_BPP		17
 
-/* from BPP 6 to 30 in steps of 0.5 */
+/* from BPP 4 to 15 in steps of 0.5 */
 #define RC_RANGE_QP420_10BPC_MAX_NUM_BPP	23
 
-/* from BPP 6 to 36 in steps of 0.5 */
+/* from BPP 4 to 18 in steps of 0.5 */
 #define RC_RANGE_QP420_12BPC_MAX_NUM_BPP	29
 
 /*
-- 
2.25.1

