Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A755C433FE
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Nov 2022 15:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F64E10E2F3;
	Mon, 14 Nov 2022 15:38:34 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6AA10E0FB
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Nov 2022 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668440277; x=1699976277;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+PcgQt81WZ8wWKAAAod0MchhtXN7Fl8fxO9BFYwz3xM=;
 b=O+5Lb8sQtXu7PAIOfDg330AYr+wI3eDISn09GLyHCL9M1V0mwxjDyYny
 D5mgt9IboSLYRwzm/QOGd+3FoJy3XgyGTTQaKdDsK6s5LTUHI/FRXDcUo
 Gi+dwS/2ALvJ/siGgrl0HITgspG7fEv++Xw9TSqWKwGq3Y2brVFgVXtHL
 5E9cIu+TceEgvTymmkNebubScxMTH1rnH2C93BgV8pkQsPHMNuocZqHby
 YTmDqAk6NrlX0RkoNQGIL1uCjUwO74wjXbwqXOw1lMA8MH4VJ0mDMMlCK
 6Em0jwoXB7yvSF8b65SZJbFzcXTdANCLSdJ2aAXoRMlDkaXYRMYGCVugI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="398290750"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="398290750"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 07:37:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="780968411"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="780968411"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 14 Nov 2022 07:37:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Nov 2022 17:37:53 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 14 Nov 2022 17:37:19 +0200
Message-Id: <20221114153732.11773-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221114153732.11773-1-ville.syrjala@linux.intel.com>
References: <20221114153732.11773-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 07/20] drm/i915: s/gamma/post_csc_lut/
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

Rename a the LUT state check foo_gamma_precision() functions
to foo_post_csc_lut_precision() to make it more clear what
they really do.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 250e83f1f5ac..e1958a1b4dcc 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1792,7 +1792,7 @@ static int icl_color_check(struct intel_crtc_state *crtc_state)
 	return 0;
 }
 
-static int i9xx_gamma_precision(const struct intel_crtc_state *crtc_state)
+static int i9xx_post_csc_lut_precision(const struct intel_crtc_state *crtc_state)
 {
 	if (!crtc_state->gamma_enable)
 		return 0;
@@ -1808,7 +1808,7 @@ static int i9xx_gamma_precision(const struct intel_crtc_state *crtc_state)
 	}
 }
 
-static int ilk_gamma_precision(const struct intel_crtc_state *crtc_state)
+static int ilk_post_csc_lut_precision(const struct intel_crtc_state *crtc_state)
 {
 	if (!crtc_state->gamma_enable)
 		return 0;
@@ -1827,15 +1827,15 @@ static int ilk_gamma_precision(const struct intel_crtc_state *crtc_state)
 	}
 }
 
-static int chv_gamma_precision(const struct intel_crtc_state *crtc_state)
+static int chv_post_csc_lut_precision(const struct intel_crtc_state *crtc_state)
 {
 	if (crtc_state->cgm_mode & CGM_PIPE_MODE_GAMMA)
 		return 10;
 	else
-		return i9xx_gamma_precision(crtc_state);
+		return i9xx_post_csc_lut_precision(crtc_state);
 }
 
-static int glk_gamma_precision(const struct intel_crtc_state *crtc_state)
+static int glk_post_csc_lut_precision(const struct intel_crtc_state *crtc_state)
 {
 	if (!crtc_state->gamma_enable)
 		return 0;
@@ -1851,7 +1851,7 @@ static int glk_gamma_precision(const struct intel_crtc_state *crtc_state)
 	}
 }
 
-static int icl_gamma_precision(const struct intel_crtc_state *crtc_state)
+static int icl_post_csc_lut_precision(const struct intel_crtc_state *crtc_state)
 {
 	if ((crtc_state->gamma_mode & POST_CSC_GAMMA_ENABLE) == 0)
 		return 0;
@@ -1876,16 +1876,16 @@ int intel_color_get_gamma_bit_precision(const struct intel_crtc_state *crtc_stat
 
 	if (HAS_GMCH(i915)) {
 		if (IS_CHERRYVIEW(i915))
-			return chv_gamma_precision(crtc_state);
+			return chv_post_csc_lut_precision(crtc_state);
 		else
-			return i9xx_gamma_precision(crtc_state);
+			return i9xx_post_csc_lut_precision(crtc_state);
 	} else {
 		if (DISPLAY_VER(i915) >= 11)
-			return icl_gamma_precision(crtc_state);
+			return icl_post_csc_lut_precision(crtc_state);
 		else if (DISPLAY_VER(i915) == 10)
-			return glk_gamma_precision(crtc_state);
+			return glk_post_csc_lut_precision(crtc_state);
 		else if (IS_IRONLAKE(i915))
-			return ilk_gamma_precision(crtc_state);
+			return ilk_post_csc_lut_precision(crtc_state);
 	}
 
 	return 0;
-- 
2.37.4

