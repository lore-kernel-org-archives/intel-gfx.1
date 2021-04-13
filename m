Return-Path: <SRS0=Tqpp=JK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C846C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 09:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC7B61242
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 09:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DC7B61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EF56E14F;
	Tue, 13 Apr 2021 09:47:30 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9B46E14F
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Apr 2021 09:47:29 +0000 (UTC)
IronPort-SDR: xpZr14RIDiTb/DnuzWPH5/7SC643+Ep8JQ8YWeZlKccxW+Twj7wZcnUeKGejaZ/z2NTbHtZbjb
 1jc1dldmisdQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="174476515"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="174476515"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 02:47:26 -0700
IronPort-SDR: hcPYueRbQ2HGhHPt5s21WJM/1O7djbDgoIzrnFV2QRQOLUQ1b8pH+2qstfQAllmLWjN5sZqc5h
 N0SjBOqoxW+Q==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="424181685"
Received: from alinapar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.36.253])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 02:47:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210413051002.92589-13-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210413051002.92589-1-lucas.demarchi@intel.com>
 <20210413051002.92589-13-lucas.demarchi@intel.com>
Date: Tue, 13 Apr 2021 12:47:19 +0300
Message-ID: <87czuyh5y0.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 12/12] drm/i915: split dgfx features from
 gen 12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Make them independent so we can use DGFX_FEATURES more generically.
> For future platforms that do not use the GEN nomenclature we will define
> graphics, media and display separately, so we avoid setting graphics_ver
> with the GEN() macro.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_pci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 1453c1436f31..44e7b94db63d 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -907,8 +907,7 @@ static const struct intel_device_info rkl_info = {
>  		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0),
>  };
>  
> -#define GEN12_DGFX_FEATURES \
> -	GEN12_FEATURES, \
> +#define DGFX_FEATURES \
>  	.memory_regions = REGION_SMEM | REGION_LMEM, \
>  	.has_master_unit_irq = 1, \
>  	.has_llc = 0, \
> @@ -916,7 +915,8 @@ static const struct intel_device_info rkl_info = {
>  	.is_dgfx = 1
>  
>  static const struct intel_device_info dg1_info __maybe_unused = {
> -	GEN12_DGFX_FEATURES,
> +	GEN12_FEATURES,
> +	DGFX_FEATURES,
>  	PLATFORM(INTEL_DG1),
>  	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),
>  	.require_force_probe = 1,

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
