Return-Path: <SRS0=HRyj=KW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B8CC47089
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 18:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A2961181
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 18:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A2961181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AF26F498;
	Thu, 27 May 2021 18:17:17 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D887A6F491
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 May 2021 18:17:10 +0000 (UTC)
IronPort-SDR: v9iy/TH2OOojfNZDWMUq6o3Dp4gqK4hX8Xw60qkTkSOqinZ3+kVC07v17MCFElFQAjg0KjPWCF
 5wzDAb20vSKA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="202808222"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="202808222"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 11:17:08 -0700
IronPort-SDR: RWY39iIyv70F5NTrFyOl/za1ibjoE7Nf+8qerPVhdHBdY8eTh0oVXKmIFG2IR/68hc1FvZzaMi
 mhQ5p1hhfVCA==
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="415008587"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 11:17:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 27 May 2021 11:17:00 -0700
Message-Id: <20210527181700.1676790-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527181700.1676790-1-lucas.demarchi@intel.com>
References: <20210527181700.1676790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 7/7] drm/i915/display: replace IS_GEN() in
 commented code
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

Since we are replacing IS_GEN() with GRAPHICS_VER(), make sure we take
care of the comments as well.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index ce73ebdfc669..aa52af7891f0 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1307,7 +1307,7 @@ intel_tv_compute_config(struct intel_encoder *encoder,
 	 * the active portion. Hence following this formula seems
 	 * more trouble that it's worth.
 	 *
-	 * if (IS_GEN(dev_priv, 4)) {
+	 * if (GRAPHICS_VER(dev_priv) == 4) {
 	 *	num = cdclk * (tv_mode->oversample >> !tv_mode->progressive);
 	 *	den = tv_mode->clock;
 	 * } else {
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
