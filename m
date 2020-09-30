Return-Path: <SRS0=p/WI=DH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F3BC4727E
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 10:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBD42074A
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 10:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FBD42074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9A56E5C0;
	Wed, 30 Sep 2020 10:28:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF0286E5C0;
 Wed, 30 Sep 2020 10:28:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B6FF1A8835;
 Wed, 30 Sep 2020 10:28:10 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Wed, 30 Sep 2020 10:28:10 -0000
Message-ID: <160146169072.17418.13092703607344279543@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200929233449.32323-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200929233449.32323-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Plumb_crtc_state_to_link_training_code_=28rev4?=
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

Series: drm/i915: Plumb crtc state to link training code (rev4)
URL   : https://patchwork.freedesktop.org/series/76993/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
accbc4f3f980 drm/i915: s/pre_empemph/preemph/
27807980feec drm/i915: s/old_crtc_state/crtc_state/
ef095a1ea266 drm/i915: Make intel_dp_process_phy_request() static
df5118aa27a3 drm/i915: Shove the PHY test into the hotplug work
da9bb32c16d1 drm/i915: Split ICL combo PHY buf trans per output type
65c7a6b7faaf drm/i915: Split ICL MG PHY buf trans per output type
d8721a405542 drm/i915: Split EHL combo PHY buf trans per output type
-:62: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#62: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:1138:
+			return icl_combo_phy_ddi_translations_edp_hbr3;
+		} else {

total: 0 errors, 1 warnings, 0 checks, 70 lines checked
5cc36c02d3b3 drm/i915: Split TGL combo PHY buf trans per output type
-:72: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#72: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:1177:
+			return tgl_uy_combo_phy_ddi_translations_dp_hbr2;
+		} else {

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
f653b950e1e9 drm/i915: Split TGL DKL PHY buf trans per output type
4ebece3b04fd drm/i915: Plumb crtc_state to link training
651a007abfa9 drm/i915: Eliminate intel_dp.regs.dp_tp_{ctl, status}


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
