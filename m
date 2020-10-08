Return-Path: <SRS0=1MTx=DP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EBDC4363A
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2020 15:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE7A20739
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2020 15:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE7A20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5B36EA82;
	Thu,  8 Oct 2020 15:45:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ADEE6EA7B;
 Thu,  8 Oct 2020 15:45:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3736BA0019;
 Thu,  8 Oct 2020 15:45:55 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Thu, 08 Oct 2020 15:45:55 -0000
Message-ID: <160217195522.11035.12824305262810091896@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201008095436.27743-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201008095436.27743-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLlNQQVJTRTogd2FybmluZyBmb3Ig?=
 =?utf-8?q?drm/i915=3A_Exclude_low_pages_=28128KiB=29_of_stolen_from_use_?=
 =?utf-8?b?KHJldjMp?=
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

Series: drm/i915: Exclude low pages (128KiB) of stolen from use (rev3)
URL   : https://patchwork.freedesktop.org/series/82443/
State : warning

== Summary ==

$ dim sparse --fast origin/drm-tip
Sparse version: v0.6.2
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/gt/selftest_reset.c:132:20:    expected void *in
+drivers/gpu/drm/i915/gt/selftest_reset.c:132:20:    got void [noderef] __iomem *[assigned] s
+drivers/gpu/drm/i915/gt/selftest_reset.c:132:20: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/i915/gt/selftest_reset.c:133:46:    expected void const *src
+drivers/gpu/drm/i915/gt/selftest_reset.c:133:46:    got void [noderef] __iomem *[assigned] s
+drivers/gpu/drm/i915/gt/selftest_reset.c:133:46: warning: incorrect type in argument 2 (different address spaces)
+drivers/gpu/drm/i915/gt/selftest_reset.c:94:34:    expected unsigned int [usertype] *s
+drivers/gpu/drm/i915/gt/selftest_reset.c:94:34:    got void [noderef] __iomem *[assigned] s
+drivers/gpu/drm/i915/gt/selftest_reset.c:94:34: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/i915/gt/selftest_reset.c:96:20:    expected void *in
+drivers/gpu/drm/i915/gt/selftest_reset.c:96:20:    got void [noderef] __iomem *[assigned] s
+drivers/gpu/drm/i915/gt/selftest_reset.c:96:20: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/i915/gt/selftest_reset.c:97:46:    expected void const *src
+drivers/gpu/drm/i915/gt/selftest_reset.c:97:46:    got void [noderef] __iomem *[assigned] s
+drivers/gpu/drm/i915/gt/selftest_reset.c:97:46: warning: incorrect type in argument 2 (different address spaces)


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
