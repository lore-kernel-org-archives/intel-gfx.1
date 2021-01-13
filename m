Return-Path: <SRS0=9rZY=GQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF44C433E6
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 14:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D06B23434
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 14:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D06B23434
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8392C6EA1C;
	Wed, 13 Jan 2021 14:37:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2626EA1C
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 14:37:34 +0000 (UTC)
IronPort-SDR: Q+YbDCogRxVd0jQb23xcUDsfAsGudTvyNDO4CZaJA4N3fm1/jEj0f0GummeaxZvuIDqeyfhJAx
 cNUygiPI41kA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="262996881"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="262996881"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 06:37:32 -0800
IronPort-SDR: CPdD0ymauC+BeIRQLMSRWe7l2LLhDUIEN66Un5Tnlm567nIZqwmbOj+Y5E2E2jlZoDstitdut9
 0hV0FH/a3pOw==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="381871652"
Received: from iklein-mobl.ger.corp.intel.com (HELO localhost) ([10.249.40.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 06:37:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 13 Jan 2021 16:37:26 +0200
Message-Id: <20210113143726.19701-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/display: remove useless use of inline
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

skl_scaler_get_filter_select() isn't static and can't be inline.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0189d379a55e..cf9860ff9a89 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5810,7 +5810,7 @@ static void cnl_program_nearest_filter_coefs(struct drm_i915_private *dev_priv,
 	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set), 0);
 }
 
-inline u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, int set)
+u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, int set)
 {
 	if (filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
 		return (PS_FILTER_PROGRAMMED |
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
