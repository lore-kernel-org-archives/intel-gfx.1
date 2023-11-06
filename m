Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8171DC4167D
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Nov 2023 21:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C88E10E42D;
	Mon,  6 Nov 2023 21:19:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7E010E42D
 for <intel-gfx@lists.freedesktop.org>; Mon,  6 Nov 2023 21:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699305562; x=1730841562;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Rz9TNJHxSjR0eicpC0yga+NCH3n7umke4KKIZMGfRk8=;
 b=MQ8yCyY7FxFGi5uoyn2C+YAF5XhUrWWuE3zMKaEAJusB8gKqNGJ4gIdG
 7dJwMHw3Qmx5pN6J1U+3F23kAUjaYU+j9zDp5pkL6zc3TJ5j87RBr2q7d
 FMyYbm7DkDVJTWKRINS+//C7yRy3vkd8WSqFXQHP4EzlIBPt/Ssju6Vdn
 3sdZw9aKB6X6szX2Kmz0HJwCzRkd9WN/m57dq0ElXuYKNyQUzj5JTKdZG
 296drRHi5yc7tNDBCl/wd5Wx2zFFQb1qYGSw8a5ruYgwSxbzNyISqDPl/
 zORrMj3744sgd2ubfF7Z5CWkYBWhcKskvDmbLqfM25eQsJx+dqse0n4KU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="10911470"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="10911470"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 13:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="755964179"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="755964179"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 06 Nov 2023 13:19:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 06 Nov 2023 23:19:18 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  6 Nov 2023 23:19:05 +0200
Message-ID: <20231106211915.13406-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106211915.13406-1-ville.syrjala@linux.intel.com>
References: <20231106211915.13406-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 01/11] drm/i915: Check pipe active state in
 {planes, vrr}_{enabling, disabling}()
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

{planes,vrr}_{enabling,disabling}() are supposed to indicate
whether the specific hardware feature is supposed to be enabling
or disabling. That can only makes sense if the pipe is active
overall. So check for that before we go poking at the hardware.

I think we're semi-safe currently on due to:
- intel_pre_plane_update() doesn't get called when the pipe
  was not-active prior to the commit, but this is actually a bug.
  This saves vrr_disabling(), and vrr_enabling() is called from
  deeper down where we have already checked hw.active.
- active_planes mirrors the crtc's hw.active

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9e9c03287869..f24c410cbd8f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -902,12 +902,18 @@ static bool needs_async_flip_vtd_wa(const struct intel_crtc_state *crtc_state)
 static bool planes_enabling(const struct intel_crtc_state *old_crtc_state,
 			    const struct intel_crtc_state *new_crtc_state)
 {
+	if (!new_crtc_state->hw.active)
+		return false;
+
 	return is_enabling(active_planes, old_crtc_state, new_crtc_state);
 }
 
 static bool planes_disabling(const struct intel_crtc_state *old_crtc_state,
 			     const struct intel_crtc_state *new_crtc_state)
 {
+	if (!old_crtc_state->hw.active)
+		return false;
+
 	return is_disabling(active_planes, old_crtc_state, new_crtc_state);
 }
 
@@ -924,6 +930,9 @@ static bool vrr_params_changed(const struct intel_crtc_state *old_crtc_state,
 static bool vrr_enabling(const struct intel_crtc_state *old_crtc_state,
 			 const struct intel_crtc_state *new_crtc_state)
 {
+	if (!new_crtc_state->hw.active)
+		return false;
+
 	return is_enabling(vrr.enable, old_crtc_state, new_crtc_state) ||
 		(new_crtc_state->vrr.enable &&
 		 (new_crtc_state->update_m_n || new_crtc_state->update_lrr ||
@@ -933,6 +942,9 @@ static bool vrr_enabling(const struct intel_crtc_state *old_crtc_state,
 static bool vrr_disabling(const struct intel_crtc_state *old_crtc_state,
 			  const struct intel_crtc_state *new_crtc_state)
 {
+	if (!old_crtc_state->hw.active)
+		return false;
+
 	return is_disabling(vrr.enable, old_crtc_state, new_crtc_state) ||
 		(old_crtc_state->vrr.enable &&
 		 (new_crtc_state->update_m_n || new_crtc_state->update_lrr ||
-- 
2.41.0

