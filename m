Return-Path: <SRS0=TleC=BP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2577EC433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 13:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00AE42312C
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 13:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00AE42312C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8452389BBD;
	Wed,  5 Aug 2020 13:26:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F91489BBD
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2020 13:26:20 +0000 (UTC)
IronPort-SDR: RlgjqnOJXS0tqnP0uu0SLdJcMoo6nn7QoKKC2NmnliD5AHlsw47yXC4Ccr8lcUnFkyZZZ/6bBb
 u4v2E2332rPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="149969979"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="149969979"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 06:26:18 -0700
IronPort-SDR: glGDcvAS1tX9Hq0nlc6Iss3MHyEq9CtIqP94phu7neqR5sTXg7YOc1h5NyVIAAuIM/9P+vKpwx
 FAvi+SIhNEDA==
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="467464973"
Received: from tlevis-mobl1.ger.corp.intel.com (HELO [10.251.167.151])
 ([10.251.167.151])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 06:26:17 -0700
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200805122231.23313-1-chris@chris-wilson.co.uk>
 <20200805122231.23313-11-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <60f5a798-3ebc-d237-95ac-f1a73c54f0c5@linux.intel.com>
Date: Wed, 5 Aug 2020 14:26:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805122231.23313-11-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 10/37] drm/i915/gem: Rename the list of
 relocations to reloc_list
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 05/08/2020 13:22, Chris Wilson wrote:
> Continuing the theme of calling the lists a foo_list, rename the relocs
> list. This means that we can now use relocs for the old reloc_cache that
> is not a cache anymore.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index a5b63ae17241..e7e16c62df1c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -252,7 +252,7 @@ struct i915_execbuffer {
>   	struct list_head unbound;
>   
>   	/** list of vma that have execobj.relocation_count */
> -	struct list_head relocs;
> +	struct list_head relocs_list;
>   
>   	/**
>   	 * Track the most recently used object for relocations, as we
> @@ -577,7 +577,7 @@ eb_add_vma(struct i915_execbuffer *eb,
>   	}
>   
>   	if (entry->relocation_count)
> -		list_add_tail(&ev->reloc_link, &eb->relocs);
> +		list_add_tail(&ev->reloc_link, &eb->relocs_list);
>   
>   	/*
>   	 * SNA is doing fancy tricks with compressing batch buffers, which leads
> @@ -932,7 +932,7 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>   	unsigned int i;
>   	int err = 0;
>   
> -	INIT_LIST_HEAD(&eb->relocs);
> +	INIT_LIST_HEAD(&eb->relocs_list);
>   	INIT_LIST_HEAD(&eb->unbound);
>   
>   	for (i = 0; i < eb->buffer_count; i++) {
> @@ -1592,7 +1592,7 @@ static int eb_relocate(struct i915_execbuffer *eb)
>   		struct eb_vma *ev;
>   		int flush;
>   
> -		list_for_each_entry(ev, &eb->relocs, reloc_link) {
> +		list_for_each_entry(ev, &eb->relocs_list, reloc_link) {
>   			err = eb_relocate_vma(eb, ev);
>   			if (err)
>   				break;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
