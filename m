Return-Path: <SRS0=t6nC=G7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592A8C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Jan 2021 19:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E447464E32
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Jan 2021 19:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E447464E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7026E219;
	Thu, 28 Jan 2021 19:13:57 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A186E219
 for <intel-gfx@lists.freedesktop.org>; Thu, 28 Jan 2021 19:13:55 +0000 (UTC)
IronPort-SDR: WoL7rxzElMGcoJQKBTFgGw/rFrruXw7tBSYWv6q3+oVe2uUeg18aEq6om6jp8R9VGDComtuK+M
 38KoRntwUuFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="176788524"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="176788524"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 11:13:54 -0800
IronPort-SDR: Z/oT6w/4/Bm63kzNjh7tu4rQpNZzER6jUsMVXXYlwuBSyh3IwP4IAzpC4XRm7IGxPi/XKXflNy
 kOIDfCxJHYcg==
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="388963507"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 11:13:53 -0800
Date: Thu, 28 Jan 2021 21:13:49 +0200
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20210128191349.GE142820@ideak-desk.fi.intel.com>
References: <20210127181909.128094-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127181909.128094-1-imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable runtime power management
 during shutdown
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
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 08:19:09PM +0200, Imre Deak wrote:
> At least on some TGL platforms PUNIT wants to access some display HW
> registers, but it doesn't handle display power managment (disabling DC
> states as required) and so this register access will lead to a hang. To
> prevent this disable runtime power management for poweroff and reboot.
> 
> Reported-and-tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Chris or Ville, could you ack if you see no problem with this?

> ---
>  drivers/gpu/drm/i915/i915_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 0037b81d991e..6f83cca8e27b 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1054,6 +1054,8 @@ static void intel_shutdown_encoders(struct drm_i915_private *dev_priv)
>  void i915_driver_shutdown(struct drm_i915_private *i915)
>  {
>  	disable_rpm_wakeref_asserts(&i915->runtime_pm);
> +	intel_runtime_pm_disable(&i915->runtime_pm);
> +	intel_power_domains_disable(i915);
>  
>  	i915_gem_suspend(i915);
>  
> @@ -1069,7 +1071,10 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
>  	intel_suspend_encoders(i915);
>  	intel_shutdown_encoders(i915);
>  
> +	intel_power_domains_driver_remove(i915);
>  	enable_rpm_wakeref_asserts(&i915->runtime_pm);
> +
> +	intel_runtime_pm_driver_release(&i915->runtime_pm);
>  }
>  
>  static bool suspend_to_idle(struct drm_i915_private *dev_priv)
> -- 
> 2.25.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
