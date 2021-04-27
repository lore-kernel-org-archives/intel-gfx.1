Return-Path: <SRS0=nd+/=JY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BE7C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 13:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343A7613D8
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 13:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 343A7613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28E86E96D;
	Tue, 27 Apr 2021 13:06:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A470F6E964;
 Tue, 27 Apr 2021 13:06:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9956AA7E03;
 Tue, 27 Apr 2021 13:06:29 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Tue, 27 Apr 2021 13:06:29 -0000
Message-ID: <161952878960.17487.18196283733526755446@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210328225709.18541-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20210328225709.18541-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJ?=
 =?utf-8?q?ntroduce_Intel_PXP_=28rev5=29?=
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

Series: Introduce Intel PXP (rev5)
URL   : https://patchwork.freedesktop.org/series/86798/
State : failure

== Summary ==

Applying: drm/i915/pxp: Define PXP component interface
Applying: mei: pxp: export pavp client to me client bus
Applying: drm/i915/pxp: define PXP device flag and kconfig
Applying: drm/i915/pxp: allocate a vcs context for pxp usage
Applying: drm/i915/pxp: Implement funcs to create the TEE channel
Applying: drm/i915/pxp: set KCR reg init
Applying: drm/i915/pxp: Create the arbitrary session after boot
Applying: drm/i915/pxp: Implement arb session teardown
Applying: drm/i915/pxp: Implement PXP irq handler
Applying: drm/i915/pxp: Enable PXP power management
Applying: drm/i915/pxp: interface for marking contexts as using protected content
Applying: drm/i915/uapi: introduce drm_i915_gem_create_ext
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/i915_drv.c
M	include/uapi/drm/i915_drm.h
Falling back to patching base and 3-way merge...
Auto-merging include/uapi/drm/i915_drm.h
CONFLICT (content): Merge conflict in include/uapi/drm/i915_drm.h
Auto-merging drivers/gpu/drm/i915/i915_drv.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0012 drm/i915/uapi: introduce drm_i915_gem_create_ext
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
