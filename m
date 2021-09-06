Return-Path: <SRS0=0xFZ=N4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF40C433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 21:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D7EA60F43
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 21:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D7EA60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1473288C5A;
	Mon,  6 Sep 2021 21:01:25 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDED89D4A;
 Mon,  6 Sep 2021 21:01:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747480"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747480"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362220"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:20 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Date: Tue,  7 Sep 2021 03:08:52 +0530
Message-Id: <20210906213904.27918-11-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [RFC v2 10/22] drm/i915/xelpd: Add plane color check to
 glk_plane_color_ctl
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

Extended glk_plane_color_ctl to have plane color checks. This helps
enabling the degamma or gamma block based on user inputs.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 724e7b04f3b6..4187a670e840 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -960,6 +960,11 @@ static u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
 	u32 plane_color_ctl = 0;
 
 	plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
+
+	/* FIXME needs hw.degamma_lut */
+	if (plane_state->uapi.degamma_lut)
+		plane_color_ctl |= PLANE_PRE_CSC_GAMMA_ENABLE;
+
 	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
 
 	if (fb->format->is_yuv && !icl_is_hdr_plane(dev_priv, plane->id)) {
-- 
2.26.2

