Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D76C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Feb 2022 17:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A75610E86F;
	Wed, 16 Feb 2022 17:43:05 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478F010E88A
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Feb 2022 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033384; x=1676569384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rdwv7ZUPPKW4rk6ULmWUO1KU+JKiRNfsens7GgsvlCg=;
 b=ZWI9cVs0I755nnGauEQQHhV7TIDUIx/IKkgiKyb/QbgfVpOU1DgImaCP
 GCgY7290oR+rF3eak8YcTzvW7M5sBzibqU0RykDbLsyCzXwQTOGUXE4dN
 4BIdWG057Ba8W0wAarEVIf6l/jOf2gnxR/Lr8klqmkCs2HqnlOVbth6z2
 uZjmQlr18WiBoGiUElxx5+dl3eumcNJ9/y1x9VuSklZODXgATo8rZ/9bE
 BFpq7s4/fzzhdfJGgRkkJTOw0ckQ2SgUFtoylYMXZS3g8Lh8xuYag4cfi
 /o5NObiHWuURg5Ke/R0ZAELdo/HPiLLv9uo8GZ/g4QqTN+JiCcX+lF+Ko Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="249513939"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="249513939"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="681609574"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 16 Feb 2022 09:43:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 19:43:01 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 16 Feb 2022 19:42:47 +0200
Message-Id: <20220216174250.4449-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216174250.4449-1-ville.syrjala@linux.intel.com>
References: <20220216174250.4449-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 3/6] drm/i915: Split pre-icl vs. icl+ SAGV
 hooks apart
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

To further reduce the confusion between the pre-icl vs. icl+
SAGV codepaths let's do a full split.

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 120 ++++++++++++++++++++------------
 1 file changed, 77 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index bd32fd70e6b2..9e2c339f8d16 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -3781,34 +3781,44 @@ intel_disable_sagv(struct drm_i915_private *dev_priv)
 	return 0;
 }
 
-void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
+static void skl_sagv_pre_plane_update(struct intel_atomic_state *state)
+{
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	const struct intel_bw_state *new_bw_state =
+		intel_atomic_get_new_bw_state(state);
+
+	if (!new_bw_state)
+		return;
+
+	if (!intel_can_enable_sagv(i915, new_bw_state))
+		intel_disable_sagv(i915);
+}
+
+static void skl_sagv_post_plane_update(struct intel_atomic_state *state)
+{
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
+	const struct intel_bw_state *new_bw_state =
+		intel_atomic_get_new_bw_state(state);
+
+	if (!new_bw_state)
+		return;
+
+	if (intel_can_enable_sagv(i915, new_bw_state))
+		intel_enable_sagv(i915);
+}
+
+static void icl_sagv_pre_plane_update(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
-	const struct intel_bw_state *new_bw_state;
-	const struct intel_bw_state *old_bw_state;
-	u32 new_mask = 0;
+	const struct intel_bw_state *old_bw_state =
+		intel_atomic_get_old_bw_state(state);
+	const struct intel_bw_state *new_bw_state =
+		intel_atomic_get_new_bw_state(state);
+	u32 new_mask;
 
-	/*
-	 * Just return if we can't control SAGV or don't have it.
-	 * This is different from situation when we have SAGV but just can't
-	 * afford it due to DBuf limitation - in case if SAGV is completely
-	 * disabled in a BIOS, we are not even allowed to send a PCode request,
-	 * as it will throw an error. So have to check it here.
-	 */
-	if (!intel_has_sagv(dev_priv))
-		return;
-
-	new_bw_state = intel_atomic_get_new_bw_state(state);
 	if (!new_bw_state)
 		return;
 
-	if (DISPLAY_VER(dev_priv) < 11) {
-		if (!intel_can_enable_sagv(dev_priv, new_bw_state))
-			intel_disable_sagv(dev_priv);
-		return;
-	}
-
-	old_bw_state = intel_atomic_get_old_bw_state(state);
 	/*
 	 * Nothing to mask
 	 */
@@ -3833,34 +3843,18 @@ void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
 	icl_pcode_restrict_qgv_points(dev_priv, new_mask);
 }
 
-void intel_sagv_post_plane_update(struct intel_atomic_state *state)
+static void icl_sagv_post_plane_update(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
-	const struct intel_bw_state *new_bw_state;
-	const struct intel_bw_state *old_bw_state;
+	const struct intel_bw_state *old_bw_state =
+		intel_atomic_get_old_bw_state(state);
+	const struct intel_bw_state *new_bw_state =
+		intel_atomic_get_new_bw_state(state);
 	u32 new_mask = 0;
 
-	/*
-	 * Just return if we can't control SAGV or don't have it.
-	 * This is different from situation when we have SAGV but just can't
-	 * afford it due to DBuf limitation - in case if SAGV is completely
-	 * disabled in a BIOS, we are not even allowed to send a PCode request,
-	 * as it will throw an error. So have to check it here.
-	 */
-	if (!intel_has_sagv(dev_priv))
-		return;
-
-	new_bw_state = intel_atomic_get_new_bw_state(state);
 	if (!new_bw_state)
 		return;
 
-	if (DISPLAY_VER(dev_priv) < 11) {
-		if (intel_can_enable_sagv(dev_priv, new_bw_state))
-			intel_enable_sagv(dev_priv);
-		return;
-	}
-
-	old_bw_state = intel_atomic_get_old_bw_state(state);
 	/*
 	 * Nothing to unmask
 	 */
@@ -3878,6 +3872,46 @@ void intel_sagv_post_plane_update(struct intel_atomic_state *state)
 	icl_pcode_restrict_qgv_points(dev_priv, new_mask);
 }
 
+void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
+{
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
+
+	/*
+	 * Just return if we can't control SAGV or don't have it.
+	 * This is different from situation when we have SAGV but just can't
+	 * afford it due to DBuf limitation - in case if SAGV is completely
+	 * disabled in a BIOS, we are not even allowed to send a PCode request,
+	 * as it will throw an error. So have to check it here.
+	 */
+	if (!intel_has_sagv(i915))
+		return;
+
+	if (DISPLAY_VER(i915) >= 11)
+		icl_sagv_pre_plane_update(state);
+	else
+		skl_sagv_pre_plane_update(state);
+}
+
+void intel_sagv_post_plane_update(struct intel_atomic_state *state)
+{
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
+
+	/*
+	 * Just return if we can't control SAGV or don't have it.
+	 * This is different from situation when we have SAGV but just can't
+	 * afford it due to DBuf limitation - in case if SAGV is completely
+	 * disabled in a BIOS, we are not even allowed to send a PCode request,
+	 * as it will throw an error. So have to check it here.
+	 */
+	if (!intel_has_sagv(i915))
+		return;
+
+	if (DISPLAY_VER(i915) >= 11)
+		icl_sagv_post_plane_update(state);
+	else
+		skl_sagv_post_plane_update(state);
+}
+
 static bool skl_crtc_can_enable_sagv(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-- 
2.34.1

