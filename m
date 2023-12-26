Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D448FC46CD3
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Dec 2023 19:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCAA10E0E5;
	Tue, 26 Dec 2023 19:49:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C3610E0E5;
 Tue, 26 Dec 2023 19:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=ltxuMlZ+kzMrrPIVGOVBbv3q97GGQmn2uNwiw82Dnkw=; b=V6LlcVTWVAYjZSAsOOdj6x+I+1
 mGidUToj2wg3ebKpsXdNW34qYqNIxH77CgoRKyeo2kAo5ihhWE3Kg0Iu5tFQYG99bkraAHcXKxxvD
 885NWv/GWxjRbcBtwvJ+nBAMSN6bbFuR27xFg1jRj/jRL6SeEv/0vVLdgi3GwsCWR6pPq0lMly58T
 rOUp7Dk2+LH8tv5lR04UKuKKnTRru+7Ga9Dvpqb/iiD2lqpzzcHG3xEH2DkNVzAwIjBR+7LKpWU3g
 ciX4Bfu4QgLbBjbDBHWBHxUgnDh5UbS1nSqbcy6maMPN8ctiKf4JGDesxVLI7D3G09YcjJh/o6mPz
 I2AGz7Wg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rIDQx-00DSmS-1T; Tue, 26 Dec 2023 19:49:47 +0000
Message-ID: <0579ecd5-1335-4010-a32c-77dd4caf3411@infradead.org>
Date: Tue, 26 Dec 2023 11:49:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/i915/perf: reconcile Excess struct member
 kernel-doc warnings
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231221032029.30942-1-rdunlap@infradead.org>
 <20231221032029.30942-4-rdunlap@infradead.org> <ZYsH757tT6sdSjDI@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZYsH757tT6sdSjDI@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



On 12/26/23 09:05, Rodrigo Vivi wrote:
> On Wed, Dec 20, 2023 at 07:20:29PM -0800, Randy Dunlap wrote:
>> Document nested struct members with full names as described in
>> Documentation/doc-guide/kernel-doc.rst.
>>
>> i915_perf_types.h:341: warning: Excess struct member 'ptr_lock' description in 'i915_perf_stream'
>> i915_perf_types.h:341: warning: Excess struct member 'head' description in 'i915_perf_stream'
>> i915_perf_types.h:341: warning: Excess struct member 'tail' description in 'i915_perf_stream'
>> 3 warnings as Errors
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: intel-gfx@lists.freedesktop.org
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: dri-devel@lists.freedesktop.org
> 
> 
> for the series:
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> I'm afraid patchwork was down when you sent this out.
> Could you please rebase and resend? Just to ensure
> our CI doesn't complain and then we push it.
> 

Will do. Thanks.

-- 
#Randy
