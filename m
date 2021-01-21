Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F51C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 11:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279AA2388E
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 11:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279AA2388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7136E52F;
	Thu, 21 Jan 2021 11:14:51 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0C86E52F
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 11:14:49 +0000 (UTC)
IronPort-SDR: MLfwN4NLS8cJQABCS5XVaXH7hblmTL3/i3puQpKtHpUpqUGf3nxFYyK+FpRJZJU0jAO2Cr+UGQ
 PQdvU9iHj3Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="166924810"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="166924810"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 03:14:48 -0800
IronPort-SDR: F1UP8kmT0paaI+quT4Dt75CaSdueqS4X9oCylgzIO4QVYcKUz4Cq9NRNjXAu3MbgEDbirzfoE4
 +05oi3A/80rg==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="356427521"
Received: from pscheper-mobl1.ger.corp.intel.com (HELO [10.252.50.106])
 ([10.252.50.106])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 03:14:46 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210120154019.5146-1-chris@chris-wilson.co.uk>
 <CAM0jSHPUoT2eKs0MgUoJ9UBB96hgtZGmQuZSDrE8vGkRSOXpoQ@mail.gmail.com>
 <161116596844.3420.4138630766326614766@build.alporthouse.com>
 <161117638753.7444.16304169600967757321@build.alporthouse.com>
 <5c5f16c9-9885-3eba-ee1b-21e491094acc@linux.intel.com>
 <161122700938.32666.8387306897872756634@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <247b6bda-ef91-26f4-c74d-b5a2083fa506@linux.intel.com>
Date: Thu, 21 Jan 2021 11:14:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <161122700938.32666.8387306897872756634@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Allow importing of shmemfs
 objects into any device
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
 Matthew Auld <matthew.auld@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 21/01/2021 11:03, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-01-21 11:00:25)
>>
>> On 20/01/2021 20:59, Chris Wilson wrote:
>>> Quoting Chris Wilson (2021-01-20 18:06:08)
>>>> Quoting Matthew Auld (2021-01-20 17:46:10)
>>>>> On Wed, 20 Jan 2021 at 15:40, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>>>>>>
>>>>>> If we import a shmemfs object between devices, for example from
>>>>>> Tigerlake to DG1, we can simply reuse the native object and its backing
>>>>>> store.
>>>>>
>>>>> Hmmm interesting, so does that include re-using the actual sg mapping
>>>>> for the backing pages? Does that work out-of-the-box between different
>>>>> devices assuming we have iommu enabled?
>>>>
>>>> Indeed interesting; the dma_addr_t are supposed to be local to a device.
>>>
>>> On reflection, we are expected to use cross-device dma_addr_t with
>>> dma-buf. It's the exporter who assigns the dma_addr_t for the importer
>>> to use, and they are always given from the original device.
>>>
>>> Maybe not so bad. Definitely needs testing to see what happens in
>>> practice.
>>
>> What about object migration? I did not spot anything preventing it once
>> object was exported like this so owning device could move it to device
>> memory afterwards which would probably be bad.
> 
> Depends on how you do your migration, but your migration should be
> checking that it is allowed to migrate the object first.

Okay agreed, meaning to be handled once migration gets to upstream.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
