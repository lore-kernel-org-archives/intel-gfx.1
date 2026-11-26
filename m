Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FD6606A323
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2026 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EC0wx9OC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBA3112236;
	Thu, 26 Nov 2026 09:44:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4033611225D
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2026 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795686294; x=1827222294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y3hSz2dK7H5UJZ0ekMVX9oPCGw3hg2Sw+JW0JWgjTbY=;
 b=EC0wx9OCbWRcC7YAws36mg8R0tShhaIqhGyv5Qa15AmEwgZL/+50qoHt
 e4u8jHDpbCff/KVzvOdqLKtuTwxxcVahMqwSoIipY9Ng4FIs0H7j6gWDR
 J41/CklODNJpCMDINP05F4LUWlF6bVKCA60rptNlaPT17yIyadoN0kFN2
 4Qm6RCvNhJDBj2Q8RTU4JGtt19LSz/hUqoBrXSQnMrnPiCtUDH3fzxChR
 6eR3JBAghuutcWMmEkXzWuFlr9J5CTq6D2o7jUM67F/e82GhBb4R8KAB2
 mnQaNrdHZUnhWIzgRkMUN4TyFc/7gfMCBV/wbhPLheTAW0xGhG/kxzAFr g==;
X-CSE-ConnectionGUID: 2ZrIMsS4TISwXIbYH+KpMQ==
X-CSE-MsgGUID: qthdTVujSFKgEjt504LSrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4604827"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4604827"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:44:54 -0800
X-CSE-ConnectionGUID: z/FPr4q2TjOArQtZi3xnKQ==
X-CSE-MsgGUID: TfgPabtuTVKX16QOHGaaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12453854"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:44:52 -0800
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Zakaria Belkadi <zakaria.belkadi@inria.fr>, stable@vger.kernel.org,
 Matthew Auld <matthew.william.auld@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH] drm/i915: Reject relocation writes to RO userptr
Date: Thu, 26 Nov 2026 11:44:44 +0200
Message-ID: <20261126094444.52858-1-joonas.lahtinen@linux.intel.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Read-only userptr BOs shouldn't be allowed to have relocation
addresses written back to them. Enforce that.

The relocation slow path where this could have happened has been
in place, reverted and then re-introduced. GPU relocations path
protected against this via ppGTT flags was also reverted at point.

There's no legimate use-case for this, so instead of trying to track
which kernel versions were impacted and which not, just outright
reject with EFAULT on all kernels with RO userptr support.

Reported-by: Zakaria Belkadi <zakaria.belkadi@inria.fr>
Fixes: 0b100760e3e8 ("drm/i915/userptr: Enable read-only support on gen8+")
Cc: <stable@vger.kernel.org> # v4.19+
Cc: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index c41e1b9a40bc..7ed23dc392b8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -511,6 +511,10 @@ eb_validate_vma(struct i915_execbuffer *eb,
 	if (unlikely(entry->flags & eb->invalid_flags))
 		return -EINVAL;
 
+	if (unlikely(i915_gem_object_is_readonly(vma->obj) &&
+		     entry->relocation_count))
+		return -EFAULT;
+
 	if (unlikely(entry->alignment &&
 		     !is_power_of_2_u64(entry->alignment)))
 		return -EINVAL;
-- 
2.56.1

