Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9006ECAAD2
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Aug 2022 08:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23EC10EEAE;
	Mon, 29 Aug 2022 08:01:53 +0000 (UTC)
X-Greylist: delayed 1097 seconds by postgrey-1.36 at gabe;
 Mon, 29 Aug 2022 08:01:49 UTC
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D29410EEAE
 for <intel-gfx@lists.freedesktop.org>; Mon, 29 Aug 2022 08:01:49 +0000 (UTC)
Received: from 91-155-254-206.elisa-laajakaista.fi ([91.155.254.206]
 helo=[192.168.100.239])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1oSZQf-0030bs-0h;
 Mon, 29 Aug 2022 10:43:30 +0300
Message-ID: <3b308cf844de6200fa7ccc4c56ac6fc9cb5a296b.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Date: Mon, 29 Aug 2022 10:43:28 +0300
In-Reply-To: <DM6PR11MB3177C91BAF3D7E483D0B2825BA769@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220826121741.25485-1-animesh.manna@intel.com>
 <DM6PR11MB3177C91BAF3D7E483D0B2825BA769@DM6PR11MB3177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-1+b1 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/mtl: Added restriction for
 plane downscaling
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

On Mon, 2022-08-29 at 02:48 +0000, Murthy, Arun R wrote:
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf
> > Of
> > Animesh Manna
> > Sent: Friday, August 26, 2022 5:48 PM
> > To: intel-gfx@lists.freedesktop.org
> > Subject: [Intel-gfx] [PATCH 1/2] drm/i915/mtl: Added restriction
> > for plane
> > downscaling
> >=20
> > The second Scaler (i.e. Scaler 2) does not support vertical
> > downscaling (i.e.
> > it's vertical scale factor must not be greater than 1.0). So,
> > vertical plane
> > downscaling is not supported on MTL, scale factor modified
> > accordingly.
> >=20
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/i915/display/skl_universal_plane.c | 7 +++++--
> > =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index bcfde81e4d08..6bfcda748e7b 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -1464,9 +1464,12 @@ static int skl_plane_max_scale(struct
> > drm_i915_private *dev_priv,
> > =C2=A0	 * whether we can use the HQ scaler mode. Assume
> > =C2=A0	 * the best case.
> > =C2=A0	 * FIXME need to properly check this later.
> > +	 * FIXME On MTL, adjust specific scaler's downscaling
> > capability.
> This should not be FIXME and this is a limitation of hardware. A NOTE
> can be added instead!

I have been working on this and I have a proper implementation for this
FIXME.

This patch is not correct because it limits scaling on all cases, i.e.
vertical scaling, horizontal scaling and both in scaler 1 and scaler 2.
But the hardware limitation is only in vertical scaling with scaler 2.

I sent the fix to our internal list last Friday.  I think we should
only take this patch upstream after it has been squashed with my
changes.


> > =C2=A0	 */
> > -	if (DISPLAY_VER(dev_priv) >=3D 10 ||
> > -	    !intel_format_info_is_yuv_semiplanar(fb->format, fb-
> > >modifier))
> > +	if (IS_METEORLAKE(dev_priv))
> > +		return 0x10000;
> Can this magic number be replaced with a macro?

This is not really a magic number, it's a 16.16 fixed point notation.=20
0x10000 represents 1.0 (no scaling).


--
Cheers,
Luca.
