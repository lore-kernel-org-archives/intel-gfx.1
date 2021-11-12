Return-Path: <SRS0=wBbn=P7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26D1C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 13:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 953E761054
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 13:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 953E761054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA3E6E0F5;
	Fri, 12 Nov 2021 13:25:10 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD94E6E0F5
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Nov 2021 13:25:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="213166101"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="213166101"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 05:25:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="670652251"
Received: from vkariyax-mobl.gar.corp.intel.com (HELO
 smullati-desk.gar.corp.intel.com) ([10.215.119.182])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 05:25:06 -0800
From: Mullati Siva <siva.mullati@intel.com>
To: intel-gfx@lists.freedesktop.org,
	siva.mullati@intel.com
Date: Fri, 12 Nov 2021 18:54:56 +0530
Message-Id: <20211112132456.19800-1-siva.mullati@intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Skip remap_io_mapping() for non-x86
 platforms
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: "Mullati, Siva" <siva.mullati@intel.com>

The _PAGE_CACHE_MASK macro is not defined in non-x86
architectures and it's been used in remap_io_mapping().
Only hw that supports mappable aperture would hit this path
remap_io_mapping(), So skip this code for non-x86  architectures.

Signed-off-by: Mullati, Siva <siva.mullati@intel.com>
---
 drivers/gpu/drm/i915/i915_mm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index 666808cb3a32..5e2a1868b957 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -91,6 +91,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 		     unsigned long addr, unsigned long pfn, unsigned long size,
 		     struct io_mapping *iomap)
 {
+#if defined(CONFIG_X86)
 	struct remap_pfn r;
 	int err;
 
@@ -108,6 +109,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 		zap_vma_ptes(vma, addr, (r.pfn - pfn) << PAGE_SHIFT);
 		return err;
 	}
+#endif
 
 	return 0;
 }
-- 
2.33.0

