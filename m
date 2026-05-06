Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF1CD3436
	for <intel-gfx@archiver.kernel.org>; Wed,  6 May 2026 10:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C727110EB10;
	Wed,  6 May 2026 10:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpDGICDC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806BA10EB10
 for <intel-gfx@lists.freedesktop.org>; Wed,  6 May 2026 10:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778062803; x=1809598803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=boC9XV8wSvSa6vZR0ImNUgYM9haJkG9PRBDh+/H07qg=;
 b=cpDGICDCaLaBnTi0HxO6G7gUewo+r97SVIDDI/nUALRfXa6O7omSlPEq
 bPZVM21f5fwQ2aHdsVphuGaVk7SwPPCqRVw5KciB793aEql/W/yZeTwN8
 Tqd823d43lw6OSJF+W0EV/wWfPNW1F+XOwtKoXNSgNSSIHj99CBU3P1Nx
 wkGgFnfmEQ0aW0S5JFRVd8z9wYIdhDoCEsTnhMPAfFG7MM08aA0IBF56U
 /xzb+c4rxOo2TOOCwp7K9ilcx7rJUhUPeskfj4KancItEFh9fyYVk/zlt
 uQPtHcKxP5TAshwzU5nAu1thh27RUZQWguk78fissUrC+w6UvQmMOjIlh A==;
X-CSE-ConnectionGUID: 3JIMWZP3RhuzZwv8XJD8pw==
X-CSE-MsgGUID: 8JBQ+6jmSQWfvqmoCFLPzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78138276"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78138276"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 03:20:02 -0700
X-CSE-ConnectionGUID: IUoiPPCeR4aYYWuHue8yGQ==
X-CSE-MsgGUID: /0Q8rZY/QtyaXPm2WPfeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="241078326"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.217])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 03:20:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] Revert "drm/i915: replace select with dependency for visible
 DEBUG_OBJECTS"
Date: Wed,  6 May 2026 13:19:57 +0300
Message-ID: <20260506101957.202271-1-jani.nikula@intel.com>
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

This reverts commit 025f89b01ed8d5e65d87ed54f231e10c6ac08188.

025f89b01ed8 ("drm/i915: replace select with dependency for visible
DEBUG_OBJECTS") breaks the build in certain scenarios, presumably
because config DRM_I915_DEBUG selects DRM_I915_SW_FENCE_DEBUG_OBJECTS
without looking at its dependencies, allowing
DRM_I915_SW_FENCE_DEBUG_OBJECTS=y and DEBUG_OBJECTS=n.

Fixes: 025f89b01ed8 ("drm/i915: replace select with dependency for visible DEBUG_OBJECTS")
Cc: Julian Braha <julianbraha@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 9a2a49284876..3562a02ef7ad 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -153,7 +153,7 @@ config DRM_I915_TRACE_GTT
 config DRM_I915_SW_FENCE_DEBUG_OBJECTS
 	bool "Enable additional driver debugging for fence objects"
 	depends on DRM_I915
-	depends on DEBUG_OBJECTS
+	select DEBUG_OBJECTS
 	default n
 	help
 	  Choose this option to turn on extra driver debugging that may affect
-- 
2.47.3

