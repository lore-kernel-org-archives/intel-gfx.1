Return-Path: <SRS0=b0kO=KH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8352CC433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 12 May 2021 22:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E43A613D3
	for <intel-gfx@archiver.kernel.org>; Wed, 12 May 2021 22:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E43A613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0A6E550;
	Wed, 12 May 2021 22:11:48 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3FD6E550
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 May 2021 22:11:47 +0000 (UTC)
IronPort-SDR: fM+8xcQns8jzvI4RmgrGIovEkVTqJpB7Ta2kJmpOz/ts60v64CgLGqsp2A9h45yaVt5neNR3W0
 yFBhb4uMWzrg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="261066140"
X-IronPort-AV: E=Sophos;i="5.82,295,1613462400"; d="scan'208";a="261066140"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 15:11:43 -0700
IronPort-SDR: hwEHCgyYGuahNmLRtPf9PgVuy4AzthB9t8K9nrxj0rtNwi3XidoIuFRKsdlajyAzFPcUCOMnAN
 4fMtOXr5AKKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,295,1613462400"; d="scan'208";a="622926907"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 12 May 2021 15:11:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 15:11:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 15:11:40 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2106.013;
 Wed, 12 May 2021 15:11:40 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH v3 39/48] drm/i915/bigjoiner: Mode validation
 with uncompressed pipe joiner
Thread-Index: AQHXQ7HsHYNbGU6ynkuIm20de1r1g6rgb8Xw
Date: Wed, 12 May 2021 22:11:40 +0000
Message-ID: <8ff9dd11154543e88f8c11164c6b97d7@intel.com>
References: <20210508022820.780227-1-matthew.d.roper@intel.com>
 <20210508022820.780227-40-matthew.d.roper@intel.com>
In-Reply-To: <20210508022820.780227-40-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v3 39/48] drm/i915/bigjoiner: Mode
 validation with uncompressed pipe joiner
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



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: Friday, May 7, 2021 7:28 PM
> To: intel-gfx@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v3 39/48] drm/i915/bigjoiner: Mode validation
> with uncompressed pipe joiner
> 
> From: Animesh Manna <animesh.manna@intel.com>
> 
> No need for checking dsc flag for uncompressed pipe joiner mode validation.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> Signed-off-by: Clinton Taylor <Clinton.A.Taylor@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index b9b8a0b9889a..92d4c5ab32d7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -819,8 +819,11 @@ intel_dp_mode_valid(struct drm_connector
> *connector,
>  		dsc = dsc_max_output_bpp && dsc_slice_count;
>  	}
> 
> -	/* big joiner configuration needs DSC */
> -	if (bigjoiner && !dsc)
> +	/*
> +	 * Big joiner configuration needs DSC for TGL which is not true for
> +	 * XE_LPD where uncompressed joiner is supported.
> +	 */
> +	if (DISPLAY_VER(dev_priv) < 13 && bigjoiner && !dsc)
>  		return MODE_CLOCK_HIGH;
> 
>  	if (mode_rate > max_rate && !dsc)
> --
> 2.25.4
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
