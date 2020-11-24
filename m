Return-Path: <SRS0=tBxe=E6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED47EC63777
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 16:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9112020715
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 16:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9112020715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144F788FFE;
	Tue, 24 Nov 2020 16:19:34 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373988FFE
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 16:19:31 +0000 (UTC)
IronPort-SDR: M+Y0fN5miTfm8v47sTrMJa1NHiD3ZD1JwcWdO5LSVOvFjvJbc7cv3GHRjcNEeDCyN7HCib1hTE
 yAEqf/o42mLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="172070333"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="172070333"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 08:19:20 -0800
IronPort-SDR: R/vp+N2saGpbsoCfmL8SdNqY9anWrOyxRR+PXy5D6MZQGuSZJ+Y2dXouGBmqGTGHW5CmX/G3YG
 8b/Kd6eMw7zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="370419387"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 24 Nov 2020 08:19:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Nov 2020 18:19:17 +0200
Date: Tue, 24 Nov 2020 18:19:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Message-ID: <20201124161917.GM6112@intel.com>
References: <20201119155050.20328-2-uma.shankar@intel.com>
 <20201119193614.25914-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119193614.25914-1-uma.shankar@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [v3 1/2] drm/i915/display/tgl: Disable FBC with PSR2
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

On Fri, Nov 20, 2020 at 01:06:14AM +0530, Uma Shankar wrote:
> There are some corner cases wrt underrun when we enable
> FBC with PSR2 on TGL. Recommendation from hardware is to
> keep this combination disabled.
> =

> Bspec: 50422 HSD: 14010260002
> =

> v2: Added psr2 enabled check from crtc_state (Anshuman)
> Added Bspec link and HSD referneces (Jose)
> =

> v3: Moved the logic to disable fbc to intel_fbc_update_state_cache
> and removed the crtc->config usages, as per Ville's recommendation.
> =

> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index a5b072816a7b..cb29c6f068f9 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -701,6 +701,15 @@ static void intel_fbc_update_state_cache(struct inte=
l_crtc *crtc,
>  	struct drm_framebuffer *fb =3D plane_state->hw.fb;
>  =

>  	cache->plane.visible =3D plane_state->uapi.visible;
> +
> +	/*
> +	 * Tigerlake is not supporting FBC with PSR2.
> +	 * Recommendation is to keep this combination disabled
> +	 * Bspec: 50422 HSD: 14010260002
> +	 */
> +	if (crtc_state->has_psr2 && IS_TIGERLAKE(dev_priv))
> +		cache->plane.visible =3D false;
> +
>  	if (!cache->plane.visible)
>  		return;
>  =

> -- =

> 2.26.2

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
