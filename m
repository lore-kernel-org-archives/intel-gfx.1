Return-Path: <SRS0=5W5W=OU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5527C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 10:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80C396142A
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 10:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80C396142A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=daenzer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AC76EB60;
	Thu, 30 Sep 2021 10:12:30 +0000 (UTC)
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Thu, 30 Sep 2021 10:12:29 UTC
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C9F66EB5C
 for <intel-gfx@lists.freedesktop.org>; Thu, 30 Sep 2021 10:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 2D63A20201B;
 Thu, 30 Sep 2021 12:04:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id JejvUw3w_5LC; Thu, 30 Sep 2021 12:04:02 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id B3A6120201A;
 Thu, 30 Sep 2021 12:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]) by thor with esmtp (Exim 4.95-RC2)
 (envelope-from <michel@daenzer.net>) id 1mVsv3-00040b-Gw;
 Thu, 30 Sep 2021 12:04:01 +0200
Message-ID: <c73d99e5-267b-c396-2c19-9e5938d7ab6f@daenzer.net>
Date: Thu, 30 Sep 2021 12:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Content-Language: en-CA
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <20210927114114.152310-12-matthew.auld@intel.com>
 <6372b5a3ab5b8d5b640af59c9290cbe6da21a0f9.camel@linux.intel.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
In-Reply-To: <6372b5a3ab5b8d5b640af59c9290cbe6da21a0f9.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH v5 12/13] drm/i915/ttm: use cached system
 pages when evicting lmem
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

On 2021-09-29 13:54, Thomas Hellström wrote:
> On Mon, 2021-09-27 at 12:41 +0100, Matthew Auld wrote:
>> This should let us do an accelerated copy directly to the shmem pages
>> when temporarily moving lmem-only objects, where the i915-gem
>> shrinker
>> can later kick in to swap out the pages, if needed.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 194e5f1deda8..46d57541c0b2 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -134,11 +134,11 @@ static enum ttm_caching
>>  i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
>>  {
>>         /*
>> -        * Objects only allowed in system get cached cpu-mappings.
>> -        * Other objects get WC mapping for now. Even if in system.
>> +        * Objects only allowed in system get cached cpu-mappings, or
>> when
>> +        * evicting lmem-only buffers to system for swapping. Other
>> objects get
>> +        * WC mapping for now. Even if in system.
>>          */
>> -       if (obj->mm.region->type == INTEL_MEMORY_SYSTEM &&
>> -           obj->mm.n_placements <= 1)
>> +       if (obj->mm.n_placements <= 1)
>>                 return ttm_cached;
>>  
>>         return ttm_write_combined;
> 
> We should be aware that with TTM, even evicted bos can be mapped by
> user-space while evicted, and this will appear to user-space like the
> WC-mapped object suddenly became WB-mapped. But it appears like mesa
> doesn't care about this as long as the mappings are fully coherent.

FWIW, the Mesa radeonsi driver avoids surprises due to this (e.g. some path which involves CPU access suddenly goes faster if the BO was evicted from VRAM) by asking for WC mapping of BOs intended to be in VRAM even while they're evicted (via the AMDGPU_GEM_CREATE_CPU_GTT_USWC flag).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
