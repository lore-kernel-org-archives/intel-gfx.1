Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3826606A33B
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eofjXEM5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDB610EFA7;
	Mon, 16 Nov 2026 14:37:27 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802CC10E828
 for <intel-gfx@lists.freedesktop.org>; Sat, 14 Nov 2026 01:44:01 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c468bd799ecso283403666b.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Nov 2026 17:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794620639; x=1795225439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z5fnz0J6vpb3Ewmw43nxWynz3ZbXtBhlPwMnvHWjbog=;
 b=eofjXEM5vDw7L1u3KnLxhI2MWDbxAYYqtKCndBsQgO/XHPmnRdwFopDTWnmRGMYlsk
 iqCd54YSxu/qVRz/aN6mqxW0h1YOKCtYjPymFLwcrzyJyKxqlas+pvXcc+alq7Q+/0vO
 cm5d6Fue/cm54jisW5GrLtJBO1BaZtF/JsRQP563S2VYPNWUvtA8l/bU89ySFf6QEGI1
 UK9RE5rvPeYUAKQh2UBXKeSffSm0WdlI78z0P51Vw2v8B48DOpkKrCSC16ej7m0gaNm+
 Rlt0f6UEgDhe8fi/NQRFuFqgM2rHySUm2zyXytohFYTZOQimsqJ709D2570uKI43UGN9
 bajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794620640; x=1795225440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z5fnz0J6vpb3Ewmw43nxWynz3ZbXtBhlPwMnvHWjbog=;
 b=irzxpSDeEqCpxZcp3ivbaZ7FPPalZ8yI/p6pnrpU84NsNa9/Y+evsKxnCKpVsBFH9D
 PWwfytibjdj1eW/e4pKJ0HWzLAkcW4ygKmKZv40PYpuzi34NvbgBd17G8hxOyOOWbao/
 zS7UL95MeiD8ITHwHh6R1+njt1FpEEFxQzWx8lEdO8tGhCasX9mHsrBJkQbyfnlyTJ7B
 Kk711lR8vZcBbAYKEBmj3d6qNKngT4KY3Zxo1Vf8eaKxUw3ZfWHstgyh1HRcMFHF9+r6
 I5qy7utQjq9fpFbPlQ8Qfj3oeMz3nO0FjtXdZr/HvLKpHIpUppJ2sI+HBkeSMJxUnVzU
 m/Zg==
X-Gm-Message-State: APuU4Z+aaZNwOll3cT88rHe3mvk+M9rMKptKscm5bj2AsoaCvj11pDx1
 VHypao1yBRs2sfHm8nD7MLoiBvUgWVkVcMhKAWWa711JXp3XIBh8Y2h008nmVi/ZUQc=
X-Gm-Gg: AYBFou0Gk/hJYu1I0bBcWnkkTMKdXizdFsH65HPKWfXftRFofcJu6GPr97BDSDnQ0AB
 zgWSIKSB1TnM188LpaCAB64pkLoVfuBNkY6BEQ/H0zUI9fpssdCMi0Uh0cTcRoBdF77b2HsYx9H
 uvxcF0aV4QLGSpLbe/1iS1LB7A6XII4QfpZSuQXrK54qHlV++kUJNSptNVRK3dLuxw/PIfz9jEy
 dosgwq3bBcaXFqYuGUtzc42WCYZOHYDm0k2QTB6SztdtuKOfhkLF/ASZ0cgV//b91XtdavO/c9c
 8A/cBc6/QualS52QDS2TftoBvYlGMplgP7nrs8HHAmNE1wf3IlEO2rMupiC4nJJRp8xEVn8/b7c
 csWP3YRiDSwtiI7ko5ttnJDmqz3EfjXV4D0ohxGk4/BKjGi2zUNF97gu9+24DF0VzvcwidH59zC
 Gmh14cDaTncKvTyymUFMqUHqdcCrztLleZBveX7CNzMj6wteBcL/KVnQri8X0fromDeLPpl/Stk
 BiuVuBWw1B9JpgoJWvbJQQ8bh41AluePLrofyeP29lyW8CPgBtpmnBktZv5pmeObvUsV0vyuhwS
 VhbtCRy+rEzVmkCdp4E2THa6fYHxiy7td4yDJMd5f2n8H90/fWF6lf3kJibfn++5q+cqa4WI5G6
 kYiSw/nBxYs35ZeuxWMBkcYlqMJqepcQ/12GQjaMpFZmv
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id
 a640c23a62f3a-c50963d50e5mr364215466b.16.1794620639602; 
 Fri, 13 Nov 2026 17:43:59 -0800 (PST)
