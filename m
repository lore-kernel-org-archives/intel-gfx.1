Return-Path: <SRS0=qjf9=C3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B54C43463
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2020 10:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CE821D24
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2020 10:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0CE821D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F21E6E13A;
	Fri, 18 Sep 2020 10:39:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B8C6E13A
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 10:39:49 +0000 (UTC)
IronPort-SDR: /5U/ptM5mM6OzTBjPqNtajhfVpS3It6LbV+2gOboAWokFxiJITdi+e59LqTsPRTUheAwXEMGGl
 VMOYNzb87Elg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="157290709"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="157290709"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 03:39:48 -0700
IronPort-SDR: g2BYQVvKrssFokWzQ7n6Pxj6iUblVz0P0EzLe5Tn3e0a1hkmPVcaVw6fRP0/ZmYBtpCwCWiPZh
 HQckNtDbXaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="320569717"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 18 Sep 2020 03:39:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Sep 2020 13:39:45 +0300
Date: Fri, 18 Sep 2020 13:39:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20200918103945.GF6112@intel.com>
References: <20200917214335.3569-1-ville.syrjala@linux.intel.com>
 <20200917235709.GA27525@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917235709.GA27525@labuser-Z97X-UD5H>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Extract
 intel_dp_output_format()
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

On Thu, Sep 17, 2020 at 04:57:09PM -0700, Navare, Manasi wrote:
> On Fri, Sep 18, 2020 at 12:43:33AM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Refactor the output_format calculation into a helper so that
> > we can reuse it for mode validation as well.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 32 +++++++++++++++----------
> >  1 file changed, 20 insertions(+), 12 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index bf1e9cf1c0f3..ad9b8b16fadb 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -592,6 +592,22 @@ static u8 intel_dp_dsc_get_slice_count(struct inte=
l_dp *intel_dp,
> >  	return 0;
> >  }
> >  =

> > +static enum intel_output_format
> > +intel_dp_output_format(struct drm_connector *connector,
> > +		       const struct drm_display_mode *mode)
> > +{
> > +	struct intel_dp *intel_dp =3D intel_attached_dp(to_intel_connector(co=
nnector));
> > +	const struct drm_display_info *info =3D &connector->display_info;
> > +
> > +	if (!drm_mode_is_420_only(info, mode))
> > +		return INTEL_OUTPUT_FORMAT_RGB;
> > +
> > +	if (intel_dp->dfp.ycbcr_444_to_420)
> > +		return INTEL_OUTPUT_FORMAT_YCBCR444;
> > +	else
> > +		return INTEL_OUTPUT_FORMAT_YCBCR420;
> > +}
> > +
> >  static bool intel_dp_hdisplay_bad(struct drm_i915_private *dev_priv,
> >  				  int hdisplay)
> >  {
> > @@ -2430,27 +2446,20 @@ intel_dp_compute_link_config(struct intel_encod=
er *encoder,
> >  }
> >  =

> >  static int
> > -intel_dp_ycbcr420_config(struct intel_dp *intel_dp,
> > -			 struct intel_crtc_state *crtc_state,
> > +intel_dp_ycbcr420_config(struct intel_crtc_state *crtc_state,
> >  			 const struct drm_connector_state *conn_state)
> >  {
> >  	struct drm_connector *connector =3D conn_state->connector;
> > -	const struct drm_display_info *info =3D &connector->display_info;
> >  	const struct drm_display_mode *adjusted_mode =3D
> >  		&crtc_state->hw.adjusted_mode;
> >  =

> >  	if (!connector->ycbcr_420_allowed)
> >  		return 0;
> >  =

> > -	if (!drm_mode_is_420_only(info, adjusted_mode))
> > -		return 0;
> > +	crtc_state->output_format =3D intel_dp_output_format(connector, adjus=
ted_mode);
> =

> So by default if its not 420_only then we set it to RGB?

Yes. The code is still a bit messy because we have three places where
we set this. Probably will try to unify it a bit more, and try to get
the lspcon stuff looking more like any other protocol converter.

Actually IIRC I noticed that some lspcon chips seem to have some
of the 1.3 protocol converter registers even though they only
advertise DPCD 1.2. Not yet sure how to handle that in the
cleanest way possible...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
