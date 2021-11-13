Return-Path: <SRS0=WWco=QA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF21C433EF
	for <intel-gfx@archiver.kernel.org>; Sat, 13 Nov 2021 17:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A7761156
	for <intel-gfx@archiver.kernel.org>; Sat, 13 Nov 2021 17:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64A7761156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB72D6E175;
	Sat, 13 Nov 2021 17:33:56 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728E06E175
 for <intel-gfx@lists.freedesktop.org>; Sat, 13 Nov 2021 17:33:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10167"; a="220484658"
X-IronPort-AV: E=Sophos;i="5.87,232,1631602800"; d="scan'208";a="220484658"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2021 09:33:54 -0800
X-IronPort-AV: E=Sophos;i="5.87,232,1631602800"; d="scan'208";a="505315157"
Received: from avgutkin-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.13.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2021 09:33:54 -0800
Date: Sat, 13 Nov 2021 09:34:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20211113173413.d3qsmxjiztfla6t2@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211112171828.21770-1-siva.mullati@intel.com>
 <87r1bl2f31.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87r1bl2f31.fsf@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Skip remap_io_mapping() for
 non-x86 platforms
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
Cc: Mullati Siva <siva.mullati@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sat, Nov 13, 2021 at 12:18:10AM +0200, Jani Nikula wrote:
>On Fri, 12 Nov 2021, Mullati Siva <siva.mullati@intel.com> wrote:
>> The _PAGE_CACHE_MASK macro is not defined in non-x86
>> architectures and it's been used in remap_io_mapping().
>> Only hw that supports mappable aperture would hit this path
>> remap_io_mapping(), So skip this code for non-x86 architectures.
>
>Patch changelog goes here.
>
>> Signed-off-by: Mullati Siva <siva.mullati@intel.com>

Is your git config correct?


>> ---
>>  drivers/gpu/drm/i915/i915_mm.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
>> index 666808cb3a32..d76feeaf3fd1 100644
>> --- a/drivers/gpu/drm/i915/i915_mm.c
>> +++ b/drivers/gpu/drm/i915/i915_mm.c
>> @@ -91,6 +91,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
>>  		     unsigned long addr, unsigned long pfn, unsigned long size,
>>  		     struct io_mapping *iomap)
>>  {
>> +#if IS_ENABLED(CONFIG_X86)
>
>My feedback to the previous version was:
>
>Please don't add conditional compilation within functions.
>
>I mean it.

if it's not clear, that means we should have a stub remap_io_mapping()
in the header rather than doing the conditional compilation here.

However, I'm still not confident about the approach since in DG1 for
example we have mappable aperture. And even for the cases we don't need
it, are you sure we never call remap_io_mapping()?  Did you add a trace
or printk() in this function to confirm that while loading the module?

Lastly, see commit b87482dfe800 ("Revert "i915: use io_mapping_map_user"")
We had a function added in mm/io-mapping.c - io_mapping_map_user() that
is now unused.

We still want to use that api (see https://lore.kernel.org/all/20211021061839.GA27953@lst.de/so).
So since you are touching this area, it would be good if you can help
figure out why it was failing.

thanks
Lucas De Marchi
