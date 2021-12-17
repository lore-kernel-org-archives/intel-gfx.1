Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF32C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Dec 2021 15:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850A210E41B;
	Fri, 17 Dec 2021 15:54:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBC910E3D8
 for <intel-gfx@lists.freedesktop.org>; Fri, 17 Dec 2021 15:54:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="239727250"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="239727250"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 07:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="662874687"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 17 Dec 2021 07:54:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Dec 2021 17:54:12 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 17 Dec 2021 17:54:00 +0200
Message-Id: <20211217155403.31477-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217155403.31477-1-ville.syrjala@linux.intel.com>
References: <20211217155403.31477-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/6] drm/i915/bios: Use i915->vbt.ports[] for
 all g4x+
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

Extend the vbt.ports[] stuff for all g4x+ platforms. We do need
to drop the version check as some elk/ctg machines may have VBTs
older than that. The oldest I know is an elk with version 142.
But the child device stuff has had the correct size since at
least version 125 (observed on my sdg), we from that angle this
should be totally safe.

This does couple of things:
- Start using the aux_ch/ddc_pin from VBT instead of just the
  hardcoded defaults. Hopefully there are no VBTs with entirely
  bogus information here.
- Start using i915->vbt.ports[] for intel_bios_is_port_dp_dual_mode().
  Should be fine as the logic doesn't actually change.
- Start using i915->vbt.ports[] for intel_bios_is_port_edp().
  The old codepath only looks at the DP DVO ports, the new codepath
  looks at both DP and HDMI DVO ports. In principle that should not
  matter. We also stop looking at some of the other device type bits
  (eg. LVDS,MIPI,ANALOG,etc.). Hopefully no VBT is broken enough that
  it sets up totally conflicting device type bits (eg. LVDS+eDP at the
  same time). We also lose the "g4x->no eDP ever" hardcoding (shouldn't
  be hard to re-introduce that into eg. sanitize_device_type() if needed).

TODO: actually smoke test on various platforms

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index b7adea9827c3..d7d64d3bf083 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2075,7 +2075,7 @@ static void parse_ddi_port(struct drm_i915_private *i915,
 
 static bool has_ddi_port_info(struct drm_i915_private *i915)
 {
-	return HAS_DDI(i915) || IS_CHERRYVIEW(i915);
+	return DISPLAY_VER(i915) >= 5 || IS_G4X(i915);
 }
 
 static void parse_ddi_ports(struct drm_i915_private *i915)
@@ -2085,9 +2085,6 @@ static void parse_ddi_ports(struct drm_i915_private *i915)
 	if (!has_ddi_port_info(i915))
 		return;
 
-	if (i915->vbt.version < 155)
-		return;
-
 	list_for_each_entry(devdata, &i915->vbt.display_devices, node)
 		parse_ddi_port(i915, devdata);
 }
-- 
2.32.0

