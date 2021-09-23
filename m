Return-Path: <SRS0=HC+g=ON=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A3FC433FE
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 07:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5AA6058D
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 07:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B5AA6058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E0C6ED0E;
	Thu, 23 Sep 2021 07:35:04 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620CE6ECF7;
 Thu, 23 Sep 2021 07:35:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203282522"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="203282522"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 00:35:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="702614115"
Received: from gerardqu-mobl.ger.corp.intel.com (HELO [10.213.243.237])
 ([10.213.243.237])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 00:34:59 -0700
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20210923003029.2194375-1-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <3fc57b4c-fa5f-47be-6250-c12471ef826d@linux.intel.com>
Date: Thu, 23 Sep 2021 08:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923003029.2194375-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915/uncore: fwtable read handlers are
 now used on all forcewake platforms
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


On 23/09/2021 01:30, Matt Roper wrote:
> With the recent refactor of the uncore mmio handling, all
> forcewake-based platforms (i.e., graphics version 6 and beyond) now use
> the 'fwtable' read handlers.  Let's pull the assignment out of the
> per-platform if/else ladder to make this more obvious.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index c8e7c71f0896..678a99de07fe 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2088,49 +2088,42 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>   		return ret;
>   	forcewake_early_sanitize(uncore, 0);
>   
> +	ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
> +
>   	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, dg2_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) >= 12) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) == 11) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen11_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen11_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_GRAPHICS_VER(i915, 9, 10)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen9_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_CHERRYVIEW(i915)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __chv_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) == 8) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_VALLEYVIEW(i915)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __vlv_fw_ranges);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen6);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_GRAPHICS_VER(i915, 6, 7)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen6);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	}
>   
>   	uncore->pmic_bus_access_nb.notifier_call = i915_pmic_bus_access_notifier;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
