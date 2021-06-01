Return-Path: <SRS0=8ese=K3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E557C47093
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 10:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1145461396
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 10:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1145461396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B54C6E9F6;
	Tue,  1 Jun 2021 10:16:22 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2C46E9F2;
 Tue,  1 Jun 2021 10:16:20 +0000 (UTC)
IronPort-SDR: QOT4bEa4gKYSZqS4Gr4GVX8nttD8ABg09YUZj1405Myctpl6cOmXIEOrb1K/trSaR2AwmsAAuh
 iw9wVnoL3eVw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203549998"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203549998"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:19 -0700
IronPort-SDR: XxeAUV91/h8IRdY+eCl4DPdkqzcOg2hhDAYuO+ksV2fkrZ/4qulyCYhkksBUQ2Fy8kXkMuMFfM
 Fh9hZdgO+i/A==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431299"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:17 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue,  1 Jun 2021 16:22:06 +0530
Message-Id: <20210601105218.29185-10-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 09/21] drm/i915/xelpd: Add plane color check to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Extended glk_plane_color_ctl to have plane color checks. This helps
enabling the degamma or gamma block based on user inputs.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 92a4fd508e92..ae439dca4b3c 100644
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

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
