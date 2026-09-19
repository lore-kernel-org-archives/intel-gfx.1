Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB6C982EE
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2026 12:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D6D10E6F7;
	Mon, 21 Sep 2026 12:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OLlfMlEL";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B5710E192
 for <intel-gfx@lists.freedesktop.org>; Sat, 19 Sep 2026 14:35:30 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so9637975e9.1
 for <intel-gfx@lists.freedesktop.org>; Sat, 19 Sep 2026 07:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789828529; x=1790433329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qYnfX7a1T7Hh69aNBsmLWpz5QWt2o+zu67TLb8Ol4cM=;
 b=OLlfMlEL/Bhf0uisbfA/CFZ0k0zX0eP8rMgO+aW/Po/5bEFvoH9tvSKFvCKKxdBGjq
 2JRoK30TFTW3RwKSiO+Wuo8ThcfvodYsWzuGLClpJGIzTwgUvASnSZoWaPqcbxoUlmCN
 WbFXonGAIb1xZkC/kxDp3nMEGZj+/NjyiXA8weHIHdPG32nBe3+XcaLFqjJoHWv8yJjo
 rAs85s0Q4LnNoiUDxpnHBvJG2rmUwYZK4kK8/yPQjmpLl5/5eR/lMnRveJVlXD4negWZ
 Tce/IHiYy6SZhqDR7xROjRAb/lu6/iAEeUoCQIiKifrbWAGZtDsE7F4XciE5NpiiI0GT
 /W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789828529; x=1790433329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qYnfX7a1T7Hh69aNBsmLWpz5QWt2o+zu67TLb8Ol4cM=;
 b=OTJpHs3mJCMItwRDh6XNE29JYN2meDE0DnqEMshzZ1LF2dOblX+bfrfm6SE1cVckax
 ptWQTNQkDbD+xrSZYy0k7U+in+8u5HtH/ZCHOVasCfvllUFNldkbekAmYbt6FK7uYjdj
 dUDuaSNGCG2cB9IXYfacwVl16P/BVRFEwwgvViNOJjovD81qqR74/tSOkvbvh4ZYdZ8v
 oM2oilJlJ3aFyDM4iJD9y+PaCEqxlRJ/BeAaeRTQbfEf8v3VUxZ68I0j5RMNUnbe7IGn
 41jUuGLufmR57pCwHkTqxIXIYXmO7BymGIVCM9W9/xPxp6rQE31rZoU1H7WLJVb+9/+d
 8W6w==
X-Forwarded-Encrypted: i=1;
 AKwUvBykjGakKGJudMoUwKsLkiqvo48gYg29o0AUbacFjLhm+rMocVA3HWJgx4QtY44xtqnnTpL0MpXgKbM=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lWH4wxbQo67XYKpuQxZP1xu3To11oH1YbaBDw604PB1/BAg0WU
 46MShMqYTQxCiUJattrjbGxAGuqYmRrnJ4Y0w7obQLnq/uEqg4OvgKS7Twk2UY1g
X-Gm-Gg: AYBFou2jRCaCEd8IUCenUq6RYeXU+oDb2xORmYhEeP/DCWaMVJNH8hYOluBD9wj37tb
 L7wmOLdC0JXfbcm5GlFSqwcYIUXF8hOx3YvpPvhwxed4aAtXHfxIJX4FGTqrDLVPPVI8gxSOesa
 EWV+PCRjXRrt8apD6gKkA1QKdmkqFO5/w5sjWDZxowbraoKqbN9vvnFd93gHssfx6K2cbmHBvob
 T9EgrolySs/ZHjpFs81yPXte9PpgI1YfK2y1BlQp1FyYuOO7PSzqG1ll8ALxrTRXxTTvEkhu+oJ
 6JR4kSgKfgwgWMMzUqeoU9kMUDIV9JppDYBdsGPjvAfnE31padCWDu4lWaDLPaTADTL5WTaclU3
 QVMEgHNv9Vlh+FLMpIOjuVHaQOGxL/Vf/RL/OlbEDYgoTrl+gFcJG/Y2chqgNhqiiOIU8OZvKA5
 EOx7+QdDCIJ488hLvb+03et8J9AZ6tQQUB+00gzjVxkF8DUA3pBjSHjwEoUHHk
X-Received: by 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id
 5b1f17b1804b1-49fc57144aamr98668365e9.8.1789828528874; 
 Sat, 19 Sep 2026 07:35:28 -0700 (PDT)
Received: from fedora ([2a02:587:200a:7d00:31a7:37b6:ee54:4eca])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd1026f4sm88343845e9.8.2026.09.19.07.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2026 07:35:28 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, George Karagounis <mail@taterr.org>
Subject: [PATCH] drm/i915/dp: Return bpp_x16 from joiner max bpp helpers
Date: Sat, 19 Sep 2026 17:35:18 +0300
Message-ID: <20260919143519.77654-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Sep 2026 12:56:44 +0000
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

1. Renamed 4 i915 helper functions by appending _x16 to their names

2. Changed the helper function's return type from u32 to int to

   represent the x16 format

3. Moved fxp_q4_from_int conversion to the helper functions so they

   return the correct format

4. Updated compute_max_compressed_bpp_x16 to declare

   joiner_max_bpp_x16 and compare it against max_link_bpp_x16,

   eliminating mixed type math

