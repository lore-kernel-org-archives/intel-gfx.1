Return-Path: <SRS0=bDtt=DG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3F1C4346E
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 08:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D5420739
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 08:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D5420739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27B689D46;
	Tue, 29 Sep 2020 08:24:00 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B676789D46
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 08:23:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22564106-1500050 for multiple; Tue, 29 Sep 2020 09:23:37 +0100
MIME-Version: 1.0
In-Reply-To: <160136751431.9258.5367116987368823201@jlahtine-mobl.ger.corp.intel.com>
References: <CAOMV6SUP1=U3bqO=+f_HrnTYpaLLwvZY4muCdW-ixQU2M10_WQ@mail.gmail.com>
 <160136751431.9258.5367116987368823201@jlahtine-mobl.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tony Fischetti <tony.fischetti@gmail.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 linux-kernel@vger.kernel.org, peterx@redhat.com, rodrigo.vivi@intel.com
Date: Tue, 29 Sep 2020 09:23:41 +0100
Message-ID: <160136782105.20502.13725312236043545047@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] REGRESSION: in intel video driver following
 introduction of mm_struct.has_pinned
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Joonas Lahtinen (2020-09-29 09:18:34)
> (+ intel-gfx for being i915 related)
> (+ Chris who has looked into the issue)
> 
> Hi,
> 
> Thanks for reporting!

Fixed in commit a4d63c3732f1a0c91abcf5b7f32b4ef7dcd82025
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Mon Sep 28 12:35:07 2020 +0200

    mm: do not rely on mm == current->mm in __get_user_pages_locked
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
