Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49435C433DF
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2531212CC
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2531212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31396ECAD;
	Thu, 15 Oct 2020 11:52:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418D26ECB2
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 11:52:53 +0000 (UTC)
IronPort-SDR: CZCfX1Iro8uH+HtO9gN11kh+WRimsTCi9IDoJNX7dtZyUmUFFYKvNj0T0nsroPdZBYNIc/kquD
 Apjq3LvFdJGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="165543204"
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="165543204"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 04:52:50 -0700
IronPort-SDR: UeZqXPGJQ5S4dPWdAkXKemqbltvbLvCLSiJ9bd/Vt0t8d8+UDD9cu0KozjvdyrepI1HvzBd9UI
 gFY9WSzQVHMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="330769749"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 15 Oct 2020 04:52:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Oct 2020 14:52:47 +0300
Date: Thu, 15 Oct 2020 14:52:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20201015115247.GI6112@intel.com>
References: <20201008214535.22942-1-manasi.d.navare@intel.com>
 <20201008214535.22942-4-manasi.d.navare@intel.com>
 <20201014112634.GG6112@intel.com>
 <20201014190405.GA22826@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014190405.GA22826@labuser-Z97X-UD5H>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH v10 04/11] drm/i915/dp: Allow big joiner
 modes in intel_dp_mode_valid(), v3.
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

On Wed, Oct 14, 2020 at 12:04:10PM -0700, Navare, Manasi wrote:
> On Wed, Oct 14, 2020 at 02:26:34PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Thu, Oct 08, 2020 at 02:45:28PM -0700, Manasi Navare wrote:
> > > From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > =

> > > Small changes to intel_dp_mode_valid(), allow listing modes that
> > > can only be supported in the bigjoiner configuration, which is
> > > not supported yet.
> > > =

> > > eDP does not support bigjoiner, so do not expose bigjoiner only
> > > modes on the eDP port.
> > > =

> > > v7:
> > > * Add can_bigjoiner() helper (Ville)
> > > * Pass bigjoiner to plane_size validation (Ville)
> > > v6:
> > > * Rebase after dp_downstream mode valid changes (Manasi)
> > > v5:
> > > * Increase max plane width to support 8K with bigjoiner (Maarten)
> > > v4:
> > > * Rebase (Manasi)
> > > =

> > > Changes since v1:
> > > - Disallow bigjoiner on eDP.
> > > Changes since v2:
> > > - Rename intel_dp_downstream_max_dotclock to intel_dp_max_dotclock,
> > >   and split off the downstream and source checking to its own functio=
n.
> > >   (Ville)
> > > v3:
> > > * Rebase (Manasi)
> > > =

> > > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_display.c |   5 +-
> > >  drivers/gpu/drm/i915/display/intel_display.h |   3 +-
> > >  drivers/gpu/drm/i915/display/intel_dp.c      | 126 +++++++++++++++--=
--
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c  |   2 +-
> > >  drivers/gpu/drm/i915/display/intel_dsi.c     |   2 +-
> > >  drivers/gpu/drm/i915/display/intel_hdmi.c    |   2 +-
> > >  6 files changed, 111 insertions(+), 29 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/g=
pu/drm/i915/display/intel_display.c
> > > index 723766b1eae3..cc540c7b7dcd 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -17642,7 +17642,8 @@ intel_mode_valid(struct drm_device *dev,
> > >  =

> > >  enum drm_mode_status
> > >  intel_mode_valid_max_plane_size(struct drm_i915_private *dev_priv,
> > > -				const struct drm_display_mode *mode)
> > > +				const struct drm_display_mode *mode,
> > > +				bool bigjoiner)
> > >  {
> > >  	int plane_width_max, plane_height_max;
> > >  =

> > > @@ -17659,7 +17660,7 @@ intel_mode_valid_max_plane_size(struct drm_i9=
15_private *dev_priv,
> > >  	 * too big for that.
> > >  	 */
> > >  	if (INTEL_GEN(dev_priv) >=3D 11) {
> > > -		plane_width_max =3D 5120;
> > > +		plane_width_max =3D 5120 << bigjoiner;
> > >  		plane_height_max =3D 4320;
> > >  	} else {
> > >  		plane_width_max =3D 5120;
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/g=
pu/drm/i915/display/intel_display.h
> > > index d10b7c8cde3f..3d860a9da8fe 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.h
> > > @@ -496,7 +496,8 @@ u32 intel_plane_fb_max_stride(struct drm_i915_pri=
vate *dev_priv,
> > >  bool intel_plane_can_remap(const struct intel_plane_state *plane_sta=
te);
> > >  enum drm_mode_status
> > >  intel_mode_valid_max_plane_size(struct drm_i915_private *dev_priv,
> > > -				const struct drm_display_mode *mode);
> > > +				const struct drm_display_mode *mode,
> > > +				bool bigjoiner);
> > >  enum phy intel_port_to_phy(struct drm_i915_private *i915, enum port =
port);
> > >  bool is_trans_port_sync_mode(const struct intel_crtc_state *state);
> > >  =

> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/dr=
m/i915/display/intel_dp.c
> > > index 8a522edd7386..af2ff425e5d5 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -247,6 +247,29 @@ intel_dp_max_data_rate(int max_link_clock, int m=
ax_lanes)
> > >  	return max_link_clock * max_lanes;
> > >  }
> > >  =

> > > +static int source_max_dotclock(struct intel_dp *intel_dp, bool allow=
_bigjoiner)
> > > +{
> > > +	struct intel_digital_port *intel_dig_port =3D dp_to_dig_port(intel_=
dp);
> > > +	struct intel_encoder *encoder =3D &intel_dig_port->base;
> > > +	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> > > +
> > > +	if (allow_bigjoiner && INTEL_GEN(dev_priv) >=3D 11 && !intel_dp_is_=
edp(intel_dp))
> > > +		return 2 * dev_priv->max_dotclk_freq;
> > > +
> > > +	return dev_priv->max_dotclk_freq;
> > > +}
> > > +
> > > +static int
> > > +intel_dp_max_dotclock(struct intel_dp *intel_dp, bool allow_bigjoine=
r)
> > > +{
> > > +	int max_dotclk =3D source_max_dotclock(intel_dp, allow_bigjoiner);
> > > +
> > > +	if (intel_dp->dfp.max_dotclock)
> > =

> > No. dfp checks should stay where they are.
> =

> I am using dfp.max_dotclock because we populate that with drm_dp_downstre=
am_max_dotclock()
> should that be used here directly from drm_dp_downstream_max_dotclock ins=
tead of using dfp.maxdotclock ?

Can you explain how bigjoiner and DFP dotclock limits relate to each
other?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
