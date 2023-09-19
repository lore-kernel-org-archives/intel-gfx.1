Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E65CE79A9
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Sep 2023 16:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9A310E143;
	Tue, 19 Sep 2023 16:12:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C739310E13B;
 Tue, 19 Sep 2023 16:12:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C05EBA73C7;
 Tue, 19 Sep 2023 16:12:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Wilcox" <willy@infradead.org>
Date: Tue, 19 Sep 2023 16:12:46 -0000
Message-ID: <169513996676.3667.11418695108092348576@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <4857570.31r3eYUQgx@natalenko.name>
In-Reply-To: <4857570.31r3eYUQgx@natalenko.name>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Panic_in_gen8=5Fggtt=5Finsert=5Fentries=28=29_with_v6=2E5?=
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

Series: Panic in gen8_ggtt_insert_entries() with v6.5
URL   : https://patchwork.freedesktop.org/series/123922/
State : warning

== Summary ==

Error: dim checkpatch failed
9c7e506f4584 Panic in gen8_ggtt_insert_entries() with v6.5
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
> Andrzej asked me to try to revert commits 0b62af28f249, e0b72c14d8dc and 1e0877d58b1e, and reverting those fixed the i915 crash for me. The e0b72c14d8dc and 1e0877d58b1e commits look like just prerequisites, so I assume 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch") is the culprit here.

-:7: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")'
#7: 
> Andrzej asked me to try to revert commits 0b62af28f249, e0b72c14d8dc and 1e0877d58b1e, and reverting those fixed the i915 crash for me. The e0b72c14d8dc and 1e0877d58b1e commits look like just prerequisites, so I assume 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch") is the culprit here.

-:21: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")'
#21: 
direction; 0b62af28f249 is a prerequisite for the later two cleanups,

-:48: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#48: FILE: drivers/gpu/drm/i915/gem/i915_gem_shmem.c:155:
+		nr_pages = min_t(unsigned long,
+				folio_nr_pages(folio), page_count - i);

-:69: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 3 errors, 1 warnings, 1 checks, 32 lines checked


