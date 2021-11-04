Return-Path: <SRS0=bagb=PX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69681C433FE
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 14:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F9C611EE
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 14:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35F9C611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02636E432;
	Thu,  4 Nov 2021 14:45:36 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1D76E432
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Nov 2021 14:45:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="295162003"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="295162003"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 07:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="501566508"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 04 Nov 2021 07:45:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Nov 2021 16:45:29 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  4 Nov 2021 16:45:06 +0200
Message-Id: <20211104144520.22605-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
References: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 03/17] drm/i915/fbc: Just use
 params->fence_y_offset always
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

No need to tiptoe around programming DPFC_FENCE_YOFF with
params->fence_y_offset vs. 0. If the fence is not enabled
it doesn't even matter what we program here.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index c95a32f1985a..8f51af2b4ebc 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -235,13 +235,11 @@ static void g4x_fbc_activate(struct drm_i915_private *dev_priv)
 
 	dpfc_ctl |= g4x_dpfc_ctl_limit(dev_priv);
 
-	if (params->fence_id >= 0) {
+	if (params->fence_id >= 0)
 		dpfc_ctl |= DPFC_CTL_FENCE_EN | params->fence_id;
-		intel_de_write(dev_priv, DPFC_FENCE_YOFF,
-			       params->fence_y_offset);
-	} else {
-		intel_de_write(dev_priv, DPFC_FENCE_YOFF, 0);
-	}
+
+	intel_de_write(dev_priv, DPFC_FENCE_YOFF,
+		       params->fence_y_offset);
 
 	/* enable it... */
 	intel_de_write(dev_priv, DPFC_CONTROL, dpfc_ctl | DPFC_CTL_EN);
-- 
2.32.0

