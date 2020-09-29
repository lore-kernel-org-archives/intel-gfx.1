Return-Path: <SRS0=bDtt=DG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C386C2D0A8
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 00:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60BB021531
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 00:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60BB021531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15A46E422;
	Tue, 29 Sep 2020 00:29:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3804C89F19
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 00:29:38 +0000 (UTC)
IronPort-SDR: NfAMQuDmJap+2g0etbLM+mRWo+v7L9wDiksmVoLVt2puoF5Rpi95uHaP0j6RWsysowPVEtn0xe
 5nCf32bMy07Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="180242845"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="180242845"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 17:29:37 -0700
IronPort-SDR: Bm/R0H7ZF8/w+u3lrgBuLmH2IKu+lDVnvWg0pVs6bbjUqdwRljn0/yI1s0ro++JIfQ9CWOwcGA
 9XF2XCr34NJA==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="488817668"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 17:29:37 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Sep 2020 03:29:29 +0300
Message-Id: <20200929002929.783620-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929002929.783620-1-imre.deak@intel.com>
References: <20200929002929.783620-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 5/5] drm/i915/tgl: Add workaround for incorrect
 BIOS combo PHY DPLL programming
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

The TGL A stepping and some B stepping (display C stepping) BIOSes
program the combo PHY DPLL fractional divider value incorrectly, not
applying the Display #22010492432 workaround.

Add a workaround for such BIOS versions, so that the driver selects the
correct WRPLL parameter entry correctly (selecting the same entry from
the table whether or not the fractional divider was adjusted or not by
BIOS according to #22010492432).

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index e7b058340a1a..7968ceb23ab6 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -3026,7 +3026,15 @@ static bool icl_dp_combo_pll_clock_match(struct drm_i915_private *i915, int cloc
 	if (clock == pll_freq)
 		return true;
 
-	return false;
+	if (!tgl_combo_pll_div_frac_wa_needed(i915) ||
+	    !IS_TGL_DISP_REVID(i915, TGL_REVID_A0, TGL_REVID_C0))
+		return false;
+
+	pll_freq = skl_wrpll_calc_freq(ref_clock,
+				       p->wrpll.dco_integer, p->wrpll.dco_fraction * 2,
+				       pdiv, qdiv, kdiv);
+
+	return clock == pll_freq;
 }
 
 static bool icl_calc_dp_combo_pll(struct intel_crtc_state *crtc_state,
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
