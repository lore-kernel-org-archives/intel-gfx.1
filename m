Return-Path: <SRS0=4f0g=EV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE51C63697
	for <intel-gfx@archiver.kernel.org>; Sun, 15 Nov 2020 21:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0BCE22447
	for <intel-gfx@archiver.kernel.org>; Sun, 15 Nov 2020 21:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0BCE22447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F696E9CF;
	Sun, 15 Nov 2020 21:08:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D276E9C4
 for <Intel-gfx@lists.freedesktop.org>; Sun, 15 Nov 2020 21:08:17 +0000 (UTC)
IronPort-SDR: aLY37gcc8CqU0g3GVs0hBZ2Adkf23DyeUEblTYg6KxMZBZWGO0GVGhTKW0pnKmaTPLmv6CBrlI
 IY+LjHOw00pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="158455838"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="158455838"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 13:08:15 -0800
IronPort-SDR: KmzF+yV4BQc5Fx13tLW/24fRZkIJj7hSL4JuP0nT1vT6aznyarcFmJ55TukLqgX5JKhwn1lVVv
 PSQ9C00pVvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="430009556"
Received: from sean-virtualbox.fm.intel.com ([10.105.158.96])
 by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2020 13:08:15 -0800
From: "Huang, Sean Z" <sean.z.huang@intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Sun, 15 Nov 2020 13:07:54 -0800
Message-Id: <20201115210815.5272-6-sean.z.huang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201115210815.5272-1-sean.z.huang@intel.com>
References: <20201115210815.5272-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] [PATCH 06/27] drm/i915: Rename the whitelist to
 allowlist
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Rename the whitelist to allowlist as suggested

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 1c14a07eba7d..c9ef0025c60e 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1989,12 +1989,12 @@ void intel_uncore_fini_mmio(struct intel_uncore *uncore)
 	uncore_mmio_cleanup(uncore);
 }
 
-static const struct reg_whitelist {
+static const struct reg_allowlist {
 	i915_reg_t offset_ldw;
 	i915_reg_t offset_udw;
 	u16 gen_mask;
 	u8 size;
-} reg_read_whitelist[] = { {
+} reg_read_allowlist[] = { {
 	.offset_ldw = RING_TIMESTAMP(RENDER_RING_BASE),
 	.offset_udw = RING_TIMESTAMP_UDW(RENDER_RING_BASE),
 	.gen_mask = INTEL_GEN_MASK(4, 12),
@@ -2007,14 +2007,14 @@ int i915_reg_read_ioctl(struct drm_device *dev,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct intel_uncore *uncore = &i915->uncore;
 	struct drm_i915_reg_read *reg = data;
-	struct reg_whitelist const *entry;
+	struct reg_allowlist const *entry;
 	intel_wakeref_t wakeref;
 	unsigned int flags;
 	int remain;
 	int ret = 0;
 
-	entry = reg_read_whitelist;
-	remain = ARRAY_SIZE(reg_read_whitelist);
+	entry = reg_read_allowlist;
+	remain = ARRAY_SIZE(reg_read_allowlist);
 	while (remain) {
 		u32 entry_offset = i915_mmio_reg_offset(entry->offset_ldw);
 
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
