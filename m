Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	SUBJECT_NEEDS_ENCODING,SUBJ_ILLEGAL_CHARS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCD9C433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 14:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D687D221EC
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 14:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D687D221EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7E06E0EB;
	Mon, 11 Jan 2021 14:54:29 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3046E0EB;
 Mon, 11 Jan 2021 14:54:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23560234-1500050 for multiple; Mon, 11 Jan 2021 14:54:26 +0000
MIME-Version: 1.0
In-Reply-To: <161037673549.25135.10724540793887363649@emeril.freedesktop.org>
References: <X/xMdcewtft7+QFM@mwanda>
 <161037673549.25135.10724540793887363649@emeril.freedesktop.org>
Subject: Re: [Intel-gfx] ✗ Fi.CI.BUILD: failure for drm/i915/selftests: Fix some error codes (rev2)
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Patchwork <patchwork@emeril.freedesktop.org>, intel-gfx@lists.freedesktop.org
Date: Mon, 11 Jan 2021 14:54:23 +0000
Message-ID: <161037686369.28181.18246181673451896020@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Patchwork (2021-01-11 14:52:15)
> == Series Details ==
> 
> Series: drm/i915/selftests: Fix some error codes (rev2)
> URL   : https://patchwork.freedesktop.org/series/85704/
> State : failure
> 
> == Summary ==
> 
> Applying: drm/i915: selftest_lrc: Fix error code in live_preempt_user()
> Using index info to reconstruct a base tree...
> M       drivers/gpu/drm/i915/gt/selftest_lrc.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/gpu/drm/i915/gt/selftest_lrc.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/selftest_lrc.c

Don't worry; I've applied the patch manually and pushed.

Thanks,
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
