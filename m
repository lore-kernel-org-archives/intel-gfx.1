Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ED3C369AB
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Apr 2025 11:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3045910E740;
	Tue, 15 Apr 2025 11:20:12 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A3810E740;
 Tue, 15 Apr 2025 11:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/edid=3A_more_dis?=
 =?utf-8?q?playid_timing_parsing_and_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Apr 2025 11:20:11 -0000
Message-ID: <174471601152.6244.12678049258743410757@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <cover.1744708239.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744708239.git.jani.nikula@intel.com>
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

Series: drm/edid: more displayid timing parsing and cleanups
URL   : https://patchwork.freedesktop.org/series/147738/
State : warning

== Summary ==

Error: dim checkpatch failed
856752a4cc4d drm/edid: Implement DisplayID Type IX & X timing blocks parsing
-:64: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#64: FILE: drivers/gpu/drm/drm_edid.c:6837:
+							   const struct displayid_formula_timings_9 *timings,

-:80: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#80: FILE: drivers/gpu/drm/drm_edid.c:6853:
+	mode = drm_cvt_mode(dev, hactive, vactive, timings->vrefresh + 1, timing_formula == 1, false, false);

-:95: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#95: FILE: drivers/gpu/drm/drm_edid.c:6868:
+	const struct displayid_formula_timing_block *formula_block = (struct displayid_formula_timing_block *)block;

total: 0 errors, 3 warnings, 0 checks, 100 lines checked
cf768be4496b drm/edid: Refactor DisplayID timing block structs
-:56: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#56: FILE: drivers/gpu/drm/drm_edid.c:6763:
+							    const struct displayid_detailed_timings_1 *timings,

total: 0 errors, 1 warnings, 0 checks, 66 lines checked


