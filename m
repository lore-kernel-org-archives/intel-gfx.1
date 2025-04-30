Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785EEC369D9
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Apr 2025 07:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F34B10E292;
	Wed, 30 Apr 2025 07:02:05 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DC610E291;
 Wed, 30 Apr 2025 07:02:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Re=3A_=5BPATCH_v3_3/6=5D_?=
 =?utf-8?q?mm=3A_shmem=3A_add_large_folio_support_for_tmpfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Baolin Wang" <baolin.wang@linux.alibaba.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 30 Apr 2025 07:02:04 -0000
Message-ID: <174599652402.28403.8868794947090395775@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1732779148.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1732779148.git.baolin.wang@linux.alibaba.com>
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

Series: Re: [PATCH v3 3/6] mm: shmem: add large folio support for tmpfs
URL   : https://patchwork.freedesktop.org/series/148465/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/148465/revisions/1/mbox/ not applied
Applying: mm: shmem: add large folio support for tmpfs
error: git diff header lacks filename information when removing 1 leading pathname component (line 2)
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 mm: shmem: add large folio support for tmpfs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


