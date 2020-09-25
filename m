Return-Path: <SRS0=QgXV=DC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6DEC4363D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 13:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4BD32076B
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 13:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4BD32076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506186E203;
	Fri, 25 Sep 2020 13:02:24 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1EE6E203;
 Fri, 25 Sep 2020 13:02:23 +0000 (UTC)
IronPort-SDR: PKT3SLQO61EqLs8o3z64XjMC9iWk83/WWa8bOVTiO6eOAvTxKkwN1OPZwE70NzIGWsvOWX7u7D
 oy+sxLfKfPjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158862328"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="158862328"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:02:10 -0700
IronPort-SDR: OZamlwX2zWqLUrbLSEoIsVvtwGhUUsxA4uAx8BG9zebWwmpfo9ZeyTDwYsvjJeAEWzi0tdodhs
 m+aC4Xx9uiAA==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="455821735"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:02:02 -0700
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
References: <20200924135853.875294-1-hch@lst.de>
 <20200924135853.875294-8-hch@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8d318fcb-f472-85ed-6639-18f9c45f30e4@linux.intel.com>
Date: Fri, 25 Sep 2020 14:01:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924135853.875294-8-hch@lst.de>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/i915: stop using kmap in
 i915_gem_object_map
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
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, x86@kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Minchan Kim <minchan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 24/09/2020 14:58, Christoph Hellwig wrote:
> kmap for !PageHighmem is just a convoluted way to say page_address,
> and kunmap is a no-op in that case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index d6eeefab3d018b..6550c0bc824ea2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -162,8 +162,6 @@ static void unmap_object(struct drm_i915_gem_object *obj, void *ptr)
>   {
>   	if (is_vmalloc_addr(ptr))
>   		vunmap(ptr);
> -	else
> -		kunmap(kmap_to_page(ptr));
>   }
>   
>   struct sg_table *
> @@ -277,11 +275,10 @@ static void *i915_gem_object_map(struct drm_i915_gem_object *obj,
>   		 * forever.
>   		 *
>   		 * So if the page is beyond the 32b boundary, make an explicit
> -		 * vmap. On 64b, this check will be optimised away as we can
> -		 * directly kmap any page on the system.
> +		 * vmap.
>   		 */
>   		if (!PageHighMem(page))
> -			return kmap(page);
> +			return page_address(page);
>   	}
>   
>   	mem = stack;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
