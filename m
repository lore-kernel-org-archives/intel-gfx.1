Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB933C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 14:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71826120F
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 14:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A71826120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AD86EC8E;
	Thu, 21 Oct 2021 14:24:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02FD6EC8E;
 Thu, 21 Oct 2021 14:23:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="216212104"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="216212104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:23:55 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="495170339"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:23:52 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, lucas.demarchi@intel.com,
 <rodrigo.vivi@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Date: Thu, 21 Oct 2021 19:56:14 +0530
Message-Id: <20211021142627.31058-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021142627.31058-1-ramalingam.c@intel.com>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 04/17] drm/i915: enforce min page size for
 scratch
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

From: Matthew Auld <matthew.auld@intel.com>

If the device needs 64K minimum GTT pages for device local-memory,
like on XEHPSDV, then we need to fail the allocation if we can't
meet it, instead of falling back to 4K pages, otherwise we can't
safely support the insertion of device local-memory pages for
this vm, since the HW expects the correct physical alignment and
size for every PTE, if we mark the page-table as 64K GTT mode.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 67d14afa6623..2a6eec5f0d58 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -334,6 +334,18 @@ int setup_scratch_page(struct i915_address_space *vm)
 		if (size == I915_GTT_PAGE_SIZE_4K)
 			return -ENOMEM;
 
+		/*
+		 * If we need 64K minimum GTT pages for device local-memory,
+		 * like on XEHPSDV, then we need to fail the allocation here,
+		 * otherwise we can't safely support the insertion of
+		 * local-memory pages for this vm, since the HW expects the
+		 * correct physical alignment and size when the page-table is
+		 * operating in 64K GTT mode, which includes any scratch PTEs,
+		 * since userpsace can still touch them.
+		 */
+		if (HAS_64K_PAGES(vm->i915))
+			return -ENOMEM;
+
 		size = I915_GTT_PAGE_SIZE_4K;
 	} while (1);
 }
-- 
2.20.1

