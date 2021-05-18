Return-Path: <SRS0=F/h7=KN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34ADC433ED
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 13:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 824EE610CD
	for <intel-gfx@archiver.kernel.org>; Tue, 18 May 2021 13:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 824EE610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F059F6EB80;
	Tue, 18 May 2021 13:22:05 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7DB6EB70;
 Tue, 18 May 2021 13:22:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5293768B05; Tue, 18 May 2021 15:21:57 +0200 (CEST)
Date: Tue, 18 May 2021 15:21:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <20210518132155.GB2617@lst.de>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de> <87pmxqiry6.fsf@depni.sinp.msu.ru>
 <20210517123716.GD15150@lst.de> <87lf8dik15.fsf@depni.sinp.msu.ru>
 <20210517131137.GA19451@lst.de>
 <CAM0jSHPy68kMi8NnpAO7ESVW0Ct=dhZ0kYHJO7APy-GBsNp2fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM0jSHPy68kMi8NnpAO7ESVW0Ct=dhZ0kYHJO7APy-GBsNp2fQ@mail.gmail.com>
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
Cc: Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 06:06:44PM +0100, Matthew Auld wrote:
> > Looks like it is caused by the validation failure then.  Which means the
> > existing code is doing something wrong in its choice of the page
> > protection bit.  I really need help from the i915 maintainers here..
> 
> AFAIK there are two users of remap_io_sg, the first is our shmem
> objects(see i915_gem_shmem.c), and for these we support UC, WC, and WB
> mmap modes for userspace. The other user is device local-memory
> objects(VRAM), and for this one we have an actual io_mapping which is
> allocated as WC, and IIRC this should only be mapped as WC for the
> mmap mode, but normal userspace can't hit this path yet.

The only caller in current mainline is vm_fault_cpu in i915_gem_mman.c.
Is that device local?

> What do we need to do here? It sounds like shmem backed objects are
> allocated as WB for the pages underneath, but i915 allows mapping them
> as UC/WC which trips up this track_pfn thing?

To me the warnings looks like system memory is mapped with the wrong
permissions, yes.  If you want to map it as UC/WC the right set_memory_*
needs to be used on the kernel mapping as well to ensure that the
attributes don't conflict.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
