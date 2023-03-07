Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C88C6FD1A
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Mar 2023 14:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABED10E4D6;
	Tue,  7 Mar 2023 14:47:36 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086610E4D6;
 Tue,  7 Mar 2023 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678200454; x=1709736454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GbTzUhMfzi25AYS27DoltRyE946Bi/6TFoDTOoGgsH8=;
 b=JPY6WKCEvxeEawl/qkubv5ey3IpAbUVjQRpnB71JHP2q5IEqX+ED3M6J
 bpISflVfSWH3rE6h5eo2KgRk8sA3OXB/Uc7Pmh+gGzQtdvg/Lfvr5vYH+
 8zkN0UcZF319GNIMvdeMp437+5szBH/QJs5GHIxnEjqgFQmyjGJailF+B
 BCn+zRIt2fByYp63eVI2JxSam8YNjG1vNsUsRzibELVCCd7tGGSEocxEV
 6vtR0bUy6I2UxADG7d0UAtS7VUJX26aSrqK3TJss8Tx0GEacqutH7sObZ
 2jYV4CCiU7L9knLJUYaygX2szcHVaUpRPUEtO+26shRvswN1x8sT19UJ4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400687338"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="400687338"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800414446"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="800414446"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.10])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:47:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Date: Tue,  7 Mar 2023 15:46:21 +0100
Message-Id: <20230307144621.10748-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 7/7] drm/ttm: Make the call to
 ttm_tt_populate() interruptible when faulting
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

When swapping in, or under memory pressure ttm_tt_populate() may sleep
for a substantiable amount of time. Allow interrupts during the sleep.
This will also allow us to inject -EINTR errors during swapin in upcoming
patches.

Also avoid returning VM_FAULT_OOM, since that will confuse the core
mm, making it print out a confused message and retrying the fault.
Return VM_FAULT_SIGBUS also under OOM conditions.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index ca7744b852f5..4bca6b54520a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -218,14 +218,21 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	prot = ttm_io_prot(bo, bo->resource, prot);
 	if (!bo->resource->bus.is_iomem) {
 		struct ttm_operation_ctx ctx = {
-			.interruptible = false,
+			.interruptible = true,
 			.no_wait_gpu = false,
 			.force_alloc = true
 		};
 
 		ttm = bo->ttm;
-		if (ttm_tt_populate(bdev, bo->ttm, &ctx))
-			return VM_FAULT_OOM;
+		err = ttm_tt_populate(bdev, bo->ttm, &ctx);
+		if (err) {
+			if (err == -EINTR || err == -ERESTARTSYS ||
+			    err == -EAGAIN)
+				return VM_FAULT_NOPAGE;
+
+			pr_debug("TTM fault hit %pe.\n", ERR_PTR(err));
+			return VM_FAULT_SIGBUS;
+		}
 	} else {
 		/* Iomem should not be marked encrypted */
 		prot = pgprot_decrypted(prot);
-- 
2.39.2

