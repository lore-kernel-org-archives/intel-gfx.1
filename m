Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1988FECAAD5
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Aug 2022 22:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA16410EA55;
	Fri, 26 Aug 2022 22:35:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DD6F10EA55;
 Fri, 26 Aug 2022 22:35:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 64D6AA47EB;
 Fri, 26 Aug 2022 22:35:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Fri, 26 Aug 2022 22:35:19 -0000
Message-ID: <166155331940.30039.4241909291993525704@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/edid=3A_Range_descriptor_stuff?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/edid: Range descriptor stuff
URL   : https://patchwork.freedesktop.org/series/107824/
State : warning

== Summary ==

Error: dim checkpatch failed
f3a0ff9bb39c drm/edid: Handle EDID 1.4 range descriptor h/vfreq offsets
a3b12a2f939d drm/edid: Clarify why we only accept the "range limits only" descriptor
1219cd9a4eb9 drm/edid: s/monitor_rage/vrr_range/
565abe4b0f72 drm/edid: Define more flags
-:22: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#22: FILE: drivers/gpu/drm/drm_edid.c:2987:
+	    descriptor->data.other_data.data.range.formula.cvt.flags & DRM_EDID_CVT_FLAGS_REDUCED_BLANKING)

total: 0 errors, 1 warnings, 0 checks, 90 lines checked
bbf158e55787 drm/edid: Only parse VRR range for continuous frequency displays
28022ddf1543 drm/edid: Extract drm_gtf2_mode()
5aaf2a783d91 drm/edid: Use GTF2 for inferred modes
23f8f68c2338 drm/edid: Use the correct formula for standard timings
f5286c90de73 drm/edid: Unconfuse preferred timing stuff a bit
afc26dcabe19 drm/edid: Make version checks less convoluted
607330ff2d5f drm/i915: Infer vrefresh range for eDP if the EDID omits it


