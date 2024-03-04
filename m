Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B00C48BF6
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Mar 2024 23:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B26D1126EB;
	Mon,  4 Mar 2024 23:23:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429321126EA;
 Mon,  4 Mar 2024 23:23:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/dp=3A_Incre?=
 =?utf-8?q?ase_idle_pattern_wait_timeout_to_2ms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 04 Mar 2024 23:23:47 -0000
Message-ID: <170959462727.503981.5991568056991785109@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304050631.774920-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240304050631.774920-1-shekhar.chauhan@intel.com>
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

Series: drm/i915/dp: Increase idle pattern wait timeout to 2ms (rev2)
URL   : https://patchwork.freedesktop.org/series/130643/
State : warning

== Summary ==

Error: dim checkpatch failed
3a67ec8f2461 drm/i915/dp: Increase idle pattern wait timeout to 2ms
-:31: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 16)
#31: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3682:
+		if (intel_de_wait_for_set(dev_priv,
[...]
+		drm_err(&dev_priv->drm,

-:32: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#32: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3683:
+		if (intel_de_wait_for_set(dev_priv,
+			dp_tp_status_reg(encoder, crtc_state),

-:37: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 16)
#37: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3688:
+		if (intel_de_wait_for_set(dev_priv,
[...]
 		drm_err(&dev_priv->drm,

-:38: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#38: FILE: drivers/gpu/drm/i915/display/intel_ddi.c:3689:
+		if (intel_de_wait_for_set(dev_priv,
+			dp_tp_status_reg(encoder, crtc_state),

total: 0 errors, 2 warnings, 2 checks, 23 lines checked


