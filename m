Return-Path: <SRS0=lQef=JL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4654BC433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 11:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F063E613C4
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 11:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F063E613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DD96E933;
	Wed, 14 Apr 2021 11:51:07 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D146E92F
 for <Intel-gfx@lists.freedesktop.org>; Wed, 14 Apr 2021 11:51:04 +0000 (UTC)
IronPort-SDR: LYf4fbkhrciFa/QzAiqUgBG+LaYYNfKsYuXi67Hic6a9cMB43fOPMrcP5wXX3Uc4GjuItRYR6B
 QcqHMsXO8B5A==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="174119562"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="174119562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 04:51:04 -0700
IronPort-SDR: yFobGOioDyr2sZLAmeeEiL5GHID8Ost1gtN/XMN5jnOOwWVPfP4raAzvROz57uZcCBt6UYbqKs
 f+g0otYZNNWg==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="521965264"
Received: from bdebhal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.119])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 04:51:03 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Wed, 14 Apr 2021 12:50:22 +0100
Message-Id: <20210414115028.168504-23-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414115028.168504-1-tvrtko.ursulin@linux.intel.com>
References: <20210414115028.168504-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 22/28] drm/i915: Use IS_GEN in stolen
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_gem_stolen.c | 36 ++++++++++----------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_stolen.c b/drivers/gpu/drm/i915/i915_gem_stolen.c
index 0afd50cf71de..4a9f545f0c4e 100644
--- a/drivers/gpu/drm/i915/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/i915_gem_stolen.c
@@ -356,34 +356,26 @@ int i915_gem_init_stolen(struct drm_i915_private *dev_priv)
 	reserved_base = 0;
 	reserved_size = 0;
 
-	switch (INTEL_GEN(dev_priv)) {
-	case 2:
-	case 3:
-		break;
-	case 4:
-		if (!IS_G4X(dev_priv))
-			break;
-		/* fall through */
-	case 5:
-		g4x_get_stolen_reserved(dev_priv,
-					&reserved_base, &reserved_size);
-		break;
-	case 6:
-		gen6_get_stolen_reserved(dev_priv,
-					 &reserved_base, &reserved_size);
-		break;
-	case 7:
-		gen7_get_stolen_reserved(dev_priv,
-					 &reserved_base, &reserved_size);
-		break;
-	default:
+	if (IS_GEN(dev_priv, 8, GEN_FOREVER)) {
 		if (IS_LP(dev_priv))
 			chv_get_stolen_reserved(dev_priv,
 						&reserved_base, &reserved_size);
 		else
 			bdw_get_stolen_reserved(dev_priv,
 						&reserved_base, &reserved_size);
-		break;
+
+	} else if (IS_GEN(dev_priv, 7, GEN_FOREVER)) {
+		gen7_get_stolen_reserved(dev_priv,
+					&reserved_base, &reserved_size);
+	} else if (IS_GEN(dev_priv, 6, GEN_FOREVER)) {
+		gen6_get_stolen_reserved(dev_priv,
+					 &reserved_base, &reserved_size);
+	} else if (IS_GEN(dev_priv, 5, GEN_FOREVER)) {
+		g4x_get_stolen_reserved(dev_priv,
+					&reserved_base, &reserved_size);
+	} else if (IS_GEN(dev_priv, 4, GEN_FOREVER) && IS_G4X(dev_priv)) {
+		g4x_get_stolen_reserved(dev_priv,
+					&reserved_base, &reserved_size);
 	}
 
 	/* It is possible for the reserved base to be zero, but the register
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
