Return-Path: <SRS0=p/WI=DH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEE1C4727C
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 15:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E522071E
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 15:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9E522071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40E089ECB;
	Wed, 30 Sep 2020 15:23:41 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556D289ECB
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 15:23:40 +0000 (UTC)
IronPort-SDR: bfdExLGSqY8jcY2jX9ykTLys+HWfUsEBlT69v84rHhj9BtNUShT7YIc7dnSy/JTKXEtd0Bus78
 wXOc19f09rCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="224067616"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="224067616"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 08:21:31 -0700
IronPort-SDR: eHlYnNUHqzIr/1YRJX22UjaXVYuMUkrRM/+xMNwzavpwttVdxja/EYyv3VtZTIu43zKsYXAhXS
 gDiGgML+6EdA==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="497977348"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 08:21:30 -0700
Date: Wed, 30 Sep 2020 18:21:26 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20200930152126.GF867650@ideak-desk.fi.intel.com>
References: <20200929233449.32323-1-ville.syrjala@linux.intel.com>
 <20200929233449.32323-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929233449.32323-7-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 06/11] drm/i915: Split ICL MG PHY buf
 trans per output type
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

On Wed, Sep 30, 2020 at 02:34:44AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Make the mess inside the buf trans funcs a bit more manageable by
> splitting along the lines of output type.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 31 ++++++++++++++++++------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 4c3416d89f30..e3c6d4942b68 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -1079,19 +1079,34 @@ icl_get_combo_buf_trans(struct intel_encoder *enc=
oder, int type, int rate,
>  }
>  =

>  static const struct icl_mg_phy_ddi_buf_trans *
> -icl_get_mg_buf_trans(struct intel_encoder *encoder, int type, int rate,
> -		     int *n_entries)
> +icl_get_mg_buf_trans_hdmi(struct intel_encoder *encoder, int type, int r=
ate,
> +			  int *n_entries)
>  {
> -	if (type =3D=3D INTEL_OUTPUT_HDMI) {
> -		*n_entries =3D ARRAY_SIZE(icl_mg_phy_ddi_translations_hdmi);
> -		return icl_mg_phy_ddi_translations_hdmi;
> -	} else if (rate > 270000) {
> +	*n_entries =3D ARRAY_SIZE(icl_mg_phy_ddi_translations_hdmi);
> +	return icl_mg_phy_ddi_translations_hdmi;
> +}
> +
> +static const struct icl_mg_phy_ddi_buf_trans *
> +icl_get_mg_buf_trans_dp(struct intel_encoder *encoder, int type, int rat=
e,
> +			int *n_entries)
> +{
> +	if (rate > 270000) {
>  		*n_entries =3D ARRAY_SIZE(icl_mg_phy_ddi_translations_hbr2_hbr3);
>  		return icl_mg_phy_ddi_translations_hbr2_hbr3;
> +	} else {
> +		*n_entries =3D ARRAY_SIZE(icl_mg_phy_ddi_translations_rbr_hbr);
> +		return icl_mg_phy_ddi_translations_rbr_hbr;
>  	}
> +}
>  =

> -	*n_entries =3D ARRAY_SIZE(icl_mg_phy_ddi_translations_rbr_hbr);
> -	return icl_mg_phy_ddi_translations_rbr_hbr;
> +static const struct icl_mg_phy_ddi_buf_trans *
> +icl_get_mg_buf_trans(struct intel_encoder *encoder, int type, int rate,
> +		     int *n_entries)
> +{
> +	if (type =3D=3D INTEL_OUTPUT_HDMI)
> +		return icl_get_mg_buf_trans_hdmi(encoder, type, rate, n_entries);
> +	else
> +		return icl_get_mg_buf_trans_dp(encoder, type, rate, n_entries);
>  }
>  =

>  static const struct cnl_ddi_buf_trans *
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
