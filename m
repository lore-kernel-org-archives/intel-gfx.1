Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CCBC64E90
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 23:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339D122260
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 23:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 339D122260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985F16E984;
	Tue,  1 Dec 2020 23:42:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C47F06E97B;
 Tue,  1 Dec 2020 23:42:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BACB3A73C9;
 Tue,  1 Dec 2020 23:42:52 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Huang, Sean Z" <sean.z.huang@intel.com>
Date: Tue, 01 Dec 2020 23:42:52 -0000
Message-ID: <160686617273.6988.2843019474229538555@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201201233411.21858-1-sean.z.huang@intel.com>
In-Reply-To: <20201201233411.21858-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJ?=
 =?utf-8?q?ntroduce_Intel_PXP_component_=28rev2=29?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Introduce Intel PXP component (rev2)
URL   : https://patchwork.freedesktop.org/series/84136/
State : failure

== Summary ==

Applying: drm/i915/pxp: Introduce Intel PXP component
Applying: drm/i915/pxp: Enable PXP irq worker and callback stub
Applying: drm/i915/pxp: Add PXP context for logical hardware states.
Applying: drm/i915/pxp: set KCR reg init during the boot time
Applying: drm/i915/pxp: Implement ioctl action to set the user space context
Applying: drm/i915/pxp: Add PXP-related registers into allowlist
Applying: drm/i915/pxp: Read register to check hardware session state
Applying: drm/i915/pxp: Implement funcs to get/set PXP tag
Applying: drm/i915/pxp: Implement ioctl action to reserve session slot
Applying: drm/i915/pxp: Implement ioctl action to set session in play
Applying: drm/i915/pxp: Func to send hardware session termination
Applying: drm/i915/pxp: Implement ioctl action to terminate the session
Applying: drm/i915/pxp: Enable ioctl action to query PXP tag
Applying: drm/i915/pxp: Destroy all type0 sessions upon teardown
Applying: drm/i915/pxp: Termiante the session upon app crash
Applying: drm/i915/pxp: Enable PXP power management
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/i915_drv.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0016 drm/i915/pxp: Enable PXP power management
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
