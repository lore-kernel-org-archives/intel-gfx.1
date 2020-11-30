Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174BFC64E7B
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 11:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD5E2076E
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 11:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACD5E2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348F86E45D;
	Mon, 30 Nov 2020 11:16:27 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B876E45D
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 11:16:25 +0000 (UTC)
IronPort-SDR: 2qx+8ZEnnS1o3+ngoq9vliNmjWVi1DVUhphk9rXaMQgusEYyrUgcVLsobYj+3Y2XKaCetZykAC
 fAa+nDbu/jqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="159670083"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="159670083"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:16:24 -0800
IronPort-SDR: zXcJ4wFncIMWvEMhCNGG9pIJknEgNPTTtzSFxb8Tm/mNJHeG+KC2dyCk2OTo0poR0Ku/0uTCOn
 2oWwxQqcvXMA==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="364194583"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:16:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 13:15:55 +0200
Message-Id: <20201130111601.2817-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201130111601.2817-1-jani.nikula@intel.com>
References: <20201130111601.2817-1-jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 04/10] drm/i915/debugfs: remove the
 i915_cache_sharing debugfs file
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
Cc: jani.nikula@intel.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The i915_cache_sharing file is a debugfs interface for gen 6-7 with no
validation or user. Remove it.

This also removes the last I915_WRITE() use in i915_debugfs.c.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 50 -----------------------------
 1 file changed, 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 01db495d475b..28e743899a3d 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -1495,55 +1495,6 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_drop_caches_fops,
 			i915_drop_caches_get, i915_drop_caches_set,
 			"0x%08llx\n");
 
-static int
-i915_cache_sharing_get(void *data, u64 *val)
-{
-	struct drm_i915_private *dev_priv = data;
-	intel_wakeref_t wakeref;
-	u32 snpcr = 0;
-
-	if (!(IS_GEN_RANGE(dev_priv, 6, 7)))
-		return -ENODEV;
-
-	with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref)
-		snpcr = I915_READ(GEN6_MBCUNIT_SNPCR);
-
-	*val = (snpcr & GEN6_MBC_SNPCR_MASK) >> GEN6_MBC_SNPCR_SHIFT;
-
-	return 0;
-}
-
-static int
-i915_cache_sharing_set(void *data, u64 val)
-{
-	struct drm_i915_private *dev_priv = data;
-	intel_wakeref_t wakeref;
-
-	if (!(IS_GEN_RANGE(dev_priv, 6, 7)))
-		return -ENODEV;
-
-	if (val > 3)
-		return -EINVAL;
-
-	drm_dbg(&dev_priv->drm,
-		"Manually setting uncore sharing to %llu\n", val);
-	with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref) {
-		u32 snpcr;
-
-		/* Update the cache sharing policy here as well */
-		snpcr = I915_READ(GEN6_MBCUNIT_SNPCR);
-		snpcr &= ~GEN6_MBC_SNPCR_MASK;
-		snpcr |= val << GEN6_MBC_SNPCR_SHIFT;
-		I915_WRITE(GEN6_MBCUNIT_SNPCR, snpcr);
-	}
-
-	return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(i915_cache_sharing_fops,
-			i915_cache_sharing_get, i915_cache_sharing_set,
-			"%llu\n");
-
 static int i915_sseu_status(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *i915 = node_to_i915(m->private);
@@ -1609,7 +1560,6 @@ static const struct i915_debugfs_files {
 } i915_debugfs_files[] = {
 	{"i915_perf_noa_delay", &i915_perf_noa_delay_fops},
 	{"i915_wedged", &i915_wedged_fops},
-	{"i915_cache_sharing", &i915_cache_sharing_fops},
 	{"i915_gem_drop_caches", &i915_drop_caches_fops},
 #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
 	{"i915_error_state", &i915_error_state_fops},
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
