Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07707C4332F
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Nov 2023 21:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8D110E42F;
	Mon,  6 Nov 2023 21:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091E10E42F
 for <intel-gfx@lists.freedesktop.org>; Mon,  6 Nov 2023 21:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699305569; x=1730841569;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KcUFYL4v8eDHiacekIbpwfQhPQI6e9Ig73dkbGJkNRE=;
 b=AifdPzIOu5peNyJiPPwTwP7OBBSLdNdtLORsHVj2PJAzf56DMtQeRazo
 9p7YYcsPAawWGfQ69YlneMgfHoQxw0aMyJGyRFIYn5X3RVnZBk21J9XXU
 RyAYKFMpsPwogcr5IjZnwDxgIlP89WuhysAxOMOFbrTXXRi/vqoBWRSaN
 ayOr5EWsZUSighRS4RIZ4NFNEKjDdJDdV13A583+6N7/9CY7kHKdLrN5n
 XwH7c0/6IJIIAXc43tIQK3hsplWrPjpe3aJ+9zlKferBnuwap5Mj/sVB7
 /KEIigumFCqKMrGStdtfN0qSV+IkX11PYEzz12hnnwfgBl5DdJBBSxNq9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="10911515"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="10911515"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 13:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="755964206"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="755964206"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 06 Nov 2023 13:19:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 06 Nov 2023 23:19:26 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  6 Nov 2023 23:19:07 +0200
Message-ID: <20231106211915.13406-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106211915.13406-1-ville.syrjala@linux.intel.com>
References: <20231106211915.13406-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 03/11] drm/i915: Polish some RMWs
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

Doing the if-else around RMWs is kinda silly. Just set/clear the
apporiate bits with a single RMW.

Also unify the coding style a bit icl_wa_cursorclkgating() while at it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index dad8dac0ebbe..ec76006b1756 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -194,12 +194,9 @@ static bool is_hdr_mode(const struct intel_crtc_state *crtc_state)
 static void
 skl_wa_827(struct drm_i915_private *dev_priv, enum pipe pipe, bool enable)
 {
-	if (enable)
-		intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(pipe),
-			     0, DUPS1_GATING_DIS | DUPS2_GATING_DIS);
-	else
-		intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(pipe),
-			     DUPS1_GATING_DIS | DUPS2_GATING_DIS, 0);
+	intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(pipe),
+		     DUPS1_GATING_DIS | DUPS2_GATING_DIS,
+		     enable ? DUPS1_GATING_DIS | DUPS2_GATING_DIS : 0);
 }
 
 /* Wa_2006604312:icl,ehl */
@@ -207,10 +204,9 @@ static void
 icl_wa_scalerclkgating(struct drm_i915_private *dev_priv, enum pipe pipe,
 		       bool enable)
 {
-	if (enable)
-		intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(pipe), 0, DPFR_GATING_DIS);
-	else
-		intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(pipe), DPFR_GATING_DIS, 0);
+	intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(pipe),
+		     DPFR_GATING_DIS,
+		     enable ? DPFR_GATING_DIS : 0);
 }
 
 /* Wa_1604331009:icl,jsl,ehl */
@@ -218,7 +214,8 @@ static void
 icl_wa_cursorclkgating(struct drm_i915_private *dev_priv, enum pipe pipe,
 		       bool enable)
 {
-	intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(pipe), CURSOR_GATING_DIS,
+	intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(pipe),
+		     CURSOR_GATING_DIS,
 		     enable ? CURSOR_GATING_DIS : 0);
 }
 
-- 
2.41.0

