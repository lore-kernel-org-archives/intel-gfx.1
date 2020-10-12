Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A260C433E7
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 20:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD98F206F4
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 20:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD98F206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E37C6E5BB;
	Mon, 12 Oct 2020 20:16:57 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA0D6E5BB
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2020 20:16:55 +0000 (UTC)
IronPort-SDR: EQoRqej69Ko/KLfCqw+xEKwSnQIrJDpuqhzYprM6CnbrWi/T8lFXX+w9rdHN2pdnWFkHbEaQtZ
 S27bFGpwdbZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="145663199"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="145663199"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 13:16:55 -0700
IronPort-SDR: ustFtLP+kwoachd0dlFfFT3W5CrWtuPUfkDkejrYhv6GcjxuIfbQJyUtRtg+hqHi2LXrH8Xt5p
 1fDU/ucQBMuA==
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; d="scan'208";a="530104096"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 13:16:53 -0700
Date: Mon, 12 Oct 2020 23:16:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20201012201650.GC2349678@ideak-desk.fi.intel.com>
References: <20201006185809.4655-1-ville.syrjala@linux.intel.com>
 <20201006185809.4655-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201006185809.4655-2-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Do drm_mode_config_reset()
 after HPD init
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 09:58:08PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> LSPCON requires HPD detection logic to be enabled when we call
> its .reset() hook during resume, to check the live state of the
> pin. To that end let's reorder the resume sequence such that
> we do HPD init before the encoder reset.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_=
drv.c
> index b2a050d916e3..66ddd4161885 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1213,21 +1213,20 @@ static int i915_drm_resume(struct drm_device *dev)
>  	 * GPU will hang. i915_gem_init_hw() will initiate batches to
>  	 * update/restore the context.
>  	 *
> -	 * drm_mode_config_reset() needs AUX interrupts.
> -	 *
>  	 * Modeset enabling in intel_modeset_init_hw() also needs working
>  	 * interrupts.
>  	 */
>  	intel_runtime_pm_enable_interrupts(dev_priv);
>  =

> -	drm_mode_config_reset(dev);
> -
>  	i915_gem_resume(dev_priv);
>  =

>  	intel_modeset_init_hw(dev_priv);
>  	intel_init_clock_gating(dev_priv);
>  	intel_hpd_init(dev_priv);
>  =

> +	/* May need AUX interrupts and HPD detection enabled */
> +	drm_mode_config_reset(dev);

lspcon_resume() could be called both by the above and during connector
detection. Delaying hotplug detection until after intel_display_resume()
would be the ideal solution, but until that we could avoid this race by
taking connection_mutex.

> +
>  	/* MST sideband requires HPD interrupts enabled */
>  	intel_dp_mst_resume(dev_priv);
>  	intel_display_resume(dev);
> -- =

> 2.26.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
