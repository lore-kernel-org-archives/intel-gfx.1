Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82241C63777
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 21:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA95B206A5
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 21:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA95B206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9226E8A1;
	Mon, 30 Nov 2020 21:11:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AF886E89B;
 Mon, 30 Nov 2020 21:11:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4F3C1A0BCB;
 Mon, 30 Nov 2020 21:11:14 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Mon, 30 Nov 2020 21:11:14 -0000
Message-ID: <160677067432.10641.11540516464456898367@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201130131910.9412-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201130131910.9412-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/5=5D_drm/i915/gt=3A_Add_an_insert?=
 =?utf-8?q?=5Fentry_for_gen8=5Fppgtt?=
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

Series: series starting with [1/5] drm/i915/gt: Add an insert_entry for gen8_ppgtt
URL   : https://patchwork.freedesktop.org/series/84406/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
1c46e6988161 drm/i915/gt: Add an insert_entry for gen8_ppgtt
9faed65cd732 drm/i915/gt: Add a routine to iterate over the pagetables of a GTT
cdb5b864f376 drm/i915/gt: Export the pinned context constructor
e4efd4ff4c9e drm/i915/gt: Pipelined page migration
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

-:255: CHECK:SPACING: spaces preferred around that '/' (ctx:WxV)
#255: FILE: drivers/gpu/drm/i915/gt/intel_migrate.c:198:
+	pkt = min_t(int, pkt, (ring->size - ring->emit) /sizeof(u32) - 6);
 	                                                ^

-:271: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!hdr"
#271: FILE: drivers/gpu/drm/i915/gt/intel_migrate.c:214:
+		if (hdr == NULL) {

-:277: CHECK:SPACING: spaces preferred around that '/' (ctx:WxV)
#277: FILE: drivers/gpu/drm/i915/gt/intel_migrate.c:220:
+			pkt = min_t(int, pkt, (ring->size - ring->emit) /sizeof(u32) - 6);
 			                                                ^

total: 0 errors, 1 warnings, 3 checks, 599 lines checked
d38f43a8ebcc drm/i915/gt: Pipelined clear


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
