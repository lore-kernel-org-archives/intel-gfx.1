Return-Path: <SRS0=0PWK=HA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8530C433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Jan 2021 16:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CB664DEB
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Jan 2021 16:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76CB664DEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55086E215;
	Fri, 29 Jan 2021 16:56:54 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30406E215
 for <intel-gfx@lists.freedesktop.org>; Fri, 29 Jan 2021 16:56:52 +0000 (UTC)
IronPort-SDR: 1mRaCTGnu7DeqTh6VvStPOODPO94Uh07ygSj27kbVU8Pj4CnQCMgbjBmy/Rp9Vd2XpMuE/c5V8
 k4+95HPmrQVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="241971980"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="241971980"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 08:56:51 -0800
IronPort-SDR: ArZMPgfaYKheNGDudyCzOhmxRAde/kCpsboTs6j5CSqJixBBgTkyFd8h7wub+dGh/4a3upyEDN
 oyJryWn3beBQ==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="365330453"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 08:56:50 -0800
Date: Fri, 29 Jan 2021 18:56:46 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20210129165646.GA183052@ideak-desk.fi.intel.com>
References: <20210128155948.13678-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128155948.13678-1-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Skip vswing programming for
 TBT
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 05:59:44PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> In thunderbolt mode the PHY is owned by the thunderbolt controller.
> We are not supposed to touch it. So skip the vswing programming
> as well (we already skipped the other steps not applicable to TBT).
> =

> Touching this stuff could supposedly interfere with the PHY
> programming done by the thunderbolt controller.
> =

> Cc: stable@vger.kernel.org
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Matches the spec:
Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 9506b8048530..c94650488dc1 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2827,6 +2827,9 @@ static void icl_mg_phy_ddi_vswing_sequence(struct i=
ntel_encoder *encoder,
>  	int n_entries, ln;
>  	u32 val;
>  =

> +	if (enc_to_dig_port(encoder)->tc_mode =3D=3D TC_PORT_TBT_ALT)
> +		return;
> +
>  	ddi_translations =3D icl_get_mg_buf_trans(encoder, crtc_state, &n_entri=
es);
>  =

>  	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
> @@ -2962,6 +2965,9 @@ tgl_dkl_phy_ddi_vswing_sequence(struct intel_encode=
r *encoder,
>  	u32 val, dpcnt_mask, dpcnt_val;
>  	int n_entries, ln;
>  =

> +	if (enc_to_dig_port(encoder)->tc_mode =3D=3D TC_PORT_TBT_ALT)
> +		return;
> +
>  	ddi_translations =3D tgl_get_dkl_buf_trans(encoder, crtc_state, &n_entr=
ies);
>  =

>  	if (drm_WARN_ON_ONCE(&dev_priv->drm, !ddi_translations))
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
