Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D54606A321
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e23ELEi3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EBE10E24C;
	Tue, 24 Nov 2026 17:36:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151810E24C
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 17:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795541763; x=1827077763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nqdpnXEJ1nM+W/NF+L0MeDOVNY3ACtqe+5zAMxUgWpg=;
 b=e23ELEi3e4oAsHCPWQYmEZCjT0a8zoWsY2kcyo37IahzrU91IQMPc3hY
 CeyxeB1Db1r6hRNT9wd3iO7K1rFWtvqKvyNuBI2UnwlJpb95g3b7Hrilj
 nAhN0Uy7YeDsN4OWDf62q3JFpTkz6LpeTfeTGfyfzJFBV8knsP7DnY9Aq
 dhckWauXKP+UrdeETXmMTrJB3vTfcmLPGu/u9cSmOLpuBeCYyWCzzPvoN
 PAWxmOqU+XW7edgu6K2nU8SXUSQUP/BF8pS54mPcTuqebIDPIxElWG7Ku
 chzJuWFCIqWAUQeh7BJ0QJQDc1kcym1PQzzh8iVckSbWV8SJME/cqqCp8 Q==;
X-CSE-ConnectionGUID: OpxcS/0jTNebvadJM5SMVg==
X-CSE-MsgGUID: NtgsHwW7TQewrfy27Z/xRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4291341"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4291341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:35:30 -0800
X-CSE-ConnectionGUID: k7CDH67YQYmwZBI/3xTWeA==
X-CSE-MsgGUID: lRKxDk7tSoCY2fPXhUKeXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12037519"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:35:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/2] drm/i915: separate RPL-U from RPL-P
Date: Tue, 24 Nov 2026 19:35:21 +0200
Message-ID: <20261124173521.1619675-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124173521.1619675-1-jani.nikula@intel.com>
References: <20261124173521.1619675-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RPL-S is a subplatform of ADL-S and RPL-P is a subplatform of
ADL-P. It's a bit much that RPL-P also matches RPL-U. Separate RPL-U
from RPL-P, and make RPL-U a standalone subplatform of ADL-P.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 7 +++----
 drivers/gpu/drm/i915/intel_step.c        | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 2014a8f07e61..23a6d7c939bc 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -178,7 +178,6 @@ static const u16 subplatform_n_ids[] = {
 
 static const u16 subplatform_rpl_ids[] = {
 	INTEL_RPLS_IDS(ID),
-	INTEL_RPLU_IDS(ID),
 	INTEL_RPLP_IDS(ID),
 };
 
@@ -257,9 +256,9 @@ static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	} else if (find_devid(devid, subplatform_rpl_ids,
 			      ARRAY_SIZE(subplatform_rpl_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_RPL);
-		if (find_devid(devid, subplatform_rplu_ids,
-			       ARRAY_SIZE(subplatform_rplu_ids)))
-			mask |= BIT(INTEL_SUBPLATFORM_RPLU);
+	} else if (find_devid(devid, subplatform_rplu_ids,
+			      ARRAY_SIZE(subplatform_rplu_ids))) {
+		mask |= BIT(INTEL_SUBPLATFORM_RPLU);
 	} else if (find_devid(devid, subplatform_g10_ids,
 			      ARRAY_SIZE(subplatform_g10_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_G10);
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 60a2af5307fc..91055c185d52 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -177,7 +177,7 @@ void intel_step_init(struct drm_i915_private *i915)
 	} else if (IS_ALDERLAKE_P_N(i915)) {
 		revids = adlp_n_revids;
 		size = ARRAY_SIZE(adlp_n_revids);
-	} else if (IS_RAPTORLAKE_P(i915)) {
+	} else if (IS_RAPTORLAKE_P(i915) || IS_RAPTORLAKE_U(i915)) {
 		revids = adlp_rplp_revids;
 		size = ARRAY_SIZE(adlp_rplp_revids);
 	} else if (IS_ALDERLAKE_P(i915)) {
-- 
2.47.3

