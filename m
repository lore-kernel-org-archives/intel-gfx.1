Return-Path: <SRS0=d1l9=PC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00C7C433FE
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 17:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A92076105A
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 17:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A92076105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F966E2C0;
	Thu, 14 Oct 2021 17:43:24 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B646E1D6
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Oct 2021 17:43:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="225204570"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="225204570"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:13:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="442909011"
Received: from dnvo-mobl.amr.corp.intel.com (HELO rdvivi-mobl4.intel.com)
 ([10.212.120.113])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:13:05 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Thu, 14 Oct 2021 13:12:56 -0400
Message-Id: <20211014171257.1615604-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014171257.1615604-1-rodrigo.vivi@intel.com>
References: <20211014171257.1615604-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 4/5] drm/i915/gt: Random clean up of comments
 around display version.
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

Although gen12 is a valid thing for the gt side on TGL,
we should prefer graphics version over the old global "gen" thing.
Of course we are not changing functions and variables and the legacy
there, but at least let's start to document things properly and
set some good examples.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 73a79c2acd3a..b6b9d324f519 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1650,7 +1650,7 @@ static void invalidate_csb_entries(const u64 *first, const u64 *last)
 }
 
 /*
- * Starting with Gen12, the status has a new format:
+ * Starting with Graphics version 12, the status has a new format:
  *
  *     bit  0:     switched to new queue
  *     bit  1:     reserved
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 3ef9eaf8c50e..ed0f0e81bb56 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -611,10 +611,10 @@ static const u8 dg2_rcs_offsets[] = {
 static const u8 *reg_offsets(const struct intel_engine_cs *engine)
 {
 	/*
-	 * The gen12+ lists only have the registers we program in the basic
-	 * default state. We rely on the context image using relative
-	 * addressing to automatic fixup the register state between the
-	 * physical engines for virtual engine.
+	 * The graphics 12 and newer platforms, lists only have the registers we
+	 * program in the basic default state. We rely on the context image
+	 * using relative addressing to automatic fixup the register state
+	 * between the physical engines for virtual engine.
 	 */
 	GEM_BUG_ON(GRAPHICS_VER(engine->i915) >= 12 &&
 		   !intel_engine_has_relative_mmio(engine));
-- 
2.31.1

