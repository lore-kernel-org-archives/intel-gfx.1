Return-Path: <SRS0=oFzv=MP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7817C4338F
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Jul 2021 23:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7706560E99
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Jul 2021 23:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7706560E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9EA6F96A;
	Fri, 23 Jul 2021 23:42:55 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A95D6F96A
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Jul 2021 23:42:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="199173400"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="199173400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 16:42:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="513756535"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 16:42:52 -0700
Date: Fri, 23 Jul 2021 16:42:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20210723234251.GF1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210721215238.24980-1-anusha.srivatsa@intel.com>
 <20210721215238.24980-3-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210721215238.24980-3-anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [CI 3/4] drm/i915/firmware: Update to DMC v2.12 on
 TGL
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

On Wed, Jul 21, 2021 at 02:52:37PM -0700, Anusha Srivatsa wrote:
> Add support to the latest DMC firmware.
> 
> Cc: Madhunitha Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Reviewed-by: Madhumitha Pradeep <

You seem to have lost Madhumitha's email address on a couple of these
patches.


Matt

> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 1f6c32932331..50093e7b088a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -61,8 +61,8 @@ MODULE_FIRMWARE(DG1_DMC_PATH);
>  #define RKL_DMC_VERSION_REQUIRED	DMC_VERSION(2, 2)
>  MODULE_FIRMWARE(RKL_DMC_PATH);
>  
> -#define TGL_DMC_PATH			DMC_PATH(tgl, 2, 08)
> -#define TGL_DMC_VERSION_REQUIRED	DMC_VERSION(2, 8)
> +#define TGL_DMC_PATH			DMC_PATH(tgl, 2, 12)
> +#define TGL_DMC_VERSION_REQUIRED	DMC_VERSION(2, 12)
>  MODULE_FIRMWARE(TGL_DMC_PATH);
>  
>  #define ICL_DMC_PATH			DMC_PATH(icl, 1, 09)
> -- 
> 2.32.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

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
