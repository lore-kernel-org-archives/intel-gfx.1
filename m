Return-Path: <SRS0=k2AZ=C6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB36EC4346E
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2020 18:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1987A222BB
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2020 18:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1987A222BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200386E063;
	Mon, 21 Sep 2020 18:25:01 +0000 (UTC)
X-Greylist: delayed 465 seconds by postgrey-1.36 at gabe;
 Mon, 21 Sep 2020 18:24:58 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178016E063
 for <intel-gfx@lists.freedesktop.org>; Mon, 21 Sep 2020 18:24:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 76B4068AFE; Mon, 21 Sep 2020 20:17:08 +0200 (CEST)
Date: Mon, 21 Sep 2020 20:17:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Minchan Kim <minchan@kernel.org>
Message-ID: <20200921181708.GA2067@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-2-hch@lst.de> <20200921174256.GA387368@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200921174256.GA387368@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH 1/6] zsmalloc: switch from alloc_vm_area to
 get_vm_area
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
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 10:42:56AM -0700, Minchan Kim wrote:
> IIRC, the problem was runtime pte popluating needs GFP_KERNEL but
> zs_map_object API runs under non-preemtible section.

Make sense.

> > -	area->vm = alloc_vm_area(PAGE_SIZE * 2, NULL);
> > +	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
> >  	if (!area->vm)
> >  		return -ENOMEM;
> >  	return 0;
> 
> I think it shoud work.
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 05789aa4af12..6a1e4d854593 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2232,7 +2232,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	arch_enter_lazy_mmu_mode();
>  
>  	do {
> -		if (create || !pte_none(*pte)) {
> +		if ((create || !pte_none(*pte)) && fn) {
>  			err = fn(pte++, addr, data);
>  			if (err)
>  				break;
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 3e4fe3259612..9ef7daf3d279 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -1116,6 +1116,8 @@ static struct zspage *find_get_zspage(struct size_class *class)
>  #ifdef CONFIG_ZSMALLOC_PGTABLE_MAPPING
>  static inline int __zs_cpu_up(struct mapping_area *area)
>  {
> +	int ret;
> +
>  	/*
>  	 * Make sure we don't leak memory if a cpu UP notification
>  	 * and zs_init() race and both call zs_cpu_up() on the same cpu
> @@ -1125,7 +1127,13 @@ static inline int __zs_cpu_up(struct mapping_area *area)
>  	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
>  	if (!area->vm)
>  		return -ENOMEM;
> -	return 0;
> +
> +	/*
> +	 * Populate ptes in advance to avoid pte allocation with GFP_KERNEL
> +	 * in non-preemtible context of zs_map_object.
> +	 */
> +	ret = apply_to_page_range(&init_mm, NULL, PAGE_SIZE * 2, NULL, NULL);
> +	return ret;

I think this needs the addr from the vm area somewhere..

We probaby want to add a trivial helper to prefault an area instead of
the open coded variant.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
