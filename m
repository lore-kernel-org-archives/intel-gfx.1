Return-Path: <SRS0=kgP7=MU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3236EC4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jul 2021 16:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEFA660F23
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jul 2021 16:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEFA660F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8CD6E7FA;
	Wed, 28 Jul 2021 16:22:47 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBDC6E7FA
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jul 2021 16:22:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="192977760"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="192977760"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 09:22:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="437830169"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 09:22:44 -0700
Date: Wed, 28 Jul 2021 19:22:40 +0300
From: Imre Deak <imre.deak@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20210728162240.GD129487@ideak-desk.fi.intel.com>
References: <20210727185505.17276-1-anusha.srivatsa@intel.com>
 <20210727185505.17276-2-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727185505.17276-2-anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/dmc: Bump ADLP DMC version to
 v2.11
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

On Tue, Jul 27, 2021 at 11:55:05AM -0700, Anusha Srivatsa wrote:
> Release notes mention that this verion has:
> - Fixes for DC6v issue.
> - Flip queue enabled on pipe C and pipe D.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

I suggest merging this only once we can look at the firmware source. I
can't see this yet for v2.11.

> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 9895fd957df9..601c30b92739 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -45,8 +45,8 @@
>  
>  #define GEN12_DMC_MAX_FW_SIZE		ICL_DMC_MAX_FW_SIZE
>  
> -#define ADLP_DMC_PATH			DMC_PATH(adlp, 2, 10)
> -#define ADLP_DMC_VERSION_REQUIRED	DMC_VERSION(2, 10)
> +#define ADLP_DMC_PATH			DMC_PATH(adlp, 2, 11)
> +#define ADLP_DMC_VERSION_REQUIRED	DMC_VERSION(2, 11)
>  MODULE_FIRMWARE(ADLP_DMC_PATH);
>  
>  #define ADLS_DMC_PATH			DMC_PATH(adls, 2, 01)
> -- 
> 2.32.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
