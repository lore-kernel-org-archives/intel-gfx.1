Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C6EC8720
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Sep 2023 12:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914C710E7BA;
	Thu,  7 Sep 2023 12:26:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509010E7BA
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Sep 2023 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694089560; x=1725625560;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dqi2cJra30T3RfeVQO+f1lpGWRebgQaaW2LqS7wONe4=;
 b=BvyaMyjLB0eBKs/S/aaXwgFb5lLbKCH+iuSu4RCXx4OwBWWOBtCEbLrr
 JTStuziAREJk+Z28cr7BiDyNGOv0NUAzGW7CEFsB/lhBFi5pr4DZZwYBb
 qQX/GXGQl0kmj27Rj3o8iy3jeMO3KePcsLWH7lnb3cZCi5DYDvyW/r0kW
 f/Z2Ns4ssydVE3cZxi/WyHOhUccxJ3FyaCEVa7hRM17y5leyQ63Ebpqat
 HxVkYlixV2a6eNE0TZ0Y3TFPSEIw4FjDQWWeNnM31wkXXprjgKT1ig+i2
 0E2swWE/GoVQRgshPl3WTpa+yVfPzmJ3jFpronjmzkgHbz5qG5tYydIxH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377252968"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="377252968"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 05:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="777051271"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="777051271"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga001.jf.intel.com with SMTP; 07 Sep 2023 05:25:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Sep 2023 15:25:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  7 Sep 2023 15:25:41 +0300
Message-ID: <20230907122541.32261-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907122541.32261-1-ville.syrjala@linux.intel.com>
References: <20230907122541.32261-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/3] drm/i915: Do plane/etc. updates more
 atomically across pipes
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

Perform all the intel_pre_update_crtc() stuff for all pipes first,
and only then do the intel_update_crtc() vblank evasion stuff for
every pipe back to back. This should make it more likely that
the plane updates from multiple pipes happen on the same frame
(assuming the pipes are running in sync, eg. due to bigjoiner
or port sync).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 26 ++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7c19a0f380ca..f96230232a47 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6711,6 +6711,12 @@ static void intel_commit_modeset_enables(struct intel_atomic_state *state)
 
 		intel_enable_crtc(state, crtc);
 		intel_pre_update_crtc(state, crtc);
+	}
+
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (!new_crtc_state->hw.active)
+			continue;
+
 		intel_update_crtc(state, crtc);
 	}
 }
@@ -6748,6 +6754,15 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 	 * So first lets enable all pipes that do not need a fullmodeset as
 	 * those don't have any external dependency.
 	 */
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		enum pipe pipe = crtc->pipe;
+
+		if ((update_pipes & BIT(pipe)) == 0)
+			continue;
+
+		intel_pre_update_crtc(state, crtc);
+	}
+
 	while (update_pipes) {
 		for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
 						    new_crtc_state, i) {
@@ -6763,7 +6778,6 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 			entries[pipe] = new_crtc_state->wm.skl.ddb;
 			update_pipes &= ~BIT(pipe);
 
-			intel_pre_update_crtc(state, crtc);
 			intel_update_crtc(state, crtc);
 
 			/*
@@ -6819,6 +6833,15 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 	/*
 	 * Finally we do the plane updates/etc. for all pipes that got enabled.
 	 */
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		enum pipe pipe = crtc->pipe;
+
+		if ((update_pipes & BIT(pipe)) == 0)
+			continue;
+
+		intel_pre_update_crtc(state, crtc);
+	}
+
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
 		enum pipe pipe = crtc->pipe;
 
@@ -6831,7 +6854,6 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		entries[pipe] = new_crtc_state->wm.skl.ddb;
 		update_pipes &= ~BIT(pipe);
 
-		intel_pre_update_crtc(state, crtc);
 		intel_update_crtc(state, crtc);
 	}
 
-- 
2.41.0

