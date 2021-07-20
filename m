Return-Path: <SRS0=c2Tb=MM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B23C636CE
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 20:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87D460FEA
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 20:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A87D460FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA836E5CD;
	Tue, 20 Jul 2021 20:40:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC476E52F;
 Tue, 20 Jul 2021 20:40:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190909017"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="190909017"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906098"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Tue, 20 Jul 2021 13:57:58 -0700
Message-Id: <20210720205802.39610-39-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 38/42] drm/i915: Force parallel contexts to
 use copy engine for reloc
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

Submitting to a subset of hardware contexts is not allowed, so use the
copy engine for GPU relocations when using a parallel context.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 1a91e21132be..cf4288ce7141 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1386,7 +1386,8 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
 	if (err)
 		goto err_unmap;
 
-	if (engine == eb->context->engine) {
+	if (engine == eb->context->engine &&
+	    !intel_context_is_parallel(eb->context)) {
 		rq = i915_request_create(eb->context);
 	} else {
 		struct intel_context *ce = eb->reloc_context;
@@ -1483,7 +1484,8 @@ static u32 *reloc_gpu(struct i915_execbuffer *eb,
 		if (eb_use_cmdparser(eb))
 			return ERR_PTR(-EWOULDBLOCK);
 
-		if (!reloc_can_use_engine(engine)) {
+		if (!reloc_can_use_engine(engine) ||
+		    intel_context_is_parallel(eb->context)) {
 			engine = engine->gt->engine_class[COPY_ENGINE_CLASS][0];
 			if (!engine)
 				return ERR_PTR(-ENODEV);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
