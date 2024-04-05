Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D233CD11C2
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Apr 2024 12:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E26113BDA;
	Fri,  5 Apr 2024 12:56:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D44113BD9;
 Fri,  5 Apr 2024 12:56:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Panel_Replay_fixes_a?=
 =?utf-8?q?nd_clean_ups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 05 Apr 2024 12:56:52 -0000
Message-ID: <171232181255.1229455.7143054971921358173@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405113602.992714-1-jouni.hogander@intel.com>
In-Reply-To: <20240405113602.992714-1-jouni.hogander@intel.com>
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

Series: Panel Replay fixes and clean ups
URL   : https://patchwork.freedesktop.org/series/132073/
State : warning

== Summary ==

Error: dim checkpatch failed
c17cab9b7282 drm/i915/psr: Add some documentation of variables used in psr code
01e4b2f7edc9 drm/i915/psr: Set intel_crtc_state->has_psr on panel replay as well
-:44: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#44: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1636:
+		pipe_config->has_psr = pipe_config->has_panel_replay = true;

total: 0 errors, 0 warnings, 1 checks, 30 lines checked
149228bf7462 drm/i915/psr: Intel_psr_pause/resume needs to support panel replay
e478a4ad888e drm/i915/psr: Do not update phy power state in case of non-eDP panel replay
fa2ba29d782d drm/i915/psr: Check possible errors for panel replay as well
158886c33897 drm/i915/psr: Do not write registers/bits not applicable for panel replay
b13d8baa224a drm/i915/psr: Unify panel replay enable/disable sink
c5757c034dac drm/i915/psr: Panel replay has to be enabled before link training
-:80: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'intel_dp' - possible side-effects?
#80: FILE: drivers/gpu/drm/i915/display/intel_psr.h:24:
+#define CAN_PANEL_REPLAY(intel_dp) ((intel_dp)->psr.sink_panel_replay_support && \
+				    (intel_dp)->psr.source_panel_replay_support)

total: 0 errors, 0 warnings, 1 checks, 50 lines checked


