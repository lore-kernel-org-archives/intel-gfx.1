Return-Path: <SRS0=9UyP=EC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC7EC4363A
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 22:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE0521D24
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 22:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BE0521D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B816E118;
	Tue, 27 Oct 2020 22:11:31 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBC16E20A
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Oct 2020 22:11:24 +0000 (UTC)
IronPort-SDR: i1XEG4nxXfgYE4lup/mezB/5hbMRA+StqdBdKD1Q7XQZ1uv01lt+XrCJ9C4TGFneLD/EyN+u8i
 X7eGBmYuWrqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="168299462"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="168299462"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 15:11:23 -0700
IronPort-SDR: f9A5EfFVcEOfqZD8/LP1PGpEkohLgq6PiVPCew+ud39rwrVUbQaU+Rp0xpQS5qkks86iBdlnrc
 pRZ4yHDeGrDA==
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="323114115"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 27 Oct 2020 15:11:23 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 27 Oct 2020 15:13:10 -0700
Message-Id: <20201027221312.16518-3-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201027221312.16518-1-manasi.d.navare@intel.com>
References: <20201027221312.16518-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 3/5] drm/i915: Pass intel_atomic_state
 instead of drm_atomic_state
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

No functional changes, to align with previous cleanups pass
intel_atomic_state instead of drm_atomic_state.
Also pass this intel_atomic_state with crtc_state to
some of the atomic_check functions.

Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 756683b2a5be..396ddcbb1520 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12661,7 +12661,7 @@ static bool encoders_cloneable(const struct intel_encoder *a,
 			  b->cloneable & (1 << a->type));
 }
 
-static bool check_single_encoder_cloning(struct drm_atomic_state *state,
+static bool check_single_encoder_cloning(struct intel_atomic_state *state,
 					 struct intel_crtc *crtc,
 					 struct intel_encoder *encoder)
 {
@@ -12670,7 +12670,7 @@ static bool check_single_encoder_cloning(struct drm_atomic_state *state,
 	struct drm_connector_state *connector_state;
 	int i;
 
-	for_each_new_connector_in_state(state, connector, connector_state, i) {
+	for_each_new_connector_in_state(&state->base, connector, connector_state, i) {
 		if (connector_state->crtc != &crtc->base)
 			continue;
 
@@ -13521,10 +13521,10 @@ intel_crtc_prepare_cleared_state(struct intel_crtc_state *crtc_state)
 }
 
 static int
-intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
+intel_modeset_pipe_config(struct intel_atomic_state *state,
+			  struct intel_crtc_state *pipe_config)
 {
 	struct drm_crtc *crtc = pipe_config->uapi.crtc;
-	struct drm_atomic_state *state = pipe_config->uapi.state;
 	struct drm_i915_private *i915 = to_i915(pipe_config->uapi.crtc->dev);
 	struct drm_connector *connector;
 	struct drm_connector_state *connector_state;
@@ -13566,7 +13566,7 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 			       &pipe_config->pipe_src_w,
 			       &pipe_config->pipe_src_h);
 
-	for_each_new_connector_in_state(state, connector, connector_state, i) {
+	for_each_new_connector_in_state(&state->base, connector, connector_state, i) {
 		struct intel_encoder *encoder =
 			to_intel_encoder(connector_state->best_encoder);
 
@@ -13604,7 +13604,7 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 	 * adjust it according to limitations or connector properties, and also
 	 * a chance to reject the mode entirely.
 	 */
-	for_each_new_connector_in_state(state, connector, connector_state, i) {
+	for_each_new_connector_in_state(&state->base, connector, connector_state, i) {
 		struct intel_encoder *encoder =
 			to_intel_encoder(connector_state->best_encoder);
 
@@ -15228,7 +15228,7 @@ static int intel_atomic_check(struct drm_device *dev,
 		if (!new_crtc_state->hw.enable)
 			continue;
 
-		ret = intel_modeset_pipe_config(new_crtc_state);
+		ret = intel_modeset_pipe_config(state, new_crtc_state);
 		if (ret)
 			goto fail;
 	}
-- 
2.19.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
