Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998E9C4345F
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Apr 2024 19:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198EA10FFD3;
	Wed, 24 Apr 2024 19:24:16 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B31A10E064;
 Wed, 24 Apr 2024 19:24:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Link_off_between_fra?=
 =?utf-8?q?mes_for_edp_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 24 Apr 2024 19:24:14 -0000
Message-ID: <171398665404.1648713.10112381379814918067@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424183820.3591593-1-animesh.manna@intel.com>
In-Reply-To: <20240424183820.3591593-1-animesh.manna@intel.com>
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

Series: Link off between frames for edp (rev3)
URL   : https://patchwork.freedesktop.org/series/130650/
State : warning

== Summary ==

Error: dim checkpatch failed
7ccdb7d534c2 drm/i915/alpm: Move alpm parameters from intel_psr
e70fb128c772 drm/i915/alpm: Move alpm related code to a new file
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

-:254: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#254: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:223:
+	io_wake_lines = intel_usecs_to_scanlines(

-:256: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#256: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:225:
+	fast_wake_lines = intel_usecs_to_scanlines(

-:267: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#267: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:236:
+		io_wake_lines = fast_wake_lines = max_wake_lines;

-:299: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#299: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:268:
+			       PORT_ALPM_CTL_SILENCE_PERIOD(

-:304: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#304: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:273:
+			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(

-:306: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#306: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:275:
+			       PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(

-:308: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#308: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:277:
+			       PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(

-:312: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#312: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:281:
+			   ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);

total: 0 errors, 2 warnings, 7 checks, 627 lines checked
ddc1c58a6502 drm/display: Add missing aux less alpm wake related bits
da33013f8b90 drm/i915/alpm: Add compute config for lobf
f94457d9da62 drm/i915/alpm: Enable lobf from source in ALPM_CTL
3c9276ff0eef drm/i915/alpm: Add debugfs for LOBF


