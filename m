Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB558C47DD9
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Feb 2024 08:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2300F10E362;
	Wed, 28 Feb 2024 08:45:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2766F10E362;
 Wed, 28 Feb 2024 08:45:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Enable_fastset_for_m?=
 =?utf-8?q?bus=5Fjoin_state_change?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stanislav Lisovskiy" <stanislav.lisovskiy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Feb 2024 08:45:13 -0000
Message-ID: <170910991315.356522.17404467218658826282@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228080213.17441-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20240228080213.17441-1-stanislav.lisovskiy@intel.com>
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

Series: Enable fastset for mbus_join state change
URL   : https://patchwork.freedesktop.org/series/130480/
State : warning

== Summary ==

Error: dim checkpatch failed
5d2ec76ef8f2 drm/i915: Update mbus in intel_dbuf_mbus_update and do it properly
-:9: WARNING:TYPO_SPELLING: 'swithing' may be misspelled - perhaps 'switching'?
#9: 
or increasing amount of pipes(typical scenario is swithing between
                                                  ^^^^^^^^

-:12: WARNING:TYPO_SPELLING: 'swithing' may be misspelled - perhaps 'switching'?
#12: 
As of BSpec 49213 if we are swithing from multiple to single display
                            ^^^^^^^^

-:38: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'old_dbuf_state->active_pipes == 0'
#38: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:3587:
+	if ((hweight8(new_dbuf_state->active_pipes) <= hweight8(old_dbuf_state->active_pipes))
+	    || (old_dbuf_state->active_pipes == 0))

-:39: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#39: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:3588:
+	if ((hweight8(new_dbuf_state->active_pipes) <= hweight8(old_dbuf_state->active_pipes))
+	    || (old_dbuf_state->active_pipes == 0))

total: 0 errors, 2 warnings, 2 checks, 28 lines checked
763e4c15d36d drm/i915: Implement vblank synchronized MBUS join changes
-:24: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#24: 
v4: - Place "single display to multiple displays scenario" MBUS/DBOX programming

-:201: WARNING:LINE_SPACING: Missing a blank line after declarations
#201: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:3653:
+		int i;
+		intel_dbuf_mbus_update(state);

-:212: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'crtc->pipe != pipe'
#212: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:3664:
+			if (!new_crtc_state->hw.active || (crtc->pipe != pipe))

total: 0 errors, 2 warnings, 1 checks, 211 lines checked


