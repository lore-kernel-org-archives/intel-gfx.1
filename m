Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30956C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 00:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCAFE6109F
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 00:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCAFE6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A8E6EA1C;
	Thu, 21 Oct 2021 00:59:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FCBC6E406;
 Thu, 21 Oct 2021 00:59:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 87665A7DFB;
 Thu, 21 Oct 2021 00:59:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 21 Oct 2021 00:59:39 -0000
Message-ID: <163477797953.20177.8786265870642656887@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211020223339.669-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211020223339.669-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_=28near=29atomic_gamma_LUT_updates_via_vblank_w?=
 =?utf-8?q?orkers?=
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

Series: drm/i915: (near)atomic gamma LUT updates via vblank workers
URL   : https://patchwork.freedesktop.org/series/96089/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
889072d8ac0e drm/i915: Move function prototypes to the correct header
0b7c1b5f5243 drm/i915: Do vrr push before sampling the freame counter
b9a5bb22d814 drm/i915: Use vblank workers for gamma updates
-:289: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#289: FILE: drivers/gpu/drm/i915/i915_trace.h:411:
+	    TP_STRUCT__entry(

-:295: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#295: FILE: drivers/gpu/drm/i915/i915_trace.h:417:
+	    TP_fast_assign(

-:310: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#310: FILE: drivers/gpu/drm/i915/i915_trace.h:432:
+	    TP_STRUCT__entry(

-:316: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#316: FILE: drivers/gpu/drm/i915/i915_trace.h:438:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 4 checks, 241 lines checked
6c8274b2061c drm/i915: Use unlocked register accesses for LUT loads


