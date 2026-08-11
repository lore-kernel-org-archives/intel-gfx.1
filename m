Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0087C5CFD9
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2026 09:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7424C10E2E8;
	Tue, 11 Aug 2026 09:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNKt4cMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FB810E2E1
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2026 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786442086; x=1817978086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y+IL3uiEvUpzitXuLyadAAcUUnIktWyF3Ak6JVDlN/4=;
 b=hNKt4cMl0ZJX9IOf+ck41Skr3GSrJRzOf0YtRoy0VB5VLHTsyK/ZkmWD
 BUAgElXVCsrZW/itpuBH/fp6ngl6I+AdlYXHgXVZP/7t59lGgGRlC9unq
 7ruEMYarjykP+GBpnzTizltiK+QqUhCiI2cmtGVboayTLDeWsXqvz84Fc
 ZXxgYUqkaMfdRXrR6kTZ7eu70lIURz+gcYpAvycfmMOfl77UDx8xjers8
 /igffNBOnQ/Prkkv29mVwy/ce1AOk2FcPLntO44V941XfwpuTd1EXEojM
 8b84EXzg0NdKVmagF+LxW6RPcwWMgZepE2Mu1c1OevWtEV9E84J4lXAay w==;
X-CSE-ConnectionGUID: 7TAAiqCUT3+BplZW/7bXVA==
X-CSE-MsgGUID: REoePFdeQmKfeUkHTZ87Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104359914"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="104359914"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:46 -0700
X-CSE-ConnectionGUID: TMc3MdnxRBu4V4gnj5izNA==
X-CSE-MsgGUID: msMARMGwTKqwMCza2ZCIuw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.2])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:44 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 3/5] drm/i915/display: remove unnecessary clock_gating
 include from intel_display.c
Date: Tue, 11 Aug 2026 12:49:11 +0300
Message-ID: <20260811095427.1147852-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811095427.1147852-1-luciano.coelho@intel.com>
References: <20260811095427.1147852-1-luciano.coelho@intel.com>
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

We don't use any of the functions inclued in intel_clock_gating.h in
the intel_display.c code anymore.  Remove the respective include.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 829d7a411dcc..8a19a2f5d222 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -60,7 +60,6 @@
 #include "intel_bo.h"
 #include "intel_bw.h"
 #include "intel_cdclk.h"
-#include "intel_clock_gating.h"
 #include "intel_cmtg.h"
 #include "intel_color.h"
 #include "intel_crt.h"
-- 
2.53.0

