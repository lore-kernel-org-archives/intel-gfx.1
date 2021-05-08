Return-Path: <SRS0=yQCO=KD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD274C433B4
	for <intel-gfx@archiver.kernel.org>; Sat,  8 May 2021 00:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D8C61132
	for <intel-gfx@archiver.kernel.org>; Sat,  8 May 2021 00:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D8C61132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47706E5C1;
	Sat,  8 May 2021 00:15:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D6516E5BB;
 Sat,  8 May 2021 00:15:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 84391A47DF;
 Sat,  8 May 2021 00:15:31 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lyude Paul" <lyude@redhat.com>
Date: Sat, 08 May 2021 00:15:31 -0000
Message-ID: <162043293151.3598.15679509760697674475@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210507233947.751846-1-lyude@redhat.com>
In-Reply-To: <20210507233947.751846-1-lyude@redhat.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm=3A_Extract_DPCD_backlight_helpers_from_i915=2C_add_supp?=
 =?utf-8?q?ort_in_nouveau_=28rev7=29?=
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

Series: drm: Extract DPCD backlight helpers from i915, add support in nouveau (rev7)
URL   : https://patchwork.freedesktop.org/series/84754/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
3fc15843fb4a drm/i915/dpcd_bl: Remove redundant AUX backlight frequency calculations
1be558955a5f drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return values correctly
a911297f4820 drm/i915/dpcd_bl: Cleanup intel_dp_aux_vesa_enable_backlight() a bit
2e3a93894d2d drm/i915/dpcd_bl: Cache some backlight capabilities in intel_panel.backlight
95e3ecbcd26b drm/i915/dpcd_bl: Move VESA backlight enabling code closer together
6eb02ebc16c4 drm/i915/dpcd_bl: Return early in vesa_calc_max_backlight if we can't read PWMGEN_BIT_COUNT
a0f72e1159ea drm/i915/dpcd_bl: Print return codes for VESA backlight failures
0a36ba5ac2dd drm/dp: Extract i915's eDP backlight code into DRM helpers
78de5e76199c drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau
-:238: CHECK:CAMELCASE: Avoid CamelCase: <DCB_CONNECTOR_eDP>
#238: FILE: drivers/gpu/drm/nouveau/nouveau_backlight.c:300:
+	if (nv_conn->type == DCB_CONNECTOR_eDP) {

total: 0 errors, 0 warnings, 1 checks, 302 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