Received: from SMOK.angora-ide.ts.net
 (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 17:43:59 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ElXreno <elxreno@gmail.com>
Subject: [PATCH 3/7] drm/i915/vrr: Leave the transcoder to the joiner primary
Date: Sat, 14 Nov 2026 04:43:31 +0300
Message-ID: <20261114014335.2132756-4-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114014335.2132756-1-elxreno@gmail.com>
References: <20261114014335.2132756-1-elxreno@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:25 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All joined pipes run off the transcoder of the primary, and the crtc
states of the secondaries are copies of the primary's state, the VRR
state included. The commit therefore reaches the transcoder level VRR
functions for every joined pipe: intel_pre_update_crtc() calls
intel_vrr_set_transcoder_timings() for each crtc whose VRR parameters
changed, intel_pre_plane_update() and commit_pipe_post_planes() call
intel_vrr_disable() and intel_vrr_enable(), and both commit paths
call intel_vrr_send_push() and intel_vrr_check_push_sent() per crtc.

Do these once, from the primary. When disabling VRR also switch the
active timings of all joined pipes as soon as the transcoder has left
VRR mode, rather than leaving the secondaries on the VRR timings
until their own turn comes.

The check in intel_vrr_set_transcoder_timings() drops the second,
identical programming of the transcoder that a joined fixed refresh
rate configuration gets today. Everything else depends on vrr.enable,
which is never set with the joiner yet, so there is no other
functional change. In particular the push a secondary sends for the
PSR and Panel Replay frame change is left as it is.

The checks in intel_vrr_set_transcoder_timings(), intel_vrr_send_push(),
intel_vrr_enable() and intel_vrr_disable() are the ones Ankit Nautiyal
posted in "drm/i915/vrr: Handle joiner with vrr", last in [1].

[1] https://lore.kernel.org/intel-gfx/20250224061717.1095226-14-ankit.k.nautiyal@intel.com/

Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 15 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_vrr.c     | 21 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9a503b25ae47..20b1103e3de4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1237,10 +1237,21 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 
 	intel_psr_pre_plane_update(state, crtc);
 
-	if (intel_crtc_vrr_disabling(state, crtc)) {
+	/* The joined pipes are handled in one go from the primary */
+	if (intel_crtc_vrr_disabling(state, crtc) &&
+	    !intel_crtc_is_joiner_secondary(old_crtc_state)) {
+		struct intel_crtc *pipe_crtc;
+
 		intel_vrr_disable(old_crtc_state);
 		intel_vrr_dcb_reset(old_crtc_state, crtc);
-		intel_crtc_update_active_timings(old_crtc_state, false);
+
+		for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
+						 intel_crtc_joined_pipe_mask(old_crtc_state)) {
+			const struct intel_crtc_state *old_pipe_crtc_state =
+				intel_atomic_get_old_crtc_state(state, pipe_crtc);
+
+			intel_crtc_update_active_timings(old_pipe_crtc_state, false);
+		}
 
 		/*
 		 * VRR is being disabled seamlessly (no modeset, Panel Replay
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index a5a5d11380a4..668c495e7407 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -19,6 +19,7 @@
 #include "intel_de.h"
 #include "intel_dip.h"
 #include "intel_dip_regs.h"
+#include "intel_display.h"
 #include "intel_display_limits.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -674,6 +675,10 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	if (!HAS_VRR(display))
 		return;
 
+	/* The joined pipes drive one transcoder, so program it once. */
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	/*
 	 * Bspec says:
 	 * "(note: VRR needs to be programmed after
@@ -773,6 +778,13 @@ void intel_vrr_send_push(struct intel_dsb *dsb,
 	if (!crtc_state->vrr.enable && !intel_psr_use_trans_push(crtc_state))
 		return;
 
+	/*
+	 * A VRR push latches all joined pipes at once, it is up to the
+	 * primary to send it once every one of them has been armed.
+	 */
+	if (crtc_state->vrr.enable && intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	if (dsb)
 		intel_dsb_nonpost_start(dsb);
 
@@ -793,6 +805,9 @@ void intel_vrr_check_push_sent(struct intel_dsb *dsb,
 	if (!crtc_state->vrr.enable)
 		return;
 
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	/*
 	 * Make sure the push send bit has cleared. This should
 	 * already be the case as long as the caller makes sure
@@ -1005,6 +1020,9 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 	if (!crtc_state->vrr.enable)
 		return;
 
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	intel_vrr_set_vrr_timings(crtc_state);
 	intel_vrr_enable_dc_balancing(crtc_state);
 
@@ -1019,6 +1037,9 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 	if (!old_crtc_state->vrr.enable)
 		return;
 
+	if (intel_crtc_is_joiner_secondary(old_crtc_state))
+		return;
+
 	if (!intel_vrr_always_use_vrr_tg(display))
 		intel_vrr_tg_disable(old_crtc_state);
 
-- 
2.56.0

