Return-Path: <SRS0=j43y=EM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719ECC2D0A3
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 22:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107D3206C1
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 22:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 107D3206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBED6EB22;
	Fri,  6 Nov 2020 22:19:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969AD6EB22
 for <intel-gfx@lists.freedesktop.org>; Fri,  6 Nov 2020 22:19:36 +0000 (UTC)
IronPort-SDR: +nOK4HseqhFDfM10AqONTomcnXbcUKWwhHO9IAHp9obUmH/TfEGZuXq1t4N8hnGlz3MnGORX6G
 Bcbf9KPTglaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="254315303"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="254315303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 14:19:36 -0800
IronPort-SDR: uyU6H8JfGARCqHu1xjZQpdAl+gzjNZus/WA5nPJe1IE0FwJ1BbocvbAxs7qL1C40P3DbrnfPZU
 qOUVGoi8gPgw==
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="358938776"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 14:19:36 -0800
Date: Fri, 6 Nov 2020 14:19:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20201106221935.GE627052@mdroper-desk1.amr.corp.intel.com>
References: <20201106011842.36203-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106011842.36203-1-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 05:18:42PM -0800, Daniele Ceraolo Spurio wrote:
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

Yeah, engine->mask (aka BIT(engine->id)) would reflect the engine's
position in the overall engine list, whereas what we really want here is
to just identify which specific VDBOX instance we're dealing with.  Your
change here matches how the field is used through the rest of the code.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 3fb52fac0d5d..0b31670343f5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -372,7 +372,8 @@ static void __setup_engine_capabilities(struct intel_engine_cs *engine)
>  		 * instances.
>  		 */
>  		if ((INTEL_GEN(i915) >= 11 &&
> -		     engine->gt->info.vdbox_sfc_access & engine->mask) ||
> +		     (engine->gt->info.vdbox_sfc_access &
> +		      BIT(engine->instance))) ||
>  		    (INTEL_GEN(i915) >= 9 && engine->instance == 0))
>  			engine->uabi_capabilities |=
>  				I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC;
> -- 
> 2.24.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
