Return-Path: <SRS0=bGS0=PO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8B2C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 22:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBA460D42
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 22:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADBA460D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152D789C86;
	Tue, 26 Oct 2021 22:43:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4012F89C6C;
 Tue, 26 Oct 2021 22:43:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3851DA66C8;
 Tue, 26 Oct 2021 22:43:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 26 Oct 2021 22:43:11 -0000
Message-ID: <163528819119.9776.11251451368547649995@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211026220848.439530-1-lyude@redhat.com>
In-Reply-To: <20211026220848.439530-1-lyude@redhat.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/dp=2C_drm/i915=3A_Finish_basic_PWM_support_for_VESA_bac?=
 =?utf-8?q?klight_helpers_=28rev10=29?=
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

Series: drm/dp, drm/i915: Finish basic PWM support for VESA backlight helpers (rev10)
URL   : https://patchwork.freedesktop.org/series/95127/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
2a532b418235 drm/i915: Add support for panels with VESA backlights with PWM enable/disable
7557ddeac4b1 drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux enable/brightness
8bc9ebb1845f drm/dp: Disable unsupported features in DP_EDP_BACKLIGHT_MODE_SET_REGISTER
e87c0204c051 drm/dp, drm/i915: Add support for VESA backlights using PWM for brightness control
-:228: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#228: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:309:
+								     panel->backlight.pwm_level_max);

total: 0 errors, 1 warnings, 0 checks, 255 lines checked
c28caf36811d drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()


