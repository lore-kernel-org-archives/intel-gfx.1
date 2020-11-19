Return-Path: <SRS0=vAY1=EZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2BAC388F9
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2020 07:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF63246B8
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2020 07:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DF63246B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A58489CAC;
	Thu, 19 Nov 2020 07:11:05 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C478289CAC
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2020 07:11:03 +0000 (UTC)
IronPort-SDR: DHwgDTTOyK2dq++unuZKUP2O9p1++Z7uCKDtWh2xWvgXRrFyca1ZsTVku9EYeTssAuGn/rC/qa
 X6zBbD0fp9/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="232858272"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="232858272"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 23:11:03 -0800
IronPort-SDR: ueyXb4TVUG/u8EjrDvUnVl3whc3QQa8SEtB4XvcWmiOzsVuG1L/7R23ZxF3sbkjHKfc2Z1pgut
 DYb6yXi8UrQQ==
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="476704355"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 18 Nov 2020 23:11:03 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 18 Nov 2020 23:13:31 -0800
Message-Id: <20201119071331.10934-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Do not call hsw_set_frame_start_delay
 for dsi
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

This should fix the boot oops for dsi

Fixes: 4e3cdb4535e7 ("drm/i915/dp: Master/Slave enable/disable sequence for bigjoiner")
Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5c07c74d4397..739be96e998d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7211,7 +7211,7 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 	if (INTEL_GEN(dev_priv) >= 9 || IS_BROADWELL(dev_priv))
 		bdw_set_pipemisc(new_crtc_state);
 
-	if (!new_crtc_state->bigjoiner_slave || !transcoder_is_dsi(cpu_transcoder)) {
+	if (!new_crtc_state->bigjoiner_slave && !transcoder_is_dsi(cpu_transcoder)) {
 		if (!transcoder_is_dsi(cpu_transcoder))
 			intel_set_transcoder_timings(new_crtc_state);
 
@@ -7224,7 +7224,7 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 			intel_cpu_transcoder_set_m_n(new_crtc_state,
 						     &new_crtc_state->fdi_m_n, NULL);
 
-		hsw_set_frame_start_delay(new_crtc_state);
+			hsw_set_frame_start_delay(new_crtc_state);
 	}
 
 	if (!transcoder_is_dsi(cpu_transcoder))
-- 
2.19.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
