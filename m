Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3678C4167B
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Dec 2023 19:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332610E969;
	Thu,  7 Dec 2023 19:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A7710E969
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Dec 2023 19:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701977697; x=1733513697;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6PU9SnoCIJtB0uKQ/AktfON8W2KQT30fdopg1byyQrI=;
 b=i+a039rV1gb1/kMf9Gj07xPwoKHRGs1OSA9MDiYfHTSx+UOMVM1sp6jK
 MqKhLV5ydVegkvXSIMpkUJJ1z8XDfb1JCQN+aGicZtRXg/UPsSUiq1loy
 3+Pv3OcBDKvhopCtE3f/kKd382YQ30SKsovK1UW3k80kRUriV1wGP916H
 3hzaxkCZWpMBKMAc5kILS4QGl4VDZhZqc2c+x934W6xSYR8Gt/WDj2QJ4
 0jXcOO/4MTnyjh08hJXlJlTD/DaTKbw84PhU2WyBaOSXdkVrQldIUPIMt
 JSo0YpvHQpg1Sm87quQF91ByeQ6Bu7zH/NzUUtB1dpvA33VGvzdPeRIgE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384694371"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="384694371"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 11:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765213138"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="765213138"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 07 Dec 2023 11:34:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Dec 2023 21:34:54 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915: Drop crtc NULL check from intel_crtc_active()
Date: Thu,  7 Dec 2023 21:34:37 +0200
Message-ID: <20231207193441.20206-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231207193441.20206-1-ville.syrjala@linux.intel.com>
References: <20231207193441.20206-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

intel_crtc_active() is never called with a NULL crtc. Drop
the redundant NULL check.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 03e8fb6caa83..11ca9572e8b3 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -608,7 +608,7 @@ static bool intel_crtc_active(struct intel_crtc *crtc)
 	 * crtc->state->active once we have proper CRTC states wired up
 	 * for atomic.
 	 */
-	return crtc && crtc->active && crtc->base.primary->state->fb &&
+	return crtc->active && crtc->base.primary->state->fb &&
 		crtc->config->hw.adjusted_mode.crtc_clock;
 }
 
-- 
2.41.0

