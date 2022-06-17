Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF6FC43334
	for <intel-gfx@archiver.kernel.org>; Fri, 17 Jun 2022 17:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4209410E65F;
	Fri, 17 Jun 2022 17:33:36 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889BB10E45A
 for <intel-gfx@lists.freedesktop.org>; Fri, 17 Jun 2022 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655487214; x=1687023214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8HGQkhrOxdk45BpZ5UaDjKdzfypy+F9tvOIVZU6u4M=;
 b=LsSAOf1Kpr3u3IpTRMGA7fgkAIzBRYDPUJdlntBxSzGQ155GxX4wkF1j
 MiCLqvHJ92v6FJo92DOIumaPksWMobr9vc8siCuzxeFfxMg1l/X7kfW/q
 Wy8FgnSKXP6N1BJgGpxumThVTlsMxlUYj7grA+rlsV5tx/J0yjHtTQRdF
 4nsvRVdUAIfyuSh1DV8SSmgZZql0DJq6odm2O8st7t+i21K4Z0+WFQfUz
 WQ0dARP9XPJLT3ELlrLQ/CFvF70ZRBOhuwTWDfHKnwnzFIffTeqeXrEcQ
 slyUhrDYPw3cohXcwhaxhVOuQSAPjh2c3JDA1TzK13mdBaqCtvQCTvQvL w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278282827"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="278282827"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 09:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="590155746"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga007.fm.intel.com with SMTP; 17 Jun 2022 09:05:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Jun 2022 19:05:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 17 Jun 2022 19:05:10 +0300
Message-Id: <20220617160510.2082-17-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617160510.2082-1-ville.syrjala@linux.intel.com>
References: <20220617160510.2082-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 16/16] drm/i915: Round TMDS clock to nearest
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

Use round-to-nearest behavour when calculating the TMDS clock.
Matches what we do for most other clock related things.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7e45dd99d03c..1ec9f3d54031 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4585,7 +4585,8 @@ int intel_crtc_dotclock(const struct intel_crtc_state *pipe_config)
 		dotclock = intel_dotclock_calculate(pipe_config->port_clock,
 						    &pipe_config->dp_m_n);
 	else if (pipe_config->has_hdmi_sink && pipe_config->pipe_bpp > 24)
-		dotclock = pipe_config->port_clock * 24 / pipe_config->pipe_bpp;
+		dotclock = DIV_ROUND_CLOSEST(pipe_config->port_clock * 24,
+					     pipe_config->pipe_bpp);
 	else
 		dotclock = pipe_config->port_clock;
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 1ae09431f53a..0b04b3800cd4 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1891,7 +1891,7 @@ int intel_hdmi_tmds_clock(int clock, int bpc, bool ycbcr420_output)
 	 *  1.5x for 12bpc
 	 *  1.25x for 10bpc
 	 */
-	return clock * bpc / 8;
+	return DIV_ROUND_CLOSEST(clock * bpc, 8);
 }
 
 static bool intel_hdmi_source_bpc_possible(struct drm_i915_private *i915, int bpc)
-- 
2.35.1

