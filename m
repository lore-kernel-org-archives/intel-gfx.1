Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBA6C54EBE
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Jan 2023 12:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B626C10E9F8;
	Fri, 13 Jan 2023 12:08:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0122610E9F8;
 Fri, 13 Jan 2023 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673611678; x=1705147678;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uVLNVffUzNe/VZhePZaGixen1oFIrJWLypcqdqurN4U=;
 b=TtWe4DyWROZtp3hT2z0oKMBCA/g1F/rR1lxEB7pNCEACkk5+a6fp4o7Q
 2THMvN4/5fPvhTWbi7Xh+I9dFeOsMwFoHloPnaa4/BOlDZ29xA8+vRu4m
 zdfrNCPMLXoBKOS6YczpgfKCmxPIjVVmR1HzuARki969MHgt/AiPFHlWA
 kXIbggsv/NQ3l7L5ozF7civXbQuWJLX7poYEzLC/cjnJkbWveJh51SpXX
 6ENGLzb3IMjq/i90d2vT/77B06b7ZFUOKpPNcgaaaw4MLZQUo6PO0WVKV
 eK6nsfU3j1HhReT435LZWuA8h3dc346t5yxd7FE45smWRQskPzq3o3NZU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="304357134"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="304357134"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:07:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="660194805"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="660194805"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.222.27])
 ([10.251.222.27])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:07:55 -0800
Message-ID: <7a8ad9f3-326d-3f84-0671-ce0ee1a732ea@linux.intel.com>
Date: Fri, 13 Jan 2023 13:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-gfx@lists.freedesktop.org
References: <20230113114903.7824-1-nirmoy.das@intel.com>
 <f691df00-a1b3-a6e1-3ed8-cdb4eb7a5a56@intel.com>
 <28a2aa02-b62c-9666-6b1f-11bd33b50c23@linux.intel.com>
 <e2c3f194-8122-5fe1-c6e4-25d8af867f64@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <e2c3f194-8122-5fe1-c6e4-25d8af867f64@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Unwind hugepages to
 drop wakeref on error
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
Cc: chris.p.wilson@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 1/13/2023 1:05 PM, Matthew Auld wrote:
> On 13/01/2023 12:02, Das, Nirmoy wrote:
>> Thanks Matt, I missed the Fixes tag so resent it with fixes and Cc to 
>> stable.
>
> I don't think kernel selftests are really stable material. AFAIK it's 
> not something normal users care about.


True, in that case please ignore the latest copy of this patch!.


Thanks,

Nirmoy

>
>>
>> On 1/13/2023 12:51 PM, Matthew Auld wrote:
>>> On 13/01/2023 11:49, Nirmoy Das wrote:
>>>> From: Chris Wilson <chris.p.wilson@linux.intel.com>
>>>>
>>>> Make sure that upon error after we have acquired the wakeref we do
>>>> release it again.
>>>>
>>>> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
