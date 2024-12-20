Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8752E77188
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Dec 2024 08:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C5510EF3E;
	Fri, 20 Dec 2024 08:50:29 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351510EF25
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Dec 2024 08:50:28 +0000 (UTC)
Received: from 91-155-254-69.elisa-laajakaista.fi ([91.155.254.69]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tOYiH-000000038eu-1YJh; Fri, 20 Dec 2024 10:50:25 +0200
Message-ID: <c15500f96cb016e17d497c87252de966945324c3.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Fri, 20 Dec 2024 10:50:23 +0200
In-Reply-To: <20241219130827.22830-4-ville.syrjala@linux.intel.com>
References: <20241219130827.22830-1-ville.syrjala@linux.intel.com>
 <20241219130827.22830-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/8] drm/i915/scaler: Extract skl_scaler_min_dst_size()
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

On Thu, 2024-12-19 at 15:08 +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> The SKL_MIN_DST_* defines just make things hard to read.
> Get rid of them and introduce an easy to read function
> in their place.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_scaler.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index d6bef6578867..cabbf4860cb3 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -76,9 +76,7 @@ static u16 skl_scaler_calc_phase(int sub, int scale, bo=
ol chroma_cosited)
>  	return ((phase >> 2) & PS_PHASE_MASK) | trip;
>  }
> =20
> -#define SKL_MIN_DST_W 8
>  #define SKL_MAX_DST_W 4096
> -#define SKL_MIN_DST_H 8
>  #define SKL_MAX_DST_H 4096
>  #define ICL_MAX_DST_W 5120
>  #define ICL_MAX_DST_H 4096
> @@ -119,6 +117,12 @@ static void skl_scaler_max_src_size(struct intel_crt=
c *crtc,
>  	}
>  }
> =20
> +static void skl_scaler_min_dst_size(int *min_w, int *min_h)
> +{
> +	*min_w =3D 8;
> +	*min_h =3D 8;
> +}
> +
>  static int
>  skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach=
,
>  		  unsigned int scaler_user, int *scaler_id,
> @@ -186,8 +190,7 @@ skl_update_scaler(struct intel_crtc_state *crtc_state=
, bool force_detach,
>  	skl_scaler_min_src_size(format, modifier, &min_src_w, &min_src_h);
>  	skl_scaler_max_src_size(crtc, &max_src_w, &max_src_h);
> =20
> -	min_dst_w =3D SKL_MIN_DST_W;
> -	min_dst_h =3D SKL_MIN_DST_H;
> +	skl_scaler_min_dst_size(&min_dst_w, &min_dst_h);
> =20
>  	if (DISPLAY_VER(display) < 11) {
>  		max_dst_w =3D SKL_MAX_DST_W;

Not sure this makes much difference in readability, but I guess it fits
the overall idea.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
