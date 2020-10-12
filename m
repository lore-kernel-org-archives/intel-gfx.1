Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B368BC43467
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 21:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF192080D
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 21:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF192080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D956E819;
	Mon, 12 Oct 2020 21:31:11 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747146E7E2
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2020 21:30:56 +0000 (UTC)
IronPort-SDR: l0IRme5GlDjKH8MPsmvazxtFkI0F/N5EzNy1cHojEGB7N0qPb1opN04qXy/MuPQvyleldMHenV
 wKFvLOXHu1CA==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="145671043"
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="145671043"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 14:30:55 -0700
IronPort-SDR: 3wjpitBkXOn58iBTT3mc0E2YNgFj9JgaQEYWEHoSMVXAeHnv5ISgRoh5INxwpzxAvnBBtJmr2E
 vpmInly+S5aw==
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="463245009"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 14:30:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Oct 2020 14:29:58 -0700
Message-Id: <20201012212959.871513-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012212959.871513-1-lucas.demarchi@intel.com>
References: <20201012212959.871513-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v7 14/15] drm/i915/dg1: Update DMC_DEBUG register
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

Update the DMC_DEBUG_DC5 register to its new location and do not try
reading the DC6 counter since DG1 doesn't support DC6.

v2: Use IS_DGFX() instead of IS_DG1(). Even if not having DC6 is not
directly related to DGFX, the register move to a new location is. So in
future, if there is one supporting DC6, it would just need to add the
other register rather than fixing the case of a wrong register being
read (Matt)

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 9 +++++++--
 drivers/gpu/drm/i915/i915_reg.h                      | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 0bf31f9a8af5..cfb4c1474982 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -518,8 +518,13 @@ static int i915_dmc_info(struct seq_file *m, void *unused)
 		   CSR_VERSION_MINOR(csr->version));
 
 	if (INTEL_GEN(dev_priv) >= 12) {
-		dc5_reg = TGL_DMC_DEBUG_DC5_COUNT;
-		dc6_reg = TGL_DMC_DEBUG_DC6_COUNT;
+		if (IS_DGFX(dev_priv)) {
+			dc5_reg = DG1_DMC_DEBUG_DC5_COUNT;
+		} else {
+			dc5_reg = TGL_DMC_DEBUG_DC5_COUNT;
+			dc6_reg = TGL_DMC_DEBUG_DC6_COUNT;
+		}
+
 		/*
 		 * NOTE: DMC_DEBUG3 is a general purpose reg.
 		 * According to B.Specs:49196 DMC f/w reuses DC5/6 counter
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 1d7d902bb640..dead4bcf717f 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7538,6 +7538,7 @@ enum {
 #define BXT_CSR_DC3_DC5_COUNT	_MMIO(0x80038)
 #define TGL_DMC_DEBUG_DC5_COUNT	_MMIO(0x101084)
 #define TGL_DMC_DEBUG_DC6_COUNT	_MMIO(0x101088)
+#define DG1_DMC_DEBUG_DC5_COUNT	_MMIO(0x134154)
 
 #define DMC_DEBUG3		_MMIO(0x101090)
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
