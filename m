Return-Path: <SRS0=QaN2=QC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CD2C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 17:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BBE1632E6
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 17:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BBE1632E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821CC6EE54;
	Mon, 15 Nov 2021 17:26:40 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C11E6EE2A;
 Mon, 15 Nov 2021 17:26:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319697811"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="319697811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 09:26:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="506012232"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 09:26:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <87lf1p1nko.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1636977089.git.jani.nikula@intel.com>
 <87y25p1vm3.fsf@intel.com> <YZJvSyQCgWZA1lcb@phenom.ffwll.local>
 <87lf1p1nko.fsf@intel.com>
Date: Mon, 15 Nov 2021 19:26:34 +0200
Message-ID: <87ilwt1gad.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH 0/3] drm/i915,
 agp/intel-ggt: clean up includes
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
Cc: intel-gfx@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 15 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Mon, Nov 15, 2021 at 01:55:32PM +0200, Jani Nikula wrote:
>>> On Mon, 15 Nov 2021, Jani Nikula <jani.nikula@intel.com> wrote:
>>> > Took Andy's patch [1] and expanded on it a bit.
>>> >
>>> > BR,
>>> > Jani.
>>> >
>>> >
>>> > [1] https://patchwork.freedesktop.org/patch/msgid/20211110102857.59604-1-andriy.shevchenko@linux.intel.com
>>> >
>>> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> >
>>> > Andy Shevchenko (1):
>>> >   agp/intel-gtt: Replace kernel.h with the necessary inclusions
>>> 
>>> Forgot to mention, I replaced the drm/i915 prefix with agp/intel-gtt
>>> here, no other changes to Andy's patch.
>>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Also feel free to push through drm-intel.git just in case you wondered
>> about that.
>
> Thanks; that's what I was planning on doing anyway. ;)

And pushed to drm-intel-next, thanks for the patch, acks and reviews.

BR,
Jani.


>
> BR,
> Jani.
>
>
>
>> -Daniel
>>
>>> 
>>> >
>>> > Jani Nikula (2):
>>> >   drm/i915: include intel-gtt.h only where needed
>>> >   agp/intel-gtt: reduce intel-gtt dependencies more
>>> >
>>> >  drivers/char/agp/intel-gtt.c         | 1 +
>>> >  drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 ++
>>> >  drivers/gpu/drm/i915/gt/intel_gt.c   | 2 ++
>>> >  drivers/gpu/drm/i915/i915_drv.h      | 1 -
>>> >  include/drm/intel-gtt.h              | 8 +++++---
>>> >  5 files changed, 10 insertions(+), 4 deletions(-)
>>> 
>>> -- 
>>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
