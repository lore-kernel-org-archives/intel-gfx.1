Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3A3D35672
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jan 2026 05:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC7610E619;
	Wed, 28 Jan 2026 05:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aaq5Q6u5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7410E619
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jan 2026 05:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769577288; x=1801113288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yi1+uGeHBISrgqkIYY4W2VUsGu6cxHGZLIdrN7Iy8yY=;
 b=Aaq5Q6u5g/XAK+5FGNimKWcHT2NoYTAVg5p9lc9TPKshm1uLJl/oKqCL
 9tG7RYO9cJiItQIGoQ5o3psaRCBcHQbBeh2Kq1Lh1Kc+K0a84M3AzqflI
 mhBvZ36YGEZ1rOyHfz0id7JLK6NKcG2kYrCkSBTRQ7XOal7PR76Ngyyci
 FMtA2dimeoyzwP8N6PIYE8x7tMbb24EYSHln9K6OgHIYrHdYMgMMnJD1M
 woArS73sYHPwqKCOPoEMXWJRRoe8o3+zgfoGA6BxpH7WGwGygInntqMSo
 e/xDzr+OwsneimtmDuOLEtrA2BzP4hHPPqT9EO2CI3zCrKgni+ND6TWC4 Q==;
X-CSE-ConnectionGUID: YyFZSgDFTban5pGAnISwWw==
X-CSE-MsgGUID: OHw42br7Ssebhm1iP+JnEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81892701"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81892701"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 21:14:47 -0800
X-CSE-ConnectionGUID: tfJV0qkmQvO/WmD3Oatoww==
X-CSE-MsgGUID: K2MhwOHtR6meBXpqkTWE6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207308975"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
 by orviesa006.jf.intel.com with ESMTP; 27 Jan 2026 21:14:45 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org,
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] drm/i915: Prevent  heap overflow in i915_l3_write()
Date: Wed, 28 Jan 2026 10:41:42 +0530
Message-Id: <20260128051142.3006076-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

The i915_l3_write() function failed to validate that the write
count did not exceed the remaining buffer size after the starting
offset. This allows userspace to trigger a heap buffer overflow.

Clamp the write count to the remaining size of the L3 log buffer
to ensure memory safety.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/gpu/drm/i915/i915_sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 70e0d8615160..3c592111d0cc 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -121,6 +121,7 @@ i915_l3_write(struct file *filp, struct kobject *kobj,
 	}
 
 	count = round_down(count, sizeof(u32));
+	count = min_t(size_t, GEN7_L3LOG_SIZE - offset, count);
 	memcpy(remap_info + offset / sizeof(u32), buf, count);
 
 	/* NB: We defer the remapping until we switch to the context */
-- 
2.34.1

