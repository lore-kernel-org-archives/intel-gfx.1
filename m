Return-Path: <SRS0=beGZ=OK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BE3C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 18:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A6FB60EE4
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 18:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A6FB60EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC706E7D3;
	Mon, 20 Sep 2021 18:59:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3D5B6E7D0;
 Mon, 20 Sep 2021 18:59:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CB2A5A008A;
 Mon, 20 Sep 2021 18:59:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 20 Sep 2021 18:59:12 -0000
Message-ID: <163216435280.25898.9972458024919836533@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210920155914.707984-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210920155914.707984-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Suspend_/_resume_backup-_and_restore_of_LMEM=2E?=
 =?utf-8?q?_=28rev6=29?=
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

Series: drm/i915: Suspend / resume backup- and restore of LMEM. (rev6)
URL   : https://patchwork.freedesktop.org/series/94278/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5fe8cae9d0ac drm/i915/ttm: Implement a function to copy the contents of two TTM-based objects
c446f298a66d drm/i915/gem: Implement a function to process all gem objects of a region
1a68e6875e24 drm/i915 Implement LMEM backup and restore for suspend / resume
-:287: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#287: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 459 lines checked
aa022e1a6969 drm/i915/gt: Register the migrate contexts with their engines
cc2f68116763 drm/i915: Don't back up pinned LMEM context images and rings during suspend
c222b6056f94 drm/i915: Reduce the number of objects subject to memcpy recover


