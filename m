Return-Path: <SRS0=FGOe=O2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E92DC433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 23:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC5D461002
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 23:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC5D461002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F72D6F387;
	Wed,  6 Oct 2021 23:57:23 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C40C6F387
 for <intel-gfx@lists.freedesktop.org>; Wed,  6 Oct 2021 23:57:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="289629543"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="289629543"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 16:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="484308646"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 06 Oct 2021 16:57:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 02:57:16 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Juston Li <juston.li@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Date: Thu,  7 Oct 2021 02:57:03 +0300
Message-Id: <20211006235704.28894-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006235704.28894-1-ville.syrjala@linux.intel.com>
References: <20211006235704.28894-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/4] drm/i915: Remove the drm_dbg() from the
 vblank evade critical section
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

We are inside the vblank evade critical section here, racing
against the raster beam. There is no time to print debug
messages.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Juston Li <juston.li@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 55dae8c8fcad..1e85ea98231f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1018,8 +1018,6 @@ static void intel_load_plane_csc_black(struct intel_plane *intel_plane)
 	enum plane_id plane = intel_plane->id;
 	u16 postoff = 0;
 
-	drm_dbg_kms(&dev_priv->drm, "plane color CTM to black  %s:%d\n",
-		    intel_plane->base.name, plane);
 	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 0), 0);
 	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 1), 0);
 
-- 
2.32.0

