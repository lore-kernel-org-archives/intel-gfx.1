Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4085AC4345F
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Apr 2024 16:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC931136A0;
	Wed, 17 Apr 2024 16:34:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042A113684;
 Wed, 17 Apr 2024 16:34:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/dp=3A_Few_M?=
 =?utf-8?q?TL/DSC_and_a_UHBR_monitor_fix_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Apr 2024 16:34:10 -0000
Message-ID: <171337165012.1482856.1637309032986424202@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416221010.376865-1-imre.deak@intel.com>
In-Reply-To: <20240416221010.376865-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Few MTL/DSC and a UHBR monitor fix (rev4)
URL   : https://patchwork.freedesktop.org/series/131386/
State : warning

== Summary ==

Error: dim checkpatch failed
8b46862b3906 drm/i915/dp: Fix DSC line buffer depth programming
0f942ddfee52 drm/i915/dp_mst: Fix symbol clock when calculating the DSC DPT bpp limit
7b25a2826ce8 drm/i915/dp_mst: Fix BW limit check when calculating DSC DPT bpp
ae7078c79b46 drm/i915/dp_mst: Account for channel coding efficiency in the DSC DPT bpp limit
e216d859bd53 drm/i915/dp_mst: Account with the DSC DPT bpp limit on MTL
85c045743de7 drm/i915/dp_mst: Sanitize calculating the DSC DPT bpp limit
ad1f327b97b2 drm/dp: Add drm_dp_128b132b_supported()
6f14d19a285d drm/dp_mst: Factor out drm_dp_mst_port_is_logical()
6b87d351ae3a drm/dp_mst: Add drm_dp_mst_aux_for_parent()
a9d4d83cb2e4 drm/i915/dp_mst: Make HBLANK expansion quirk work for logical ports
210f94e07d2b drm/i915/dp_mst: Enable HBLANK expansion quirk for UHBR rates
-:39: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#39: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2284:
+	/* MediaTek panels (at least in U3224KBA) require DSC for modes with a short HBLANK on UHBR links. */

-:40: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#40: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2285:
+	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },

total: 0 errors, 2 warnings, 0 checks, 55 lines checked


