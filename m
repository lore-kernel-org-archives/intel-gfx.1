Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C20CA0FEF
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Sep 2023 18:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A838D10E076;
	Fri,  1 Sep 2023 18:38:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EC8610E076;
 Fri,  1 Sep 2023 18:38:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8782DAADE0;
 Fri,  1 Sep 2023 18:38:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Fri, 01 Sep 2023 18:38:47 -0000
Message-ID: <169359352755.9816.9263588965283525329@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230901130440.2085-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20230901130440.2085-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_VRR=2C_LRR=2C_and_M/N_stuff_=28rev2=29?=
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

Series: drm/i915: VRR, LRR, and M/N stuff (rev2)
URL   : https://patchwork.freedesktop.org/series/123171/
State : warning

== Summary ==

Error: dim checkpatch failed
c7fffe8e772b drm/i915: Move psr unlock out from the pipe update critical section
0431a7e05f0c drm/i915: Change intel_pipe_update_{start, end}() calling convention
92d923a61bcb drm/i915: Extract intel_crtc_vblank_evade_scanlines()
00208c178f7e drm/i915: Enable VRR later during fastsets
ba53ce94d6e6 drm/i915: Adjust seamless_m_n flag behaviour
b9e3a8d75a8b drm/i915: Optimize out redundant M/N updates
bb0955c10359 drm/i915: Relocate is_in_vrr_range()
73bdf859c6b4 drm/i915: Validate that the timings are within the VRR range
eb64fd4e8af4 drm/i915: Disable VRR during seamless M/N changes
75ddcb0cebab drm/i915: Update VRR parameters in fastset
40f26b86aaf1 drm/i915: Assert that VRR is off during vblank evasion if necessary
a39a2eb2de5e drm/i915: Implement transcoder LRR for TGL+
-:173: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#173: FILE: drivers/gpu/drm/i915/display/intel_display.c:5589:
+	    (old_crtc_state->hw.adjusted_mode.crtc_vtotal == new_crtc_state->hw.adjusted_mode.crtc_vtotal &&

-:174: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#174: FILE: drivers/gpu/drm/i915/display/intel_display.c:5590:
+	     old_crtc_state->hw.adjusted_mode.crtc_vblank_end == new_crtc_state->hw.adjusted_mode.crtc_vblank_end))

total: 0 errors, 2 warnings, 0 checks, 208 lines checked


