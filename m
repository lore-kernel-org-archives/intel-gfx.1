Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0523CC433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 11:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D25238EC
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 11:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D25238EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E198C6E249;
	Thu, 14 Jan 2021 11:18:28 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544036E1F2
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 11:18:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23593476-1500050 
 for multiple; Thu, 14 Jan 2021 11:18:18 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 14 Jan 2021 11:18:17 +0000
Message-Id: <20210114111817.3849-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Add DEBUG_GEM to the recommended CI
 config
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Now that i915 compiles cleanly with Werror, we can enforce enabling
DEBUG_GEM when selecting the default debug config.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.debug | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 0fb7fd0ef717..3701bae5b855 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -39,10 +39,12 @@ config DRM_I915_DEBUG
 	select DRM_DEBUG_SELFTEST
 	select DMABUF_SELFTESTS
 	select SW_SYNC # signaling validation framework (igt/syncobj*)
+	select DRM_I915_WERROR
+	select DRM_I915_DEBUG_GEM
+	select DRM_I915_DEBUG_MMIO
+	select DRM_I915_DEBUG_RUNTIME_PM
 	select DRM_I915_SW_FENCE_DEBUG_OBJECTS
 	select DRM_I915_SELFTEST
-	select DRM_I915_DEBUG_RUNTIME_PM
-	select DRM_I915_DEBUG_MMIO
 	select BROKEN # for prototype uAPI
 	default n
 	help
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
