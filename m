Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B632C6379F
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Feb 2023 23:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93E10E7DD;
	Mon, 20 Feb 2023 23:41:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C30910E7DA
 for <intel-gfx@lists.freedesktop.org>; Mon, 20 Feb 2023 23:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676936484; x=1708472484;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JPmUA9w3hq1cC+ZgK1FnXbNnTDuLK4pe+VEV1mHuibc=;
 b=VSqxwPzjrSgU8liCp5HVVo8HAWDpTsl9SWfOlnedeciX/b0sDDUHX1ac
 QuqTLWvUpY5AU1r80QDi9ltWFApUejVLgCuYsDT1vZt3r7c+70NSQWVc7
 UD/4pLISbnxyg41OU1g7O6xHbLpKiJtYDBDhjEbIWsdp6IfmrS+43bFwd
 7MIRCL2hE+5bXOSao9nutqSzyqzuFfXED51GqjOv8nCtGrJ/ii3t3Jd6c
 0SK5NFEeW1QwE3SBcPv0ihiWuscN6AHvAPtwlzVXvyGRcGi/93H4Ndf1V
 UOPqaycpp9nEM4WX/SUuNaOtJlETTt1SO+kmYI1hAINtG2VfphScL8n+8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="394989068"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="394989068"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 15:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="664769741"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="664769741"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 20 Feb 2023 15:41:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Feb 2023 01:41:20 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 21 Feb 2023 01:40:39 +0200
Message-Id: <20230220234046.29716-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220234046.29716-1-ville.syrjala@linux.intel.com>
References: <20230220234046.29716-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 11/18] drm/i915: Remove bogus DDI-F from
 hsw/bdw output init
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
index 0bb429d3e8d7..e3d503b964f5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7884,10 +7884,8 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		if (found & SFUSE_STRAP_DDIC_DETECTED)
 			intel_ddi_init(dev_priv, PORT_C);
 		if (found & SFUSE_STRAP_DDID_DETECTED)
 			intel_ddi_init(dev_priv, PORT_D);
-		if (found & SFUSE_STRAP_DDIF_DETECTED)
-			intel_ddi_init(dev_priv, PORT_F);
 	} else if (HAS_PCH_SPLIT(dev_priv)) {
 		int found;
 
 		/*
-- 
2.39.2

