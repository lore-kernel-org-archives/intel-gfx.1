Return-Path: <SRS0=c+dM=MQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7143DC43216
	for <intel-gfx@archiver.kernel.org>; Sat, 24 Jul 2021 00:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F58960E8F
	for <intel-gfx@archiver.kernel.org>; Sat, 24 Jul 2021 00:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F58960E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734FE6FD53;
	Sat, 24 Jul 2021 00:11:42 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4136FD2C;
 Sat, 24 Jul 2021 00:11:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563473"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563473"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270066"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 23 Jul 2021 17:11:14 -0700
Message-Id: <20210724001114.249295-31-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 30/30] drm/i915: switch num_scalers/num_sprites
 to consider DISPLAY_VER
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The numbers of scalers and sprites depend on the display version, so use
it instead of GRAPHICS_VER. We were mixing both, which let me confused
while removing CNL and GRAPHICS_VER == 10.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index ffe3b5d89a63..7023d36a9a28 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -265,10 +265,10 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 	if (IS_ADLS_DISPLAY_STEP(dev_priv, STEP_A0, STEP_A2))
 		for_each_pipe(dev_priv, pipe)
 			runtime->num_scalers[pipe] = 0;
-	else if (GRAPHICS_VER(dev_priv) >= 11) {
+	else if (DISPLAY_VER(dev_priv) >= 11) {
 		for_each_pipe(dev_priv, pipe)
 			runtime->num_scalers[pipe] = 2;
-	} else if (GRAPHICS_VER(dev_priv) == 9) {
+	} else if (DISPLAY_VER(dev_priv) == 9) {
 		runtime->num_scalers[PIPE_A] = 2;
 		runtime->num_scalers[PIPE_B] = 2;
 		runtime->num_scalers[PIPE_C] = 1;
@@ -279,7 +279,7 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 	if (DISPLAY_VER(dev_priv) >= 13 || HAS_D12_PLANE_MINIMIZATION(dev_priv))
 		for_each_pipe(dev_priv, pipe)
 			runtime->num_sprites[pipe] = 4;
-	else if (GRAPHICS_VER(dev_priv) >= 11)
+	else if (DISPLAY_VER(dev_priv) >= 11)
 		for_each_pipe(dev_priv, pipe)
 			runtime->num_sprites[pipe] = 6;
 	else if (IS_GEMINILAKE(dev_priv))
@@ -301,7 +301,7 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 	} else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
 		for_each_pipe(dev_priv, pipe)
 			runtime->num_sprites[pipe] = 2;
-	} else if (GRAPHICS_VER(dev_priv) >= 5 || IS_G4X(dev_priv)) {
+	} else if (DISPLAY_VER(dev_priv) >= 5 || IS_G4X(dev_priv)) {
 		for_each_pipe(dev_priv, pipe)
 			runtime->num_sprites[pipe] = 1;
 	}
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
