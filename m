Return-Path: <SRS0=AGhj=HO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3541C433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Feb 2021 21:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7923364E13
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Feb 2021 21:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7923364E13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC546E7FE;
	Fri, 12 Feb 2021 21:19:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DA86E7FE
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Feb 2021 21:19:41 +0000 (UTC)
IronPort-SDR: AAnhtdqdSl5eNsPp4DoJJHyTFqfYeyXA2CvAS9k4WkI/ZQNooI61rvyFxe1dHo6I6IYSFzKads
 pht+EBIgOMug==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="182609133"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="182609133"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 13:19:40 -0800
IronPort-SDR: I8BUv5KAkz1X3ZtPGjqCSoYQ0UXyAVa7jR+W217kMQURHONSd/LdYuz2nPatlMsbfSRi342VuT
 ZtGkUOB/JzUA==
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="381867046"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 13:19:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 12 Feb 2021 13:19:24 -0800
Message-Id: <20210212211925.3418280-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915: FPGA_DBG is display-specific
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Although the bspec's description doesn't make it very clear, the
hardware architects have confirmed that the FPGA_DBG register that we
use to check for unclaimed MMIO accesses is display-specific and will
only properly flag unclaimed MMIO transactions for registers in the
display range.  If a platform doesn't have display, FPGA_DBG itself will
not be available and should not be checked.  Let's move the feature flag
into intel_device_info.display to more accurately reflect this.

Given that we now know FPGA_DBG is display-specific, it could be argued
that we should only check it on out intel_de_*() functions.  However
let's not make that change right now; keeping the checks in all of the
existing locations still helps us catch cases where regular
intel_uncore_*() functions use bad MMIO offset math / base addresses and
accidentally wind up landing within an unused area within the display
MMIO range.  It will also help catch cases where userspace-initiated
MMIO (e.g., IGT's intel_reg tool) attempt to read bad offsets within the
display range.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c          | 4 ++--
 drivers/gpu/drm/i915/intel_device_info.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index eff7155db2fd..a9f24f2bda33 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -538,7 +538,7 @@ static const struct intel_device_info vlv_info = {
 	.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP), \
 	.display.has_ddi = 1, \
-	.has_fpga_dbg = 1, \
+	.display.has_fpga_dbg = 1, \
 	.display.has_psr = 1, \
 	.display.has_psr_hw_tracking = 1, \
 	.display.has_dp_mst = 1, \
@@ -689,7 +689,7 @@ static const struct intel_device_info skl_gt4_info = {
 		BIT(TRANSCODER_DSI_A) | BIT(TRANSCODER_DSI_C), \
 	.has_64bit_reloc = 1, \
 	.display.has_ddi = 1, \
-	.has_fpga_dbg = 1, \
+	.display.has_fpga_dbg = 1, \
 	.display.has_fbc = 1, \
 	.display.has_hdcp = 1, \
 	.display.has_psr = 1, \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index e6ca1023ffcf..d44f64b57b7a 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -118,7 +118,6 @@ enum intel_ppgtt_type {
 	func(has_64bit_reloc); \
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
-	func(has_fpga_dbg); \
 	func(has_global_mocs); \
 	func(has_gt_uc); \
 	func(has_l3_dpf); \
@@ -145,6 +144,7 @@ enum intel_ppgtt_type {
 	func(has_dsb); \
 	func(has_dsc); \
 	func(has_fbc); \
+	func(has_fpga_dbg); \
 	func(has_gmch); \
 	func(has_hdcp); \
 	func(has_hotplug); \
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
