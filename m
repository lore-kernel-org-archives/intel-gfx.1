Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101D2C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Feb 2022 20:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AADE10E7BA;
	Thu, 17 Feb 2022 20:26:58 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEE310E7AF;
 Thu, 17 Feb 2022 20:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645129615; x=1676665615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CAOY7D1XGhAYqvQP/hcL22aF29wRn657CuZ5WaLOiTw=;
 b=irPXxnVe0poAeiGWqcsUvfF6V9QKgZDG0OLdnQHkbAHq6aOyZunGljkK
 lOwlTVUC57moVC3VXnQOksiYtfesqLPPpWqE/7hcZULUHUw84r34vTMGO
 VA/1/Bb4Fj7gZsOVJv7IMxxEN2BWMrJMnXXolmabKiFJX+XLxtDPHJ1E6
 XFaF3xU+P8hcU4bBjLOivF270EHlm0uahYMHwVJMIKfx0xcjCpkBfHepM
 vuGMHlpwc4ZOYsJFwvm+FTOkP/ILKQ/OP/E14sHCDdjBS5ZtR3+rlKX7e
 BE8LOcHJclBYwSMZm+T2WfdqGO7pu4v+EcMTnvpW1rUfuDj1XQNsLgxzd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238370945"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="238370945"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:26:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545842096"
Received: from zlwang-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.198.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:26:55 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 17 Feb 2022 12:26:42 -0800
Message-Id: <20220217202644.122937-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217202644.122937-1-michael.cheng@intel.com>
References: <20220217202644.122937-1-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 1/3] drm_cache: Add logic for
 wbvind_on_all_cpus
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
Cc: michael.cheng@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Add logic for wbvind_on_all_cpus for non-x86 platforms.

v2(Michael Cheng): Change logic to if platform is not x86, then
		   we add pr_warn for calling wbvind_on_all_cpus.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 2 --
 include/drm/drm_cache.h     | 6 ++++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 66597e411764..722e3931d68a 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -40,8 +40,6 @@
 #define MEMCPY_BOUNCE_SIZE 128
 
 #if defined(CONFIG_X86)
-#include <asm/smp.h>
-
 /*
  * clflushopt is an unordered instruction which needs fencing with mfence or
  * sfence to avoid ordering issues.  For drm_clflush_page this fencing happens
diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index 22deb216b59c..24fcf6be1419 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -34,6 +34,12 @@
 #define _DRM_CACHE_H_
 
 #include <linux/scatterlist.h>
+#include <asm/smp.h>
+
+#if !defined(CONFIG_x86)
+#define wbinvd_on_all_cpus() \
+	pr_warn("Missing cache flush in %s\n", __func__)
+#endif
 
 struct iosys_map;
 
-- 
2.25.1

