Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF0CC63777
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 22:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CDB42084C
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 22:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CDB42084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C59F6E8E6;
	Mon, 30 Nov 2020 22:00:39 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964CD6E8E6
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 22:00:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23168644-1500050 for multiple; Mon, 30 Nov 2020 22:00:35 +0000
MIME-Version: 1.0
In-Reply-To: <20201130212200.2811939-5-imre.deak@intel.com>
References: <20201130212200.2811939-1-imre.deak@intel.com>
 <20201130212200.2811939-5-imre.deak@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 22:00:33 +0000
Message-ID: <160677363371.12351.7483170084025008582@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 4/9] drm/i915/ddi: Track power reference
 taken for encoder DDI IO use
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

Quoting Imre Deak (2020-11-30 21:21:55)
> Add wakeref tracking for the DDI encoders' DDI_IO display power domain
> references.
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c      | 38 ++++++++++++-------
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 92940a0c5ef8..9518d298b0f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2285,9 +2285,11 @@ static void intel_ddi_get_power_domains(struct intel_encoder *encoder,
>         dig_port = enc_to_dig_port(encoder);
>  
>         if (!intel_phy_is_tc(dev_priv, phy) ||
> -           dig_port->tc_mode != TC_PORT_TBT_ALT)
> -               intel_display_power_get(dev_priv,
> -                                       dig_port->ddi_io_power_domain);
> +           dig_port->tc_mode != TC_PORT_TBT_ALT) {
> +               drm_WARN_ON(&dev_priv->drm, dig_port->ddi_io_wakeref);
> +               dig_port->ddi_io_wakeref = intel_display_power_get(dev_priv,
> +                                                                  dig_port->ddi_io_power_domain);
> +       }

> @@ -3958,8 +3967,9 @@ static void intel_ddi_post_disable_hdmi(struct intel_atomic_state *state,
>  
>         intel_disable_ddi_buf(encoder, old_crtc_state);
>  
> -       intel_display_power_put_unchecked(dev_priv,
> -                                         dig_port->ddi_io_power_domain);
> +       intel_display_power_put(dev_priv,
> +                               dig_port->ddi_io_power_domain,
> +                               fetch_and_zero(&dig_port->ddi_io_wakeref));

I remember that once we had trouble with this being a macro and not
evaluating the fetch_and_zero() when used as an argument.

Looks like we still have the same trouble with

#if !IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
static inline void
intel_display_power_put(struct drm_i915_private *i915,
                        enum intel_display_power_domain domain,
                        intel_wakeref_t wakeref)
{
        intel_display_power_put_unchecked(i915, domain);
}
#endif

will cause the ddi_io_wakeref to not be cleared, and the warn on to be
hit in non-debug builds.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
