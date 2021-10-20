Return-Path: <SRS0=m2z4=PI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D889C4332F
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 22:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E879611CC
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 22:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E879611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71BE6E3E3;
	Wed, 20 Oct 2021 22:04:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5846F6E3DB;
 Wed, 20 Oct 2021 22:04:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3C454A47E1;
 Wed, 20 Oct 2021 22:04:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 20 Oct 2021 22:04:01 -0000
Message-ID: <163476744121.27358.5299862127953514588@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211020195216.36173-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20211020195216.36173-1-vinay.belgaumkar@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/guc/slpc=3A_Implement_waitboost_for_SLPC?=
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

Series: drm/i915/guc/slpc: Implement waitboost for SLPC
URL   : https://patchwork.freedesktop.org/series/96082/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
0eb920836a06 drm/i915/guc/slpc: Define and initialize boost frequency
cda3c12346d8 drm/i915/guc/slpc: Add waitboost functionality for SLPC
d2be325e7ae0 drm/i915/guc/slpc: Update boost sysfs hooks for SLPC
-:104: ERROR:CODE_INDENT: code indent should use tabs where possible
#104: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:631:
+ ^Ireturn 0;$

-:104: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#104: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:631:
+ ^Ireturn 0;$

-:104: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#104: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:631:
+ ^Ireturn 0;$

-:163: ERROR:TRAILING_WHITESPACE: trailing whitespace
#163: FILE: drivers/gpu/drm/i915/i915_sysfs.c:299:
+ $

-:163: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#163: FILE: drivers/gpu/drm/i915/i915_sysfs.c:299:
+ $

total: 2 errors, 3 warnings, 0 checks, 128 lines checked


