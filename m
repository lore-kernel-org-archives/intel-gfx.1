Return-Path: <SRS0=0qc7=C7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2677C4363D
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2020 14:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7766E2395C
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2020 14:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uqlDPU6S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7766E2395C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F366E899;
	Tue, 22 Sep 2020 14:53:47 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE6E6E899;
 Tue, 22 Sep 2020 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PwB7PgSBMCf1i80JEZZeqaAM6Spcvmy9ewYyeFjPsVI=; b=uqlDPU6SPAe3x1DDKo8G1qtut1
 YwG3PA4mc8CLJ1oJyPiko0/UbU5ybdUeleXBeV8YHEyvVNYLAMBaj9YGVnr8/JyuAmcKGkiiTdejs
 bVQysHpa55j4+LiObyETCdlPouw9Nwil/VnTPyLQvh9hBrpeU/Wmc3llTMeW/vjL27ShndfDs1p17
 1HtwFHqpD+N1OhT15+cuZIdFzM2p+uhSCE063YoA7faH9tQzfuFItic4W+TEbWs9VLsTKgtP5hMCZ
 z1+P1JChn7/bURfHcxuqNO0QLmQHNZ4osoavXcBcFeMSltMsN9VNgTTTzxDcDVb8dMbZA2ChSspNL
 P4owvfJg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kKjfX-0001op-62; Tue, 22 Sep 2020 14:53:23 +0000
Date: Tue, 22 Sep 2020 15:53:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200922145323.GG32101@casper.infradead.org>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org>
 <20200922062249.GA30831@lst.de>
 <20200922112144.GB32101@casper.infradead.org>
 <20200922143906.GB26664@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922143906.GB26664@lst.de>
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 04:39:06PM +0200, Christoph Hellwig wrote:
> On Tue, Sep 22, 2020 at 12:21:44PM +0100, Matthew Wilcox wrote:
> > Actually, vfree() will work today; I cc'd you on a documentation update
> > to make it clear that this is permitted.
> 
> vfree calls __free_pages, the i915 and a lot of other code calls
> put_page.  They are mostly the same, but not quite and everytime I
> look into that mess I'm more confused than before.
> 
> Can someone in the know write sensible documentation on when to use
> __free_page(s) vs put_page?

I started on that, and then I found a bug that's been lurking for 12
years, so that delayed the documentation somewhat.  The short answer is
that __free_pages() lets you free non-compound high-order pages while
put_page() can only free order-0 and compound pages.

I would really like to overhaul our memory allocation APIs:

current			new
__get_free_page(s)	alloc_page(s)
free_page(s)		free_page(s)
alloc_page(s)		get_free_page(s)
__free_pages		put_page_order

Then put_page() and put_page_order() are more obviously friends.

But I cannot imagine a world in which Linus says yes to that upheaval.
He's previous expressed dislike of the get_free_page() family of APIs,
and thinks all those callers should just use kmalloc().  Maybe we can
make that transition happen, now that kmalloc() aligns larger allocations.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
