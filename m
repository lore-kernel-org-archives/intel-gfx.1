Return-Path: <SRS0=qSOt=J7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DB5C433ED
	for <intel-gfx@archiver.kernel.org>; Tue,  4 May 2021 08:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8375F611EE
	for <intel-gfx@archiver.kernel.org>; Tue,  4 May 2021 08:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8375F611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC876EAA7;
	Tue,  4 May 2021 08:14:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840E56EAA7
 for <intel-gfx@lists.freedesktop.org>; Tue,  4 May 2021 08:14:13 +0000 (UTC)
IronPort-SDR: VhXykPyqMH13qfCecYjT44zrhy366ArlRaBow3LPFc2Eqa925WSOekRL1s2WmeHzdBrobjhhyh
 MOygnTgM8cuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197980846"
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="197980846"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 01:14:13 -0700
IronPort-SDR: 2bddPSC186HaXS7B9kWvjOzyocGZa6aPHHojDdsY+7Hii+vQgbDbYBUnj9mgFUZFMD0w1ewpWB
 A738VcngX+/w==
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="433166287"
Received: from radwanib-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 01:14:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  4 May 2021 11:14:00 +0300
Message-Id: <a87fd5e66b52c4d52a568888e1b8037841786fd2.1620115982.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620115982.git.jani.nikula@intel.com>
References: <cover.1620115982.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/audio: simplify,
 don't mask out in all branches
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Lift the masking outside of the if branches. No functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 23 ++++++++--------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index b40e929a167e..60083431228c 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -600,31 +600,24 @@ static void enable_audio_dsc_wa(struct intel_encoder *encoder,
 	    (crtc_state->hw.adjusted_mode.hdisplay >= 3840 &&
 	    crtc_state->hw.adjusted_mode.vdisplay >= 2160)) {
 		/* Get hblank early enable value required */
+		val &= ~HBLANK_START_COUNT_MASK(pipe);
 		hblank_early_prog = calc_hblank_early_prog(encoder, crtc_state);
-		if (hblank_early_prog < 32) {
-			val &= ~HBLANK_START_COUNT_MASK(pipe);
+		if (hblank_early_prog < 32)
 			val |= HBLANK_START_COUNT(pipe, HBLANK_START_COUNT_32);
-		} else if (hblank_early_prog < 64) {
-			val &= ~HBLANK_START_COUNT_MASK(pipe);
+		else if (hblank_early_prog < 64)
 			val |= HBLANK_START_COUNT(pipe, HBLANK_START_COUNT_64);
-		} else if (hblank_early_prog < 96) {
-			val &= ~HBLANK_START_COUNT_MASK(pipe);
+		else if (hblank_early_prog < 96)
 			val |= HBLANK_START_COUNT(pipe, HBLANK_START_COUNT_96);
-		} else {
-			val &= ~HBLANK_START_COUNT_MASK(pipe);
+		else
 			val |= HBLANK_START_COUNT(pipe, HBLANK_START_COUNT_128);
-		}
 
 		/* Get samples room value required */
+		val &= ~NUMBER_SAMPLES_PER_LINE_MASK(pipe);
 		samples_room = calc_samples_room(crtc_state);
-		if (samples_room < 3) {
-			val &= ~NUMBER_SAMPLES_PER_LINE_MASK(pipe);
+		if (samples_room < 3)
 			val |= NUMBER_SAMPLES_PER_LINE(pipe, samples_room);
-		} else {
-			/* Program 0 i.e "All Samples available in buffer" */
-			val &= ~NUMBER_SAMPLES_PER_LINE_MASK(pipe);
+		else /* Program 0 i.e "All Samples available in buffer" */
 			val |= NUMBER_SAMPLES_PER_LINE(pipe, 0x0);
-		}
 	}
 
 	intel_de_write(i915, AUD_CONFIG_BE, val);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
