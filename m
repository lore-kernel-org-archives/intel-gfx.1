Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E36BD15D8A
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Oct 2024 13:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C6910E4EC;
	Mon, 21 Oct 2024 13:07:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A22B10E4EC;
 Mon, 21 Oct 2024 13:07:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Add_support_for_3_VD?=
 =?utf-8?q?SC_engines_12_slices_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 21 Oct 2024 13:07:48 -0000
Message-ID: <172951606842.1305454.6247025143915910919@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021123414.3993899-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241021123414.3993899-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for 3 VDSC engines 12 slices (rev4)
URL   : https://patchwork.freedesktop.org/series/139934/
State : warning

== Summary ==

Error: dim checkpatch failed
321ae3da8cc9 drm/i915/dp: Update Comment for Valid DSC Slices per Line
ad2c11146440 drm/i915/display: Prepare for dsc 3 stream splitter
6a9db221e828 drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
37eb62f9de0d drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
0a32f374ba17 drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
42113ffedb7f drm/i915/dp: Ensure hactive is divisible by slice count
2e438d2aa0d6 drm/i915/dp: Enable 3 DSC engines for 12 slices
c74837cd7e1b drm/i915/display: Add macro HAS_PIXEL_REPLICATION
-:19: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#19: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_PIXEL_REPLICATION(i915)	(HAS_DSC(i915) && \
+					 (DISPLAY_VER(i915) >= 20 || \
+					  DISPLAY_VER_FULL(i915) == IP_VER(14, 1)))

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
eeff3b7f25a7 drm/i915/display: Add support for DSC pixel replication
-:139: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:59:
+#define  DSC_PIXEL_REPLICATION(count)		(REG_FIELD_PREP(DSC_PIXEL_REPLICATION_MASK, (count)))

total: 0 errors, 1 warnings, 0 checks, 99 lines checked
e3fe2ce6ff54 drm/i915/dp_mst: Account for pixel replication for MST overhead with DSC
70305f1dd965 drm/i915/dp: Account for pixel replication for BW computation with DSC
ce3f7ebc2c7a drm/i915/display: Account for pixel replication in pipe_src
90f48fd82de0 drm/i915/dp: Enable DSC pixel replication
c77b8b4f56c6 drm/i915/dsc: Introduce odd pixel removal
3f3cfc7e0812 drm/i915/display: Adjust Pipe SRC Width for Odd Pixels
e580a07626f6 drm/i915/dp: Add Check for Odd Pixel Requirement


