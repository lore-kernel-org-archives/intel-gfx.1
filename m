Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B238C5475B
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Feb 2024 13:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A153010E0CA;
	Tue, 20 Feb 2024 13:02:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D9910E0CA;
 Tue, 20 Feb 2024 13:02:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_ALPM_AUX-Less_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 20 Feb 2024 13:02:05 -0000
Message-ID: <170843412580.125002.4435704650192055436@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220121045.2156004-1-jouni.hogander@intel.com>
In-Reply-To: <20240220121045.2156004-1-jouni.hogander@intel.com>
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

Series: ALPM AUX-Less (rev2)
URL   : https://patchwork.freedesktop.org/series/129938/
State : warning

== Summary ==

Error: dim checkpatch failed
ea6ececafe60 drm/display: Add missing aux less alpm wake related bits
434fb689c399 drm/i915/psr: Calculate aux less wake time
c2f006945429 drm/i915/psr: Silence period and lfps half cycle
3558f2d67484 drm/i915/psr: Add missing ALPM AUX-Less register definitions
-:31: WARNING:LONG_LINE: line length of 169 exceeds 100 columns
#31: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:352:
+#define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(val)		REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK, (val) - PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN)

-:33: WARNING:LONG_LINE: line length of 133 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:354:
+#define  PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION_MASK, val)

-:35: WARNING:LONG_LINE: line length of 133 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:356:
+#define  PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION_MASK, val)

-:37: WARNING:LONG_LINE: line length of 133 exceeds 100 columns
#37: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:358:
+#define  PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(val)	REG_FIELD_PREP(PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION_MASK, val)

total: 0 errors, 4 warnings, 0 checks, 17 lines checked
8784d6789a71 drm/i915/psr: Enable ALPM for eDP Panel replay
-:26: WARNING:BAD_SIGN_OFF: Duplicate signature
#26: 
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

-:54: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#54: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1713:
+			       PORT_ALPM_CTL_SILENCE_PERIOD(

-:59: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#59: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1718:
+			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(

-:61: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#61: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1720:
+			       PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(

-:63: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#63: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1722:
+			       PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(

total: 0 errors, 1 warnings, 4 checks, 58 lines checked
603e13a8edad drm/i915/psr: Do not write ALPM configuration for PSR1 or DP2.0 Panel Replay


