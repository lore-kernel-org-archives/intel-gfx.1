Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6823C282D1
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Mar 2025 16:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C9210EA09;
	Thu,  6 Mar 2025 16:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZvuLxB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4018910EA09
 for <intel-gfx@lists.freedesktop.org>; Thu,  6 Mar 2025 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741278908; x=1772814908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ks+B/hp2bfQ6JgyP6/ss2Phvwsq9uXzy5bcgAPwYxPo=;
 b=mZvuLxB7osyOhICSykLWvG9+/RUzkUM5vNjP/cXfiKL+olBnrHRPrXpr
 EYYxjf3QujvcbFi9LIOtgPz2XlCV2NcCBVx4F/T/gic0UyWTgNFI1V1zo
 ODhgTJ+zwkbu1jbAWr5A08c6qZjdJaOgY5fS+bH0oHL77y/WE/glwDgV2
 LgyGCQNCXdAJt0/zob2s1ErxG5C4mdEKOQYoEXVIQKSv5bbMI5+6XEEU9
 jfd//tlGkyyTn6kcE1keS8cW7GSSqEroYhEJRvTp2+exr2Np3+m3jlOYa
 zFG+cwoXEIj9gkpNLTtSswaT80VzTQKdv5mJdp4TGKLdPw89v9djcdNkE g==;
X-CSE-ConnectionGUID: 58bnmFU4QDuuKmMKY5ZocA==
X-CSE-MsgGUID: NmdsJd2bQvmofayHQvWHIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53704385"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="53704385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:35:08 -0800
X-CSE-ConnectionGUID: ixLlDb1UTXKcikqhcYqrKg==
X-CSE-MsgGUID: nLMF9G2aQx+P1xVrG2MOpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124289196"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 06 Mar 2025 08:35:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 06 Mar 2025 18:35:04 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH v2 14/18] drm/i915: Simplify cdclk_disable_noatomic()
Date: Thu,  6 Mar 2025 18:34:16 +0200
Message-ID: <20250306163420.3961-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250306163420.3961-1-ville.syrjala@linux.intel.com>
References: <20250306163420.3961-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Instead of hand rolling the cdclk state disabling for a
pipe in noatomic() let's just recompute the whole thing
from scratch. Less code we have to remember to keep in sync.

Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 62caee4a8b64..2a8749a0213e 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -3364,13 +3364,8 @@ void intel_cdclk_update_hw_state(struct intel_display *display)
 void intel_cdclk_crtc_disable_noatomic(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
-	struct intel_cdclk_state *cdclk_state =
-		to_intel_cdclk_state(display->cdclk.obj.state);
-	enum pipe pipe = crtc->pipe;
 
-	cdclk_state->min_cdclk[pipe] = 0;
-	cdclk_state->min_voltage_level[pipe] = 0;
-	cdclk_state->active_pipes &= ~BIT(pipe);
+	intel_cdclk_update_hw_state(display);
 }
 
 static int intel_compute_max_dotclk(struct intel_display *display)
-- 
2.45.3

