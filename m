Return-Path: <SRS0=Y9sQ=OF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2810DC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Sep 2021 10:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC976115B
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Sep 2021 10:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAC976115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378CB6E8FA;
	Wed, 15 Sep 2021 10:14:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0068A6E8FE
 for <intel-gfx@lists.freedesktop.org>; Wed, 15 Sep 2021 10:14:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="222317821"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="222317821"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 03:14:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="553053858"
Received: from vmastnak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.214.245])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 03:14:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20210913144440.23008-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210913144440.23008-1-ville.syrjala@linux.intel.com>
 <20210913144440.23008-5-ville.syrjala@linux.intel.com>
Date: Wed, 15 Sep 2021 13:13:59 +0300
Message-ID: <87h7emywm0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH 04/16] drm/i915: Flatten
 hsw_crtc_compute_clock()
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 13 Sep 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> hsw_crtc_compute_clock() has become spaghetti. Flatten
> it a bit to make it at least semi-legible.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dpll.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/=
i915/display/intel_dpll.c
> index 210f91f4a576..ace9157a1c30 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll.c
> @@ -937,16 +937,18 @@ static int hsw_crtc_compute_clock(struct intel_crtc=
_state *crtc_state)
>  	struct intel_encoder *encoder =3D
>  		intel_get_crtc_new_encoder(state, crtc_state);
>=20=20
> -	if (IS_DG2(dev_priv)) {
> +	if (IS_DG2(dev_priv))
>  		return intel_mpllb_calc_state(crtc_state, encoder);
> -	} else if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DSI) ||
> -		   DISPLAY_VER(dev_priv) >=3D 11) {
> -		if (!intel_reserve_shared_dplls(state, crtc, encoder)) {
> -			drm_dbg_kms(&dev_priv->drm,
> -				    "failed to find PLL for pipe %c\n",
> -				    pipe_name(crtc->pipe));
> -			return -EINVAL;
> -		}
> +
> +	if (DISPLAY_VER(dev_priv) < 11 &&
> +	    intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DSI))
> +		return 0;
> +
> +	if (!intel_reserve_shared_dplls(state, crtc, encoder)) {
> +		drm_dbg_kms(&dev_priv->drm,
> +			    "failed to find PLL for pipe %c\n",
> +			    pipe_name(crtc->pipe));
> +		return -EINVAL;
>  	}
>=20=20
>  	return 0;

--=20
Jani Nikula, Intel Open Source Graphics Center
