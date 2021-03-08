Return-Path: <SRS0=f97i=IG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6955DC433DB
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Mar 2021 13:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A5565100
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Mar 2021 13:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22A5565100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C639C89F45;
	Mon,  8 Mar 2021 13:56:58 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37B89F45
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Mar 2021 13:56:58 +0000 (UTC)
IronPort-SDR: j9Uf0QciXbPGkMFFj371wjyIWm277WwHZqd+q0Q3jX/jLp8uGr4/98al5/rIzSC4uusoSw61Bz
 b/0+1B8SG9sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="273058316"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; d="scan'208";a="273058316"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 05:56:57 -0800
IronPort-SDR: cyn1eOp15GTAzTapmH4VpeU7YXcAQ7ycnyWHfSE0M0/vAAddFX9fseMPmhZrBO9S0IdIZqPah7
 3pylRd1Gls6w==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; d="scan'208";a="409305139"
Received: from dhoffend-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.45.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 05:56:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  8 Mar 2021 15:56:38 +0200
Message-Id: <996274d28cf939186a748b4714872b1c31b23adb.1615211711.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615211711.git.jani.nikula@intel.com>
References: <cover.1615211711.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 1/8] drm/i915: remove unused ADLS_REVID_*
 macros
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

It's the adls_revid_step_tbl array indexes that matter.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1d45d7492d10..2f511bf2bd82 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1587,12 +1587,6 @@ tgl_stepping_get(struct drm_i915_private *dev_priv)
 #define IS_DG1_REVID(p, since, until) \
 	(IS_DG1(p) && IS_REVID(p, since, until))
 
-#define ADLS_REVID_A0		0x0
-#define ADLS_REVID_A2		0x1
-#define ADLS_REVID_B0		0x4
-#define ADLS_REVID_G0		0x8
-#define ADLS_REVID_C0		0xC /*Same as H0 ADLS SOC stepping*/
-
 #define IS_ADLS_DISP_STEPPING(p, since, until) \
 	(IS_ALDERLAKE_S(p) && \
 	 tgl_stepping_get(p)->disp_stepping >= (since) && \
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
