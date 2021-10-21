Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8039C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 12:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFFCB610C8
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 12:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFFCB610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E566EC51;
	Thu, 21 Oct 2021 12:54:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539546E444;
 Thu, 21 Oct 2021 12:54:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="228971109"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="228971109"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 05:54:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="484191103"
Received: from lmirabel-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.195.77])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 05:54:16 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 21 Oct 2021 13:53:31 +0100
Message-Id: <20211021125332.2455288-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/dmabuf: fix broken build
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

wbinvd_on_all_cpus() is only defined on x86 it seems, plus we need to
include asm/smp.h here.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1adcd8e02d29..a45d0ec2c5b6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -12,6 +12,13 @@
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
 
+#if defined(CONFIG_X86)
+#include <asm/smp.h>
+#else
+#define wbinvd_on_all_cpus() \
+	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
+#endif
+
 I915_SELFTEST_DECLARE(static bool force_different_devices;)
 
 static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
-- 
2.26.3

