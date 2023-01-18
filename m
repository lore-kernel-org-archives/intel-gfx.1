Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE3C32793
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Jan 2023 13:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1280610E74D;
	Wed, 18 Jan 2023 13:28:53 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D583110E74D
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Jan 2023 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674048530; x=1705584530;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Wkh2Rm/FH9rzdiBCQ1lMSrycX9xUDg53HP450qxtuwM=;
 b=TWW0odsKVPMwoKznAXdBZPzkFZ3idF9ICbCw4atYFOm26JVvX0GW89y6
 rIrnQXwPt3APIZPrKzE9r6S577gYVuQaDjUkFjIkHHp5H8KQe7cR9wXf9
 XTpCAyPIoO5podFs8m9JAIo5fVrFk5xNGcIAQ2wSkCvkjvlb/hSG25QnW
 FdYgqZN6MjDpe+GBSfnfsK5cIwD6VWSFMykNLz440ZAUY4EruI/LQcc5Y
 S4B1rCAE14BbHttZW1Db6ToXVcPeGBqaiiofPw+uVssN+Ou0SZbhrnizZ
 xevomQP5WFXjE7dMytn5vdT06PZp1A+qnumuUwY/211w2SO3uegfeYose w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308540527"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="308540527"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:28:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="728198446"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="728198446"
Received: from llvincen-mobl.ger.corp.intel.com (HELO [10.213.215.37])
 ([10.213.215.37])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:28:49 -0800
Message-ID: <19e8a403-735d-371f-0d01-82ecb6908350@linux.intel.com>
Date: Wed, 18 Jan 2023 13:28:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230118131538.3558599-1-jani.nikula@intel.com>
 <20230118131538.3558599-3-jani.nikula@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230118131538.3558599-3-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915: drop a number of unnecessary
 forward declarations
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



On 18/01/2023 13:15, Jani Nikula wrote:
> Remove leftovers from earlier cleanups.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_drv.h | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 343e3e568774..ad0c5fd0cc92 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -65,13 +65,6 @@
>   #include "intel_uncore.h"
>   
>   struct drm_i915_clock_gating_funcs;
> -struct drm_i915_gem_object;
> -struct drm_i915_private;
> -struct intel_connector;
> -struct intel_dp;
> -struct intel_encoder;
> -struct intel_limit;
> -struct intel_overlay_error_state;
>   struct vlv_s0ix_state;
>   struct intel_pxp;
>   

Assuming the proof is in the pudding:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
