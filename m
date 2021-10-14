Return-Path: <SRS0=d1l9=PC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5F6C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 17:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13DAD61037
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Oct 2021 17:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13DAD61037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933516E1F4;
	Thu, 14 Oct 2021 17:43:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1856E1E6
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Oct 2021 17:43:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="225204581"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="225204581"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:13:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="442909020"
Received: from dnvo-mobl.amr.corp.intel.com (HELO rdvivi-mobl4.intel.com)
 ([10.212.120.113])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 10:13:06 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Thu, 14 Oct 2021 13:12:57 -0400
Message-Id: <20211014171257.1615604-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014171257.1615604-1-rodrigo.vivi@intel.com>
References: <20211014171257.1615604-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 5/5] drm/i915: Other random display and graphics
 version comment clean-ups
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

We should prefer Graphics and Display version over the
old global "gen" thing. Of course we are not changing functions
and variables and the legacy there, but at least let's start to
document things properly and set some good examples.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c  | 2 +-
 drivers/gpu/drm/i915/i915_perf.c | 8 ++++----
 drivers/gpu/drm/i915/i915_reg.h  | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 77680bca46ee..c50ae0843757 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2362,7 +2362,7 @@ gen8_de_misc_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
 
 			intel_psr_irq_handler(intel_dp, psr_iir);
 
-			/* prior GEN12 only have one EDP PSR */
+			/* prior Display 12 only have one EDP PSR */
 			if (DISPLAY_VER(dev_priv) < 12)
 				break;
 		}
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 2f01b8c0284c..44e149a4cae8 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -3444,10 +3444,10 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
 	 * MI_REPORT_PERF_COUNT commands and so consider it a privileged op to
 	 * enable the OA unit by default.
 	 *
-	 * For Gen12+ we gain a new OAR unit that only monitors the RCS on a
-	 * per context basis. So we can relax requirements there if the user
-	 * doesn't request global stream access (i.e. query based sampling
-	 * using MI_RECORD_PERF_COUNT.
+	 * For Graphics 12 and newer platforms, we gain a new OAR unit that only
+	 * monitors the RCS on a per context basis. So we can relax requirements
+	 * there if the user doesn't request global stream access (i.e. query
+	 * based sampling using MI_RECORD_PERF_COUNT.
 	 */
 	if (IS_HASWELL(perf->i915) && specific_ctx)
 		privileged_op = false;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index a897f4abea0c..b01fe09729ef 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8264,8 +8264,8 @@ enum {
 #define  DISP_IPC_ENABLE		(1 << 3)
 
 /*
- * The below are numbered starting from "S1" on gen11/gen12, but starting
- * with gen13 display, the bspec switches to a 0-based numbering scheme
+ * The below are numbered starting from "S1" on display versions 11 and 12, but
+ * starting with display 13, the bspec switches to a 0-based numbering scheme
  * (although the addresses stay the same so new S0 = old S1, new S1 = old S2).
  * We'll just use the 0-based numbering here for all platforms since it's the
  * way things will be named by the hardware team going forward, plus it's more
-- 
2.31.1

