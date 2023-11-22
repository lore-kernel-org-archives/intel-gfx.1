Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B77DC61D9B
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Nov 2023 18:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FA310E0D5;
	Wed, 22 Nov 2023 18:57:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE61610E0BC
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Nov 2023 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700679452; x=1732215452;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TCZS5gQG92YOq7qRHVntbBuMZH1CNJw0IHwStDseyPw=;
 b=W8HNDnJw2oyHa9BosBlJuOLCkhwjq9m26xFY4p8J0osT+CobjnQ+5RhS
 QjRFSzS85+p+u0NgIBDY+LYSzpq4kWViViV6HPirWOqO54y3ashIf13GU
 JSjmJ3XvPJ43uXurFU/NNN8eBHSuPqNjv8iwe0kCORuaiYB4WluZIgaV8
 hQdhgnK23pyWuPC83jFxf0n6HSguVTuL62rSM8JM+s6pPOsDMDOMl6B+b
 ms26GQq5NwXyxXnTfTBxRzqdsdzgk4VkYVuO8Fb41f0v8U+QODy4HVVyD
 ayRbe7CnbC3mX79LEgTCwOPbnCqkdNAqReBalNMTHMb0iNYMy2jkqr0bq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423252680"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="423252680"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:41:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760381425"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="760381425"
Received: from unknown (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 22 Nov 2023 01:43:47 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Nov 2023 11:40:47 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 22 Nov 2023 11:31:37 +0200
Message-ID: <20231122093137.1509-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122093137.1509-1-ville.syrjala@linux.intel.com>
References: <20231122093137.1509-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 4/4] drm/i915: Move the SDP split debug spew to
 the correct place
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

Adding ad-hoc debug prints all over the place is not good.
Move the SDP split debug spew into the proper place (state
dumper).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 3 +++
 drivers/gpu/drm/i915/display/intel_dp.c              | 7 -------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 5bcdbf083281..e62afd298191 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -263,6 +263,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			    str_enabled_disabled(pipe_config->fec_enable),
 			    str_enabled_disabled(pipe_config->enhanced_framing));
 
+		drm_dbg_kms(&i915->drm, "sdp split: %s\n",
+			    str_enabled_disabled(pipe_config->sdp_split_enable));
+
 		drm_dbg_kms(&i915->drm, "psr: %s, psr2: %s, selective fetch: %s\n",
 			    str_enabled_disabled(pipe_config->has_psr),
 			    str_enabled_disabled(pipe_config->has_psr2),
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1422c2370269..c6e3fe8b75d3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2844,19 +2844,12 @@ intel_dp_audio_compute_config(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state)
 {
-	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
-	struct drm_connector *connector = conn_state->connector;
-
 	pipe_config->has_audio =
 		intel_dp_has_audio(encoder, pipe_config, conn_state) &&
 		intel_audio_compute_config(encoder, pipe_config, conn_state);
 
 	pipe_config->sdp_split_enable = pipe_config->has_audio &&
 					intel_dp_is_uhbr(pipe_config);
-
-	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s] SDP split enable: %s\n",
-		    connector->base.id, connector->name,
-		    str_yes_no(pipe_config->sdp_split_enable));
 }
 
 int
-- 
2.41.0

