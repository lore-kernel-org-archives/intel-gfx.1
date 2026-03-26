Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC7F10A88F7
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Mar 2026 17:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454D310E295;
	Thu, 26 Mar 2026 17:52:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8079310E295;
 Thu, 26 Mar 2026 17:52:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/display=3A_Add_D?=
 =?utf-8?q?C3CO_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 26 Mar 2026 17:52:28 -0000
Message-ID: <177454754849.402963.17553373711024957455@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
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

Series: drm/i915/display: Add DC3CO support
URL   : https://patchwork.freedesktop.org/series/163939/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/163939/revisions/1/mbox/ not applied
Applying: drm/i915/display: Remove TGL DC3CO support
Applying: drm/i915/display: Replace DC_STATE_EN_DC3CO with DC_STATE_EN_UPTO_DC3CO
Applying: drm/i915/display: Use FIELD_PREP() for DC state enable bits
Applying: drm/i915/display: Add DC3CO DC_STATE enable/disable support
Applying: drm/i915/display: Validate target DC state against allowed_dc_mask
Applying: drm/i915/display: Fix HAS_DC3CO() and add DC3CO trigger enum
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/display/intel_display_device.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/display/intel_display_device.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_display_device.h
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0006 drm/i915/display: Fix HAS_DC3CO() and add DC3CO trigger enum
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


