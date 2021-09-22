Return-Path: <SRS0=at8c=OM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC83C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 21:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5624161019
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 21:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5624161019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1BB6E051;
	Wed, 22 Sep 2021 21:47:09 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B086E051
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Sep 2021 21:47:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203206928"
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; d="scan'208";a="203206928"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 14:47:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; d="scan'208";a="435593150"
Received: from josouza-mobl2.jf.intel.com (HELO josouza-mobl2.intel.com)
 ([10.24.14.60])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 14:47:07 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Imre Deak <imre.deak@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 22 Sep 2021 14:52:40 -0700
Message-Id: <20210922215242.66683-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH CI 1/3] drm/i915/display/dmc: Set
 DC_STATE_DEBUG_MASK_CORES after firmware load
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

Specification asks for DC_STATE_DEBUG_MASK_CORES to be set for all
platforms that supports DMC, not only for geminilake and broxton.

While at is also taking the oportunity to simply the code.

BSpec: 7402
BSpec: 49436
Reviewed-by: Imre Deak <imre.deak@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index b0268552b2863..2dc9d632969db 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -255,20 +255,10 @@ intel_get_stepping_info(struct drm_i915_private *i915,
 
 static void gen9_set_dc_state_debugmask(struct drm_i915_private *dev_priv)
 {
-	u32 val, mask;
-
-	mask = DC_STATE_DEBUG_MASK_MEMORY_UP;
-
-	if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
-		mask |= DC_STATE_DEBUG_MASK_CORES;
-
 	/* The below bit doesn't need to be cleared ever afterwards */
-	val = intel_de_read(dev_priv, DC_STATE_DEBUG);
-	if ((val & mask) != mask) {
-		val |= mask;
-		intel_de_write(dev_priv, DC_STATE_DEBUG, val);
-		intel_de_posting_read(dev_priv, DC_STATE_DEBUG);
-	}
+	intel_de_rmw(dev_priv, DC_STATE_DEBUG, 0,
+		     DC_STATE_DEBUG_MASK_CORES | DC_STATE_DEBUG_MASK_MEMORY_UP);
+	intel_de_posting_read(dev_priv, DC_STATE_DEBUG);
 }
 
 /**
-- 
2.33.0

