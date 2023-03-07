Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7CCC6FD1A
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Mar 2023 16:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E370210E0F7;
	Tue,  7 Mar 2023 16:27:06 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAE110E0F7
 for <intel-gfx@lists.freedesktop.org>; Tue,  7 Mar 2023 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678206425; x=1709742425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hIgup6+vHDtI1ag0MhsfxZU4QsMSrK2zmM4i5nhXGmw=;
 b=FCw7HG1HHGxzcvqnvLHSUrBvHJS+bE6czMhWURrIIuatZ8XM0o4jbnfj
 KAfBFCThklZdrr5Ye0isNo2gMXJokW0bp6nBW00GZusB2hm7JTOYmZE1N
 Psjlb2D9SjRcw5Y+BTz61S7q5XSp7tb6QLmQmJ7mWL+EcCKlYLOBFm0Gw
 OZACiWnBmIXGQ9L60DVoH8Jarat0xWUT3+OJJm0agCOrAcupVG68nFeuU
 JMvHEx9AmDoYeqNceGuDFlJLNohhfG23X1d2dID6FG4YYyMnomx4vIgLf
 eExWbkarrGMpu41J1/aeclnZ/DB0Pn9MzCb12mqNqToK0Z+ifzQdBVnR3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324202493"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="324202493"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 08:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="740779343"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="740779343"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga008.fm.intel.com with SMTP; 07 Mar 2023 08:26:52 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 Mar 2023 18:26:52 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  7 Mar 2023 18:26:52 +0200
Message-Id: <20230307162652.1178-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230214134348.11020-1-ville.syrjala@linux.intel.com>
References: <20230214134348.11020-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 1/3] drm/i915: Don't switch to TPS1 when
 disabling DP_TP_CTL
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

AFAICS Bspec has never asked us to switch to TPS1 when *disabling*
DP_TP_CTL. Let's stop doing that in case it confuses something.
We do have to switch before we *enable* DP_TP_CTL, but that
is already being handled correctly.

v2: Do the same for FDI

Reviewed-by: Imre Deak <imre.deak@intel.com> #v1
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 6 ++----
 drivers/gpu/drm/i915/display/intel_fdi.c | 4 +---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bfd1e30a27b4..4af2ba2dfcad 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2624,8 +2624,7 @@ static void intel_disable_ddi_buf(struct intel_encoder *encoder,
 
 	if (intel_crtc_has_dp_encoder(crtc_state)) {
 		val = intel_de_read(dev_priv, dp_tp_ctl_reg(encoder, crtc_state));
-		val &= ~(DP_TP_CTL_ENABLE | DP_TP_CTL_LINK_TRAIN_MASK);
-		val |= DP_TP_CTL_LINK_TRAIN_PAT1;
+		val &= ~DP_TP_CTL_ENABLE;
 		intel_de_write(dev_priv, dp_tp_ctl_reg(encoder, crtc_state), val);
 	}
 
@@ -3153,8 +3152,7 @@ static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 			wait = true;
 		}
 
-		dp_tp_ctl &= ~(DP_TP_CTL_ENABLE | DP_TP_CTL_LINK_TRAIN_MASK);
-		dp_tp_ctl |= DP_TP_CTL_LINK_TRAIN_PAT1;
+		dp_tp_ctl &= ~DP_TP_CTL_ENABLE;
 		intel_de_write(dev_priv, dp_tp_ctl_reg(encoder, crtc_state), dp_tp_ctl);
 		intel_de_posting_read(dev_priv, dp_tp_ctl_reg(encoder, crtc_state));
 
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index f62d9a931349..f3ac34b0f3fa 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -846,9 +846,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 		intel_de_posting_read(dev_priv, DDI_BUF_CTL(PORT_E));
 
 		/* Disable DP_TP_CTL and FDI_RX_CTL and retry */
-		intel_de_rmw(dev_priv, DP_TP_CTL(PORT_E),
-			     DP_TP_CTL_ENABLE | DP_TP_CTL_LINK_TRAIN_MASK,
-			     DP_TP_CTL_LINK_TRAIN_PAT1);
+		intel_de_rmw(dev_priv, DP_TP_CTL(PORT_E), DP_TP_CTL_ENABLE, 0);
 		intel_de_posting_read(dev_priv, DP_TP_CTL(PORT_E));
 
 		intel_wait_ddi_buf_idle(dev_priv, PORT_E);
-- 
2.39.2

