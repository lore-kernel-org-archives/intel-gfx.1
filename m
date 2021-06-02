Return-Path: <SRS0=VOyE=K4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6560C47083
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 17:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7916061C8F
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 17:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7916061C8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182B96EE04;
	Wed,  2 Jun 2021 17:03:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95AD86EE04;
 Wed,  2 Jun 2021 17:03:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8DC6DA47E2;
 Wed,  2 Jun 2021 17:03:23 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Ekstrand" <jason@jlekstrand.net>
Date: Wed, 02 Jun 2021 17:03:23 -0000
Message-ID: <162265340355.11226.16848929304059707335@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210602164149.391653-1-jason@jlekstrand.net>
In-Reply-To: <20210602164149.391653-1-jason@jlekstrand.net>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Get_rid_of_fence_error_propagation?=
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

Series: drm/i915: Get rid of fence error propagation
URL   : https://patchwork.freedesktop.org/series/90891/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
18e3ff57e304 drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"
-:6: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 686c7c35abc2 ("drm/i915/gem: Asynchronous cmdparser")'
#6: 
This reverts 686c7c35abc2 ("drm/i915/gem: Asynchronous cmdparser").  The

-:23: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 0edbb9ba1bfe ("drm/i915: Move cmd parser pinning to execbuffer")'
#23: 
This also reverts most of 0edbb9ba1bfe ("drm/i915: Move cmd parser

total: 2 errors, 0 warnings, 0 checks, 482 lines checked
0f6ab544bc55 drm/i915: Remove allow_alloc from i915_gem_object_get_sg*
-:6: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 0edbb9ba1bfe ("drm/i915: Move cmd parser pinning to execbuffer")'
#6: 
This reverts the rest of 0edbb9ba1bfe ("drm/i915: Move cmd parser

total: 1 errors, 0 warnings, 0 checks, 86 lines checked
f9732cd9968a drm/i915: Drop error handling from dma_fence_work
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 49 lines checked
afd44bdaa7c9 Revert "drm/i915: Propagate errors on awaiting already signaled fences"
-:49: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Jason Ekstrand <jason@jlekstrand.net>' != 'Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
59562703d27b Revert "drm/i915: Skip over MI_NOOP when parsing"
-:6: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit a6c5e2aea704 ("drm/i915: Skip over MI_NOOP when parsing")'
#6: 
This reverts a6c5e2aea704 ("drm/i915: Skip over MI_NOOP when parsing").

total: 1 errors, 0 warnings, 0 checks, 83 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
