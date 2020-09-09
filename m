Return-Path: <SRS0=DO2q=CS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C9DC433E2
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2020 12:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BDF21D81
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2020 12:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BDF21D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15CF6E0F6;
	Wed,  9 Sep 2020 12:31:17 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9036E0F6
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2020 12:31:16 +0000 (UTC)
IronPort-SDR: DKTAnc8v3upYaf9nxVPhACUUX40So+Q9DzuNi0kqgbx1QqjH+VLp83g3jL3iYV80hVi6UA2wdP
 ALwunAue+YCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="219876346"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="219876346"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 05:31:16 -0700
IronPort-SDR: q/YYyWLxbPrVQ1WDfme1bVTnoH8bLGVqVH0iaLrjsmEX9OOuK7z2UOh/BOKWo26G6Of02LTmkC
 MECRuWa/j3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="300134904"
Received: from lkp-server01.sh.intel.com (HELO 12ff3cf3f2e9) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 09 Sep 2020 05:31:15 -0700
Received: from kbuild by 12ff3cf3f2e9 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kFzFq-0000Px-9N; Wed, 09 Sep 2020 12:31:14 +0000
Date: Wed, 9 Sep 2020 20:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org
Message-ID: <20200909123048.GA21655@aec44941eab3>
References: <20200909085047.31004-4-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909085047.31004-4-vandita.kulkarni@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Intel-gfx] [RFC PATCH] drm/i915/dsi:
 gen11_dsi_te_interrupt_handler() can be static
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
Cc: jani.nikula@intel.com, kbuild-all@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


Signed-off-by: kernel test robot <lkp@intel.com>
---
 i915_irq.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index f8398c5cbd4a60..3e150c9179f7ca 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2299,8 +2299,8 @@ gen8_de_misc_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
 		drm_err(&dev_priv->drm, "Unexpected DE Misc interrupt\n");
 }
 
-void gen11_dsi_te_interrupt_handler(struct drm_i915_private *dev_priv,
-				    u32 te_trigger)
+static void gen11_dsi_te_interrupt_handler(struct drm_i915_private *dev_priv,
+					   u32 te_trigger)
 {
 	enum pipe pipe = INVALID_PIPE;
 	enum transcoder dsi_trans;
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
