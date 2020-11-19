Return-Path: <SRS0=vAY1=EZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FBAC388F9
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2020 19:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D7E24655
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2020 19:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D7E24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8E8898A4;
	Thu, 19 Nov 2020 19:01:33 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229FC898A4
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2020 19:01:32 +0000 (UTC)
IronPort-SDR: Kj9GJc51z/jHr10rJ99ZF1S8aRTd318zyLolLfMenkJRBov6nlHCbD0fFWJ4DnfqfcitlaLSPs
 xgt72Q16e95Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="170562735"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="170562735"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 11:01:31 -0800
IronPort-SDR: hgxR2piAK/Fso/qVH80HRL2JV1WBWUYuJIq5MfxO0iiRI+Vlcr7bQfFAPgHqTlTlMLAFIOX6Wq
 cGaQL8NCUXmg==
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="368874032"
Received: from linux-desktop.iind.intel.com ([10.223.34.173])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 11:01:29 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 20 Nov 2020 01:06:14 +0530
Message-Id: <20201119193614.25914-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119155050.20328-2-uma.shankar@intel.com>
References: <20201119155050.20328-2-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v3 1/2] drm/i915/display/tgl: Disable FBC with PSR2
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

There are some corner cases wrt underrun when we enable
FBC with PSR2 on TGL. Recommendation from hardware is to
keep this combination disabled.

Bspec: 50422 HSD: 14010260002

v2: Added psr2 enabled check from crtc_state (Anshuman)
Added Bspec link and HSD referneces (Jose)

v3: Moved the logic to disable fbc to intel_fbc_update_state_cache
and removed the crtc->config usages, as per Ville's recommendation.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index a5b072816a7b..cb29c6f068f9 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -701,6 +701,15 @@ static void intel_fbc_update_state_cache(struct intel_crtc *crtc,
 	struct drm_framebuffer *fb = plane_state->hw.fb;
 
 	cache->plane.visible = plane_state->uapi.visible;
+
+	/*
+	 * Tigerlake is not supporting FBC with PSR2.
+	 * Recommendation is to keep this combination disabled
+	 * Bspec: 50422 HSD: 14010260002
+	 */
+	if (crtc_state->has_psr2 && IS_TIGERLAKE(dev_priv))
+		cache->plane.visible = false;
+
 	if (!cache->plane.visible)
 		return;
 
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
