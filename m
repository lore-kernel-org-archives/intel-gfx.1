Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D95C4332F
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Nov 2022 08:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A1A10E67C;
	Thu, 10 Nov 2022 08:23:04 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB6B10E126
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Nov 2022 08:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668068561; x=1699604561;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QylUTOuSBxFVBkpMtEOEE7u9ay8EtYzk/9VaCtu7bXY=;
 b=Z6stMNQAT309mUyWLgC2I1AuKxQRGpjd6k7VVTkbMjk/+AysxeAk7I2b
 psRU/s0Fnfp5q/yrTsGoAeHJD3sGw+Y9IGGxxR5L5K3TMYT9RM7gyIDL0
 zr8OtomLlzJM7bALXihCBGnSCVCeLu0vN+nzvNeCWjTLWpUY24BCSTldG
 uZ4V+PlJ2DYaWB4Y+NxACaXyGFk6Do8ebM0Z5PzQWhVNIWgcTvkepQRgj
 iGkkoLukIy0hyLVpvlHNAQ8P4ScbZPJGOHMHrPiE25KCuYGRPHmXUQRJ2
 QBrAnEhnpFzEFtCyDGBzbr1Tdh1HdnGRrKQQmONilQL1ArDfxjaud0G5q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="309965475"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="309965475"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 00:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="639531118"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="639531118"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 10 Nov 2022 00:22:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Nov 2022 10:22:38 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Nov 2022 10:21:44 +0200
Message-Id: <20221110082144.19666-19-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221110082144.19666-1-ville.syrjala@linux.intel.com>
References: <20221110082144.19666-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 18/18] drm/i915: Do state check for color
 management changes
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

In order to validate LUT programming more thoroughly let's
do a state check for all color management updates as well.

Not sure we really want this outside CI. It is rather heavy
and color management updates could become rather common
with all the HDR/etc. stuff happening. Maybe we should have
an extra knob for this that we could enable in CI?

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_modeset_verify.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index 842d70f0dfd2..f9124bb49a2b 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -228,6 +228,7 @@ void intel_modeset_verify_crtc(struct intel_crtc *crtc,
 			       struct intel_crtc_state *new_crtc_state)
 {
 	if (!intel_crtc_needs_modeset(new_crtc_state) &&
+	    !intel_crtc_needs_color_update(new_crtc_state) &&
 	    !intel_crtc_needs_fastset(new_crtc_state))
 		return;
 
-- 
2.37.4

