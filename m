Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D503C7115B
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Jun 2025 10:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FD310E358;
	Mon, 23 Jun 2025 10:49:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F10B10E358;
 Mon, 23 Jun 2025 10:49:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915=2C_drm/xe=3A_add?=
 =?utf-8?q?_drm_device_based_pcode_interface_for_display_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 23 Jun 2025 10:49:16 -0000
Message-ID: <175067575638.100397.3504474504158008872@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749119274.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749119274.git.jani.nikula@intel.com>
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

Series: drm/i915, drm/xe: add drm device based pcode interface for display (rev2)
URL   : https://patchwork.freedesktop.org/series/149878/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/149878/revisions/2/mbox/ not applied
Applying: drm/i915/pcode: drop fast wait from snb_pcode_write_timeout()
Applying: drm/i915/pcode: add struct drm_device based interface
Applying: drm/xe/pcode: add struct drm_device based interface
Applying: drm/i915/display: switch to struct drm_device based pcode interface
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/display/hsw_ips.c
M	drivers/gpu/drm/i915/display/intel_bw.c
M	drivers/gpu/drm/i915/display/intel_cdclk.c
M	drivers/gpu/drm/i915/display/intel_display_power.c
M	drivers/gpu/drm/i915/display/intel_display_power_well.c
M	drivers/gpu/drm/i915/display/intel_hdcp.c
M	drivers/gpu/drm/i915/display/skl_watermark.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/display/skl_watermark.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/skl_watermark.c
Auto-merging drivers/gpu/drm/i915/display/intel_hdcp.c
Auto-merging drivers/gpu/drm/i915/display/intel_display_power_well.c
Auto-merging drivers/gpu/drm/i915/display/intel_display_power.c
Auto-merging drivers/gpu/drm/i915/display/intel_cdclk.c
Auto-merging drivers/gpu/drm/i915/display/intel_bw.c
Auto-merging drivers/gpu/drm/i915/display/hsw_ips.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0004 drm/i915/display: switch to struct drm_device based pcode interface
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


