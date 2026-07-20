Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2330DC4451B
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Jul 2026 06:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A542210E671;
	Mon, 20 Jul 2026 06:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USQeOm2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338A810E671;
 Mon, 20 Jul 2026 06:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784527265; x=1816063265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xEaD3aGKmDLiA+8sOs27dPA7EW7rldz/03PBZ7WqK8Y=;
 b=USQeOm2ZUAN89Bh73jMA2HvLkmANYO9c5JQC79zULa6FIOcXahF937pD
 V/4Cdc1uv4CwOOdlzzGPLhdtHw8SJD6pnjfU8CFIs1QXsB4cWeNVnEXiu
 cgNR3Tb0pkt/zRETG/tDjN2tpOiSc3y+YegrPRhcGlUbw4dlBAkwGovHY
 gbCjEd1EfMUTiXBB2RC7DkBqsneNvDKA409/nEkrHPKVg7/Bw0zCk+SPf
 deiHRwC9JUHhGZyzxdPLHFZDeqZK1AHYUVyS4CHdSuNO7227M1rN4V8yV
 vz3h9CYuUeKQ9QX1OKBZY/LsrOOgmzdKtO9VMrWeuFaLc2QEFxp0kIqxO w==;
X-CSE-ConnectionGUID: nqePr3NiRVKRqen15bEbkw==
X-CSE-MsgGUID: Xx23sYm7QM2J9P3qUdD0dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95457751"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="95457751"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:01:04 -0700
X-CSE-ConnectionGUID: RJdlLC8lSgGIftGeH8MENQ==
X-CSE-MsgGUID: 0kT/jEl1T8Odn33kxcJ5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="262327682"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.94])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:01:01 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/igt_store: Fix unexpected reuse of allocated offset
Date: Mon, 20 Jul 2026 07:59:10 +0200
Message-ID: <20260720055919.1945692-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

CI was extremely sporadically (once a month or two) reporting an issue
with unexpected premature completion of a spin supposed to be still
running.  It occurred possible to reproduce the issue in a few hours by
running the test in a loop on one of affected platforms.

Having a closer look at the logs, it became clear that the test was
blocking somewhere before the check for the spin still busy, and the spin
was meanwhile aborted by a request watchdog timer after a default period
of 20s of its activity.

Deeper debugging revealed that one of the test subprocesses was trying to
evict a VMA and was waiting infinitely for its idleness.  Since the scope
of affected platforms was limited to Gen12, where no kernel side
relocations are used, Chris suggested that must have been a userspace bug,
i.e., the test was apparently providing conflicting object offsets.
Further analysis also shown that the main process of the test was looping
infinitely around a page fault that occurred by reading another, mmapped
GEM object shared with subprocesses, apparently locked by the subprocess
waiting on eviction.

Based on all those observations, Zbigniew noticed incorrect use of
intel_allocator library, leading to unexpected reuse of a just closed
object handle, and its already allocated offset, by another child process
before the allocator drops a link of the offset to the handle.  That
theory was then confirmed by:
a) forcing a single fixed offset to be used by each child process, which
   resulted in immediate reproduction of the issue on first attempt, and
b) extending a potential race window by introducing a short delay between
   GEM closing the object of the VMA and the allocator forgetting the link
   between its handle and offset, which also resulted in prompt
   reproduction of the issue.

Close the race window by reordering those two cleanup operations inside an
IGT store function: call put_offset() first, then gem_close(), so other
test processes have no chance to pick up the same offset when reusing the
just closed GEM object handle.

Correctness of the proposed solution was confirmed by running the fixed
test in a loop for 12 hours with no issues.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15263
Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_store.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_store.c b/lib/igt_store.c
index 42ffdc5cdb..ce29355c3d 100644
--- a/lib/igt_store.c
+++ b/lib/igt_store.c
@@ -95,6 +95,6 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 	batch[++i] = MI_BATCH_BUFFER_END;
 	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
 	gem_execbuf(fd, &execbuf);
-	gem_close(fd, obj[BATCH].handle);
 	put_offset(ahnd, obj[BATCH].handle);
+	gem_close(fd, obj[BATCH].handle);
 }
-- 
2.54.0

