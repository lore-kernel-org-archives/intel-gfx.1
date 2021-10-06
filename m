Return-Path: <SRS0=FGOe=O2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C84C433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 23:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA6F361002
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 23:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA6F361002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E386F388;
	Wed,  6 Oct 2021 23:57:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4536F388
 for <intel-gfx@lists.freedesktop.org>; Wed,  6 Oct 2021 23:57:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="223523593"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="223523593"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 16:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="624057410"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 06 Oct 2021 16:57:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 02:57:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Juston Li <juston.li@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Date: Thu,  7 Oct 2021 02:57:04 +0300
Message-Id: <20211006235704.28894-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006235704.28894-1-ville.syrjala@linux.intel.com>
References: <20211006235704.28894-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 4/4] drm/i915: Rename
 intel_load_plane_csc_black()
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

intel_load_plane_csc_black() is specific to glk+ so deserves
a name reflecting that fact. Also rename the variables to
standard form so I won't get confused reading the code.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Juston Li <juston.li@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/skl_universal_plane.c    | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 1e85ea98231f..709ab7166d88 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1011,29 +1011,28 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 	}
 }
 
-static void intel_load_plane_csc_black(struct intel_plane *intel_plane)
+static void glk_plane_csc_load_black(struct intel_plane *plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_plane->base.dev);
-	enum pipe pipe = intel_plane->pipe;
-	enum plane_id plane = intel_plane->id;
-	u16 postoff = 0;
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	enum plane_id plane_id = plane->id;
+	enum pipe pipe = plane->pipe;
 
-	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 0), 0);
-	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 1), 0);
+	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 0), 0);
+	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 1), 0);
 
-	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 2), 0);
-	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 3), 0);
+	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 2), 0);
+	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 3), 0);
 
-	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 4), 0);
-	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 5), 0);
+	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 4), 0);
+	intel_de_write_fw(i915, PLANE_CSC_COEFF(pipe, plane_id, 5), 0);
 
-	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
-	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
-	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
+	intel_de_write_fw(i915, PLANE_CSC_PREOFF(pipe, plane_id, 0), 0);
+	intel_de_write_fw(i915, PLANE_CSC_PREOFF(pipe, plane_id, 1), 0);
+	intel_de_write_fw(i915, PLANE_CSC_PREOFF(pipe, plane_id, 2), 0);
 
-	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 0), postoff);
-	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 1), postoff);
-	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 2), postoff);
+	intel_de_write_fw(i915, PLANE_CSC_POSTOFF(pipe, plane_id, 0), 0);
+	intel_de_write_fw(i915, PLANE_CSC_POSTOFF(pipe, plane_id, 1), 0);
+	intel_de_write_fw(i915, PLANE_CSC_POSTOFF(pipe, plane_id, 2), 0);
 }
 
 static void
@@ -1102,7 +1101,7 @@ skl_program_plane(struct intel_plane *plane,
 	 * or after the commit, display content will be garbage.
 	 */
 	if (plane_state->force_black)
-		intel_load_plane_csc_black(plane);
+		glk_plane_csc_load_black(plane);
 
 	intel_de_write_fw(dev_priv, PLANE_STRIDE(pipe, plane_id), stride);
 	intel_de_write_fw(dev_priv, PLANE_POS(pipe, plane_id),
-- 
2.32.0

