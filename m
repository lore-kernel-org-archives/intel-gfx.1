Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E7CC25B79
	for <intel-gfx@archiver.kernel.org>; Thu, 23 May 2024 14:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92E910E1E2;
	Thu, 23 May 2024 14:39:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F7810E1E2;
 Thu, 23 May 2024 14:39:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915=3A_dev=5Fpr?=
 =?utf-8?q?iv_fixes_for_i9xx=5Fplane=5Fregs=2Eh/intel=5Fcolor=5Fregs=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 23 May 2024 14:39:42 -0000
Message-ID: <171647518242.2170280.9430633677613840365@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1716469091.git.jani.nikula@intel.com>
In-Reply-To: <cover.1716469091.git.jani.nikula@intel.com>
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

Series: drm/i915: dev_priv fixes for i9xx_plane_regs.h/intel_color_regs.h
URL   : https://patchwork.freedesktop.org/series/133961/
State : warning

== Summary ==

Error: dim checkpatch failed
c6ca7406f7f7 drm/i915: pass dev_priv explicitly to DSPADDR_VLV
f3e2cda96093 drm/i915: pass dev_priv explicitly to DSPCNTR
d200ecb0dabd drm/i915: pass dev_priv explicitly to DSPADDR
26f159f76eb9 drm/i915: pass dev_priv explicitly to DSPLINOFF
86586f314608 drm/i915: pass dev_priv explicitly to DSPSTRIDE
84bf2fe7719e drm/i915: pass dev_priv explicitly to DSPPOS
50e20395f963 drm/i915: pass dev_priv explicitly to DSPSIZE
14cc75f5e8bb drm/i915: pass dev_priv explicitly to DSPSURF
22c27f81f743 drm/i915: pass dev_priv explicitly to DSPTILEOFF
e9250cd74599 drm/i915: pass dev_priv explicitly to DSPOFFSET
e6da8f36eeeb drm/i915: pass dev_priv explicitly to DSPSURFLIVE
94ef1395cf13 drm/i915: pass dev_priv explicitly to DSPGAMC
-:20: WARNING:LONG_LINE: line length of 132 exceeds 100 columns
#20: FILE: drivers/gpu/drm/i915/display/i9xx_plane_regs.h:87:
+#define DSPGAMC(dev_priv, plane, i)		_MMIO_PIPE2(dev_priv, plane, _DSPAGAMC + (5 - (i)) * 4) /* plane C only, 6 x u0.8 */

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
b077c7fdcc89 drm/i915: pass dev_priv explicitly to PRIMPOS
cc98490d42de drm/i915: pass dev_priv explicitly to PRIMSIZE
70ee81fa5acd drm/i915: pass dev_priv explicitly to PRIMCNSTALPHA
287db389c945 drm/i915: pass dev_priv explicitly to PIPEGCMAX
-:40: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/intel_color.c:3243:
+	lut[i].red = i965_lut_11p6_max_pack(intel_de_read_fw(dev_priv, PIPEGCMAX(dev_priv, pipe, 0)));

-:41: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#41: FILE: drivers/gpu/drm/i915/display/intel_color.c:3244:
+	lut[i].green = i965_lut_11p6_max_pack(intel_de_read_fw(dev_priv, PIPEGCMAX(dev_priv, pipe, 1)));

-:42: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/intel_color.c:3245:
+	lut[i].blue = i965_lut_11p6_max_pack(intel_de_read_fw(dev_priv, PIPEGCMAX(dev_priv, pipe, 2)));

-:59: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_color_regs.h:42:
+#define PIPEGCMAX(dev_priv, pipe, i)	_MMIO_PIPE2(dev_priv, pipe, _PIPEAGCMAX + (i) * 4) /* u1.16 */

total: 0 errors, 4 warnings, 0 checks, 37 lines checked


