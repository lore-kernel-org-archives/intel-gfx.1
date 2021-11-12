Return-Path: <SRS0=wBbn=P7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F91C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 19:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AED7260EE9
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 19:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AED7260EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BB86F46F;
	Fri, 12 Nov 2021 19:38:34 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904FD6F46F
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Nov 2021 19:38:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10166"; a="294019214"
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="294019214"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 11:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="505009439"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 12 Nov 2021 11:38:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 21:38:30 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 12 Nov 2021 21:38:10 +0200
Message-Id: <20211112193813.8224-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211112193813.8224-1-ville.syrjala@linux.intel.com>
References: <20211112193813.8224-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 6/9] drm/i915: Clean up PIPESRC defines
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

Use REG_GENMASK() & co. when dealing with PIPESRC.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c    | 4 ++--
 drivers/gpu/drm/i915/display/intel_display.c | 7 ++++---
 drivers/gpu/drm/i915/i915_reg.h              | 4 ++++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 2194f74101ae..f586e39cb378 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -1048,8 +1048,8 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 	plane_config->base = base;
 
 	val = intel_de_read(dev_priv, PIPESRC(pipe));
-	fb->width = ((val >> 16) & 0xfff) + 1;
-	fb->height = ((val >> 0) & 0xfff) + 1;
+	fb->width = REG_FIELD_GET(PIPESRC_WIDTH_MASK, val) + 1;
+	fb->height = REG_FIELD_GET(PIPESRC_HEIGHT_MASK, val) + 1;
 
 	val = intel_de_read(dev_priv, DSPSTRIDE(i9xx_plane));
 	fb->pitches[0] = val & 0xffffffc0;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4e29032b29d6..e1959a17805c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3236,7 +3236,8 @@ static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state)
 	 * always be the user's requested size.
 	 */
 	intel_de_write(dev_priv, PIPESRC(pipe),
-		       ((crtc_state->pipe_src_w - 1) << 16) | (crtc_state->pipe_src_h - 1));
+		       PIPESRC_WIDTH(crtc_state->pipe_src_w - 1) |
+		       PIPESRC_HEIGHT(crtc_state->pipe_src_h - 1));
 }
 
 static bool intel_pipe_is_interlaced(const struct intel_crtc_state *crtc_state)
@@ -3307,8 +3308,8 @@ static void intel_get_pipe_src_size(struct intel_crtc *crtc,
 	u32 tmp;
 
 	tmp = intel_de_read(dev_priv, PIPESRC(crtc->pipe));
-	pipe_config->pipe_src_h = (tmp & 0xffff) + 1;
-	pipe_config->pipe_src_w = ((tmp >> 16) & 0xffff) + 1;
+	pipe_config->pipe_src_w = REG_FIELD_GET(PIPESRC_WIDTH_MASK, tmp) + 1;
+	pipe_config->pipe_src_h = REG_FIELD_GET(PIPESRC_HEIGHT_MASK, tmp) + 1;
 }
 
 static void i9xx_set_pipeconf(const struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index eea009e76e15..211e2b415e50 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4476,6 +4476,10 @@ enum {
 #define _VSYNC_A	0x60014
 #define _EXITLINE_A	0x60018
 #define _PIPEASRC	0x6001c
+#define   PIPESRC_WIDTH_MASK	REG_GENMASK(31, 16)
+#define   PIPESRC_WIDTH(w)	REG_FIELD_PREP(PIPESRC_WIDTH_MASK, (w))
+#define   PIPESRC_HEIGHT_MASK	REG_GENMASK(15, 0)
+#define   PIPESRC_HEIGHT(h)	REG_FIELD_PREP(PIPESRC_HEIGHT_MASK, (h))
 #define _BCLRPAT_A	0x60020
 #define _VSYNCSHIFT_A	0x60028
 #define _PIPE_MULT_A	0x6002c
-- 
2.32.0

