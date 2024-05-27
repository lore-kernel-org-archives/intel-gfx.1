Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28133C25B79
	for <intel-gfx@archiver.kernel.org>; Mon, 27 May 2024 14:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AFE10FB0B;
	Mon, 27 May 2024 14:00:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C30110FB03;
 Mon, 27 May 2024 13:59:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915=3A_pass_dev?=
 =?utf-8?q?=5Fpriv_explicitly_to_DIP_regs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 27 May 2024 13:59:28 -0000
Message-ID: <171681836824.2213173.6160130684566758660@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1716808214.git.jani.nikula@intel.com>
In-Reply-To: <cover.1716808214.git.jani.nikula@intel.com>
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

Series: drm/i915: pass dev_priv explicitly to DIP regs
URL   : https://patchwork.freedesktop.org/series/134074/
State : warning

== Summary ==

Error: dim checkpatch failed
df89c96ca80c drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_CTL
-:79: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#79: FILE: drivers/gpu/drm/i915/i915_reg.h:3478:
+#define HSW_TVIDEO_DIP_CTL(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_CTL_A)

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
1d6548f7f2b1 drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_GCP
-:42: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/i915_reg.h:3479:
+#define HSW_TVIDEO_DIP_GCP(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_GCP_A)

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
f717db5a3e3f drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_AVI_DATA
-:33: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:3480:
+#define HSW_TVIDEO_DIP_AVI_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_AVI_DATA_A + (i) * 4)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
2460d4a04377 drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_VS_DATA
-:33: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:3481:
+#define HSW_TVIDEO_DIP_VS_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_VS_DATA_A + (i) * 4)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
94f16ec183b8 drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_SPD_DATA
-:33: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:3482:
+#define HSW_TVIDEO_DIP_SPD_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_SPD_DATA_A + (i) * 4)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
962e93f3a493 drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_GMP_DATA
-:33: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:3483:
+#define HSW_TVIDEO_DIP_GMP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_GMP_DATA_A + (i) * 4)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
71160f5a0576 drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_VSC_DATA
-:33: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:3484:
+#define HSW_TVIDEO_DIP_VSC_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _HSW_VIDEO_DIP_VSC_DATA_A + (i) * 4)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
d2ab407b9a2a drm/i915: pass dev_priv explicitly to GLK_TVIDEO_DIP_DRM_DATA
-:33: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:3485:
+#define GLK_TVIDEO_DIP_DRM_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
6e4e6c67feaf drm/i915: pass dev_priv explicitly to ICL_VIDEO_DIP_PPS_DATA
-:33: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_reg.h:3486:
+#define ICL_VIDEO_DIP_PPS_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
2c702085abb4 drm/i915: pass dev_priv explicitly to ICL_VIDEO_DIP_PPS_ECC
-:20: WARNING:LONG_LINE: line length of 129 exceeds 100 columns
#20: FILE: drivers/gpu/drm/i915/i915_reg.h:3487:
+#define ICL_VIDEO_DIP_PPS_ECC(dev_priv, trans, i)		_MMIO_TRANS2(dev_priv, trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
283606419eba drm/i915: pass dev_priv explicitly to ADL_TVIDEO_DIP_AS_SDP_DATA