Conclusion: fixed a TODO in the i915 code
Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 53 ++++++++++++-------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3152122e6aef..929d3e35e71a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -761,8 +761,8 @@ static int bigjoiner_interface_bits(struct intel_display *display)
 	return DISPLAY_VER(display) >= 14 ? 36 : 24;
 }
 
-static u32 bigjoiner_bw_max_bpp(struct intel_display *display, u32 mode_clock,
-				int num_joined_pipes)
+static int bigjoiner_bw_max_bpp_x16(struct intel_display *display, u32 mode_clock,
+				    int num_joined_pipes)
 {
 	u32 max_bpp;
 	/* With bigjoiner multiple dsc engines are used in parallel so PPC is 2 */
@@ -771,25 +771,22 @@ static u32 bigjoiner_bw_max_bpp(struct intel_display *display, u32 mode_clock,
 
 	max_bpp = display->cdclk.max_cdclk_freq * ppc * bigjoiner_interface_bits(display) /
 		  intel_dp_mode_to_fec_clock(mode_clock);
-
 	max_bpp *= num_big_joiners;
 
-	return max_bpp;
-
+	return fxp_q4_from_int(max_bpp);
 }
 
-static u32 small_joiner_ram_max_bpp(struct intel_display *display,
-				    u32 mode_hdisplay,
-				    int num_joined_pipes)
+static int small_joiner_ram_max_bpp_x16(struct intel_display *display,
+					u32 mode_hdisplay,
+					int num_joined_pipes)
 {
 	u32 max_bpp;
 
 	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
 	max_bpp = small_joiner_ram_size_bits(display) / mode_hdisplay;
-
 	max_bpp *= num_joined_pipes;
 
-	return max_bpp;
+	return fxp_q4_from_int(max_bpp);
 }
 
 static int ultrajoiner_ram_bits(void)
@@ -797,26 +794,26 @@ static int ultrajoiner_ram_bits(void)
 	return 4 * 72 * 512;
 }
 
-static u32 ultrajoiner_ram_max_bpp(u32 mode_hdisplay)
+static int ultrajoiner_ram_max_bpp_x16(u32 mode_hdisplay)
 {
-	return ultrajoiner_ram_bits() / mode_hdisplay;
+	u32 max_bpp = ultrajoiner_ram_bits() / mode_hdisplay;
+
+	return fxp_q4_from_int(max_bpp);
 }
 
-/* TODO: return a bpp_x16 value */
-static
-u32 get_max_compressed_bpp_with_joiner(struct intel_display *display,
-				       u32 mode_clock, u32 mode_hdisplay,
-				       int num_joined_pipes)
+static int get_max_compressed_bpp_with_joiner_x16(struct intel_display *display,
+						  u32 mode_clock, u32 mode_hdisplay,
+						  int num_joined_pipes)
 {
-	u32 max_bpp = small_joiner_ram_max_bpp(display, mode_hdisplay, num_joined_pipes);
+	int max_bpp_x16 = small_joiner_ram_max_bpp_x16(display, mode_hdisplay, num_joined_pipes);
 
 	if (num_joined_pipes > 1)
-		max_bpp = min(max_bpp, bigjoiner_bw_max_bpp(display, mode_clock,
-							    num_joined_pipes));
+		max_bpp_x16 = min(max_bpp_x16, bigjoiner_bw_max_bpp_x16(display, mode_clock,
+									num_joined_pipes));
 	if (num_joined_pipes == 4)
-		max_bpp = min(max_bpp, ultrajoiner_ram_max_bpp(mode_hdisplay));
+		max_bpp_x16 = min(max_bpp_x16, ultrajoiner_ram_max_bpp_x16(mode_hdisplay));
 
-	return max_bpp;
+	return max_bpp_x16;
 }
 
 static int intel_dp_dsc_min_slice_count(const struct intel_connector *connector,
@@ -2487,19 +2484,19 @@ static int compute_max_compressed_bpp_x16(struct intel_connector *connector,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	int dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
 	int throughput_max_bpp_x16;
-	int joiner_max_bpp;
+	int joiner_max_bpp_x16;
 
 	dsc_src_max_bpp = dsc_src_max_compressed_bpp(intel_dp);
-	joiner_max_bpp = get_max_compressed_bpp_with_joiner(display,
-							    mode_clock,
-							    mode_hdisplay,
-							    num_joined_pipes);
+	joiner_max_bpp_x16 = get_max_compressed_bpp_with_joiner_x16(display,
+								    mode_clock,
+								    mode_hdisplay,
+								    num_joined_pipes);
 	dsc_sink_max_bpp = intel_dp_dsc_sink_max_compressed_bpp(connector,
 								output_format,
 								pipe_max_bpp / 3);
 	dsc_max_bpp = min(dsc_sink_max_bpp, dsc_src_max_bpp);
-	dsc_max_bpp = min(dsc_max_bpp, joiner_max_bpp);
 
+	max_link_bpp_x16 = min(max_link_bpp_x16, joiner_max_bpp_x16);
 	max_link_bpp_x16 = min(max_link_bpp_x16, fxp_q4_from_int(dsc_max_bpp));
 
 	throughput_max_bpp_x16 = dsc_throughput_quirk_max_bpp_x16(connector,
-- 
2.55.0

