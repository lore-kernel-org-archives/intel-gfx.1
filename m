Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771FCC77B7A
	for <intel-gfx@archiver.kernel.org>; Thu, 25 May 2023 09:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1108610E899;
	Thu, 25 May 2023 09:58:32 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449AF10E888;
 Thu, 25 May 2023 09:58:30 +0000 (UTC)
Received: from 91-155-254-196.elisa-laajakaista.fi ([91.155.254.196]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1q27jl-008cR5-R2;
 Thu, 25 May 2023 12:58:27 +0300
Message-ID: <42f08a82863017a9382aa393bb9b8c44af49cf42.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 25 May 2023 12:58:24 +0300
In-Reply-To: <20230502143906.2401-12-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-12-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 11/11] drm/i915: Reduce combo PHY log spam
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
> We always check whether combo PHYs need to be re-initialized
> after disabling DC states, which leads to log spam. Switch things
> around so that we only log something when we actually have to
> re-initialized a PHY.
>=20
> The log spam was exacerbated by commit 41b4c7fe72b6 ("drm/i915:
> Disable DC states for all commits") since we now disable DC
> states far more often.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_combo_phy.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu=
/drm/i915/display/intel_combo_phy.c
> index 922a6d87b553..ee843f2b1af1 100644
> --- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
> @@ -114,10 +114,6 @@ static bool icl_verify_procmon_ref_values(struct drm=
_i915_private *dev_priv,
> =20
>  	procmon =3D icl_get_procmon_ref_values(dev_priv, phy);
> =20
> -	drm_dbg_kms(&dev_priv->drm,
> -		    "Combo PHY %c Voltage/Process Info : %s\n",
> -		    phy_name(phy), procmon->name);
> -
>  	ret =3D check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW1(phy),
>  			    (0xff << 16) | 0xff, procmon->dw1);
>  	ret &=3D check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW9(phy),
> @@ -312,14 +308,17 @@ static void icl_combo_phys_init(struct drm_i915_pri=
vate *dev_priv)
>  	enum phy phy;
> =20
>  	for_each_combo_phy(dev_priv, phy) {
> +		const struct icl_procmon *procmon;
>  		u32 val;
> =20
> -		if (icl_combo_phy_verify_state(dev_priv, phy)) {
> -			drm_dbg(&dev_priv->drm,
> -				"Combo PHY %c already enabled, won't reprogram it.\n",
> -				phy_name(phy));
> +		if (icl_combo_phy_verify_state(dev_priv, phy))
>  			continue;
> -		}
> +
> +		procmon =3D icl_get_procmon_ref_values(dev_priv, phy);
> +
> +		drm_dbg(&dev_priv->drm,
> +			"Initializing combo PHY %c (Voltage/Process Info : %s)\n",
> +			phy_name(phy), procmon->name);
> =20
>  		if (!has_phy_misc(dev_priv, phy))
>  			goto skip_phy_misc;

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
