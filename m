Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B298C53200
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Jul 2026 09:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127710E638;
	Wed, 29 Jul 2026 09:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gntc8vHT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1945110E638
 for <intel-gfx@lists.freedesktop.org>; Wed, 29 Jul 2026 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785317511; x=1816853511;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=yfh1K4s9UM6ONR/NdUI8eqojG952ouEIAau2dKsUFBU=;
 b=gntc8vHTXE/1IXEFRZm0MzjoLcSiQ1H9nsjpATdzd9b0LDtLTd9yX9uD
 pLiMvEOlKkGIaX6xeq8lBACaq8PZNMP6ut5YA1E0d3CPJLH/v/gHrTfTL
 TmvKJkZ06TmwGo9u+eVP9mqWrE3jx9D8ppYnl7zD8awsj4t303HNyr/QX
 tAQ0srPEmWEKuUZRQHwcIVkw2pkaUF7m4+41kQykmfsPZvjcUt9vfe4LM
 whXW2Gw43BS9/XYfgcvlQ49rW0uUUQBOdPOS+Emm4X1g3MbxS0TL7IJ0U
 M5lKJPErzF0aCsue389w2CUYapHjO58OAk3TmmE7TuaPP82XyCBfyMKTv A==;
X-CSE-ConnectionGUID: t3rQuW4vShiOHHQIXjYeCQ==
X-CSE-MsgGUID: 3RJLXxS3Qa+48iPzk2aKNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85043039"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85043039"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 02:31:51 -0700
X-CSE-ConnectionGUID: iE0whvLHSlSmM8x+B/IALg==
X-CSE-MsgGUID: /55AUmsuQbqbAOzJHMz1ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="257290837"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.212])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 02:31:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dpt: remove unused include
In-Reply-To: <92ddca76-3752-4509-84bf-2291351cc76c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260728175959.622050-1-jani.nikula@intel.com>
 <92ddca76-3752-4509-84bf-2291351cc76c@intel.com>
Date: Wed, 29 Jul 2026 12:31:47 +0300
Message-ID: <36905f06d7c8102157a31c13c7eed76a39ef1ea0@intel.com>
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

On Wed, 29 Jul 2026, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> On 7/28/2026 11:29 PM, Jani Nikula wrote:
>> i915_dpt.c no longer needs intel_display_core.h, remove.
>
> LGTM,
>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Thanks, pushed to drm-intel-next.

>
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_dpt.c | 1 -
>>   1 file changed, 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
>> index fcd7cced771d..e01dc4de1788 100644
>> --- a/drivers/gpu/drm/i915/i915_dpt.c
>> +++ b/drivers/gpu/drm/i915/i915_dpt.c
>> @@ -6,7 +6,6 @@
>>   #include <drm/drm_print.h>
>>   #include <drm/intel/display_parent_interface.h>
>>   
>> -#include "display/intel_display_core.h"
>>   #include "gem/i915_gem_domain.h"
>>   #include "gem/i915_gem_internal.h"
>>   #include "gem/i915_gem_lmem.h"
>

-- 
Jani Nikula, Intel
