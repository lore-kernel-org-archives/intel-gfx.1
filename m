Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29868C28B20
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Apr 2025 15:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7DE10E819;
	Wed,  2 Apr 2025 15:48:23 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63ABF10E80B;
 Wed,  2 Apr 2025 15:48:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Remove_aops-=3Ewritepage_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 02 Apr 2025 15:48:22 -0000
Message-ID: <174360890240.28365.3683089606394966451@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402150005.2309458-1-willy@infradead.org>
In-Reply-To: <20250402150005.2309458-1-willy@infradead.org>
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

Series: Remove aops->writepage (rev2)
URL   : https://patchwork.freedesktop.org/series/145995/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/145995/revisions/2/mbox/ not applied
Applying: 9p: Add a migrate_folio method
Applying: vboxsf: Convert to writepages
Applying: migrate: Remove call to ->writepage
Applying: writeback: Remove writeback_use_writepage()
Applying: shmem: Add shmem_writeout()
Applying: i915: Use writeback_iter()
Applying: ttm: Call shmem_writeout() from ttm_backup_backup_page()
Applying: mm: Remove swap_writepage() and shmem_writepage()
error: sha1 information is lacking or useless (mm/shmem.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0008 mm: Remove swap_writepage() and shmem_writepage()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


