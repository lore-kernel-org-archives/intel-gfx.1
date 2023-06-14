Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3167FEB64D9
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Jun 2023 15:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9F110E0A3;
	Wed, 14 Jun 2023 15:36:02 +0000 (UTC)
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jun 2023 15:35:59 UTC
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B069B10E07D;
 Wed, 14 Jun 2023 15:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2B49C3FF00;
 Wed, 14 Jun 2023 17:30:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oe7QbcaBXzJp; Wed, 14 Jun 2023 17:30:27 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6D7533FECC;
 Wed, 14 Jun 2023 17:30:26 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E894D3631FF;
 Wed, 14 Jun 2023 17:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1686756626; bh=My99GLkGvRcJlCBxLCHL4W/UQjFF1tmEmHpgRBESrnI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QNeJaHjqVqB4HskMw/NNX9mPCz3LWemDx6Hc9IdNNAgtZlzQ4A7fWTNVmnP/xOySI
 PLrCXXFLtVOR7+eRI+rMD7YULyQ4zzgSUKUdC3iBYdxBogO/lfZxtVmwIh4YtuX2IL
 pJl/J1CQhbmzWiugIIF4GGiWwohPosaBmKBT/QG8=
Message-ID: <69d7af2f-f4c2-5a7d-ce69-c38be5660c74@shipmail.org>
Date: Wed, 14 Jun 2023 17:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sumitra Sharma <sumitraartsy@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230614123556.GA381200@sumitra.com>
 <bebd57fc-7135-dc97-701e-54cb9c2955c0@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <bebd57fc-7135-dc97-701e-54cb9c2955c0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Call page_address() on page
 acquired with GFP_KERNEL flag
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
Cc: Deepak R Varma <drv@mailo.com>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, Fabio <fmdefrancesco@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 6/14/23 15:22, Tvrtko Ursulin wrote:
>
> On 14/06/2023 13:35, Sumitra Sharma wrote:
>> Pages allocated with GFP_KERNEL cannot come from Highmem.
>> That is why there is no need to call kmap() on them.
>
> Are you sure it is GFP_KERNEL backed and not tmpfs? I am not sure 
> myself so let me copy Matt and Thomas if they happen to know off hand.

It looks to me these are shmem pages or TTM pages. Both could be 
highmem. So I think kmap is the correct choice here.

/Thomas




>
> Regards,
>
> Tvrtko
>
>> Therefore, don't call kmap() on the page coming from
>> vma_res->bi.pages using for_each_sgt_page() in
>> i915_vma_coredump_create().
>>
>> Use a plain page_address() to get the kernel address instead.
>>
>> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index f020c0086fbc..6f51cb4fc55c 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1164,9 +1164,8 @@ i915_vma_coredump_create(const struct intel_gt 
>> *gt,
>>                 drm_clflush_pages(&page, 1);
>>   -            s = kmap(page);
>> +            s = page_address(page);
>>               ret = compress_page(compress, s, dst, false);
>> -            kunmap(page);
>>                 drm_clflush_pages(&page, 1);
