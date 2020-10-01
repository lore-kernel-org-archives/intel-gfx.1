Return-Path: <SRS0=YfZL=DI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D50C4727C
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 11:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0995820691
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 11:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0995820691
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AFD6E1D8;
	Thu,  1 Oct 2020 11:27:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 039A76E1D8;
 Thu,  1 Oct 2020 11:27:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F0487A0094;
 Thu,  1 Oct 2020 11:27:40 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Thu, 01 Oct 2020 11:27:40 -0000
Message-ID: <160155166095.16181.6916543618071991471@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200929233449.32323-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200929233449.32323-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Plumb_crtc_state_to_link_training_code_=28rev5?=
 =?utf-8?q?=29?=
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: Plumb crtc state to link training code (rev5)
URL   : https://patchwork.freedesktop.org/series/76993/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d4651ba92742 drm/i915: s/pre_empemph/preemph/
d2dcd064491e drm/i915: s/old_crtc_state/crtc_state/
f40c6b9eb99a drm/i915: Make intel_dp_process_phy_request() static
582bcff90ebb drm/i915: Shove the PHY test into the hotplug work
5606e8d70bc2 drm/i915: Split ICL combo PHY buf trans per output type
a1ebc02e12c4 drm/i915: Split ICL MG PHY buf trans per output type
f41ab4bb8812 drm/i915: Split EHL combo PHY buf trans per output type
-:63: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#63: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:1138:
+			return icl_combo_phy_ddi_translations_edp_hbr3;
+		} else {

total: 0 errors, 1 warnings, 0 checks, 70 lines checked
cf80a68f2857 drm/i915: Split TGL combo PHY buf trans per output type
-:73: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#73: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:1177:
+			return tgl_uy_combo_phy_ddi_translations_dp_hbr2;
+		} else {

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
2fa06f11cdf9 drm/i915: Split TGL DKL PHY buf trans per output type
680bf95e8d06 drm/i915: Plumb crtc_state to link training
17947177aa4e drm/i915: Eliminate intel_dp.regs.dp_tp_{ctl, status}


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
