Return-Path: <SRS0=ky/+=DA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9408C4741F
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 06:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC3F21D43
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 06:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC3F21D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32746E438;
	Wed, 23 Sep 2020 06:11:07 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343946E438;
 Wed, 23 Sep 2020 06:11:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DCEC767373; Wed, 23 Sep 2020 08:11:02 +0200 (CEST)
Date: Wed, 23 Sep 2020 08:11:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20200923061102.GA15762@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org> <20200922062249.GA30831@lst.de>
 <43d10588-2033-038b-14e4-9f41cd622d7b@linux.intel.com>
 <20200922143141.GA26637@lst.de>
 <e429c3e6-2143-f51a-4c1c-c1470076ad3e@linux.intel.com>
 <20200922163346.GA1701@lst.de>
 <1b05b9d6-a14c-85cd-0728-d0d40c9ff84b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b05b9d6-a14c-85cd-0728-d0d40c9ff84b@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Christoph Hellwig <hch@lst.de>, Nitin Gupta <ngupta@vflare.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 06:04:37PM +0100, Tvrtko Ursulin wrote:
> Only reason I can come up with now is if mapping side is on a latency 
> sensitive path, while un-mapping is lazy/delayed so can be more costly. 
> Then fast map and extra cost on unmap may make sense.

In general yes.  But compared to the overall operations a small kmalloc
is in the noise, so I'd really like to see numbers.

> It more applies to the other i915 patch, which implements a much more used 
> API, but whether or not we can demonstrate any difference in the perf 
> profiles I couldn't tell you without trying to collect some.

The other patch keeps the stack, as avoiding it would not simplify the
code as significantly.  I still doubt it is all that useful, though.


>> We could do vmalloc_to_page, but that is fairly expensive (not as bad
>> as reading from the page cache..).  Are you really worried about the
>> allocation?
>
> Not so much given how we don't even use shmem_pin_map outside selftests.
>
> If we start using it I expect it will be for tiny objects anyway. Only if 
> they end up being pinned for the lifetime of the driver, it may be a 
> pointless waste of memory compared to the downsides of vmalloc_to_page. But 
> we can revisit this particular edge case optimization if the need arises.

For tiny object we could either look into using kmap, or in fact
ensure the shmem files aren't in highmem, in which case you could
always use single-page mappings without any extra mapping.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
