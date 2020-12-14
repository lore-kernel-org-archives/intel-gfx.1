Return-Path: <SRS0=LtMi=FS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272C4C1B0D8
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Dec 2020 13:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C90BE224B1
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Dec 2020 13:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C90BE224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285FD6E1BB;
	Mon, 14 Dec 2020 13:25:40 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D284E6E176;
 Mon, 14 Dec 2020 13:25:38 +0000 (UTC)
IronPort-SDR: xQyAK9+9nxC1WYBNmFux3vmvOoD+IE/P0eh5meE7Bo/zh5nDd0L+Eo9UfjlsnMFwegw39PMcPY
 MKtb1G4G8SQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="236288102"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="236288102"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 05:25:38 -0800
IronPort-SDR: PyJIfVqCzWY11pfBVp6LJrv3h0HI9dghDvuSVHqDqbmth/yLmhP57Wje0Pdj2VaoV30hZH/Z+2
 OENSyC0I608g==
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="336083251"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 05:25:35 -0800
Date: Mon, 14 Dec 2020 18:55:25 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20201214132525.GA22687@intel.com>
References: <20201211134244.14588-1-anshuman.gupta@intel.com>
 <20201211134244.14588-20-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211134244.14588-20-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH v8 19/19] drm/i915/hdcp: Enable HDCP 2.2 MST
 support
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 2020-12-11 at 19:12:44 +0530, Anshuman Gupta wrote:
> Enable HDCP 2.2 MST support till Gen12.
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Tested-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 768a6218b9c4..20c8d8f63566 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2233,7 +2233,7 @@ int intel_hdcp_init(struct intel_connector *connector,
>  	if (!shim)
>  		return -EINVAL;
>  
> -	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
> +	if (is_hdcp2_supported(dev_priv))
>  		intel_hdcp2_init(connector, dig_port, shim);
>  
>  	ret =
> -- 
> 2.26.2
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
