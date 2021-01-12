Return-Path: <SRS0=+Lzr=GP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CBCC433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 17:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75612311C
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 17:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E75612311C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D7589C49;
	Tue, 12 Jan 2021 17:23:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCAC89C49
 for <intel-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 17:23:15 +0000 (UTC)
IronPort-SDR: zs2KRSex9V3lq5c3K+WKA4LnLqeG5Q53KgXGelY25G4ZrL2Q8u/O4Ngvdy0Mo1e489WzGA4prP
 +AFJ4o+BFF+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165754522"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="165754522"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 09:22:53 -0800
IronPort-SDR: SgfgPnoSV1Y6kisO+5mCHjGFK5u4npWznrjINp13tR02tlmLFqQVaUkM7rGGmLqD5eJ35EUnjh
 O0eEii1tfEXw==
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="381500922"
Received: from vbucoci-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.39.237])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 09:22:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 12 Jan 2021 19:22:46 +0200
Message-Id: <20210112172246.11933-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/lmem: make intel_region_lmem_ops static
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

There are no users outside of intel_region_lmem.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/intel_region_lmem.c | 2 +-
 drivers/gpu/drm/i915/intel_region_lmem.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index 40d8f1a95df6..83992312a34b 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -95,7 +95,7 @@ region_lmem_init(struct intel_memory_region *mem)
 	return ret;
 }
 
-const struct intel_memory_region_ops intel_region_lmem_ops = {
+static const struct intel_memory_region_ops intel_region_lmem_ops = {
 	.init = region_lmem_init,
 	.release = region_lmem_release,
 	.create_object = __i915_gem_lmem_object_create,
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.h b/drivers/gpu/drm/i915/intel_region_lmem.h
index 213def7c7b8a..8ea43e538dab 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.h
+++ b/drivers/gpu/drm/i915/intel_region_lmem.h
@@ -8,8 +8,6 @@
 
 struct drm_i915_private;
 
-extern const struct intel_memory_region_ops intel_region_lmem_ops;
-
 struct intel_memory_region *
 intel_setup_fake_lmem(struct drm_i915_private *i915);
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
