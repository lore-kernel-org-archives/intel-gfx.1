Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7100C5DF81
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2026 21:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2322910E083;
	Tue, 18 Aug 2026 21:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g67zeS+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FDE10E083
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Aug 2026 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787086963; x=1818622963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u+IvDJv/BeucQywfwnEu96n20VES88QMiI2zExchoT0=;
 b=g67zeS+upt/mMp7Wn3EpTjjcF3KbeupP0YvN3t9dHGivYP7lnEhBdB09
 xXnHqtt4l5kNQcZl543tSdpS7Up5WlryVKhP5vU0zKTB6e5WTTgx04ZeA
 y4eOa4OmcVAjgDRaZE4qw3xH2qqh+RYWGgtw3PSX+T15n/V9SJknx8h90
 yPJ4CItlKR7wPK0iUOQQyxyQplp/egqFD2q0+z3pTYYOXLTlaMPGc4rLu
 cO5Um2R5bOxYgSp4QcVTqDNXpb3P+22j+BFLHvzR0NuL9U5F4OIQV5jDr
 f0JAmGoORzEIjbxPQxXjp3wyo9sODIUkebzKL3PqpHEEShPxBD9ia0xJV A==;
X-CSE-ConnectionGUID: o9wV247mSV+KEd0UU8aR/w==
X-CSE-MsgGUID: 6BG+JXjNSD2OoxLaKZbisA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98952917"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98952917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:02:43 -0700
X-CSE-ConnectionGUID: Z+fayCGbRCCxm10aK089Yw==
X-CSE-MsgGUID: mZMBZe5kS2CterAdM4PrIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="259152548"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:02:41 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v4] drm/i915/display: Check some INVALID_TRANSCODER cases
Date: Wed, 19 Aug 2026 05:02:38 +0800
Message-ID: <20260818210238.274246-1-jonathan.cavitt@intel.com>
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

v4:
- Directly set master_transcoder = INVALID_TRANSCODER in the
  port_sync_transcoders == 0 case (Jani)
- Reorganize cpu_transcoder == master_transcoder segment, as
  master_transcoder no longer needs to be reassigned in the
  INVALID_TRANSCODER case (jcavitt)
- Add a comment explaining the change (jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9b3b526e5e55..d3131dcf6356 100644
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
@@ -4674,10 +4675,26 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 	 */
 	if (port_sync_transcoders & BIT(TRANSCODER_EDP))
 		crtc_state->master_transcoder = TRANSCODER_EDP;
+	else if (!port_sync_transcoders)
+		crtc_state->master_transcoder = INVALID_TRANSCODER;
 	else
 		crtc_state->master_transcoder = ffs(port_sync_transcoders) - 1;
 
 	if (crtc_state->master_transcoder == crtc_state->cpu_transcoder) {
+		if (crtc_state->cpu_transcoder == INVALID_TRANSCODER) {
+			/*
+			 * Since master_transcoder == cpu_transcoder,
+			 * master_transcoder == INVALID_TRANSCODER, so we don't need to do
+			 * the later assignment.  Also, the intended behavior in this case
+			 * is to just set the sync_mode_slaves_mask to zero, as
+			 * port_sync_transcoders must be zero here.  But performing a bit
+			 * shift (via REG_BIT) by a negative value results in undefined
+			 * behavior which should always be avoided, so just do the
+			 * assignment to zero directly and return.
+			 */
+			crtc_state->sync_mode_slaves_mask = 0;
+			return 0;
+		}
 		crtc_state->master_transcoder = INVALID_TRANSCODER;
 		crtc_state->sync_mode_slaves_mask = port_sync_transcoders &
 			~REG_BIT(crtc_state->cpu_transcoder);
-- 
2.53.0

