Return-Path: <SRS0=4yRy=LV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC50C48BC2
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Jun 2021 22:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16F0161C29
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Jun 2021 22:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16F0161C29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AF06E14D;
	Sun, 27 Jun 2021 22:56:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB386E139;
 Sun, 27 Jun 2021 22:56:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="206039734"
X-IronPort-AV: E=Sophos;i="5.83,304,1616482800"; d="scan'208";a="206039734"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2021 15:56:49 -0700
X-IronPort-AV: E=Sophos;i="5.83,304,1616482800"; d="scan'208";a="625049916"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2021 15:56:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Sun, 27 Jun 2021 16:14:39 -0700
Message-Id: <20210627231439.138612-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210627231439.138612-1-matthew.brost@intel.com>
References: <20210627231439.138612-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 7/7] drm/i915/guc: Module load failure test for
 CT buffer creation
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

From: John Harrison <John.C.Harrison@Intel.com>

Add several module failure load inject points in the CT buffer creation
code path.

Signed-off-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 63bce4dc21fa..44bb6d630150 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -175,6 +175,10 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
 {
 	int err;
 
+	err = i915_inject_probe_error(guc_to_gt(ct_to_guc(ct))->i915, -ENXIO);
+	if (unlikely(err))
+		return err;
+
 	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
 					    desc_addr, buff_addr, size);
 	if (unlikely(err))
@@ -226,6 +230,10 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 	u32 *cmds;
 	int err;
 
+	err = i915_inject_probe_error(guc_to_gt(guc)->i915, -ENXIO);
+	if (err)
+		return err;
+
 	GEM_BUG_ON(ct->vma);
 
 	blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE + CTB_G2H_BUFFER_SIZE;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
