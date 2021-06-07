Return-Path: <SRS0=wI8T=LB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13183C47095
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 12:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73E5610E7
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 12:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73E5610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42906E3CE;
	Mon,  7 Jun 2021 12:14:32 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152CC6E1E8;
 Mon,  7 Jun 2021 12:14:31 +0000 (UTC)
IronPort-SDR: p6y4pkaz0Jn4NjmTcKPNAO3iY5PJYN/1WMX7y98dZxO+pQPGTX3CkwQ+iSsJlrpMqqJkO5E9mP
 Z+iJMTPBEwUw==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="184978833"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="184978833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 05:14:30 -0700
IronPort-SDR: 6YUEijo5gp57lt5Wt+3kLuXFJqA6hXtBsVkUnYyZhnmxNcGteF8UHyL9pRBjGi/ebyYyFJwU3j
 rLumhES3Cgfw==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="449064384"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 05:14:26 -0700
Date: Mon, 7 Jun 2021 15:14:23 +0300
From: Imre Deak <imre.deak@intel.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Message-ID: <20210607121423.GB3787465@ideak-desk.fi.intel.com>
References: <20210605032209.16111-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210605032209.16111-1-wanjiabing@vivo.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: remove duplicated argument
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sat, Jun 05, 2021 at 11:22:07AM +0800, Wan Jiabing wrote:
> Fix the following coccicheck warning:
> 
> ./drivers/gpu/drm/i915/display/intel_display_power.c:3081:1-28:
>  duplicated argument to & or |
> 
> This commit fixes duplicate argument. It might be a typo.
> But what I can do is to remove it now.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Thanks, pushed to drm-intel-next.

> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 3e1f6ec61514..4298ae684d7d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -3078,7 +3078,6 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_C_LANES) |	\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_D_XELPD) |	\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_E_XELPD) |	\
> -	BIT_ULL(POWER_DOMAIN_AUX_C) |			\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC1) |	\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC2) |	\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC3) |	\
> -- 
> 2.20.1
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
