Return-Path: <SRS0=Vnqj=M2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE65C4338F
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 20:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F8760F45
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 20:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29F8760F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35016E8BF;
	Tue,  3 Aug 2021 20:13:52 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F39C6E12B;
 Tue,  3 Aug 2021 20:13:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="213499171"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="213499171"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 13:13:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="568776539"
Received: from unerlige-ril-10.jf.intel.com ([10.165.21.208])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 13:13:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Date: Tue,  3 Aug 2021 13:13:44 -0700
Message-Id: <20210803201349.31031-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803201349.31031-1-umesh.nerlige.ramappa@intel.com>
References: <20210803201349.31031-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/8] drm/i915/gt: Check for conflicting
 RING_NONPRIV
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

From: Chris Wilson <chris@chris-wilson.co.uk>

Strip the encoded bits from the register offset so that we only use the
address for looking up the RING_NONPRIV entry.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 66 +++++++++++++--------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 94540cdb90c4..7dda5a0a8e75 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -80,18 +80,44 @@ static void wa_init_finish(struct i915_wa_list *wal)
 			 wal->wa_count, wal->name, wal->engine_name);
 }
 
+static u32 reg_offset(i915_reg_t reg)
+{
+	return i915_mmio_reg_offset(reg) & RING_FORCE_TO_NONPRIV_ADDRESS_MASK;
+}
+
+static u32 reg_flags(i915_reg_t reg)
+{
+	return i915_mmio_reg_offset(reg) & ~RING_FORCE_TO_NONPRIV_ADDRESS_MASK;
+}
+
+__maybe_unused
+static bool is_nonpriv_flags_valid(u32 flags)
+{
+	/* Check only valid flag bits are set */
+	if (flags & ~RING_FORCE_TO_NONPRIV_MASK_VALID)
+		return false;
+
+	/* NB: Only 3 out of 4 enum values are valid for access field */
+	if ((flags & RING_FORCE_TO_NONPRIV_ACCESS_MASK) ==
+	    RING_FORCE_TO_NONPRIV_ACCESS_INVALID)
+		return false;
+
+	return true;
+}
+
 static int wa_index(struct i915_wa_list *wal, i915_reg_t reg)
 {
-	unsigned int addr = i915_mmio_reg_offset(reg);
 	int start = 0, end = wal->count;
+	u32 addr = reg_offset(reg);
 
 	/* addr and wal->list[].reg, both include the R/W flags */
 	while (start < end) {
 		unsigned int mid = start + (end - start) / 2;
+		u32 pos = reg_offset(wal->list[mid].reg);
 
-		if (i915_mmio_reg_offset(wal->list[mid].reg) < addr)
+		if (pos < addr)
 			start = mid + 1;
-		else if (i915_mmio_reg_offset(wal->list[mid].reg) > addr)
+		else if (pos > addr)
 			end = mid;
 		else
 			return mid;
@@ -117,13 +143,22 @@ static void __wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 	struct i915_wa *wa_;
 	int index;
 
+	GEM_BUG_ON(!is_nonpriv_flags_valid(reg_flags(wa->reg)));
+
 	index = wa_index(wal, wa->reg);
 	if (index >= 0) {
 		wa_ = &wal->list[index];
 
+		if (i915_mmio_reg_offset(wa->reg) !=
+		    i915_mmio_reg_offset(wa_->reg)) {
+			DRM_ERROR("Discarding incompatible w/a for reg %04x\n",
+				  reg_offset(wa->reg));
+			return;
+		}
+
 		if ((wa->clr | wa_->clr) && !(wa->clr & ~wa_->clr)) {
 			DRM_ERROR("Discarding overwritten w/a for reg %04x (clear: %08x, set: %08x)\n",
-				  i915_mmio_reg_offset(wa_->reg),
+				  reg_offset(wa_->reg),
 				  wa_->clr, wa_->set);
 
 			wa_->set &= ~wa->clr;
@@ -141,10 +176,8 @@ static void __wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 	*wa_ = *wa;
 
 	while (wa_-- > wal->list) {
-		GEM_BUG_ON(i915_mmio_reg_offset(wa_[0].reg) ==
-			   i915_mmio_reg_offset(wa_[1].reg));
-		if (i915_mmio_reg_offset(wa_[1].reg) >
-		    i915_mmio_reg_offset(wa_[0].reg))
+		GEM_BUG_ON(reg_offset(wa_[0].reg) == reg_offset(wa_[1].reg));
+		if (reg_offset(wa_[1].reg) > reg_offset(wa_[0].reg))
 			break;
 
 		swap(wa_[1], wa_[0]);
@@ -160,7 +193,7 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 	if (IS_ALIGNED(wal->count, grow) && /* Either uninitialized or full. */
 	    wa_list_grow(wal, ALIGN(wal->count + 1, grow), GFP_KERNEL)) {
 		DRM_ERROR("Unable to store w/a for reg %04x\n",
-			  i915_mmio_reg_offset(wa->reg));
+			  reg_offset(wa->reg));
 		return;
 	}
 
@@ -1227,21 +1260,6 @@ bool intel_gt_verify_workarounds(struct intel_gt *gt, const char *from)
 	return wa_list_verify(gt, &gt->i915->gt_wa_list, from);
 }
 
-__maybe_unused
-static bool is_nonpriv_flags_valid(u32 flags)
-{
-	/* Check only valid flag bits are set */
-	if (flags & ~RING_FORCE_TO_NONPRIV_MASK_VALID)
-		return false;
-
-	/* NB: Only 3 out of 4 enum values are valid for access field */
-	if ((flags & RING_FORCE_TO_NONPRIV_ACCESS_MASK) ==
-	    RING_FORCE_TO_NONPRIV_ACCESS_INVALID)
-		return false;
-
-	return true;
-}
-
 static void
 whitelist_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
 {
-- 
2.20.1

