Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262A4C12002
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 15:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF0061003
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 15:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF0061003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0620F6ECA9;
	Wed, 21 Jul 2021 15:41:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DEBB6ECA8;
 Wed, 21 Jul 2021 15:41:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 013F4A882E;
 Wed, 21 Jul 2021 15:41:20 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Ekstrand" <jason@jlekstrand.net>
Date: Wed, 21 Jul 2021 15:41:20 -0000
Message-ID: <162688208098.766.2698307546801668038@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210721152358.2893314-1-jason@jlekstrand.net>
In-Reply-To: <20210721152358.2893314-1-jason@jlekstrand.net>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Fix_the_debugfs_splat_from_mock_selftests_=28rev3=29?=
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

Series: Fix the debugfs splat from mock selftests (rev3)
URL   : https://patchwork.freedesktop.org/series/92729/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
b682cf540a5c drm/i915: Call i915_globals_exit() after i915_pmu_exit()
6b5175fb9124 drm/i915: Call i915_globals_exit() if pci_register_device() fails
e72dbb7e01fa drm/i915: Use a table for i915_init/exit (v2)
-:145: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#145: FILE: drivers/gpu/drm/i915/i915_pci.c:1233:
+   int (*init)(void);$

-:146: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#146: FILE: drivers/gpu/drm/i915/i915_pci.c:1234:
+   void (*exit)(void);$

-:155: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#155: FILE: drivers/gpu/drm/i915/i915_pci.c:1243:
+};
+static int init_progress;

total: 0 errors, 2 warnings, 1 checks, 197 lines checked
fde79ac95398 drm/ttm: Initialize debugfs from ttm_global_init()
d03eff83a646 drm/i915: Make the kmem slab for i915_buddy_block a global


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
