Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1445DC433FE
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Mar 2022 12:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4B010E6FE;
	Fri, 25 Mar 2022 12:32:18 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9310E677
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Mar 2022 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211537; x=1679747537;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UYIBDkk+lUEbnQ0Ko2U2o03Dc2Llm4g7wpmlRhNEHww=;
 b=W5AGTlvJAlmFYu1846Kg1EEwz1kek4aVv9fIOC/AD1uPWrIPmQAy1Wh9
 8DMaKe9LHqztjWYyep/M9Fn5wav05ucyKDjgtmobMyDHYcAbWksb4SleF
 nnQmrBxa6y8aAmZnvz/+fcngkq4HBW4UhzmW8ygA3IcmM0QUiPD+0603k
 5y5b/fF2iw0pzbk06Unk53vk1AZ7V7PAbyHoVV/1BN0CbTMRbK0MQUT39
 nAOPt7ihAT/KZKcxR2ob8E9CtPP3M7izGpaBJz1tPFFvST/kWHdURKtkz
 nTHAT07bOltA9PybmFv8BHN3pzIRk38ylA1enyvdkWJBTy18Bmo9+XVjM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="319330504"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="319330504"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="516532704"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga002.jf.intel.com with SMTP; 25 Mar 2022 05:32:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Mar 2022 14:32:14 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 25 Mar 2022 14:31:55 +0200
Message-Id: <20220325123205.22140-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325123205.22140-1-ville.syrjala@linux.intel.com>
References: <20220325123205.22140-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 03/13] drm/i915: Remove pointless dpll_funcs
 checks
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

All platforms have dpll_funcs. Remove the pointless NULL checks.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 986e2e67ef91..57d9b065622f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7053,14 +7053,10 @@ intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state)
 
 static void intel_modeset_clear_plls(struct intel_atomic_state *state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
 	struct intel_crtc_state *new_crtc_state;
 	struct intel_crtc *crtc;
 	int i;
 
-	if (!dev_priv->dpll_funcs)
-		return;
-
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
 		if (!intel_crtc_needs_modeset(new_crtc_state))
 			continue;
-- 
2.34.1

