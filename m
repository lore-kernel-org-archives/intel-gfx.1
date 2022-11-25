Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934ECC4332F
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Nov 2022 17:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EDA10E779;
	Fri, 25 Nov 2022 17:32:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398F10E776
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Nov 2022 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669397522; x=1700933522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pfiOBO6KBRysoue5OrK5tiygYV7QKpiV1vu3I0OI0Qk=;
 b=UBCoIVPpr7msZh3hT1ZVFXHPmzMoul3nWAC7V0pZXgLlQNCb3pEOOF74
 c1iDzHRtFyd26wz5z+0s6YEvH1BKfzmLRAgYhcMMY6045FnaGmFH7qbeh
 mC4yuCqVe2DA1FFy4d42ExtuPGDs74vxpzUtwI1h7sXGGAlPT5xIDSsF0
 EQHc7k2uUwG2sybgIECkOS3QYdOgVaaxBXDhGZTmDxIm6y32CaOnXw7Y4
 UDq5AQzURKYy0Ejmc1CBwndoJ9uFXZzn5Ux0DAblz5Z8vT6ei2PTZQvf2
 5knfS5xV0HJZfgueYWnkWBUlWPzSKwQwZtZpABdYPGfmQ2oV3ltG4GCos Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="315674614"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="315674614"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 09:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="706124268"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="706124268"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 25 Nov 2022 09:31:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Nov 2022 19:31:59 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 25 Nov 2022 19:31:48 +0200
Message-Id: <20221125173156.31689-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125173156.31689-1-ville.syrjala@linux.intel.com>
References: <20221125173156.31689-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 1/9] drm/i915: Introduce
 intel_panel_init_alloc()
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Introduce a place where we can initialize connector->panel
after it's been allocated. We already have a intel_panel_init()
so had to get creative with the name and came up with
intel_panel_init_alloc().

Cc: Animesh Manna <animesh.manna@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_connector.c | 2 +-
 drivers/gpu/drm/i915/display/intel_panel.c     | 7 +++++++
 drivers/gpu/drm/i915/display/intel_panel.h     | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 6205ddd3ded0..562da3b741e2 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -54,7 +54,7 @@ int intel_connector_init(struct intel_connector *connector)
 	__drm_atomic_helper_connector_reset(&connector->base,
 					    &conn_state->base);
 
-	INIT_LIST_HEAD(&connector->panel.fixed_modes);
+	intel_panel_init_alloc(connector);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 1640726bfbf6..b49228eb79e7 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -661,6 +661,13 @@ intel_panel_mode_valid(struct intel_connector *connector,
 	return MODE_OK;
 }
 
+void intel_panel_init_alloc(struct intel_connector *connector)
+{
+	struct intel_panel *panel = &connector->panel;
+
+	INIT_LIST_HEAD(&panel->fixed_modes);
+}
+
 int intel_panel_init(struct intel_connector *connector)
 {
 	struct intel_panel *panel = &connector->panel;
diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/i915/display/intel_panel.h
index 5c5b5b7f95b6..4b51e1c51da6 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.h
+++ b/drivers/gpu/drm/i915/display/intel_panel.h
@@ -18,6 +18,7 @@ struct intel_connector;
 struct intel_crtc_state;
 struct intel_encoder;
 
+void intel_panel_init_alloc(struct intel_connector *connector);
 int intel_panel_init(struct intel_connector *connector);
 void intel_panel_fini(struct intel_connector *connector);
 enum drm_connector_status
-- 
2.37.4

