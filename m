Return-Path: <SRS0=pmG3=KF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BF5C43460
	for <intel-gfx@archiver.kernel.org>; Mon, 10 May 2021 08:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310AC6144E
	for <intel-gfx@archiver.kernel.org>; Mon, 10 May 2021 08:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 310AC6144E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B535C89D81;
	Mon, 10 May 2021 08:58:28 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9DE89D81;
 Mon, 10 May 2021 08:58:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5AF7367373; Mon, 10 May 2021 10:58:23 +0200 (CEST)
Date: Mon, 10 May 2021 10:58:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: youling257 <youling257@gmail.com>
Message-ID: <20210510085823.GA1466@lst.de>
References: <20210326055505.1424432-5-hch@lst.de>
 <20210508193329.28394-1-youling257@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210508193329.28394-1-youling257@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the
 pgprot
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
Cc: peterz@infradead.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linux-mm@kvack.org, akpm@linux-foundation.org,
 hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, May 09, 2021 at 03:33:29AM +0800, youling257 wrote:
> This patch cause "x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x064a2000-0x064a2fff], got write-back" problem.
> my 2GB ram Bay trail z3735f tablet runing on android-x86, "i915: fix remap_io_sg to verify the pgprot" cause this problem.

So this is the memtype verification added by the patch, meaning that the
old code did in fact not call into track_pfn_remap with the right flags.

Can the i915 maintainers take a look at making sure the page permissions
here make sense?
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
