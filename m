Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6352C48BF6
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Mar 2024 04:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B9610FBF4;
	Mon,  4 Mar 2024 04:29:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A6310FBF4;
 Mon,  4 Mar 2024 04:29:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/dp=3A_Incre?=
 =?utf-8?q?ase_idle_pattern_wait_timeout_to_2ms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 04 Mar 2024 04:29:02 -0000
Message-ID: <170952654273.486223.16321780408016983166@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304040038.774303-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240304040038.774303-1-shekhar.chauhan@intel.com>
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

Series: drm/i915/dp: Increase idle pattern wait timeout to 2ms
URL   : https://patchwork.freedesktop.org/series/130643/
State : warning

== Summary ==

Error: dim checkpatch failed
aee3aa2feba0 drm/i915/dp: Increase idle pattern wait timeout to 2ms
-:27: ERROR:SPACING: space required before the open parenthesis '('
#27: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3681:
+	if(DISPLAY_VER(dev_priv) >= 20) {

-:28: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 16)
#28: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3682:
+		if (intel_de_wait_for_set(dev_priv,
[...]
+		drm_err(&dev_priv->drm,

-:29: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#29: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3683:
+		if (intel_de_wait_for_set(dev_priv,
+				  dp_tp_status_reg(encoder, crtc_state),

-:34: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3688:
+	}
+	else {

-:34: CHECK:BRACES: Unbalanced braces around else statement
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3688:
+	else {

-:35: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 16)
#35: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3689:
+		if (intel_de_wait_for_set(dev_priv,
[...]
 		drm_err(&dev_priv->drm,

-:36: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#36: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3690:
+		if (intel_de_wait_for_set(dev_priv,
 				  dp_tp_status_reg(encoder, crtc_state),

total: 2 errors, 2 warnings, 3 checks, 22 lines checked


