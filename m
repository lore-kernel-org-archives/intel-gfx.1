Return-Path: <SRS0=BQGL=OY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5744C433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Oct 2021 18:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 951966140D
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Oct 2021 18:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 951966140D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357826EA90;
	Mon,  4 Oct 2021 18:40:44 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2416EA92
 for <intel-gfx@lists.freedesktop.org>; Mon,  4 Oct 2021 18:40:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="224314528"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="224314528"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="483218742"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 Oct 2021 10:05:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 20:05:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  4 Oct 2021 20:05:35 +0300
Message-Id: <20211004170535.4173-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004170535.4173-1-ville.syrjala@linux.intel.com>
References: <20211004170535.4173-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 5/5] drm/i915: Call
 intel_dp_dump_link_status() for CR failures
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

I suppose intel_dp_dump_link_status() might be useful for diagnosing
link training failures. Hoever we only call from the channel EQ phase
currently. Let's call it from the CR phase as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 18f4b469766e..c92044710012 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -649,6 +649,7 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	u8 old_link_status[DP_LINK_STATUS_SIZE] = {};
 	int voltage_tries, cr_tries, max_cr_tries;
+	u8 link_status[DP_LINK_STATUS_SIZE];
 	bool max_vswing_reached = false;
 	char phy_name[10];
 
@@ -678,8 +679,6 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 
 	voltage_tries = 1;
 	for (cr_tries = 0; cr_tries < max_cr_tries; ++cr_tries) {
-		u8 link_status[DP_LINK_STATUS_SIZE];
-
 		intel_dp_link_training_clock_recovery_delay(intel_dp, dp_phy);
 
 		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, dp_phy,
@@ -697,6 +696,7 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 		}
 
 		if (voltage_tries == 5) {
+			intel_dp_dump_link_status(intel_dp, dp_phy, link_status);
 			drm_dbg_kms(&i915->drm,
 				    "[ENCODER:%d:%s][%s] Same voltage tried 5 times\n",
 				    encoder->base.base.id, encoder->base.name, phy_name);
@@ -704,6 +704,7 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 		}
 
 		if (max_vswing_reached) {
+			intel_dp_dump_link_status(intel_dp, dp_phy, link_status);
 			drm_dbg_kms(&i915->drm,
 				    "[ENCODER:%d:%s][%s] Max Voltage Swing reached\n",
 				    encoder->base.base.id, encoder->base.name, phy_name);
@@ -732,6 +733,7 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 			max_vswing_reached = true;
 	}
 
+	intel_dp_dump_link_status(intel_dp, dp_phy, link_status);
 	drm_err(&i915->drm,
 		"[ENCODER:%d:%s][%s] Failed clock recovery %d times, giving up!\n",
 		encoder->base.base.id, encoder->base.name, phy_name, max_cr_tries);
-- 
2.32.0

