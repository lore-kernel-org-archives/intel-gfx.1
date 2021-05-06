Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD8CC43600
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 18:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA70B610D2
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 18:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA70B610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0282A6EDC3;
	Thu,  6 May 2021 18:57:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8826ED06;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: VE2WcL2acwM0MwJqLdnecrJpzcUjt11pkAPbXrn6hvAD+y5SOmJjsYCYaelZeR9Rz+LFxQwfvq
 73B9x4uEsGeQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531007"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531007"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
IronPort-SDR: jNfQ+lix+OmSqmQXTZFvHTIb+BstXea6NbwCUCQ4VZxgZp0ctz9BsndFReEaD6KR9G/tHNxDVO
 9N6vea34es2w==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583478"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Thu,  6 May 2021 12:13:53 -0700
Message-Id: <20210506191451.77768-40-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 39/97] drm/i915/guc: Increase size of CTB
 buffers
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

With the introduction of non-blocking CTBs more than one CTB can be in
flight at a time. Increasing the size of the CTBs should reduce how
often software hits the case where no space is available in the CTB
buffer.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 77dfbc94dcc3..d6895d29ed2d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -63,11 +63,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
  *      +--------+-----------------------------------------------+------+
  *
  * Size of each `CT Buffer`_ must be multiple of 4K.
- * As we don't expect too many messages, for now use minimum sizes.
+ * We don't expect too many messages in flight at any time, unless we are
+ * using the GuC submission. In that case each request requires a minimum
+ * 16 bytes which gives us a maximum 256 queue'd requests. Hopefully this
+ * enough space to avoid backpressure on the driver. We increase the size
+ * of the receive buffer (relative to the send) to ensure a G2H response
+ * CTB has a landing spot.
  */
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
-#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
+#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
 
 #define MAX_US_STALL_CTB	1000000
 
@@ -753,7 +758,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	/* beware of buffer wrap case */
 	if (unlikely(available < 0))
 		available += size;
-	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
+	CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail, size);
 	GEM_BUG_ON(available < 0);
 
 	header = cmds[head];
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
