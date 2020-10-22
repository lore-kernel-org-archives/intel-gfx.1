Return-Path: <SRS0=0RYq=D5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5397C388F9
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 23:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6CE24248
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2020 23:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C6CE24248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB786E435;
	Thu, 22 Oct 2020 23:35:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B796E435
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 23:35:32 +0000 (UTC)
IronPort-SDR: Sokt9lwv4z9BhpwM167aBkIBzjb715M/L11jl5Cbi1JUbnw0vxtPcRHFrCQXfujgdHl5Y9ps7n
 FEt3kf4XZtHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="164114554"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="164114554"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 16:35:32 -0700
IronPort-SDR: zlz9mpfksiJ7jy+/X384oPhvQ8VNGOcHJ9Fa6E/SG+vJkn4rQNIsue8Dg0Ac40GXfMLyEubgBs
 hrJ4CTq/Ajlg==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="393218167"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 16:35:31 -0700
Date: Thu, 22 Oct 2020 16:35:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20201022233530.GS627052@mdroper-desk1.amr.corp.intel.com>
References: <20201021082034.3170478-1-lucas.demarchi@intel.com>
 <20201021082034.3170478-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021082034.3170478-7-lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/dg1: Implement WA_16011163337
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

On Wed, Oct 21, 2020 at 01:20:34AM -0700, Lucas De Marchi wrote:
> From: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
> 
> Set GS Timer to 224.
> Bspec: 53508
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 8d24ea769fe6..cd0c5847e2df 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -684,6 +684,11 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	/* Wa_22010493298 */
>  	WA_SET_BIT_MASKED(HIZ_CHICKEN,
>  			  DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE);
> +
> +	/* Wa_16011163337 */
> +	wa_add(wal,
> +	       FF_MODE2,
> +	       FF_MODE2_GS_TIMER_MASK, FF_MODE2_GS_TIMER_224, 0);

It looks like with the latest bspec updates we can just move this into
gen12_ctx_workarounds_init() (and remove the copy in the tgl_ function);
it now applies to all platforms that will be using that function.


Matt

>  }
>  
>  static void
> -- 
> 2.28.0
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
