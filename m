Return-Path: <SRS0=RkM0=MZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F051C4338F
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Aug 2021 13:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B185360EFF
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Aug 2021 13:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B185360EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E706E0E5;
	Mon,  2 Aug 2021 13:28:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 40C116E0E5;
 Mon,  2 Aug 2021 13:28:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 397D5A73C7;
 Mon,  2 Aug 2021 13:28:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Desmond Cheong Zhi Xi" <desmondcheongzx@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 02 Aug 2021 13:28:47 -0000
Message-ID: <162791092721.3902.10714610190952381857@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210802105957.77692-1-desmondcheongzx@gmail.com>
In-Reply-To: <20210802105957.77692-1-desmondcheongzx@gmail.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_locking/lockdep=2C_drm=3A_apply_new_lockdep_assert_in_drm?=
 =?utf-8?q?=5Fauth=2Ec?=
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

Series: locking/lockdep, drm: apply new lockdep assert in drm_auth.c
URL   : https://patchwork.freedesktop.org/series/93304/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
60bc4f495a48 locking/lockdep: Provide lockdep_assert{, _once}() helpers
-:30: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#30: FILE: include/linux/lockdep.h:309:
+#define lockdep_assert(cond)		\
+	do { WARN_ON(debug_locks && !(cond)); } while (0)

-:37: WARNING:SINGLE_STATEMENT_DO_WHILE_MACRO: Single statement macros should not use a do {} while (0) loop
#37: FILE: include/linux/lockdep.h:312:
+#define lockdep_assert_once(cond)	\
+	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)

-:81: CHECK:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email comments mismatch: 'From: Peter Zijlstra <peterz@infradead.org>' != 'Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>'

total: 0 errors, 2 warnings, 1 checks, 58 lines checked
e5ac42473801 drm: add lockdep assert to drm_is_current_master_locked


