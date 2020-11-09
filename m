Return-Path: <SRS0=npFd=EP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAC0C2D0A3
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 11:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E543B206ED
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2020 11:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E543B206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1486789973;
	Mon,  9 Nov 2020 11:28:11 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E16A89973
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2020 11:28:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22936748-1500050 for multiple; Mon, 09 Nov 2020 11:28:05 +0000
MIME-Version: 1.0
In-Reply-To: <20201109111249.109365-1-matthew.auld@intel.com>
References: <20201109111249.109365-1-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 09 Nov 2020 11:28:04 +0000
Message-ID: <160492128460.23251.2174972599366119546@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/region: fix order when adding
 blocks
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

Quoting Matthew Auld (2020-11-09 11:12:49)
> When performing an allocation we try split it down into the largest
> possible power-of-two blocks/pages-sizes, and for the common case we
> expect to allocate the blocks in descending order. This also naturally
> fits with our GTT alignment tricks(including the hugepages selftest),
> where we sometimes try to align to the largest possible GTT page-size
> for the allocation, in the hope that translates to bigger GTT
> page-sizes. Currently, we seem to incorrectly add the blocks in the
> opposite order, which is definitely not the intended behaviour.

Right, so currently we end up with small -> large blocks, and you want
to change it so that we use large -> small blocks, because we want to
keep things aligned for as long as possible (if we start small, we
immediately spoil the alignment provided for us).

How can we test this? Create a 2MiB + 4KiB object and ask if
page_sizes.gtt has a 2MiB? I don't think it can be directly observed
from userspace, right? Is it possible to generalise the characteristic
we expect and prevent future errors?
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
