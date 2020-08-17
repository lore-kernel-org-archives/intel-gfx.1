Return-Path: <SRS0=qmob=B3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA00EC433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2020 22:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AFC20674
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2020 22:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87AFC20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192936E142;
	Mon, 17 Aug 2020 22:35:08 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1C36E142
 for <intel-gfx@lists.freedesktop.org>; Mon, 17 Aug 2020 22:35:06 +0000 (UTC)
IronPort-SDR: 5TaiWP7zcJ2tq6dBzT6lEUGXT6BGgCY/+2Lr02AdRhob837e+8BdtDwvF76I6n9xvjM1lXWLHc
 SC1y+v7IPnCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="216323957"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; d="scan'208";a="216323957"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 15:35:05 -0700
IronPort-SDR: DlhtX0rzetVOeAPQuMO6XFICxQndr4mAlVgoe/gnuXxf1HEm2CPPLNH9bwxe1B3wm9nZSpxuYB
 ny9R+7jUvIKQ==
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; d="scan'208";a="400327036"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 15:35:05 -0700
Date: Mon, 17 Aug 2020 15:35:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20200817223504.GE3213597@mdroper-desk1.amr.corp.intel.com>
References: <20200731115015.19706-1-anusha.srivatsa@intel.com>
 <20200731115015.19706-2-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731115015.19706-2-anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/dmc: Load DMC firmware v2.02
 for Rocket Lake
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

On Fri, Jul 31, 2020 at 04:50:15AM -0700, Anusha Srivatsa wrote:
> The latest firmware contains fix for PSR2 power saving.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_csr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_csr.c b/drivers/gpu/drm/i915/display/intel_csr.c
> index eb74eb123148..b6d0ce627d07 100644
> --- a/drivers/gpu/drm/i915/display/intel_csr.c
> +++ b/drivers/gpu/drm/i915/display/intel_csr.c
> @@ -40,8 +40,8 @@
>  
>  #define GEN12_CSR_MAX_FW_SIZE		ICL_CSR_MAX_FW_SIZE
>  
> -#define RKL_CSR_PATH			"i915/rkl_dmc_ver2_01.bin"
> -#define RKL_CSR_VERSION_REQUIRED	CSR_VERSION(2, 1)
> +#define RKL_CSR_PATH			"i915/rkl_dmc_ver2_02.bin"
> +#define RKL_CSR_VERSION_REQUIRED	CSR_VERSION(2, 2)
>  MODULE_FIRMWARE(RKL_CSR_PATH);
>  
>  #define TGL_CSR_PATH			"i915/tgl_dmc_ver2_07.bin"
> -- 
> 2.25.0
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
