Return-Path: <SRS0=QgXV=DC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B56C4741F
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 12:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 638C021D7A
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 12:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 638C021D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A6C6ECA2;
	Fri, 25 Sep 2020 12:29:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38266ECA2;
 Fri, 25 Sep 2020 12:29:58 +0000 (UTC)
IronPort-SDR: +wh+9JjWD6SR3YeNt7AWNYC2AyoHzKNGJncEUhpRb/DanJ9mbEsjJD2H5kOD4oUcNfZkVKpRDz
 AuJg8Wad6qzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="225671247"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="225671247"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 05:29:58 -0700
IronPort-SDR: OatOg+mI2cktpFK85pdpyPjv0iQQ+N/4tqSMOhX/do3enQSWt2VmuP8C841vmZkqHsUfbL0sie
 MthwJq7tkFmA==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="455808533"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 05:29:53 -0700
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal>
 <adff5752-582c-2065-89e2-924ef732911a@linux.intel.com>
 <20200925115833.GZ9475@nvidia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c5956163-1769-ee40-e4ed-45532d8c4e19@linux.intel.com>
Date: Fri, 25 Sep 2020 13:29:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925115833.GZ9475@nvidia.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add
 support in dynamic allocation of SG table from pages
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, Maor Gottlieb <maorg@mellanox.com>,
 David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Maor Gottlieb <maorg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 25/09/2020 12:58, Jason Gunthorpe wrote:
> On Fri, Sep 25, 2020 at 12:41:29PM +0100, Tvrtko Ursulin wrote:
>>
>> On 25/09/2020 08:13, Leon Romanovsky wrote:
>>> On Thu, Sep 24, 2020 at 09:21:20AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 22/09/2020 09:39, Leon Romanovsky wrote:
>>>>> From: Maor Gottlieb <maorg@mellanox.com>
>>>>>
>>>>> Extend __sg_alloc_table_from_pages to support dynamic allocation of
>>>>> SG table from pages. It should be used by drivers that can't supply
>>>>> all the pages at one time.
>>>>>
>>>>> This function returns the last populated SGE in the table. Users should
>>>>> pass it as an argument to the function from the second call and forward.
>>>>> As before, nents will be equal to the number of populated SGEs (chunks).
>>>>
>>>> So it's appending and growing the "list", did I get that right? Sounds handy
>>>> indeed. Some comments/questions below.
>>>
>>> Yes, we (RDMA) use this function to chain contiguous pages.
>>
>> I will eveluate if i915 could start using it. We have some loops which build
>> page by page and coalesce.
> 
> Christoph H doesn't like it, but if there are enough cases we should
> really have a pin_user_pages_to_sg() rather than open code this all
> over the place.
> 
> With THP the chance of getting a coalescing SG is much higher, and
> everything is more efficient with larger SGEs.

Right, I was actually referring to i915 sites where we build sg tables 
out of shmem and plain kernel pages. In those areas we have some open 
coded coalescing loops (see for instance our shmem_get_pages). Plus a 
local "trim" to discard the unused entries, since we allocate 
pessimistically not knowing how coalescing will pan out. This kind of 
core function which appends pages could replace some of that. Maybe it 
would be slightly less efficient but I will pencil in to at least 
evaluate it.

Otherwise I do agree that coalescing is a win and in the past I have 
measured savings in a few MiB range just for struct scatterlist storage.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
