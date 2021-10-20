Return-Path: <SRS0=m2z4=PI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624A6C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 22:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CDA6128E
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 22:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28CDA6128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8156E3F2;
	Wed, 20 Oct 2021 22:39:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCD9F6E3F2;
 Wed, 20 Oct 2021 22:39:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C6085A66C9;
 Wed, 20 Oct 2021 22:39:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 20 Oct 2021 22:39:39 -0000
Message-ID: <163476957978.27360.2070851778390677696@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211018115030.3547-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211018115030.3547-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Split_plane_updates_to_noarm+arm_phases_=28rev2?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: Split plane updates to noarm+arm phases (rev2)
URL   : https://patchwork.freedesktop.org/series/95962/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
0af9d48ba766 drm/i915: Reject planar formats when doing async flips
d6008f7429e8 drm/i915: Fix async flip with decryption and/or DPT
0e1b125748d4 drm/i915: Fix up the sprite namespacing
ae42a64df447 drm/i915: Split update_plane() into update_noarm() + update_arm()
-:596: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#596: FILE: drivers/gpu/drm/i915/i915_trace.h:324:
+	    TP_STRUCT__entry(

-:605: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#605: FILE: drivers/gpu/drm/i915/i915_trace.h:333:
+	    TP_fast_assign(

-:614: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#614: FILE: drivers/gpu/drm/i915/i915_trace.h:342:
+	    TP_printk("pipe %c, plane %s, frame=%u, scanline=%u, " DRM_RECT_FP_FMT " -> " DRM_RECT_FMT,

total: 0 errors, 1 warnings, 2 checks, 521 lines checked
d235981045de drm/i915: Split skl+ plane update into noarm+arm pair
de67af6ad7c0 drm/i915: Split pre-skl primary plane update into noarm+arm pair
aff585c97390 drm/i915: Split g4x+ sprite plane update into noarm+arm pair
3666ba39b832 drm/i915: Split ivb+ sprite plane update into noarm+arm pair
1108d9cc547a drm/i915: Split vlv/chv sprite plane update into noarm+arm pair


