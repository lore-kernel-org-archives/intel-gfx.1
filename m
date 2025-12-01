Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0D3D116F5
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Dec 2025 12:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE59710E363;
	Mon,  1 Dec 2025 12:06:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44A010E363;
 Mon,  1 Dec 2025 12:06:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_witch_to_use_kernel_stand?=
 =?utf-8?q?ard_fault_injection_in_i915?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 01 Dec 2025 12:06:26 -0000
Message-ID: <176459078673.41875.7683555691821022866@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251201120004.690290-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20251201120004.690290-1-juhapekka.heikkila@gmail.com>
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

Series: witch to use kernel standard fault injection in i915
URL   : https://patchwork.freedesktop.org/series/158289/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/158289/revisions/1/mbox/ not applied
Applying: drm/i915: switch to use kernel standard error injection
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/i915_driver.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/i915_driver.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_driver.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915: switch to use kernel standard error injection
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


