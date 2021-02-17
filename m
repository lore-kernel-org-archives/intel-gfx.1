Return-Path: <SRS0=t69m=HT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F98C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 18:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCEB64DFF
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 18:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCEB64DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AA089DC9;
	Wed, 17 Feb 2021 18:19:19 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339066E9AC;
 Wed, 17 Feb 2021 18:19:19 +0000 (UTC)
IronPort-SDR: YSTstMiHTgLANwvcNlRa6PhDEd0aSb+lhj6v88QkQu9WHkcrQbLhahrEjuHITQloBrRKNwnTsf
 jeKdsA+4Ka9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="162409033"
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="162409033"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 10:19:01 -0800
IronPort-SDR: 10/4LOWbbDnZydEs+vFTlUYsXzTSAzQnuDjBVxyDtp4FHP9x+tcj8xiNBV49xXOPLYOR6BMZ3y
 Q5hA4fy5S5Tw==
X-IronPort-AV: E=Sophos;i="5.81,185,1610438400"; d="scan'208";a="401386165"
Received: from gfreude-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.209.147.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 10:19:00 -0800
Date: Wed, 17 Feb 2021 13:18:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <YC1eEmjZigHbYYyy@intel.com>
References: <20210217025337.1929015-1-lyude@redhat.com>
 <20210217025337.1929015-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210217025337.1929015-2-lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/icp+: Use
 icp_hpd_irq_setup() instead of spt_hpd_irq_setup()
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 09:53:37PM -0500, Lyude Paul wrote:
> While reviewing patches for handling workarounds related to gen9 bc, Imre
> from Intel discovered that we're using spt_hpd_irq_setup() on ICP+ PCHs
> despite it being almost the same as icp_hpd_irq_setup(). Since we need to
> be calling icp_hpd_irq_setup() to ensure that CML-S/TGP platforms function
> correctly anyway, let's move platforms using PCH_ICP which aren't handled
> by gen11_hpd_irq_setup() over to icp_hpd_irq_setup().
> 
> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>


makes sense to me...


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/i915/i915_irq.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index f86b147f588f..7ec61187a315 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -4320,6 +4320,8 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
>  			dev_priv->display.hpd_irq_setup = gen11_hpd_irq_setup;
>  		else if (IS_GEN9_LP(dev_priv))
>  			dev_priv->display.hpd_irq_setup = bxt_hpd_irq_setup;
> +		else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
> +			dev_priv->display.hpd_irq_setup = icp_hpd_irq_setup;
>  		else if (INTEL_PCH_TYPE(dev_priv) >= PCH_SPT)
>  			dev_priv->display.hpd_irq_setup = spt_hpd_irq_setup;
>  		else
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
