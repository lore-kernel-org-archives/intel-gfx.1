Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE72BC433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 09:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A4A61056
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 09:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7A4A61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5B86E454;
	Tue, 14 Sep 2021 09:31:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FDAF6E453;
 Tue, 14 Sep 2021 09:31:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 391DCA01BB;
 Tue, 14 Sep 2021 09:31:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Zijlstra" <peterz@infradead.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 14 Sep 2021 09:31:10 -0000
Message-ID: <163161187021.3455.14427323980906484470@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_kernel/locking=3A_Add_context_to_ww=5Fmutex=5Ftrylock=2E_?=
 =?utf-8?b?KHJldjQp?=
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

Series: kernel/locking: Add context to ww_mutex_trylock. (rev4)
URL   : https://patchwork.freedesktop.org/series/94437/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
3e5b7ed1e30d kernel/locking: Add context to ww_mutex_trylock.
-:9: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#9: 
> > + * ww_mutex_trylock - tries to acquire the w/w mutex with optional acquire context

-:144: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#144: FILE: include/linux/ww_mutex.h:340:
+extern int __must_check ww_mutex_trylock(struct ww_mutex *lock,

-:217: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'a' - possible side-effects?
#217: FILE: kernel/locking/test-ww_mutex.c:20:
+#define ww_acquire_init_noinject(a, b) do { \
+		ww_acquire_init((a), (b)); \
+		(a)->deadlock_inject_countdown = ~0U; \
+	} while (0)

-:372: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#372: FILE: kernel/locking/test-ww_mutex.c:625:
+	printk(KERN_INFO "Beginning ww mutex selftests\n");

-:405: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#405: FILE: kernel/locking/test-ww_mutex.c:665:
+	printk(KERN_INFO "All ww mutex selftests passed\n");

-:457: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 3 warnings, 2 checks, 332 lines checked


