Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61900C5B572
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 14:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E9C10E411;
	Mon, 17 Aug 2026 14:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBgTku5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5318C10E411
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2026 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786978723; x=1818514723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OhHudVg19YOiWO/ZxiEP4Ihst9/hutfPz+WQ6T8sees=;
 b=dBgTku5z/K0i2WufSn7pDhTghptWE02kgYC1q5uGLuF7CivRbgMb1Zx9
 msnjIpArKKtrReB426t2xfyqCYrBQOnL24A8XaxADM0J962hXJa9Nyq/+
 SxNdOWoQcZTKdFqiuF7moBHsT5DAyj3UWF+9WsvgTGUxzAE2/08rp3vnA
 yvVTqw8GEY9EvNBebxP6cvS/zJhMzF8qDzO/Czqcdx+aHg5JqQH+8WJjL
 /sC5KOvssxpJ0TMQ0YPvl0IBpfjL1FdN+t5h7hjLu52EH3jMPeRC6/VsA
 ZGfFzK15fMmH6Fs95akEzKQxGSfzu6m9ti3AmpKyz4bbkaah0/DAqMLZa Q==;
X-CSE-ConnectionGUID: XNJDyI4EQ3CmS4kiIlXIJQ==
X-CSE-MsgGUID: Tr+dtMrRTZGOLc/NbplcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98117562"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="98117562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:58:43 -0700
X-CSE-ConnectionGUID: eo+MLIsgS7ihhvyficVwVA==
X-CSE-MsgGUID: xskorqTySNiS2tseMAsFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="258734892"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:58:41 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v3] drm/i915/display: Check some INVALID_TRANSCODER cases
Date: Mon, 17 Aug 2026 22:58:38 +0800
Message-ID: <20260817145838.252365-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

There are some cases in intel_ddi.c, such as in intel_ddi_is_audio_enabled
and intel_ddi_compute_config_late, where we attempt to perform a BIT
shift using a passed transcoder enum value.  This value may be -1,
INVALID_TRANSCODER, which can result in undefined behavior if this
occurs.

In the former case, we can simply return false if this is the transcoder
passed (as audio is not enabled on an invalid transcoder).

In the latter case, the likely expected behavior is to set the
crtc_state->sync_mode_slaves_mask to zero, so just do that directly and
avoid a risky bit shift.

The likelihood of either case occurring during normal execution is
unknown and possibly very low.  Regardless, this covers a static analyis
issue.

v2: Rewrite the latter case to streamline it (Ville)

v3: Target cpu_transcoder in intel_ddi_compute_config_late change (Jani)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9b3b526e5e55..2bfbb6297b5d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3893,7 +3893,8 @@ static void intel_ddi_set_idle_link_train(struct intel_dp *intel_dp,
 static bool intel_ddi_is_audio_enabled(struct intel_display *display,
 				       enum transcoder cpu_transcoder)
 {
-	if (cpu_transcoder == TRANSCODER_EDP)
+	if (cpu_transcoder == TRANSCODER_EDP ||
+	    cpu_transcoder == INVALID_TRANSCODER)
 		return false;
 
 	if (!intel_display_power_is_enabled(display, POWER_DOMAIN_AUDIO_MMIO))
@@ -4679,6 +4680,10 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 
 	if (crtc_state->master_transcoder == crtc_state->cpu_transcoder) {
 		crtc_state->master_transcoder = INVALID_TRANSCODER;
+		if (crtc_state->cpu_transcoder == INVALID_TRANSCODER) {
+			crtc_state->sync_mode_slaves_mask = 0;
+			return 0;
+		}
 		crtc_state->sync_mode_slaves_mask = port_sync_transcoders &
 			~REG_BIT(crtc_state->cpu_transcoder);
 	}
-- 
2.53.0

