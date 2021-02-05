Return-Path: <SRS0=PZs0=HH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071CFC433E0
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 13:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A0B864F6C
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 13:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A0B864F6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF52D6E165;
	Fri,  5 Feb 2021 13:33:52 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9013E6E165
 for <intel-gfx@lists.freedesktop.org>; Fri,  5 Feb 2021 13:33:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23798191-1500050 for multiple; Fri, 05 Feb 2021 13:33:48 +0000
MIME-Version: 1.0
In-Reply-To: <20210205003310.282664-1-sagar.ghuge@intel.com>
References: <20210205003310.282664-1-sagar.ghuge@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Sagar Ghuge <sagar.ghuge@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 05 Feb 2021 13:33:47 +0000
Message-ID: <161253202745.17965.9984860116785355664@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/icl,
 tgl: whitelist COMMON_SLICE_CHICKEN3 register
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

Quoting Sagar Ghuge (2021-02-05 00:33:10)
> Adding this register to whitelist will allow UMD to toggle State Cache
> Perf fix disable chicken bit.
> 
>    "If this bit is enabled, RCC uses BTP+BTI as address tag in its state
>    cache instead of BTI only"
> 
> which will lead to dropping unnecessary render target flushes and stall
> on scoreboard.

The rest of the register looks safe to expose, and it passes our sanity
checks that the register is local to the context and should not affect
others.

> Bspec: 11333
> Bspec: 45829
> 
> Signed-off-by: Sagar Ghuge <sagar.ghuge@intel.com>

Acked-by: Chris Wilson <chris@chris-wilson.co.uk>

The only missing piece of the puzzle that Joonas will require is a
Link: to a reviewed userspace patch/MR to confirm the uABI.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
