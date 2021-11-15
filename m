Return-Path: <SRS0=QaN2=QC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D4EC433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 11:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 338B461AD1
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 11:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 338B461AD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9243A6E993;
	Mon, 15 Nov 2021 11:53:30 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B116E993;
 Mon, 15 Nov 2021 11:53:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="213459175"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="213459175"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:53:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="453998899"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:53:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 15 Nov 2021 13:53:12 +0200
Message-Id: <4d6a976459547407979f4b4c05a52785523e6bd8.1636977089.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1636977089.git.jani.nikula@intel.com>
References: <cover.1636977089.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/3] agp/intel-gtt: Replace kernel.h with the
 necessary inclusions
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
Cc: jani.nikula@intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

When kernel.h is used in the headers it adds a lot into dependency hell,
especially when there are circular dependencies are involved.

Replace kernel.h inclusion with the list of what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/intel-gtt.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel-gtt.h b/include/drm/intel-gtt.h
index abfefaaf897a..4e5f8e7e25d0 100644
--- a/include/drm/intel-gtt.h
+++ b/include/drm/intel-gtt.h
@@ -6,7 +6,10 @@
 
 #include <linux/agp_backend.h>
 #include <linux/intel-iommu.h>
-#include <linux/kernel.h>
+#include <linux/types.h>
+
+struct pci_dev;
+struct sg_table;
 
 void intel_gtt_get(u64 *gtt_total,
 		   phys_addr_t *mappable_base,
-- 
2.30.2

