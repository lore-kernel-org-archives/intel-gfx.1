Return-Path: <SRS0=at8c=OM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7E1C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 13:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 149A861153
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 13:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 149A861153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F0B8999A;
	Wed, 22 Sep 2021 13:34:13 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF93689854;
 Wed, 22 Sep 2021 13:34:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="284603458"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="284603458"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 06:34:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="533685342"
Received: from tranthip-mobl.ccr.corp.intel.com (HELO [10.213.32.169])
 ([10.213.32.169])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 06:34:08 -0700
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
 <20210921110121.3783395-10-matthew.auld@intel.com>
 <92d33ac7-f1b9-26e4-d39f-c351c4220dfa@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <b42594cb-a9aa-8240-e03b-5d6c303242d0@intel.com>
Date: Wed, 22 Sep 2021 14:34:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <92d33ac7-f1b9-26e4-d39f-c351c4220dfa@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH v4 10/14] drm/i915/ttm: hide shmem objects
 from TTM LRU
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 21/09/2021 12:48, Christian König wrote:
> Am 21.09.21 um 13:01 schrieb Matthew Auld:
>> This is probably a NAK. But ideally we need to somehow prevent TTM from
>> seeing shmem objects when doing its LRU swap walk. Since these are
>> EXTERNAL they are ignored anyway, but keeping them in the LRU seems
>> pretty wasteful.  Trying to use bo_pin() for this is all kinds of nasty
>> since we need to be able to do the bo_unpin() from the unpopulate hook,
>> but since that can be called from the BO destroy path we will likely go
>> down in flames.
>>
>> An alternative is to maybe just add EXTERNAL objects to some
>> bdev->external LRU in TTM, or just don't add them at all?
> 
> Yeah, that goes into the same direction as why I want to push the LRU 
> into the resource for some time.
> 
> The problem is that the LRU is needed for multiple things. E.g. 
> swapping, GART management, resource constrains, IOMMU teardown etc..
> 
> So for now I think that everything should be on the LRU even if it isn't 
> valid to be there for some use case.

Ok. Is it a no-go to keep TT_FLAG_EXTERNAL on say bdev->external?

> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 174aebe11264..b438ddb52764 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -800,6 +800,22 @@ static unsigned long i915_ttm_io_mem_pfn(struct 
>> ttm_buffer_object *bo,
>>       return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + ofs;
>>   }
>> +static void i915_ttm_del_from_lru_notify(struct ttm_buffer_object *bo)
>> +{
>> +    struct i915_ttm_tt *i915_tt =
>> +        container_of(bo->ttm, typeof(*i915_tt), ttm);
>> +
>> +    /* Idealy we need to prevent TTM from seeing shmem objects when 
>> doing
>> +     * its LRU swap walk. Since these are EXTERNAL they are ignored 
>> anyway,
>> +     * but keeping them in the LRU is pretty waseful. Trying to use 
>> bo_pin()
>> +     * for this is very nasty since we need to be able to do the 
>> bo_unpin()
>> +     * from the unpopulate hook, but since that can be called from 
>> the BO
>> +     * destroy path we will go down in flames.
>> +     */
>> +    if (bo->ttm && ttm_tt_is_populated(bo->ttm) && i915_tt->is_shmem)
>> +        list_del_init(&bo->lru);
>> +}
>> +
>>   static struct ttm_device_funcs i915_ttm_bo_driver = {
>>       .ttm_tt_create = i915_ttm_tt_create,
>>       .ttm_tt_populate = i915_ttm_tt_populate,
>> @@ -810,6 +826,7 @@ static struct ttm_device_funcs i915_ttm_bo_driver = {
>>       .move = i915_ttm_move,
>>       .swap_notify = i915_ttm_swap_notify,
>>       .delete_mem_notify = i915_ttm_delete_mem_notify,
>> +    .del_from_lru_notify = i915_ttm_del_from_lru_notify,
>>       .io_mem_reserve = i915_ttm_io_mem_reserve,
>>       .io_mem_pfn = i915_ttm_io_mem_pfn,
>>   };
> 
