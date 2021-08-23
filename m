Return-Path: <SRS0=iWgT=NO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A834EC4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 16:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AF2E613D2
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 16:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AF2E613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DD86E093;
	Mon, 23 Aug 2021 16:19:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EED26E093
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Aug 2021 16:19:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="239273581"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="239273581"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 09:19:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="684454168"
Received: from todonova-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.44.47])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 09:19:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 manasi.d.navare@intel.com
Date: Mon, 23 Aug 2021 19:18:17 +0300
Message-Id: <56519a9b96a4d2603973c1b506b30dc4156b2754.1629735412.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629735412.git.jani.nikula@intel.com>
References: <cover.1629735412.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 16/19] drm/i915/dp: add HAS_DP20 macro
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

Let's abstract the DP 2.0 feature. Initially just DG2.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 0a2b63072ff5..fc89cf618b44 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1665,6 +1665,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_IPS(dev_priv)	(IS_HSW_ULT(dev_priv) || IS_BROADWELL(dev_priv))
 
 #define HAS_DP_MST(dev_priv)	(INTEL_INFO(dev_priv)->display.has_dp_mst)
+#define HAS_DP20(dev_priv)	(IS_DG2(dev_priv))
 
 #define HAS_CDCLK_CRAWL(dev_priv)	 (INTEL_INFO(dev_priv)->display.has_cdclk_crawl)
 #define HAS_DDI(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ddi)
-- 
2.20.1

