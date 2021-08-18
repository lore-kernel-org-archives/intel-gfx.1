Return-Path: <SRS0=K2GL=NJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21165C4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 20:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7676109F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 20:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF7676109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2BF6E8C2;
	Wed, 18 Aug 2021 20:19:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BAFB89A4E;
 Wed, 18 Aug 2021 20:19:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1D1B0A77A5;
 Wed, 18 Aug 2021 20:19:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 18 Aug 2021 20:19:23 -0000
Message-ID: <162931796308.16675.17770288438918565340@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <cover.1629310010.git.jani.nikula@intel.com>
In-Reply-To: <cover.1629310010.git.jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/dp=3A_dp_2=2E0_enabling_prep_work?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/dp: dp 2.0 enabling prep work
URL   : https://patchwork.freedesktop.org/series/93800/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
098494421cf3 drm/dp: add DP 2.0 UHBR link rate and bw code conversions
15972d4824f6 drm/dp: use more of the extended receiver cap
176cd12c2a2e drm/dp: add LTTPR DP 2.0 DPCD addresses
348fff506827 drm/dp: add helper for extracting adjust 128b/132b TX FFE preset
2c801bbdc46b drm/i915/dp: use actual link rate values in struct link_config_limits
-:26: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#26: FILE: drivers/gpu/drm/i915/display/intel_dp.c:1047:
+				limits->min_rate = limits->max_rate =

total: 0 errors, 0 warnings, 1 checks, 106 lines checked
4d03932add3c drm/i915/dp: read sink UHBR rates
bd393efa3f8d drm/i915/dg2: add TRANS_DP2_CTL register definition
-:24: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#24: FILE: drivers/gpu/drm/i915/i915_reg.h:9106:
+#define TRANS_DP2_CTL(trans)			_MMIO_TRANS(trans, _TRANS_DP2_CTL_A, _TRANS_DP2_CTL_B)

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
2ae1f5cd9112 drm/i915/dg2: add DG2+ TRANS_DDI_FUNC_CTL DP 2.0 128b/132b mode
09dd0b1c53f5 drm/i915/dg2: add TRANS_DP2_VFREQHIGH and TRANS_DP2_VFREQLOW
-:25: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#25: FILE: drivers/gpu/drm/i915/i915_reg.h:9115:
+#define TRANS_DP2_VFREQHIGH(trans)		_MMIO_TRANS(trans, _TRANS_DP2_VFREQHIGH_A, _TRANS_DP2_VFREQHIGH_B)

-:27: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#27: FILE: drivers/gpu/drm/i915/i915_reg.h:9117:
+#define  TRANS_DP2_VFREQ_PIXEL_CLOCK(clk_hz)	REG_FIELD_PREP(TRANS_DP2_VFREQ_PIXEL_CLOCK_MASK, (clk_hz))

-:33: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:9123:
+#define TRANS_DP2_VFREQLOW(trans)		_MMIO_TRANS(trans, _TRANS_DP2_VFREQLOW_A, _TRANS_DP2_VFREQLOW_B)

total: 0 errors, 3 warnings, 0 checks, 20 lines checked
310bd160b5df drm/i915/dg2: add DG2 UHBR source rates
9cf6be09b318 drm/i915/dp: add max data rate calculation for UHBR rates
-:70: WARNING:LINE_SPACING: Missing a blank line after declarations
#70: FILE: drivers/gpu/drm/i915/display/intel_dp.c:254:
+		int max_link_rate_kbps = max_link_rate * 10;
+		max_link_rate_kbps = DIV_ROUND_CLOSEST_ULL(max_link_rate_kbps * 9671, 10000);

total: 0 errors, 1 warnings, 0 checks, 75 lines checked
7d3f86063b7b drm/i915/dp: use 128b/132b TPS2 for UHBR+ link rates
76465b4d3708 drm/i915/dp: select 128b/132b channel encoding for UHBR rates
753442fe1e74 drm/i915/dg2: configure TRANS_DP2_CTL for DP 2.0
73b7a835f7b3 drm/i915/dg2: use 128b/132b transcoder DDI mode
44526b8ce97b drm/i915/dg2: configure TRANS_DP2_VFREQ{HIGH, LOW} for 128b/132b
f619e6bfa217 drm/i915/dg2: update link training for 128b/132b
-:25: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#25: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:1403:
+		return intel_dp->train_set[0] & DP_TX_FFE_PRESET_VALUE_MASK;
+	} else {

-:44: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#44: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:304:
+static void intel_dp_128b132b_adjust_train(struct intel_dp* intel_dp,

total: 1 errors, 1 warnings, 0 checks, 139 lines checked


