Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC62C47073
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Jan 2024 17:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E13110E616;
	Wed, 10 Jan 2024 17:41:11 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7217C10E610;
 Wed, 10 Jan 2024 17:41:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Panel_replay_selecti?=
 =?utf-8?q?ve_update_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Wed, 10 Jan 2024 17:41:09 -0000
Message-ID: <170490846946.240792.8108949879418458651@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110131304.2470006-1-jouni.hogander@intel.com>
In-Reply-To: <20240110131304.2470006-1-jouni.hogander@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Panel replay selective update support (rev2)
URL   : https://patchwork.freedesktop.org/series/128193/
State : warning

== Summary ==

Error: dim checkpatch failed
af6e1b067218 drm/i915/psr: Disable panel replay for now
1ad3b9a2a48a drm/i915/psr: Intel_psr_pause/resume needs to support panel replay
f0b97dc1d99b drm/i915/psr: Do not check alpm on DP or capability change for panel replay
424c68f53ab4 drm/i915/psr: Unify panel replay enable sink
f0bf5f90363d drm/i915/psr: Rename has_psr2 as has_sel_update
ac4958a72f0f drm/i915/psr: Rename psr2_enabled as sel_update_enabled
d27945c32bdf drm/i915/psr: Add some documentation of variables used in psr code
ac74a6fbe5bd drm/i915/psr: Add sink_panel_replay_su_support to intel_psr
f111452b0ef7 drm/i915/psr: Detect panel replay selective update support
65a947a12d8e drm/i915/psr: Split intel_psr2_config_valid for panel replay
9f5ef2469b13 drm/panelreplay: dpcd register definition for panelreplay SU
77a34490833a drm/i915/psr: Modify intel_dp_get_su_granularity to support panel replay
ddde1b752ad8 drm/i915/psr: Add panel replay sel update support to debugfs interface
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
Sink support: PSR = no, Panel Replay = yes, Panel Replay Selective Update = yes

total: 0 errors, 1 warnings, 0 checks, 22 lines checked


