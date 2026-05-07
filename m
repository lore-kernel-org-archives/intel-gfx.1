Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CE9CD3442
	for <intel-gfx@archiver.kernel.org>; Thu,  7 May 2026 10:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9969010E155;
	Thu,  7 May 2026 10:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmQ8P2q0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2110E155
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 May 2026 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778149058; x=1809685058;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=om0PFpBGorRzdVaPSlTMk0ZUEkKUDXDkRrOBojy6iKM=;
 b=MmQ8P2q0Xf+wcV0hRUJTFEtiCywQgurC09HtCgVk8B/1+s7pxfxlpvjZ
 PlagF54dzMQMopHCumXQE3Hlk53IMtLGtCl8Uzalih5LybBQl4HP8h9Da
 joMqscje3Jr0XpZ6FfUWJk4gTQOdY3lDUxE0XNg6RMm2IkgwgFh22prsp
 muoQ1KFAP0DNDv3bk98foGPCi5CFlhfg2/zQ/APf8U3/lorUcPbWjMphg
 wfdx9Ym9+/BiNMKO7b1fNdLYaVtl3OFDhmOyHfjtc1XMqzClsrTfkKCEQ
 FPhAP/TZ12wpGHo1zpUPYK+HP5HFd+8B9+eJzxVrm6PM7PPSlPJltA1V6 w==;
X-CSE-ConnectionGUID: 8FlqHtNvQbybf8CBtAJnBg==
X-CSE-MsgGUID: NdFwuZrBTnGEr/OY4Z3rWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89790746"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="89790746"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 03:17:37 -0700
X-CSE-ConnectionGUID: QABej8wFQgeUciVHAjhdiA==
X-CSE-MsgGUID: yyNs6+uXRsGSgYWkyy497A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="231885897"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.157])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 03:17:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Cc: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] Revert "drm/i915: replace select with dependency for
 visible DEBUG_OBJECTS"
In-Reply-To: <47e6ca58-59c3-48fa-8563-d27ac67d60f6@ursulin.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260506101957.202271-1-jani.nikula@intel.com>
 <47e6ca58-59c3-48fa-8563-d27ac67d60f6@ursulin.net>
Date: Thu, 07 May 2026 13:17:33 +0300
Message-ID: <685a137a88a6dcd70ca380401cd11c912e77c1b6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 06 May 2026, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> On 06/05/2026 11:19, Jani Nikula wrote:
>> This reverts commit 025f89b01ed8d5e65d87ed54f231e10c6ac08188.
>> 
>> 025f89b01ed8 ("drm/i915: replace select with dependency for visible
>> DEBUG_OBJECTS") breaks the build in certain scenarios, presumably
>> because config DRM_I915_DEBUG selects DRM_I915_SW_FENCE_DEBUG_OBJECTS
>> without looking at its dependencies, allowing
>> DRM_I915_SW_FENCE_DEBUG_OBJECTS=y and DEBUG_OBJECTS=n.
>> 
>> Fixes: 025f89b01ed8 ("drm/i915: replace select with dependency for visible DEBUG_OBJECTS")
>> Cc: Julian Braha <julianbraha@gmail.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Kconfig.debug | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
>> index 9a2a49284876..3562a02ef7ad 100644
>> --- a/drivers/gpu/drm/i915/Kconfig.debug
>> +++ b/drivers/gpu/drm/i915/Kconfig.debug
>> @@ -153,7 +153,7 @@ config DRM_I915_TRACE_GTT
>>   config DRM_I915_SW_FENCE_DEBUG_OBJECTS
>>   	bool "Enable additional driver debugging for fence objects"
>>   	depends on DRM_I915
>> -	depends on DEBUG_OBJECTS
>> +	select DEBUG_OBJECTS
>>   	default n
>>   	help
>>   	  Choose this option to turn on extra driver debugging that may affect
>
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Thanks, pushed to drm-intel-next (yesterday).

BR,
Jani.

>
> Regards,
>
> Tvrtko
>

-- 
Jani Nikula, Intel
