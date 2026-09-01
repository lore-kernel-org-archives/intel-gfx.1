Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD193C624D4
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2026 13:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87810E626;
	Tue,  1 Sep 2026 13:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOxMArXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F47910E626
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 13:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788268918; x=1819804918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L3jGat/15xSBYfTTFQfXhwX3WlPj33kdfs3U1sytVmw=;
 b=DOxMArXS/WIP+lA23JP8u4FLE6Voqkv8eNeDnncBEYIBK3MkumVf7Ao8
 Agspk/CU7aAKEsRuGrbY76cQoIgMLMTyDWLJj55L42alv8VMA+hgIRO9g
 iaNTFp47tXcdM4fzDwoHp7o8WW//1IJy2SFpw9EWV0bO2PzMALsPmfdlS
 uja1+TImrtwrofi8ywp5yaL3MAiziLWnde5cMVjDxoEIdGPBNbRuIhjZN
 R/VlnXO8APw4jD21Hg6irV6bfGUDOZmzR45AfdUwaj//a/ia3hjt6WQwP
 6z5IhrGs60+l/aj2bDII6wBjSy0zrmKNn/fmup/KAmW1RmElfXG5F4r5t Q==;
X-CSE-ConnectionGUID: 5MkJwe1/R26T1a63RwhAyg==
X-CSE-MsgGUID: umZWMv9lT1SEmZXohwq9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106216149"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="106216149"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 06:21:58 -0700
X-CSE-ConnectionGUID: dfoMjZ8zT4OVwkGMoq8svA==
X-CSE-MsgGUID: x3pcAK2dRXygvPAjDpcgiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="268564734"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa008.jf.intel.com with ESMTP; 01 Sep 2026 06:21:57 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, ankit.k.nautiyal@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/display: fix MSA MISC1 VSC SDP bit set without
 actual VSC SDP
Date: Tue,  1 Sep 2026 21:19:28 +0800
Message-ID: <20260901131928.238611-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

DP MSA MISC1[6] (DP_MSA_MISC_COLOR_VSC_SDP) tells the sink to derive
colorimetry information from VSC SDP rather than from MSA fields. This
bit should only be set when a VSC SDP with colorimetry is actually being
transmitted.

When a sink does not advertise colorimetry support via VSC SDP
(DPCD 0x2210[3] = 0), intel_dp_compute_vsc_sdp() correctly skips
sending the VSC SDP. However, intel_ddi_set_dp_msa() unconditionally
sets MISC1[6] whenever intel_dp_needs_vsc_sdp() returns true (e.g. for
BT.2020 colorspace), without checking whether the VSC SDP will actually
be sent.

This mismatch causes the sink to ignore MSA colorimetry fields and wait
for a VSC SDP that never arrives, resulting in incorrect colorimetry
decoding and visible color errors.

Fix by gating MISC1[6] on intel_dp->colorimetry_support, mirroring the
check already present in intel_dp_compute_vsc_sdp(). Retain the
has_psr exception since PSR also uses VSC SDP independently of
colorimetry support.

Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 2b7eb010511b..f2175f05b42e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -469,9 +469,20 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 	 * of Color Encoding Format and Content Color Gamut] while sending
 	 * YCBCR 420, HDR BT.2020 signals we should program MSA MISC1 fields
 	 * which indicate VSC SDP for the Pixel Encoding/Colorimetry Format.
+	 * Only set when VSC SDP will actually be transmitted with colorimetry;
+	 * colorimetry_support=false means the sink didn't advertise the cap via
+	 * DPCD 0x2210[3] and intel_dp_compute_vsc_sdp() will skip sending the SDP.
+	 * Setting this bit without a corresponding VSC SDP causes the sink to
+	 * ignore MSA colorimetry and wait for a VSC SDP that never arrives.
 	 */
-	if (intel_dp_needs_vsc_sdp(crtc_state, conn_state))
-		temp |= DP_MSA_MISC_COLOR_VSC_SDP;
+	if (intel_dp_needs_vsc_sdp(crtc_state, conn_state)) {
+		struct intel_connector *connector =
+			to_intel_connector(conn_state->connector);
+		struct intel_dp *intel_dp = intel_attached_dp(connector);
+
+		if (intel_dp->colorimetry_support || crtc_state->has_psr)
+			temp |= DP_MSA_MISC_COLOR_VSC_SDP;
+	}
 
 	intel_de_write(display, TRANS_MSA_MISC(display, cpu_transcoder),
 		       temp);
-- 
2.43.0

