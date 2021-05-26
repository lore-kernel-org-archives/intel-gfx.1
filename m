Return-Path: <SRS0=zXYq=KV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6689BC47082
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 20:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E878613BF
	for <intel-gfx@archiver.kernel.org>; Wed, 26 May 2021 20:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E878613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DBA6EDD8;
	Wed, 26 May 2021 20:35:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4BB6EDDB
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 May 2021 20:35:04 +0000 (UTC)
IronPort-SDR: nZqCmik3R01N5GQwwFqT3ueraePQqxvnjgOdEWU1+hVZV1rBOgswXSsxjwrzkJ8MY9IJj3Y+iy
 InNgu/Q9Acyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="182220539"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="182220539"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 13:35:01 -0700
IronPort-SDR: CYz+qPl0akAN9Se489L9+tQ5WYAbfLbwrysL03P+AfPS+2DYCALdwd8UsLZ51MtfIvZ0BZ1xhk
 Dcpfh2U/irNA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="477119280"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 13:34:59 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 26 May 2021 23:34:56 +0300
Message-Id: <20210526203456.2733040-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/adlp: Add missing TBT AUX -> PW#2
 power domain dependencies
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

On ADL_P the TBT AUX power wells depend on the PW#2 power well, add the
corresponding power domain dependencies.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2f7d1664c4738..225fb1fdb097b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -3082,6 +3082,10 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
 	BIT_ULL(POWER_DOMAIN_AUX_USBC2) |			\
 	BIT_ULL(POWER_DOMAIN_AUX_USBC3) |			\
 	BIT_ULL(POWER_DOMAIN_AUX_USBC4) |			\
+	BIT_ULL(POWER_DOMAIN_AUX_TBT1) |			\
+	BIT_ULL(POWER_DOMAIN_AUX_TBT2) |			\
+	BIT_ULL(POWER_DOMAIN_AUX_TBT3) |			\
+	BIT_ULL(POWER_DOMAIN_AUX_TBT4) |			\
 	BIT_ULL(POWER_DOMAIN_INIT))
 
 /*
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
