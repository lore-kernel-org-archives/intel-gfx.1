Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0002FC77B7A
	for <intel-gfx@archiver.kernel.org>; Fri, 26 May 2023 18:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F62610E1EA;
	Fri, 26 May 2023 18:41:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A139610E1EA;
 Fri, 26 May 2023 18:41:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9A98BA882E;
 Fri, 26 May 2023 18:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Date: Fri, 26 May 2023 18:41:37 -0000
Message-ID: <168512649760.32385.7437121537666363438@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230526125055.39886-1-vinod.govindapillai@intel.com>
In-Reply-To: <20230526125055.39886-1-vinod.govindapillai@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_mtl=3A_add_support_for_pmdemand_=28rev9=29?=
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

Series: mtl: add support for pmdemand (rev9)
URL   : https://patchwork.freedesktop.org/series/116949/
State : warning

== Summary ==

Error: dim checkpatch failed
46ebac6b36e6 drm/i915: fix the derating percentage for MTL
e38d851823c0 drm/i915: update the QGV point frequency calculations
394b4f9549e5 drm/i915: store the peak bw per QGV point
80e49852b3a0 drm/i915: extract intel_bw_check_qgv_points()
9c8a98ce40ee drm/i915: modify max_bw to return index to intel_bw_info
f9c7377c1465 drm/i915/mtl: find the best QGV point for the SAGV configuration
ddee56f34615 drm/i915/mtl: Add support for PM DEMAND
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:252: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#252: 
new file mode 100644

-:882: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#882: FILE: drivers/gpu/drm/i915/i915_reg.h:4511:
+#define  XELPDP_PMDEMAND_QCLK_GV_BW(x)			REG_FIELD_PREP(XELPDP_PMDEMAND_QCLK_GV_BW_MASK, x)

-:884: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#884: FILE: drivers/gpu/drm/i915/i915_reg.h:4513:
+#define  XELPDP_PMDEMAND_VOLTAGE_INDEX(x)		REG_FIELD_PREP(XELPDP_PMDEMAND_VOLTAGE_INDEX_MASK, x)

-:886: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#886: FILE: drivers/gpu/drm/i915/i915_reg.h:4515:
+#define  XELPDP_PMDEMAND_QCLK_GV_INDEX(x)		REG_FIELD_PREP(XELPDP_PMDEMAND_QCLK_GV_INDEX_MASK, x)

-:888: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#888: FILE: drivers/gpu/drm/i915/i915_reg.h:4517:
+#define  XELPDP_PMDEMAND_PIPES(x)			REG_FIELD_PREP(XELPDP_PMDEMAND_PIPES_MASK, x)

-:890: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#890: FILE: drivers/gpu/drm/i915/i915_reg.h:4519:
+#define  XELPDP_PMDEMAND_DBUFS(x)			REG_FIELD_PREP(XELPDP_PMDEMAND_DBUFS_MASK, x)

-:896: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#896: FILE: drivers/gpu/drm/i915/i915_reg.h:4525:
+#define  XELPDP_PMDEMAND_CDCLK_FREQ(x)			REG_FIELD_PREP(XELPDP_PMDEMAND_CDCLK_FREQ_MASK, x)

-:898: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#898: FILE: drivers/gpu/drm/i915/i915_reg.h:4527:
+#define  XELPDP_PMDEMAND_DDICLK_FREQ(x)			REG_FIELD_PREP(XELPDP_PMDEMAND_DDICLK_FREQ_MASK, x)

-:900: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#900: FILE: drivers/gpu/drm/i915/i915_reg.h:4529:
+#define  XELPDP_PMDEMAND_SCALERS(x)			REG_FIELD_PREP(XELPDP_PMDEMAND_SCALERS_MASK, x)

total: 0 errors, 9 warnings, 0 checks, 807 lines checked


