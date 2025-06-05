Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88BFC5B543
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643C910E05A;
	Thu,  5 Jun 2025 06:15:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7053010E05A;
 Thu,  5 Jun 2025 06:15:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/display=3A_?=
 =?utf-8?q?Fix_macro_HAS=5FULTRAJOINER?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 05 Jun 2025 06:15:29 -0000
Message-ID: <174910412945.50857.15808442583203775029@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605052616.3368990-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250605052616.3368990-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/display: Fix macro HAS_ULTRAJOINER
URL   : https://patchwork.freedesktop.org/series/149862/
State : warning

== Summary ==

Error: dim checkpatch failed
7dd71becd943 drm/i915/display: Fix macro HAS_ULTRAJOINER
-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:195:
+#define HAS_ULTRAJOINER(__display)	(((__display)->platform.dgfx && \
+					  DISPLAY_VER(__display) == 14) && HAS_DSC(__display))

total: 0 errors, 0 warnings, 1 checks, 11 lines checked


