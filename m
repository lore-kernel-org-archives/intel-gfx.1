Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2552C3600C
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Apr 2025 04:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A11410E113;
	Tue,  8 Apr 2025 04:53:05 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873FD10E113;
 Tue,  8 Apr 2025 04:53:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Rework/Correction_on?=
 =?utf-8?q?_minimum_hblank_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 08 Apr 2025 04:53:04 -0000
Message-ID: <174408798454.46038.10523248454642271569@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
In-Reply-To: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
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

Series: Rework/Correction on minimum hblank calculation
URL   : https://patchwork.freedesktop.org/series/147361/
State : warning

== Summary ==

Error: dim checkpatch failed
9c35662b4d58 drm/drm_dp_helper: export link symbol cycles calculation
7d69bc381050 drm/i915/display: export function to count dsc slices
f3d0212869af drm/i915/audio: move min_hblank from dp_mst to audio
-:96: CHECK:LINE_SPACING: Please don't use multiple blank lines
#96: FILE: drivers/gpu/drm/i915/display/intel_audio.c:246:
+
+

total: 0 errors, 0 warnings, 1 checks, 204 lines checked


