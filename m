Return-Path: <SRS0=KOmL=OR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FD7C4332F
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 18:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C2060FD7
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 18:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75C2060FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3D96E029;
	Mon, 27 Sep 2021 18:52:46 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936C96E029
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Sep 2021 18:52:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="211789934"
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="211789934"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 11:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="456346419"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 27 Sep 2021 11:52:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Sep 2021 21:52:42 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 27 Sep 2021 21:52:42 +0300
Message-Id: <20210927185242.13754-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210923200109.4459-6-ville.syrjala@linux.intel.com>
References: <20210923200109.4459-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 5/6] drm/i915: Reject user modes that don't
 match fixed mode's refresh rate
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

When using a panel with a fixed mode we don't change the refresh
rate of the display. Reject any user requested mode which doesn't
match that fixed refresh rate.

Unfortunately when Xorg sees the scaling_mode property on the
connecor it likes to automagically cook up modes whose refresh
rate is a fair bit off from the fixed refresh rate we use. So
we have to give it some extra latitude so that we don't start to
reject all of it.

v2: sDVO now uses intel_panel_compute_config() too

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 77c1ca387de0..8c1ea322502c 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -53,6 +53,15 @@ int intel_panel_compute_config(struct intel_connector *connector,
 	if (!fixed_mode)
 		return 0;
 
+	/*
+	 * We don't want to lie too much to the user about the refresh
+	 * rate they're going to get. But we have to allow a bit of latitude
+	 * for Xorg since it likes to automagically cook up modes with slightly
+	 * off refresh rates.
+	 */
+	if (abs(drm_mode_vrefresh(adjusted_mode) - drm_mode_vrefresh(fixed_mode)) > 1)
+		return -EINVAL;
+
 	drm_mode_copy(adjusted_mode, fixed_mode);
 
 	drm_mode_set_crtcinfo(adjusted_mode, 0);
-- 
2.32.0

