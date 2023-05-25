Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EE3C77B7A
	for <intel-gfx@archiver.kernel.org>; Thu, 25 May 2023 09:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA34910E87B;
	Thu, 25 May 2023 09:52:18 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F5C10E87B;
 Thu, 25 May 2023 09:52:16 +0000 (UTC)
Received: from 91-155-254-196.elisa-laajakaista.fi ([91.155.254.196]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1q27dk-008cQS-6q;
 Thu, 25 May 2023 12:52:14 +0300
Message-ID: <cca3bd86b996549e5e137cbd1f06f57237f0d3b7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 25 May 2023 12:52:11 +0300
In-Reply-To: <20230502143906.2401-10-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-10-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 09/11] drm/i915: Stop spamming the logs with
 PLL state
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 2023-05-02 at 17:39 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> encoder->get_config() is not the place where the state
> should be dumped. Get rid of the spam.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 51ae1aad7cc7..65e031ff740c 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3863,11 +3863,9 @@ static void mtl_ddi_get_config(struct intel_encode=
r *encoder,
>  		crtc_state->port_clock =3D intel_mtl_tbt_calc_port_clock(encoder);
>  	} else if (intel_is_c10phy(i915, phy)) {
>  		intel_c10pll_readout_hw_state(encoder, &crtc_state->cx0pll_state.c10);
> -		intel_c10pll_dump_hw_state(i915, &crtc_state->cx0pll_state.c10);
>  		crtc_state->port_clock =3D intel_c10pll_calc_port_clock(encoder, &crtc=
_state->cx0pll_state.c10);
>  	} else {
>  		intel_c20pll_readout_hw_state(encoder, &crtc_state->cx0pll_state.c20);
> -		intel_c20pll_dump_hw_state(i915, &crtc_state->cx0pll_state.c20);
>  		crtc_state->port_clock =3D intel_c20pll_calc_port_clock(encoder, &crtc=
_state->cx0pll_state.c20);
>  	}
> =20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
