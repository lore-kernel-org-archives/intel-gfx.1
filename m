Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B593C54E67
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Mar 2024 01:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAFD10FB12;
	Thu, 21 Mar 2024 01:39:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF0E10FB12;
 Thu, 21 Mar 2024 01:39:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/dp=3A_Few_M?=
 =?utf-8?q?TL/DSC_and_a_UHBR_monitor_fix?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 21 Mar 2024 01:39:51 -0000
Message-ID: <171098519144.938557.10587323176274409047@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320201152.3487892-1-imre.deak@intel.com>
In-Reply-To: <20240320201152.3487892-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Few MTL/DSC and a UHBR monitor fix
URL   : https://patchwork.freedesktop.org/series/131386/
State : warning

== Summary ==

Error: dim checkpatch failed
9183ac6af689 drm/i915/dp: Fix DSC line buffer depth programming
ca44bf249961 drm/i915/dp_mst: Fix symbol clock when calculating the DSC DPT bpp limit
fef91e101fcb drm/i915/dp_mst: Fix BW limit check when calculating DSC DPT bpp
f44ec86a39d8 drm/i915/dp_mst: Account for channel coding efficiency in the DSC DPT bpp limit
cab48f1e5ee6 drm/i915/dp_mst: Account with the DSC DPT bpp limit on MTL
56c30e6af3ff drm/i915/dp_mst: Sanitize calculating the DSC DPT bpp limit
29ba369e9dd0 drm/dp: Add drm_dp_uhbr_channel_coding_supported()
a76031363d87 drm/dp_mst: Factor out drm_dp_mst_port_is_logical()
b3fcdcd1049b drm/dp_mst: Add drm_dp_mst_aux_for_parent()
601ece014625 drm/i915/dp_mst: Make HBLANK expansion quirk work for logical ports
f5895020cbbb drm/i915/dp_mst: Enable HBLANK expansion quirk for UHBR rates
-:35: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#35: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2284:
+	/* MediaTek panels (at least in U3224KBA) require DSC for modes with a short HBLANK on UHBR links. */

-:36: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#36: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2285:
+	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },

total: 0 errors, 2 warnings, 0 checks, 55 lines checked


