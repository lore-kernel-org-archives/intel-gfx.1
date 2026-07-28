Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB81C54F4D
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Jul 2026 18:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F6510E9A6;
	Tue, 28 Jul 2026 18:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsB/epbN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D48810E9A6
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Jul 2026 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785261605; x=1816797605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/NmGftJN5Rb/AGdACDypYHVSFkVdbloUaG5rYzRWsq8=;
 b=PsB/epbNJU1e8lXHvNUzBo+pgFTL9Nvmv7gqK/g2dK/C6xzynVRUB2i6
 B4j8jjCqEUUGu+ad0D47/maugLS31Pl0BFuSEe5t7JtWa+Le8yH98x3Pq
 /0gXF1hNuWelIkUJppNJQWY4usd/eJDCWe9Oct8QqYGL3eI1gum9OU128
 Qa0aI7QlHHPCbkbfumCfG8+T1GPe7rmRtzjIxJWIsoLkculu2aP+HzVqj
 h/85s9WFi0GCpKlAfB6tcQI+C3bGEL7wU+4SfJi+H9HacMhFuRMSbMjmm
 R14B3jdrxgXQES4FbYBq/OXbhYjzuFkdiFwWSi4fP/944FI3VILm8duYm A==;
X-CSE-ConnectionGUID: p+lG2rZrSBaksDTQR6+q5g==
X-CSE-MsgGUID: NVizCa2jRAm8ZUsP3wxgVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108655373"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="108655373"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 11:00:05 -0700
X-CSE-ConnectionGUID: 5cvoLiOoRyKMtVmjzdHzGA==
X-CSE-MsgGUID: +3dDG+ODQniV3tsEnFG1Jw==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 11:00:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/i915/dpt: remove unused include
Date: Tue, 28 Jul 2026 20:59:59 +0300
Message-ID: <20260728175959.622050-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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

i915_dpt.c no longer needs intel_display_core.h, remove.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_dpt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index fcd7cced771d..e01dc4de1788 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -6,7 +6,6 @@
 #include <drm/drm_print.h>
 #include <drm/intel/display_parent_interface.h>
 
-#include "display/intel_display_core.h"
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
-- 
2.47.3

