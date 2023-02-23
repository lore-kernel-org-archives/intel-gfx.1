Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19665C61DA4
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Feb 2023 15:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3DE10E057;
	Thu, 23 Feb 2023 15:20:53 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E72310E057
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Feb 2023 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677165652; x=1708701652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C7J9mfPQ99h+PpWIb0r1Q/aPVGAydtpIwJaOLnrMRdo=;
 b=RHolDa+Ciwj6vWi7OYcI9UbLjcGOAn4Lg0xtXSPeY4mMtc3lNpfIFEp0
 TPFHT8Mt8skxbAqg6LKbH8uGlAFDK1V4yZ6IAGSNn0FsHzz4RkJCwM0VB
 h+nia3B2s+sH0D/2/V3fxisy4EDDloviAklPAJiXtkiqrWnotCgtkD2X9
 5a0EszJRQKQJXqF9LcgG+Voh4wNLH4/Y+BH9cI8wjCQS45GBk282RW82l
 nmmK2txTZfyElbIkrlJhuxLH2j4t80DiilJBqEGrhyCfO11vuma/s1GYe
 DwNfXTd6qdOOpGvd6LREJPEGy6SXyuswv3Kb2Drv6+dA3QMa+fYpXTWZH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360729627"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="360729627"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 07:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="674563911"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="674563911"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 23 Feb 2023 07:20:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Feb 2023 17:20:48 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 23 Feb 2023 17:20:48 +0200
Message-Id: <20230223152048.20878-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Preserve crtc_state->inherited during
 state clearing
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
Cc: stable@vger.kernel.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_crtc_prepare_cleared_state() is unintentionally losing
the "inherited" flag. This will happen if intel_initial_commit()
is forced to go through the full modeset calculations for
whatever reason.

Afterwards the first real commit from userspace will not get
forced to the full modeset path, and thus eg. audio state may
not get recomputed properly. So if the monitor was already
enabled during boot audio will not work until userspace itself
does an explicit full modeset.

Cc: stable@vger.kernel.org
Tested-by: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a1fbdf32bd21..ed95c0acfaae 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5078,6 +5078,7 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
 	 * only fields that are know to not cause problems are preserved. */
 
 	saved_state->uapi = crtc_state->uapi;
+	saved_state->inherited = crtc_state->inherited;
 	saved_state->scaler_state = crtc_state->scaler_state;
 	saved_state->shared_dpll = crtc_state->shared_dpll;
 	saved_state->dpll_hw_state = crtc_state->dpll_hw_state;
-- 
2.39.2

