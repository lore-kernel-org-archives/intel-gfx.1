Return-Path: <SRS0=U9P+=OZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB743C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 18:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36A7613AC
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 18:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A36A7613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25E66EC21;
	Tue,  5 Oct 2021 18:25:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905B26EC21;
 Tue,  5 Oct 2021 18:25:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="249086504"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="249086504"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 11:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="438805373"
Received: from ashleylh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.209.141])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 11:25:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue,  5 Oct 2021 19:24:04 +0100
Message-Id: <20211005182405.915100-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211005182405.915100-1-matthew.auld@intel.com>
References: <20211005182405.915100-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v6 7/8] drm/i915/ttm: use cached system pages
 when evicting lmem
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

This should let us do an accelerated copy directly to the shmem pages
when temporarily moving lmem-only objects, where the i915-gem shrinker
can later kick in to swap out the pages, if needed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 98b7ead1a008..48069b5a664e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -134,11 +134,11 @@ static enum ttm_caching
 i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
 {
 	/*
-	 * Objects only allowed in system get cached cpu-mappings.
-	 * Other objects get WC mapping for now. Even if in system.
+	 * Objects only allowed in system get cached cpu-mappings, or when
+	 * evicting lmem-only buffers to system for swapping. Other objects get
+	 * WC mapping for now. Even if in system.
 	 */
-	if (obj->mm.region->type == INTEL_MEMORY_SYSTEM &&
-	    obj->mm.n_placements <= 1)
+	if (obj->mm.n_placements <= 1)
 		return ttm_cached;
 
 	return ttm_write_combined;
-- 
2.26.3

