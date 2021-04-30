Return-Path: <SRS0=IWb8=J3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB21C433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Apr 2021 22:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6866D61210
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Apr 2021 22:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6866D61210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC84D6F603;
	Fri, 30 Apr 2021 22:38:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027366F5FF
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Apr 2021 22:38:16 +0000 (UTC)
IronPort-SDR: sZiNry190iN6EeIZdns2RIrfwkTm51XWCB1pZjgJDL9bapFRIWgueWuU1pJhAsJQDbn6cjvRXB
 fQ09KfwoFPuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="176869092"
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="176869092"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 15:38:16 -0700
IronPort-SDR: 5NR1FqH104px11NK09Yfj8AEbJFljNYTMcyirJEDTl9Irhx4+aQV/Zqh3ucT8VC2YKWgLSDbcg
 Gy7W4Ev3cPJQ==
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="426619832"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 15:38:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 30 Apr 2021 15:38:08 -0700
Message-Id: <20210430223808.1078010-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430223808.1078010-1-lucas.demarchi@intel.com>
References: <20210430223808.1078010-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 4/4] drm/i915/display: hide workaround for broken
 vbt in intel_bios.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Instead of poluting the normal code path in intel_display.c, make
intel_bios.c handle the brokenness of the VBT.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c    | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++------------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index befab891a6b9..a783c5a40934 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1852,6 +1852,19 @@ intel_bios_encoder_supports_edp(const struct intel_bios_encoder_data *devdata)
 		devdata->child.device_type & DEVICE_TYPE_INTERNAL_CONNECTOR;
 }
 
+static bool is_port_valid(struct drm_i915_private *i915, enum port port)
+{
+	/*
+	 * On some ICL/CNL SKUs port F is not present, but broken VBTs mark
+	 * the port as present. Only try to initialize port F for the
+	 * SKUs that may actually have it.
+	 */
+	if (port == PORT_F && (IS_ICELAKE(i915) || IS_CANNONLAKE(i915)))
+		return IS_ICL_WITH_PORT_F(i915) || IS_CNL_WITH_PORT_F(i915);
+
+	return true;
+}
+
 static void parse_ddi_port(struct drm_i915_private *i915,
 			   struct intel_bios_encoder_data *devdata)
 {
@@ -1865,6 +1878,13 @@ static void parse_ddi_port(struct drm_i915_private *i915,
 	if (port == PORT_NONE)
 		return;
 
+	if (!is_port_valid(i915, port)) {
+		drm_dbg_kms(&i915->drm,
+			    "VBT reports port %c as supported, but that can't be true: skipping\n",
+			    port_name(port));
+		return;
+	}
+
 	info = &i915->vbt.ddi_port_info[port];
 
 	if (info->devdata) {
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 55f8f2ceada2..87a85de5e03d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10868,15 +10868,7 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_ddi_init(dev_priv, PORT_C);
 		intel_ddi_init(dev_priv, PORT_D);
 		intel_ddi_init(dev_priv, PORT_E);
-
-		/*
-		 * On some ICL SKUs port F is not present, but broken VBTs mark
-		 * the port as present. Only try to initialize port F for the
-		 * SKUs that may actually have it.
-		 */
-		if (IS_ICL_WITH_PORT_F(dev_priv))
-			intel_ddi_init(dev_priv, PORT_F);
-
+		intel_ddi_init(dev_priv, PORT_F);
 		icl_dsi_init(dev_priv);
 	} else if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv)) {
 		intel_ddi_init(dev_priv, PORT_A);
@@ -10889,9 +10881,7 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_ddi_init(dev_priv, PORT_C);
 		intel_ddi_init(dev_priv, PORT_D);
 		intel_ddi_init(dev_priv, PORT_E);
-
-		if (IS_CNL_WITH_PORT_F(dev_priv))
-			intel_ddi_init(dev_priv, PORT_F);
+		intel_ddi_init(dev_priv, PORT_F);
 	} else if (HAS_DDI(dev_priv)) {
 		u32 found;
 
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
