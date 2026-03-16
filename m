Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C05FFB5E85
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Mar 2026 23:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3EA10E188;
	Mon, 16 Mar 2026 23:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7a1Zxw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24A010E188
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Mar 2026 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773704155; x=1805240155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W1EQzO9+FEODu86QiTOj/ucNdjlS409oznwDrwUZXCs=;
 b=d7a1Zxw6M0dfys3Sk8juw23lTcBkABpuduXRZdk54wZPCoknoJGRa9IR
 AD53v5rLczhogTRSa/3bg22tGTjlZ7Y8uz7xYH0NinWCOAw+EfjuRz6IU
 MC1IJEyc+wQyBDShscnYYTcaAmtwlnEEMdsETxcJ3M2QWbAeSLJ8/vP4M
 g98r1XtfAYx8kITrW4Unv2EUI9RtPs9+6ofGjwKeni7OHqaRT2cP/4HXK
 UiZY8FxHlkvoU810omJ4vUaTwZlW0upAN/aygZbI9BxNmKj52+FKSulA9
 NGp+gAy/+cuiQVnTr5Q86MpTXvKzDZOZisE2qGK8yklqAZwkKUPZRJTlm A==;
X-CSE-ConnectionGUID: toyGKUpJT3GMpjuX3xYi1A==
X-CSE-MsgGUID: dNsnzrkgQZ+91t4sQYK9RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74434972"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74434972"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 16:35:54 -0700
X-CSE-ConnectionGUID: FX/lzi1pQ/OSjfmhl7Ceww==
X-CSE-MsgGUID: ZfgTaJF5S8yFg3m3kAsvVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222138063"
Received: from chu13-desk.fm.intel.com ([10.80.209.210])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 16:35:53 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/2] drm/i915/plane: don't DMA odd Xpan even Xsize UV buffer
Date: Mon, 16 Mar 2026 16:32:54 -0700
Message-Id: <20260316233254.393640-2-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316233254.393640-1-austin.hu@intel.com>
References: <20260316233254.393640-1-austin.hu@intel.com>
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

The original code (for Wa_16023981245) make (UV) plane state
checking failed for odd Xpan buffer, so that some YUV semi-planar
buffers with odd Xpan and odd Xsize couldn't pass to be DMAed by DE
Plane.

So only apply the work around for odd Xpan and even Xsize YUV
semi-planar buffers, and the HW issue is expected to be fixed since
Intel Xe3p DE IP.

Signed-off-by: Austin Hu <austin.hu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 3d945fe99b67..4f0c04f72bba 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1105,11 +1105,14 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 		hsub = 1;
 		vsub = 1;
 
-		/* Wa_16023981245 */
+		/*
+		 * Wa_16023981245, applied to odd Xpan and even Xsize for UV
+		 * Plane due to HW issue which is fixed since Xe3p DE IP.
+		 */
 		if ((DISPLAY_VERx100(display) == 2000 ||
 		     DISPLAY_VERx100(display) == 3000 ||
 		     DISPLAY_VERx100(display) == 3002) &&
-		     src_x % 2 != 0)
+		     (src_x & 1) && !(src_w & 1))
 			hsub = 2;
 
 		if (DISPLAY_VER(display) == 35)
-- 
2.34.1

