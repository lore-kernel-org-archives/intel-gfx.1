Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D03C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 15:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B142311C
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 15:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B142311C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1926E45D;
	Tue, 26 Jan 2021 15:13:02 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826A289D8E;
 Tue, 26 Jan 2021 15:13:00 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23704930-1500050 for multiple; Tue, 26 Jan 2021 15:12:54 +0000
MIME-Version: 1.0
In-Reply-To: <20210126150155.1617-1-kernel@esmil.dk>
References: <20210126150155.1617-1-kernel@esmil.dk>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Emil Renner Berthing <kernel@esmil.dk>, intel-gfx@lists.freedesktop.org
Date: Tue, 26 Jan 2021 15:12:56 +0000
Message-ID: <161167397638.2943.18167940013400200979@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/gt: use new tasklet API for
 execution list
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Emil Renner Berthing (2021-01-26 15:01:55)
> This converts the driver to use the new tasklet API introduced in
> commit 12cc923f1ccc ("tasklet: Introduce new initialization API")
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> 
> ---
> v2: Rebased on drm-intel-next

Ta. Saves me having to do the fixup.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Will be applied to drm-intel-gt-next which is scheduled for inclusion in
5.13. It should apply against the 5.12 merge window if there's a tree
through which you want to migrate the tasklet API faster.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
