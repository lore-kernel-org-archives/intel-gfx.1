Return-Path: <SRS0=WhEZ=PV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FE2C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 01:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13DB4603E8
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 01:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13DB4603E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA5A6F5D1;
	Tue,  2 Nov 2021 01:38:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 72A276F5D1;
 Tue,  2 Nov 2021 01:38:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 69484A0078;
 Tue,  2 Nov 2021 01:38:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Tue, 02 Nov 2021 01:38:32 -0000
Message-ID: <163581711239.15503.7300848857907048031@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211102012608.8609-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20211102012608.8609-1-vinay.belgaumkar@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/guc/slpc=3A_Implement_waitboost_for_SLPC_=28rev3?=
 =?utf-8?q?=29?=
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

Series: drm/i915/guc/slpc: Implement waitboost for SLPC (rev3)
URL   : https://patchwork.freedesktop.org/series/96082/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
3b5f16b5d3d0 drm/i915/guc/slpc: Define and initialize boost frequency
-:13: WARNING:TYPO_SPELLING: 'accomodate' may be misspelled - perhaps 'accommodate'?
#13: 
a few lines below to accomodate this.
                     ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 155 lines checked
3bbcbcb0adb5 drm/i915/guc/slpc: Add waitboost functionality for SLPC
-:89: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#89: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c:453:
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
+

total: 0 errors, 0 warnings, 1 checks, 99 lines checked
7c77538083a4 drm/i915/guc/slpc: Update boost sysfs hooks for SLPC


