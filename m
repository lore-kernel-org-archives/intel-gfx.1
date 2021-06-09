Return-Path: <SRS0=iOfG=LD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41478C48BCD
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 09:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11DDA6124C
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 09:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11DDA6124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC4889FD9;
	Wed,  9 Jun 2021 09:39:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8189F89FD9;
 Wed,  9 Jun 2021 09:39:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 79A6CA008A;
 Wed,  9 Jun 2021 09:39:40 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Wed, 09 Jun 2021 09:39:40 -0000
Message-ID: <162323158049.27477.1318511919190929345@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210609085632.22026-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210609085632.22026-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Cleanup_intel=5Fcrtc_leftovers?=
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

Series: drm/i915: Cleanup intel_crtc leftovers
URL   : https://patchwork.freedesktop.org/series/91228/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
8e210ec77a89 drm/i915: Stop hand rolling drm_crtc_mask()
8a5104afbe28 drm/i915: Clean up intel_get_load_detect_pipe() a bit
a329856db7f9 drm/i915: Clean up intel_find_initial_plane_obj() a bit
cd8c3028dd2e drm/i915: Clean up pre-skl wm calling convention
065c8d4b9cc7 drm/i915: Clean up intel_fbdev_init_bios() a bit
a935b9b200e8 drm/i915: s/intel_crtc/crtc/
-:94: CHECK:SPACING: No space is necessary after a cast
#94: FILE: drivers/gpu/drm/i915/display/intel_display.c:2723:
+		(void) intel_overlay_switch_off(crtc->overlay);

total: 0 errors, 0 warnings, 1 checks, 584 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
