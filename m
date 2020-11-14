Return-Path: <SRS0=QofO=EU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FC3C55ABD
	for <intel-gfx@archiver.kernel.org>; Sat, 14 Nov 2020 01:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A9E2225D
	for <intel-gfx@archiver.kernel.org>; Sat, 14 Nov 2020 01:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A9E2225D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D227B6E8B6;
	Sat, 14 Nov 2020 01:45:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2551B6E885
 for <Intel-gfx@lists.freedesktop.org>; Sat, 14 Nov 2020 01:45:41 +0000 (UTC)
IronPort-SDR: YPAL2YnrHEztiNdQ0RbfG2ff94BzK6wfZ/2VoS3Fe7K4NSJ8/rW54jN4k7O3o0/9iMT9lS6uoR
 J/0l3N8MEBVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="149824101"
X-IronPort-AV: E=Sophos;i="5.77,477,1596524400"; d="scan'208";a="149824101"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 17:45:40 -0800
IronPort-SDR: A2dWSl3YgJ94zPWpB0o+RFuS79gPppidCJbS1VRe37mbRHc2xnwxYQZ1Y2Mwu0i+gVmu26Zo6M
 br8QjhsqROUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,477,1596524400"; d="scan'208";a="361524819"
Received: from sean-virtualbox.fm.intel.com ([10.105.158.96])
 by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2020 17:45:38 -0800
From: Sean Z Huang <sean.z.huang@intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Fri, 13 Nov 2020 17:45:32 -0800
Message-Id: <20201114014537.25495-22-sean.z.huang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201114014537.25495-1-sean.z.huang@intel.com>
References: <20201114014537.25495-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] [PATCH 22/27] drm/i915/pxp: Expose session state for
 display protection flip
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
Cc: "Huang, Sean Z" <sean.z.huang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: "Huang, Sean Z" <sean.z.huang@intel.com>

Implement the intel_pxp_gem_object_status() to allow ring0 i915
display querying the current PXP session state. In the design,
ring0 display should not perform protection flip on the protected
buffers if there is no PXP session alive.

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c | 8 ++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 23955d7a3c3d..082c1aaabaa8 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -341,3 +341,11 @@ void intel_pxp_irq_handler(struct intel_gt *gt, u16 iir)
 end:
 	return;
 }
+
+bool intel_pxp_gem_object_status(struct drm_i915_private *i915, u64 gem_object_metadata)
+{
+	if (i915->pxp.r0ctx && i915->pxp.r0ctx->flag_display_hm_surface_keys)
+		return true;
+	else
+		return false;
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index c0119ccdab08..eb0e548ce434 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -111,4 +111,6 @@ int i915_pxp_global_terminate_complete_callback(struct drm_i915_private *i915);
 int intel_pxp_init(struct drm_i915_private *i915);
 void intel_pxp_uninit(struct drm_i915_private *i915);
 
+bool intel_pxp_gem_object_status(struct drm_i915_private *i915, u64 gem_object_metadata);
+
 #endif
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
