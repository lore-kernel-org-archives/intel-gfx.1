Return-Path: <SRS0=vegk=G3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD573C433E0
	for <intel-gfx@archiver.kernel.org>; Sun, 24 Jan 2021 14:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FF422CB1
	for <intel-gfx@archiver.kernel.org>; Sun, 24 Jan 2021 14:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69FF422CB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3CC89DFA;
	Sun, 24 Jan 2021 14:16:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBEEC89E33;
 Sun, 24 Jan 2021 14:16:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D4D78A363D;
 Sun, 24 Jan 2021 14:16:22 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Sun, 24 Jan 2021 14:16:22 -0000
Message-ID: <161149778283.10312.2847444928490337915@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210124135406.28756-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210124135406.28756-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_drm/i915=3A_Remove_guard_page_insertio?=
 =?utf-8?q?n_around_unevictable_nodes_=28rev2=29?=
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

Series: series starting with drm/i915: Remove guard page insertion around unevictable nodes (rev2)
URL   : https://patchwork.freedesktop.org/series/86220/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d8da1202f742 drm/i915: Remove guard page insertion around unevictable nodes
-:58: ERROR:CODE_INDENT: code indent should use tabs where possible
#58: FILE: drivers/gpu/drm/i915/i915_vma.h:290:
+^I       ^Inode->color == color;$

-:58: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#58: FILE: drivers/gpu/drm/i915/i915_vma.h:290:
+^I       ^Inode->color == color;$

total: 1 errors, 1 warnings, 0 checks, 50 lines checked
ef937ce200af drm/i915/gt: Always try to reserve GGTT address 0x0


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
