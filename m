Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E60C4332F
	for <intel-gfx@archiver.kernel.org>; Thu, 13 Jan 2022 23:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDC110E831;
	Thu, 13 Jan 2022 23:51:25 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D6410E820;
 Thu, 13 Jan 2022 23:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642117881; x=1673653881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XNaUABaAhd0Hs3dyMVFyNvJrgO+inyn+eyw36s+S1Wo=;
 b=Lfq/PCTpxLkQeqmldMLEZq0IIBUMvXj3ZAtXPpVL6m35J8QC3+lrLZWu
 KGQKy1mwWEl5hbfYAoPX0es+fdOAbLXAfPsqXELxY5dCqIhyuaBvLt4WD
 g/Jx1B4R7xX02ZTG66+dUMcy/0C0dzJX5ZGrWqHTtcnOagW3UhCMZkwiJ
 yYA0rZ1t8p1YiPw/7LcpDJ4mhP1SecF+4Doi90J/+OWIFgYmMLlZivgD5
 KGMWBJUSudmJilpVSgceqfZne1jlbFI3WspA2rsJMpoC4UA7LKheLMo1I
 j/maum6xpIVGou3LT16nf/wvTroLunP9p1xTWOUwPMmrdAMzGU+v5rhX3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="268502299"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="268502299"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 15:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="620783035"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2022 15:51:21 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Date: Thu, 13 Jan 2022 15:51:14 -0800
Message-Id: <20220113235118.1575410-12-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113235118.1575410-1-John.C.Harrison@Intel.com>
References: <20220113235118.1575410-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 i-g-t 11/15] tests/i915/i915_hangman: Don't
 let background contexts cause a ban
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
Cc: Intel-GFX@Lists.FreeDesktop.Org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The global context used by all the subtests for causing hangs is
marked as unbannable. However, some of the subtests set background
spinners running on all engines using a freshly created context. If
there is a test failure for any reason, all of those spinners can be
killed off as hanging contexts. On systems with lots of engines, that
can result in the test being banned from creating any new contexts.

So make the spinner contexts unbannable as well. That way if one
subtest fails it won't necessarily bring down all subsequent subtests.

v2: Simplify anti-banning code (review feedback from Matthew Brost).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/i915_hangman.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index a1aeeba6d..e661b8ad0 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -284,6 +284,17 @@ static void test_error_state_capture(const intel_ctx_t *ctx,
 	check_alive();
 }
 
+static void context_unban(int fd, unsigned ctx)
+{
+	struct drm_i915_gem_context_param param = {
+		.ctx_id = ctx,
+		.param = I915_CONTEXT_PARAM_BANNABLE,
+		.value = 0,
+	};
+
+	gem_context_set_param(fd, &param);
+}
+
 static void
 test_engine_hang(const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e, unsigned int flags)
@@ -307,6 +318,7 @@ test_engine_hang(const intel_ctx_t *ctx,
 	num_ctx = 0;
 	for_each_ctx_engine(device, ctx, other) {
 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
+		context_unban(device, local_ctx[num_ctx]->id);
 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
 		spin = __igt_spin_new(device,
 				      .ahnd = ahndN,
-- 
2.25.1

