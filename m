Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959FCE77199
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Jan 2025 15:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4131110EBE0;
	Wed,  8 Jan 2025 15:13:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF8610EBE0;
 Wed,  8 Jan 2025 15:13:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/audio=3A_co?=
 =?utf-8?q?nvert_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 08 Jan 2025 15:13:53 -0000
Message-ID: <173634923306.1326979.8630508053403695522@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1736345025.git.jani.nikula@intel.com>
In-Reply-To: <cover.1736345025.git.jani.nikula@intel.com>
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

Series: drm/i915/audio: convert to struct intel_display
URL   : https://patchwork.freedesktop.org/series/143248/
State : warning

== Summary ==

Error: dim checkpatch failed
8e88d7bd097b drm/i915/audio: convert to struct intel_display
48a81ac0fa0d drm/i915/audio: convert LPE audio to struct intel_display
-:425: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#425: FILE: drivers/gpu/drm/i915/display/intel_lpe_audio.h:27:
 }
+static inline void intel_lpe_audio_teardown(struct intel_display *display)

-:429: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#429: FILE: drivers/gpu/drm/i915/display/intel_lpe_audio.h:30:
 }
+static inline void intel_lpe_audio_irq_handler(struct intel_display *display)

-:433: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#433: FILE: drivers/gpu/drm/i915/display/intel_lpe_audio.h:33:
 }
+static inline void intel_lpe_audio_notify(struct intel_display *display,

total: 0 errors, 0 warnings, 3 checks, 417 lines checked
71ce490396cc drm/i915/audio: rename function prefixes from i915 to intel


