Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C33C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 16:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51E8B6115B
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 16:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51E8B6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811B06ED9E;
	Fri, 22 Oct 2021 16:50:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4711F6E5D4;
 Fri, 22 Oct 2021 16:50:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10145"; a="226794291"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="226794291"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 09:50:08 -0700
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="595602363"
Received: from bkokkula-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.0.159])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 09:50:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 22 Oct 2021 17:48:46 +0100
Message-Id: <20211022164847.2632366-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/gtt: flush the scratch page
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

The scratch page is directly visible in the users address space, and
while this is forced as CACHE_LLC, by the kernel, we still have to
contend with things like "Bypass-LLC" MOCS. So just flush no matter
what.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 67d14afa6623..b6c088423319 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -273,6 +273,7 @@ static void poison_scratch_page(struct drm_i915_gem_object *scratch)
 		val = POISON_FREE;
 
 	memset(vaddr, val, scratch->base.size);
+	clflush_cache_range(vaddr, scratch->base.size);
 }
 
 int setup_scratch_page(struct i915_address_space *vm)
-- 
2.26.3

