Return-Path: <SRS0=iOfG=LD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DA9C48BCD
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 11:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED12661108
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 11:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED12661108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A386E8E7;
	Wed,  9 Jun 2021 11:25:26 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BE36E8E7
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Jun 2021 11:25:25 +0000 (UTC)
IronPort-SDR: g+8vcWcuYpjmcBrS5Q/VgrpvBZOSoLN3G0qnYXZ3EGiTmdwYbASYutZpqYsKK0j9BybgZWgqKY
 TwgAo3//hl6g==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="205079430"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="205079430"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 04:25:24 -0700
IronPort-SDR: fhrQ/L9jGFfDzrIYM31jsisMvE9xC9XOn9ILxgjSRLwdCFnDaKo4hcj8rtg5a96315QFKxtHkc
 CYLfOWStp1Eg==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="448248749"
Received: from akshayka-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.254.35.119])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 04:25:23 -0700
Date: Wed, 9 Jun 2021 07:25:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <YMClIQtPC/YeEsLZ@intel.com>
References: <20210609085632.22026-1-ville.syrjala@linux.intel.com>
 <20210609085632.22026-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609085632.22026-2-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915: Stop hand rolling
 drm_crtc_mask()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 11:56:27AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Use drm_crtc_mask() instead of hand rolling it.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 362bff9beb5c..62ad4cfae073 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6485,7 +6485,7 @@ int intel_get_load_detect_pipe(struct drm_connector=
 *connector,
>  	struct drm_atomic_state *state =3D NULL, *restore_state =3D NULL;
>  	struct drm_connector_state *connector_state;
>  	struct intel_crtc_state *crtc_state;
> -	int ret, i =3D -1;
> +	int ret;
>  =

>  	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
>  		    connector->base.id, connector->name,
> @@ -6519,8 +6519,7 @@ int intel_get_load_detect_pipe(struct drm_connector=
 *connector,
>  =

>  	/* Find an unused one (if possible) */
>  	for_each_crtc(dev, possible_crtc) {
> -		i++;
> -		if (!(encoder->possible_crtcs & (1 << i)))
> +		if (!(encoder->possible_crtcs & drm_crtc_mask(possible_crtc)))
>  			continue;
>  =

>  		ret =3D drm_modeset_lock(&possible_crtc->mutex, ctx);
> -- =

> 2.31.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
