Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE590C64E7B
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 11:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5886E2076E
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 11:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5886E2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF19E6E459;
	Mon, 30 Nov 2020 11:16:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496556E459
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 11:16:14 +0000 (UTC)
IronPort-SDR: zcQp0gEQQoYIoQLb2Oi3xLMqURYmMZAmfkE3bYq+0qEpTXSincE9Pv0jsKlDjc9MWjb+6lSoKJ
 NdjftuuEoveg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="172775877"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="172775877"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:16:13 -0800
IronPort-SDR: PfOrCPvBQyXNckmt13ZC+AWabeKz2D4/zRvc4tJ4sW4G0xnuwCge5koQbVw7kicZCZO1wmSb34
 NznPUA6CwglA==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="538559599"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:16:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 13:15:53 +0200
Message-Id: <20201130111601.2817-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201130111601.2817-1-jani.nikula@intel.com>
References: <20201130111601.2817-1-jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 02/10] drm/i915: remove last traces of
 I915_READ_FW() and I915_WRITE_FW()
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

Good riddance! Remove the macros and their remaining references in
comments.

intel_uncore_read_fw() and intel_uncore_write_fw() should be used
instead.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h     | 29 -----------------------------
 drivers/gpu/drm/i915/intel_uncore.c |  2 +-
 drivers/gpu/drm/i915/intel_uncore.h |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 15be8debae54..fecb5899cbac 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1978,35 +1978,6 @@ int i915_reg_read_ioctl(struct drm_device *dev, void *data,
 
 #define POSTING_READ(reg__)	__I915_REG_OP(posting_read, dev_priv, (reg__))
 
-/* These are untraced mmio-accessors that are only valid to be used inside
- * critical sections, such as inside IRQ handlers, where forcewake is explicitly
- * controlled.
- *
- * Think twice, and think again, before using these.
- *
- * As an example, these accessors can possibly be used between:
- *
- * spin_lock_irq(&dev_priv->uncore.lock);
- * intel_uncore_forcewake_get__locked();
- *
- * and
- *
- * intel_uncore_forcewake_put__locked();
- * spin_unlock_irq(&dev_priv->uncore.lock);
- *
- *
- * Note: some registers may not need forcewake held, so
- * intel_uncore_forcewake_{get,put} can be omitted, see
- * intel_uncore_forcewake_for_reg().
- *
- * Certain architectures will die if the same cacheline is concurrently accessed
- * by different clients (e.g. on Ivybridge). Access to registers should
- * therefore generally be serialised, by either the dev_priv->uncore.lock or
- * a more localised lock guarding all access to that bank of registers.
- */
-#define I915_READ_FW(reg__) __I915_REG_OP(read_fw, dev_priv, (reg__))
-#define I915_WRITE_FW(reg__, val__) __I915_REG_OP(write_fw, dev_priv, (reg__), (val__))
-
 /* i915_mm.c */
 int remap_io_mapping(struct vm_area_struct *vma,
 		     unsigned long addr, unsigned long pfn, unsigned long size,
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 1c14a07eba7d..ef40edfff412 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2070,7 +2070,7 @@ int i915_reg_read_ioctl(struct drm_device *dev,
  * This routine waits until the target register @reg contains the expected
  * @value after applying the @mask, i.e. it waits until ::
  *
- *     (I915_READ_FW(reg) & mask) == value
+ *     (intel_uncore_read_fw(uncore, reg) & mask) == value
  *
  * Otherwise, the wait will timeout after @slow_timeout_ms milliseconds.
  * For atomic context @slow_timeout_ms must be zero and @fast_timeout_us
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index bd2467284295..5dcb7f4183b2 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -216,7 +216,7 @@ void intel_uncore_forcewake_flush(struct intel_uncore *uncore,
 
 /*
  * Like above but the caller must manage the uncore.lock itself.
- * Must be used with I915_READ_FW and friends.
+ * Must be used with intel_uncore_read_fw() and friends.
  */
 void intel_uncore_forcewake_get__locked(struct intel_uncore *uncore,
 					enum forcewake_domains domains);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
