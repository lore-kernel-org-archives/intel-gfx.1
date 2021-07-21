Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED56BC12002
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 17:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B224461246
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 17:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B224461246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596D46E85F;
	Wed, 21 Jul 2021 17:42:05 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC686E85F
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jul 2021 17:42:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198756092"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="198756092"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 10:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="662193234"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2021 10:42:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 21 Jul 2021 10:42:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 10:42:00 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2242.010;
 Wed, 21 Jul 2021 10:42:00 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH v2 40/50] drm/i915/dg2: DG2 has fixed memory
 bandwidth
Thread-Index: AQHXeF6loPU8PzwNa0C6a1X6JWGryatNvoyw
Date: Wed, 21 Jul 2021 17:42:00 +0000
Message-ID: <580c719e8cb94bc084302e2cd2e96620@intel.com>
References: <20210714031540.3539704-1-matthew.d.roper@intel.com>
 <20210714031540.3539704-41-matthew.d.roper@intel.com>
In-Reply-To: <20210714031540.3539704-41-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 40/50] drm/i915/dg2: DG2 has fixed memory
 bandwidth
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Matt Roper
> Sent: Tuesday, July 13, 2021 8:16 PM
> To: intel-gfx@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v2 40/50] drm/i915/dg2: DG2 has fixed memory
> bandwidth
> 
> DG2 doesn't have a SAGV or QGV points that determine memory bandwidth.
> Instead it has a constant amount of memory bandwidth available to display
> that does not need to be reduced based on the number of active planes.
> 
> For simplicity, we'll just modify driver initialization to create a single dummy
> QGV point with the proper amount of memory bandwidth, rather than trying
> to query the pcode for this information.
> 
> Bspec: 64631
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bw.c | 24
> +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c
> b/drivers/gpu/drm/i915/display/intel_bw.c
> index 0d5d52548925..f554c1974072 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -273,6 +273,26 @@ static int icl_get_bw_info(struct drm_i915_private
> *dev_priv, const struct intel
>  	return 0;
>  }
> 
> +static void dg2_get_bw_info(struct drm_i915_private *i915) {
> +	struct intel_bw_info *bi = &i915->max_bw[0];
> +
> +	/*
> +	 * DG2 doesn't have SAGV or QGV points, just a constant max
> bandwidth
> +	 * that doesn't depend on the number of planes enabled.  Create a
> +	 * single dummy QGV point to reflect that.  DG2-G10 platforms have
> a
> +	 * constant 50 GB/s bandwidth, whereas DG2-G11 platforms have 38
> GB/s.
> +	 */
> +	bi->num_planes = 1;
> +	bi->num_qgv_points = 1;
> +	if (IS_DG2_G11(i915))
> +		bi->deratedbw[0] = 38000;
> +	else
> +		bi->deratedbw[0] = 50000;
> +
> +	i915->sagv_status = I915_SAGV_NOT_CONTROLLED; }
> +
>  static unsigned int icl_max_bw(struct drm_i915_private *dev_priv,
>  			       int num_planes, int qgv_point)  { @@ -306,7
> +326,9 @@ void intel_bw_init_hw(struct drm_i915_private *dev_priv)
>  	if (!HAS_DISPLAY(dev_priv))
>  		return;
> 
> -	if (IS_ALDERLAKE_S(dev_priv) || IS_ALDERLAKE_P(dev_priv))
> +	if (IS_DG2(dev_priv))
> +		dg2_get_bw_info(dev_priv);
> +	else if (IS_ALDERLAKE_S(dev_priv) || IS_ALDERLAKE_P(dev_priv))
>  		icl_get_bw_info(dev_priv, &adls_sa_info);
>  	else if (IS_ROCKETLAKE(dev_priv))
>  		icl_get_bw_info(dev_priv, &rkl_sa_info);
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
