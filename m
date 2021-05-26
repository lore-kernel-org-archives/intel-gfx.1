Return-Path: <SRS0=zXYq=KV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A54C47082
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 06:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1772B613C9
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 06:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1772B613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1996EBB5;
	Wed, 26 May 2021 06:25:07 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1466EBAC;
 Wed, 26 May 2021 06:24:51 +0000 (UTC)
IronPort-SDR: czX0jGAxeebsTxSMMu7xZiN2rilLR6tiGTGArTyuUvl+0IvOZSUqwDgp/KnjyVjf07fBLapFfw
 l39TYdkGtu1g==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182033749"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="182033749"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:50 -0700
IronPort-SDR: hevj83R/UB8ap6UtSN8FolnHPZjwOmogjuxz40voMiPueP3bcXEg7Nlb2QjmWsNj0iXIEZt7DZ
 nD6gTzOOXLVg==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="633376839"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Tue, 25 May 2021 23:42:35 -0700
Message-Id: <20210526064237.77853-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210526064237.77853-1-matthew.brost@intel.com>
References: <20210526064237.77853-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 16/18] drm/i915/guc: Stop using mutex while
 sending CTB messages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

We are no longer using descriptor to hold G2H replies and we are
protecting access to the descriptor and command buffer by the
separate spinlock, so we can stop using mutex.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 42063e1c355d..b183c70cdd5c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -552,7 +552,6 @@ static int ct_send(struct intel_guc_ct *ct,
 int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		      u32 *response_buf, u32 response_buf_size)
 {
-	struct intel_guc *guc = ct_to_guc(ct);
 	u32 status = ~0; /* undefined */
 	int ret;
 
@@ -561,8 +560,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		return -ENODEV;
 	}
 
-	mutex_lock(&guc->send_mutex);
-
 	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
 	if (unlikely(ret < 0)) {
 		CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
@@ -572,7 +569,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 			 action[0], ret, ret);
 	}
 
-	mutex_unlock(&guc->send_mutex);
 	return ret;
 }
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
