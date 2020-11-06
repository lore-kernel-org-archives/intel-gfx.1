Return-Path: <SRS0=j43y=EM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AADC55178
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 09:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AADBA20B80
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 09:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AADBA20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AB86E19B;
	Fri,  6 Nov 2020 09:30:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4FA6E19B
 for <intel-gfx@lists.freedesktop.org>; Fri,  6 Nov 2020 09:30:10 +0000 (UTC)
IronPort-SDR: +3D0+57kxeyv+kUqlXLHSS97OuyJSGt5hvY3oBfiefY68OR1rCcev0kgiP/9OGakjMocp11hVf
 3KfXHQYmA1fA==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="169672707"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="169672707"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 01:30:10 -0800
IronPort-SDR: VQBC7mCsdwXTLqutz45uDaWVFRaIGRpQE3A+tu4XTrq1ddSZOhLzSno3wq6Hqm0mlQ0pTmMV6H
 cFyFMftOO4EA==
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="539776176"
Received: from pdavid-mobl.ger.corp.intel.com (HELO [10.214.241.160])
 ([10.214.241.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 01:30:08 -0800
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201106011842.36203-1-daniele.ceraolospurio@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5004bc0d-1e97-bbf3-ece9-327c61d4d09c@linux.intel.com>
Date: Fri, 6 Nov 2020 09:30:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106011842.36203-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Correctly set SFC capability for
 video engines
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 06/11/2020 01:18, Daniele Ceraolo Spurio wrote:
> From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> 
> SFC capability of video engines is not set correctly because i915
> is testing for incorrect bits.
> 
> Fixes: c5d3e39caa45 ("drm/i915: Engine discovery query")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 3fb52fac0d5d..0b31670343f5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -372,7 +372,8 @@ static void __setup_engine_capabilities(struct intel_engine_cs *engine)
>   		 * instances.
>   		 */
>   		if ((INTEL_GEN(i915) >= 11 &&
> -		     engine->gt->info.vdbox_sfc_access & engine->mask) ||
> +		     (engine->gt->info.vdbox_sfc_access &
> +		      BIT(engine->instance))) ||
>   		    (INTEL_GEN(i915) >= 9 && engine->instance == 0))
>   			engine->uabi_capabilities |=
>   				I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
