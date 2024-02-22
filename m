Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1070C48BF8
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Feb 2024 12:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81910E920;
	Thu, 22 Feb 2024 12:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrfH/kvH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AE210E920
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Feb 2024 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708606621; x=1740142621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Z15VPwlRlSOe4grUCeVXLb3OqW8AVZOjhTmiNl6N9w=;
 b=hrfH/kvHCKtMRSNmYUnFdPESUmLK0PktOWFFRIhbDzlEkzPAn09nqRjp
 4Nv+yN6LtHN/V6uuH2hztBxLYKIbOpKENaCUmRJGb2XdTwDxytjTVUc62
 tZ/ZOsniJanGQ3y1R7uw45FTs1AZk8cHa4PQJzkbTLBqvPl+Sy5R96sPO
 SvFpUGAORMsSuvRzngCgbje1e6DMGWporh/a5ASW4XxfAhDxp/bBvZWdu
 xrRQamTyKGoqQVqbEDXuy1xeKOLKTI/MZLdpg9iQ73a+e+xxQvhC6rwnC
 SMxuD7vnp+naBHIk6TlUCgesslgFuowZSpyP2KofBZCst2NGjzD9D89iG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2979126"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2979126"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 04:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5464317"
Received: from sfriis-mobl.ger.corp.intel.com (HELO vgovind2-mobl3.intel.com)
 ([10.249.44.6])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 04:56:59 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, stanislav.lisovskiy@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v1 3/6] drm/i915/xe2lpd: Write DBuf after CDCLK change in post
 plane
Date: Thu, 22 Feb 2024 14:56:31 +0200
Message-Id: <20240222125634.275047-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222125634.275047-1-vinod.govindapillai@intel.com>
References: <20240222125634.275047-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Previously we always updated DBuf MBUS CTL and DBUF CTL regs after
CDCLK has been changed(CDCLK_CTL), however for Xe2-LPD we can't do like
that anymore. According to BSpec, we have to first update DBuf regs and
then write CDCLK regs, when CDCLK is decreased, which we do in post
plane.

So now we do CDCLK post plane update only after DBuf regs are
written (CDCLK/MDCLK separation requires MDCLK/CDCLK ratio to be written
to DBuf regs).

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 00ac65a14029..4d8d32741a4f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7160,7 +7160,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* Now enable the clocks, plane, pipe, and connectors that we set up. */
 	dev_priv->display.funcs.display->commit_modeset_enables(state);
 
-	if (state->modeset)
+	if (state->modeset && DISPLAY_VER(dev_priv) < 20)
 		intel_set_cdclk_post_plane_update(state);
 
 	intel_wait_for_vblank_workers(state);
@@ -7208,6 +7208,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	intel_dbuf_post_plane_update(state);
 
+	if (state->modeset && DISPLAY_VER(dev_priv) >= 20)
+		intel_set_cdclk_post_plane_update(state);
+
 	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		intel_post_plane_update(state, crtc);
 
-- 
2.34.1

