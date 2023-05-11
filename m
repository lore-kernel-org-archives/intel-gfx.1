Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2856C7EE22
	for <intel-gfx@archiver.kernel.org>; Thu, 11 May 2023 16:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FBB10E55A;
	Thu, 11 May 2023 16:55:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D5110E52A
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 May 2023 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683824143; x=1715360143;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KsiZhqe20foDB8hRMOWSqIKbI363KrGjEUeyHM0ahrg=;
 b=RbQ1GviUcPiDi0nmATvP0hr1mPJNjJa0szeXPdOSodTqemRDooU67Vgl
 z73hubdI2PjT3PKsI4gf+ALDb1/tDv1oOnjsHZuBDD2O2IqPyXDh5vnc9
 RTYu2xKH0FIsv9xQbTRTtx41kqYQ2nTsERJzW3S2xB5C24CJyQ8KnSWLr
 YW65guzmBPCDgMgT/uW2JNwB2BRolLY9y1tugkAL7mPot92jE1ZEPnJ9i
 99hzJxx03rLaAGeFMFyM6YT32kS7AUXndY9xe8jHjM/YQi2t6U7Nt+VqW
 FtgO2ERkZDAW0yDnXY5Vvq3B5t+P/Y9tMRlAZmSWlEoAzLleRvIduRgH7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="348042940"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="348042940"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 09:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824049594"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="824049594"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga004.jf.intel.com with SMTP; 11 May 2023 09:55:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 May 2023 19:55:37 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 May 2023 19:55:28 +0300
Message-Id: <20230511165534.10266-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230511165534.10266-1-ville.syrjala@linux.intel.com>
References: <20230511165534.10266-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/7] drm/i915: Remove bogus DDI-F from hsw/bdw
 output init
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

HSW/BDW don't have DDI-F so don't go looking for one.

Seems to have been accidentally left behind when the
skl+ stuff got split out in commit 097d9e902068
("drm/i915/display: remove strap checks from gen 9").

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 1d5d42a40803..c1e0d439db79 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7429,8 +7429,6 @@ void intel_setup_outputs(struct drm_i915_private *dev_priv)
 			intel_ddi_init(dev_priv, PORT_C);
 		if (found & SFUSE_STRAP_DDID_DETECTED)
 			intel_ddi_init(dev_priv, PORT_D);
-		if (found & SFUSE_STRAP_DDIF_DETECTED)
-			intel_ddi_init(dev_priv, PORT_F);
 	} else if (HAS_PCH_SPLIT(dev_priv)) {
 		int found;
 
-- 
2.39.3

