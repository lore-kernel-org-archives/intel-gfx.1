Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D8FF31E5E
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Apr 2026 16:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8265B10E00A;
	Thu,  9 Apr 2026 16:20:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B822110E00A;
 Thu,  9 Apr 2026 16:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_new_general_DRM_prope?=
 =?utf-8?q?rty_=22color_format=22_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 09 Apr 2026 16:20:28 -0000
Message-ID: <177575162873.447267.17378149374032445255@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
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

Series: Add new general DRM property "color format" (rev9)
URL   : https://patchwork.freedesktop.org/series/157910/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/157910/revisions/9/mbox/ not applied
Applying: drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
Applying: drm/display: hdmi-state-helper: Use default case for unsupported formats
Applying: drm: Add new general DRM property "color format"
Applying: drm/bridge: Act on the DRM color format property
Applying: drm/atomic-helper: Add HDMI bridge output bus formats helper
Applying: drm/display: hdmi-state-helper: Act on color format DRM property
Applying: drm/display: hdmi-state-helper: Try subsampling in mode_valid
Applying: drm/amdgpu: Implement "color format" DRM property
Applying: drm/i915/hdmi: Add YCBCR444 handling for sink formats
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/display/intel_hdmi.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/display/intel_hdmi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_hdmi.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0009 drm/i915/hdmi: Add YCBCR444 handling for sink formats
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


