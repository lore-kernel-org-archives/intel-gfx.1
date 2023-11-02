Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC50C4167B
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Nov 2023 17:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3141B10E968;
	Thu,  2 Nov 2023 17:33:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88A8610E968;
 Thu,  2 Nov 2023 17:33:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 820F5AADD6;
 Thu,  2 Nov 2023 17:33:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Date: Thu, 02 Nov 2023 17:33:06 -0000
Message-ID: <169894638652.28157.11935627979201246481@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025-debugobjects_fix-v3-1-2bc3bf7084c2@intel.com>
In-Reply-To: <20231025-debugobjects_fix-v3-1-2bc3bf7084c2@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_debugobjects=3A_stop_accessing_objects_after_releasing_spin?=
 =?utf-8?q?lock_=28rev4=29?=
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

Series: debugobjects: stop accessing objects after releasing spinlock (rev4)
URL   : https://patchwork.freedesktop.org/series/124185/
State : warning

== Summary ==

Error: dim checkpatch failed
d3d4d06720a6 debugobjects: stop accessing objects after releasing spinlock
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
2. Other thread frees debugobject, then allocates new one on the same memory

-:88: WARNING:LIKELY_MISUSE: nested (un)?likely() calls, IS_ERR already uses unlikely() internally
#88: FILE: lib/debugobjects.c:715:
+	} else if (likely(!IS_ERR(obj))) {

-:384: CHECK:SPACING: No space is necessary after a cast
#384: FILE: lib/debugobjects.c:992:
+						   (void *) oaddr, o.state);

total: 0 errors, 2 warnings, 1 checks, 350 lines checked


