Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F78FC6FA82
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Sep 2022 09:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750D410EA95;
	Thu, 22 Sep 2022 09:48:37 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2CC10E291
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Sep 2022 09:48:33 +0000 (UTC)
Received: from 85-76-65-44-nat.elisa-mobile.fi ([85.76.65.44]
 helo=[172.20.10.4]) by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1obIoo-003W4x-Ex;
 Thu, 22 Sep 2022 12:48:32 +0300
Message-ID: <6a6814e577df677f121bc17e51ca9deab614a0b3.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 22 Sep 2022 12:46:59 +0300
In-Reply-To: <YywdAq6eYfTEppUC@intel.com>
References: <20220916165206.1499-1-ville.syrjala@linux.intel.com>
 <20220916165206.1499-3-ville.syrjala@linux.intel.com>
 <9731fffc60162a34b7790bb08792fc55593e4ca2.camel@coelho.fi>
 <YywdAq6eYfTEppUC@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Mark FBC B gone if pipe B is
 gone
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

On Thu, 2022-09-22 at 11:29 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Thu, Sep 22, 2022 at 11:18:55AM +0300, Luca Coelho wrote:
> > On Fri, 2022-09-16 at 19:52 +0300, Ville Syrjala wrote:
> > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >=20
> > > If pipe B is fused off we also shouldn't have FBC B.
> > >=20
> > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
>
> > > ---
> > >  drivers/gpu/drm/i915/intel_device_info.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/d=
rm/i915/intel_device_info.c
> > > index 1434dc33cf49..fbefebc023f1 100644
> > > --- a/drivers/gpu/drm/i915/intel_device_info.c
> > > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> > > @@ -394,6 +394,7 @@ void intel_device_info_runtime_init(struct drm_i9=
15_private *dev_priv)
> > >  		if (dfsm & SKL_DFSM_PIPE_B_DISABLE) {
> > >  			runtime->pipe_mask &=3D ~BIT(PIPE_B);
> > >  			runtime->cpu_transcoder_mask &=3D ~BIT(TRANSCODER_B);
> > > +			runtime->fbc_mask &=3D ~BIT(INTEL_FBC_B);
> > >  		}
> > >  		if (dfsm & SKL_DFSM_PIPE_C_DISABLE) {
> > >  			runtime->pipe_mask &=3D ~BIT(PIPE_C);
> >=20
> > I don't know (yet) what exactly this does, but it makes sense if you
> > think of consistency: we already do that for PIPE_A.
>=20
> It's basically saying the entire pipe is fused off, so anything
> living inside that pipe should also be fused off.
>=20
> >=20
> > But what about PIPE_C and PIPE_D? Wouldn't it make sense to do the same
> > thing for them as well?
>=20
> There is no FBC engine on those pipes (we don't even have
> the INTEL_FBC_C+ enum values defined), at least for now.
>=20

Okay, but AFAICT INTEL_FBC_B was defined but not really used directly
anywhere.  So wouldn't it make sense to add this for pipes C and D as
well? Then, if you ever just need to check if the pipe supports FBC,
you could just check that bit, without making any other assumptions.

--
Cheers,
Luca.
