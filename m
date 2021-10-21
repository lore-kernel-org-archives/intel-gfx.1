Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB16C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 18:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A4C61AAD
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 18:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17A4C61AAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC396ECF4;
	Thu, 21 Oct 2021 18:19:01 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966EA6ECF4;
 Thu, 21 Oct 2021 18:19:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="216274391"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="216274391"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:18:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="576084042"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:18:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 21 Oct 2021 11:18:47 -0700
Message-Id: <20211021181847.1543341-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: remove CNL leftover
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

We left the definition IS_CANNONLAKE() macro while removing it from the
tree due to having to merge the changes in different branches. Now that
everything is back in sync and nobody is using IS_CANNONLAKE(), we can
safely ditch it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 357faa043b3a..5e23c0273cf0 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1431,7 +1431,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_GEMINILAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_GEMINILAKE)
 #define IS_COFFEELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COFFEELAKE)
 #define IS_COMETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COMETLAKE)
-#define IS_CANNONLAKE(dev_priv)	0
 #define IS_ICELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ICELAKE)
 #define IS_JSL_EHL(dev_priv)	(IS_PLATFORM(dev_priv, INTEL_JASPERLAKE) || \
 				IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
-- 
2.33.1

