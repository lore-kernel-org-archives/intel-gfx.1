Return-Path: <SRS0=l9+3=OG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D325C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 19:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F8261130
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Sep 2021 19:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9F8261130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E016E858;
	Thu, 16 Sep 2021 19:39:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 334136E834;
 Thu, 16 Sep 2021 19:39:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 29F72A01BB;
 Thu, 16 Sep 2021 19:39:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imran Khan" <imran.f.khan@oracle.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 16 Sep 2021 19:39:52 -0000
Message-ID: <163182119213.8837.14866134424441410010@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210916133535.3592491-1-imran.f.khan@oracle.com>
In-Reply-To: <20210916133535.3592491-1-imran.f.khan@oracle.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_lib=2C_stackdepot=3A_check_stackdepot_handle_before_accessi?=
 =?utf-8?q?ng_slabs_=28rev3=29?=
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

Series: lib, stackdepot: check stackdepot handle before accessing slabs (rev3)
URL   : https://patchwork.freedesktop.org/series/94696/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d7e2c22d032f lib, stackdepot: check stackdepot handle before accessing slabs.
1a68f8420ad4 lib, stackdepot: Add helper to print stack entries.
5f20e9afbc22 lib, stackdepot: Add helper to print stack entries into buffer.
-:152: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#152: FILE: include/linux/stackdepot.h:23:
+int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
+		       int spaces);

-:179: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#179: FILE: lib/stackdepot.c:231:
+int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
+		       int spaces)

total: 0 errors, 0 warnings, 2 checks, 157 lines checked


