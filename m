Return-Path: <SRS0=h8SK=PP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5857BC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 19:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 229776044F
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 19:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 229776044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B704C6E530;
	Wed, 27 Oct 2021 19:07:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A906E530
 for <intel-gfx@lists.freedesktop.org>; Wed, 27 Oct 2021 19:07:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="253794166"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="253794166"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 11:42:39 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="494937119"
Received: from josouza-mobl2.jf.intel.com (HELO josouza-mobl2.intel.com)
 ([10.24.14.60])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 11:42:38 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Jouni Hogander <jouni.hogander@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 27 Oct 2021 11:48:55 -0700
Message-Id: <20211027184855.108731-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/psr2: Do full fetches when doing async
 flips
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

Async flips are not supported by selective fetch and we had a check
for that but that check was only executed when doing modesets.
So moving this check to the page flip path, so it can be properly
handled.

This fix a failure in kms_async_flips@test-cursor.

Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jouni Hogander <jouni.hogander@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 8d08e3cf08c1f..ce6850ed72c60 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -729,12 +729,6 @@ static bool intel_psr2_sel_fetch_config_valid(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	if (crtc_state->uapi.async_flip) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "PSR2 sel fetch not enabled, async flip enabled\n");
-		return false;
-	}
-
 	/* Wa_14010254185 Wa_14010103792 */
 	if (IS_TGL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_C0)) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -1592,6 +1586,8 @@ static bool psr2_sel_fetch_pipe_state_supported(const struct intel_crtc_state *c
 {
 	if (crtc_state->scaler_state.scaler_id >= 0)
 		return false;
+	if (crtc_state->uapi.async_flip)
+		return false;
 
 	return true;
 }
-- 
2.33.1

