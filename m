Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3845C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 17:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68AB764DE9
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 17:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68AB764DE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D406EC7E;
	Thu,  4 Feb 2021 17:16:40 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BAB6EC7E
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 17:16:39 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id y11so4152349otq.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 04 Feb 2021 09:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJnVO3IRTh6jLTnURSMqZt6jb+mhY21ToLMIpLkV9R4=;
 b=DhM2acIpr+HIk3JVAZvNpFn5a6f9MUwyT7EWsFy2cOKrCeHyfYQt+p5Kh7UioqqHL1
 RnHG2tXuYB5AuR4K+IbXmPhqZQSGTGKUrGAGszVMQOtsx99l6BMz9GYjtfE3rwM9WtdJ
 UXNmWYZbNjQi3TqhxNOS+LsJ7E4aexI6FMs8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJnVO3IRTh6jLTnURSMqZt6jb+mhY21ToLMIpLkV9R4=;
 b=ZT7XY4hm0r3PfxtFHcMItorTA72Pf7bziar7VADy0gm81izM8XY/VoQQ8ThF1Ucqxl
 8L5Rlvx4gKajJGdOFO7Ru7MYzzsjFYebCRg01PUpTkrMn9EsgRyYgdyPuxIafQiZQkAh
 YP4Ejy1ZQSRjqtxjAAXoqqSoCkFsNKX4QtyO+RgxJTkdAfUUbTl1fhJAjwCFvVynDzeI
 HDvULyIZo1wyGB8/jA8woFBMqPLaAhXH+l8w81Yw72aEfd3UUyxNCX+9Z/2Q5iK6Pvy1
 3ZreQo4mQMAY5wH5yWKGRe5jTbZc2k07zLZe3BQyXZc8sU+o5SAeqmOdUpxFNPR8XCy+
 rqOw==
X-Gm-Message-State: AOAM531M/Fk/9QG84DYZqlwbWVsyQXsVdoRwpzPImIa5ek+2mZmwpJrm
 zIATRq/9FQqxdCvsh6u/k9uFLzTl4z8U7EzMb3YH7g==
X-Google-Smtp-Source: ABdhPJwAkGg4N4y18wGDr+SCd9/HnouTpio3RzotUFP5dy6ZXX80lPrKik+UQ1LGNd1ps7C62WHTl9aITStWc16IyCk=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr236633otr.303.1612458998103; 
 Thu, 04 Feb 2021 09:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
In-Reply-To: <20210204161339.GX4718@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 4 Feb 2021 18:16:27 +0100
Message-ID: <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [Intel-gfx] [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for
 mmap
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 5:13 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Wed, Feb 03, 2021 at 10:19:48PM +0100, Daniel Vetter wrote:
> > tldr; DMA buffers aren't normal memory, expecting that you can use
> > them like that (like calling get_user_pages works, or that they're
> > accounting like any other normal memory) cannot be guaranteed.
> >
> > Since some userspace only runs on integrated devices, where all
> > buffers are actually all resident system memory, there's a huge
> > temptation to assume that a struct page is always present and useable
> > like for any more pagecache backed mmap. This has the potential to
> > result in a uapi nightmare.
> >
> > To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
> > blocks get_user_pages and all the other struct page based
> > infrastructure for everyone. In spirit this is the uapi counterpart to
> > the kernel-internal CONFIG_DMABUF_DEBUG.
>
> Fast gup needs the special flag set on the PTE as well.. Feels weird
> to have a special VMA without also having special PTEs?

There's kinda no convenient & cheap way to check for the pte_special
flag. This here should at least catch accidental misuse, people
building their own ptes we can't stop. Maybe we should exclude
VM_MIXEDMAP to catch vm_insert_page in one of these.

Hm looking at code I think we need to require VM_PFNMAP here to stop
vm_insert_page. And looking at the various functions, that seems to be
required (and I guess VM_IO is more for really funky architectures
where io-space is somewhere else?). I guess I should check for
VM_PFNMAP instead of VM_SPECIAL?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
