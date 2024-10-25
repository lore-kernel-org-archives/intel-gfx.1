Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB1FD149F2
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Oct 2024 21:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD5C10EB82;
	Fri, 25 Oct 2024 21:36:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF7610EB84;
 Fri, 25 Oct 2024 21:36:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/xe3lpd=3A_p?=
 =?utf-8?q?tl_display_patches_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 25 Oct 2024 21:36:45 -0000
Message-ID: <172989220590.1334319.17377428403864816967@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025204743.211510-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241025204743.211510-1-clinton.a.taylor@intel.com>
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

Series: drm/i915/xe3lpd: ptl display patches (rev5)
URL   : https://patchwork.freedesktop.org/series/140196/
State : warning

== Summary ==

Error: dim checkpatch failed
a6718297a14a drm/i915/xe3lpd: Update pmdemand programming
-:145: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#145: FILE: drivers/gpu/drm/i915/display/intel_pmdemand.c:483:
+intel_pmdemand_update_params(struct intel_display *display,
+				 const struct intel_pmdemand_state *new,

total: 0 errors, 0 warnings, 1 checks, 172 lines checked
6acfa68aa4bb drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3
-:21: WARNING:BAD_SIGN_OFF: Duplicate signature
#21: 
Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
931c1f3ae979 drm/i915/xe3lpd: Add check to see if edp over type c is allowed
4ec527502c70 drm/i915/ptl: Define IS_PANTHERLAKE macro
-:22: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#22: FILE: drivers/gpu/drm/i915/i915_drv.h:539:
+#define IS_PANTHERLAKE(i915) (0 && i915)

total: 0 errors, 0 warnings, 1 checks, 7 lines checked
3f89723fea91 drm/i915/cx0: Extend C10 check to PTL
608d3ff0d53b drm/i915/cx0: Remove bus reset after every c10 transaction
e7c3282b5f6b drm/i915/xe3lpd: Move async flip bit to PLANE_SURF register
b7514b241f31 drm/i915/xe3: Underrun recovery does not exist post Xe2
e7997b2fec7f drm/i915/display/xe3: disable x-tiled framebuffers
0501e65da334 drm/i915/xe3lpd: Power request asserting/deasserting
-:96: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#96: FILE: drivers/gpu/drm/i915/i915_reg.h:4545:
+#define   TCSS_DISP_MAILBOX_IN_CMD_DATA(x)	TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY | \
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

-:97: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#97: FILE: drivers/gpu/drm/i915/i915_reg.h:4546:
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

total: 1 errors, 1 warnings, 0 checks, 65 lines checked
83c2e5a66e59 drm/xe/ptl: Enable PTL display
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


