Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934ACD16243
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Oct 2024 11:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF6A10E439;
	Mon, 14 Oct 2024 11:33:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F8E10E439;
 Mon, 14 Oct 2024 11:33:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 14 Oct 2024 11:33:20 -0000
Message-ID: <172890560095.1248138.5012325147222803442@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241014111302.95362-1-nemesa.garg@intel.com>
In-Reply-To: <20241014111302.95362-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev3)
URL   : https://patchwork.freedesktop.org/series/138754/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/138754/revisions/3/mbox/ not applied
Applying: drm: Introduce sharpness strength property
Applying: drm/i915/display: Compute the scaler filter coefficients
.git/rebase-apply/patch:212: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/Makefile
M	drivers/gpu/drm/i915/display/intel_display.c
M	drivers/gpu/drm/i915/display/intel_display_types.h
M	drivers/gpu/drm/i915/i915_reg.h
M	drivers/gpu/drm/xe/Makefile
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/xe/Makefile
Auto-merging drivers/gpu/drm/i915/i915_reg.h
Auto-merging drivers/gpu/drm/i915/display/intel_display_types.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_display_types.h
Auto-merging drivers/gpu/drm/i915/display/intel_display.c
Auto-merging drivers/gpu/drm/i915/Makefile
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0002 drm/i915/display: Compute the scaler filter coefficients
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


