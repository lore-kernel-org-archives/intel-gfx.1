Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA7C4167B
	for <intel-gfx@archiver.kernel.org>; Sun, 26 Nov 2023 20:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFDF10E032;
	Sun, 26 Nov 2023 20:50:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69F4610E032;
 Sun, 26 Nov 2023 20:50:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 54126A0093;
 Sun, 26 Nov 2023 20:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Date: Sun, 26 Nov 2023 20:50:12 -0000
Message-ID: <170103181231.9025.11950253403578949607@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <202311201406.2022ca3f-oliver.sang@intel.com>
In-Reply-To: <202311201406.2022ca3f-oliver.sang@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_0ede61d858=3A_will-it-scale=2Eper=5Fthread=5Fops_-2=2E9=25_?=
 =?utf-8?q?regression?=
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

Series: 0ede61d858: will-it-scale.per_thread_ops -2.9% regression
URL   : https://patchwork.freedesktop.org/series/126899/
State : warning

== Summary ==

Error: dim checkpatch failed
e2225568ae06 0ede61d858: will-it-scale.per_thread_ops -2.9% regression
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
On Sun, 19 Nov 2023 at 23:11, kernel test robot <oliver.sang@intel.com> wrote:

-:13: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU")'
#13: 
> commit: 0ede61d8589cc2d93aa78230d74ac58b5b8d0244 ("file: convert to SLAB_TYPESAFE_BY_RCU")

-:107: CHECK:SPACING: spaces preferred around that '&' (ctx:VxV)
#107: FILE: fs/file.c:968:
+		fdentry = fdt->fd + (fd&mask);
 		                       ^

-:202: CHECK:SPACING: spaces preferred around that '&' (ctx:VxV)
#202: FILE: include/linux/fdtable.h:95:
+	needs_masking = rcu_dereference_raw(fdt->fd[fd&mask]);
 	                                              ^

-:206: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 2 errors, 1 warnings, 2 checks, 104 lines checked


