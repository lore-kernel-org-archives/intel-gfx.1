Return-Path: <SRS0=lQef=JL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC565C43470
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 11:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28726120E
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 11:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B28726120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5DF6E92F;
	Wed, 14 Apr 2021 11:51:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5266E92E
 for <Intel-gfx@lists.freedesktop.org>; Wed, 14 Apr 2021 11:51:06 +0000 (UTC)
IronPort-SDR: otiYpS/zAyIUMVzuorKEgTcxSDajjEy9EmV+72Ecx/PDHEGb5BHdpJkCGao6jVBhUjr74VRtVT
 mkbezVVTdCtg==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="174119577"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="174119577"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 04:51:06 -0700
IronPort-SDR: DHFYr9rmAnNNCVVTQEz2PEhDM4jpJfoslTZodUWu9DCyesNSxt6WKDG6KEmyP+7upmqP+ci5Gw
 /yr8VFpkAELg==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="521965273"
Received: from bdebhal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.119])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 04:51:05 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Wed, 14 Apr 2021 12:50:24 +0100
Message-Id: <20210414115028.168504-25-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414115028.168504-1-tvrtko.ursulin@linux.intel.com>
References: <20210414115028.168504-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 24/28] drm/i915: Use IS_GEN in intel_fb_pitch_limit
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/intel_display.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index f7a3cefaaaed..5d1d67a7c368 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -13848,23 +13848,22 @@ static
 u32 intel_fb_pitch_limit(struct drm_i915_private *dev_priv,
 			 uint64_t fb_modifier, uint32_t pixel_format)
 {
-	u32 gen = INTEL_GEN(dev_priv);
-
-	if (gen >= 9) {
+	if (IS_GEN(dev_priv, 9, GEN_FOREVER)) {
 		int cpp = drm_format_plane_cpp(pixel_format, 0);
 
 		/* "The stride in bytes must not exceed the of the size of 8K
 		 *  pixels and 32K bytes."
 		 */
 		return min(8192 * cpp, 32768);
-	} else if (gen >= 5 && !HAS_GMCH_DISPLAY(dev_priv)) {
+	} else if (IS_GEN(dev_priv, 5, GEN_FOREVER) &&
+		   !HAS_GMCH_DISPLAY(dev_priv)) {
 		return 32*1024;
-	} else if (gen >= 4) {
+	} else if (IS_GEN(dev_priv, 4, GEN_FOREVER)) {
 		if (fb_modifier == I915_FORMAT_MOD_X_TILED)
 			return 16*1024;
 		else
 			return 32*1024;
-	} else if (gen >= 3) {
+	} else if (IS_GEN(dev_priv, 3, GEN_FOREVER)) {
 		if (fb_modifier == I915_FORMAT_MOD_X_TILED)
 			return 8*1024;
 		else
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
