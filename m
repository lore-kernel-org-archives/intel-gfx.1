Return-Path: <SRS0=yb3L=EI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BA5C00A89
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2020 14:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C3120679
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2020 14:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iCGmG442"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C3120679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301156E517;
	Mon,  2 Nov 2020 14:21:30 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9636E492;
 Mon,  2 Nov 2020 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=chyZPXcPEyftbKLXMlXQpUobVD4NM6uuWUEYM6jzZNM=; b=iCGmG442EfucMcTK1LSK+U23GI
 kMK1F9AjY28qTha7x5hJJWoFArFEjstM3urLt9nLcDk/17d2cNV6bjwO+kHKthVN+rTGnALJ66FOo
 CjUEPX3ceQvSm4Gir7JtoBKIjlEP2GMhqQInBZ5w+iuj0kJD5MNpYoj1/7V+vvilMxP16XCXytVka
 jrPgzILWDbTyoE8zYtXJMv2DVPBoACIgO4c2ioi3l6zUagyPPhu6MrXtMMAkmbS1YmOe7mCn+GD+2
 RfUToqhXuJ8DKaLLrkViO/1EKjPt9GTAnJsS6i2DCMNANIH47yryu1tmabxC/M9PUf+pmn8JGzDJH
 KBuKDK+g==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kZX3P-0007Ua-Em; Mon, 02 Nov 2020 10:27:11 +0000
Date: Mon, 2 Nov 2020 10:27:11 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20201102102711.GA28511@infradead.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
 <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 02 Nov 2020 14:21:29 +0000
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the
 drm-misc tree
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Joerg Roedel <jroedel@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@infradead.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian K??nig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 10:28:34AM +0100, Daniel Vetter wrote:
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -5,6 +5,9 @@
> >  #include <linux/dma-direction.h>
> >  #include <linux/init.h>
> >  #include <linux/types.h>
> > +#ifndef CONFIG_SWIOTLB
> > +#include <linux/limits.h>
> > +#endif

No conditional includes please.  And the proper fix for the reported
issue is to stop poking into swiotlb internals in random drivers..
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
