Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295D3C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 22:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8ACF239EF
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 22:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8ACF239EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A266E971;
	Thu, 21 Jan 2021 22:54:25 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B156E971
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 22:54:24 +0000 (UTC)
IronPort-SDR: nFRkYmI3d4SHa+s6L+j/7sGe/VmSFUU2+R4Ks3aRBpIp423h177YPdOdoeLuW82RBR9/FKhCwM
 qpk9dzx0EM3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="198102389"
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; d="scan'208";a="198102389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 14:54:23 -0800
IronPort-SDR: H0fyRnfzuYxXq/+Yjk/LyWfVTh6+FBHp7sgNyo2eoKwMkwy07btbFYk8XUROqN9GsQQQWPj+5O
 JctwLPSx4u2g==
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; d="scan'208";a="403378083"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 14:54:23 -0800
Date: Thu, 21 Jan 2021 14:58:51 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20210121225851.GA26641@labuser-Z97X-UD5H>
References: <20210113220935.4151-1-manasi.d.navare@intel.com>
 <20210113220935.4151-9-manasi.d.navare@intel.com>
 <YAB8F6jLOrWT0cZs@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAB8F6jLOrWT0cZs@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Intel-gfx] [PATCH v4 08/18] drm/i915/display: VRR + DRRS
 cannot be enabled together
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

On Thu, Jan 14, 2021 at 07:15:03PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Jan 13, 2021 at 02:09:25PM -0800, Manasi Navare wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > If VRR is enabled, DRRS cannot be enabled, so make this check
> > in atomic check.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> if we want to keep this as a separete patch.

Yes will add your sign off to this
and with that

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> =

> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index a275303c0c5c..869a9d291e1b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -2845,6 +2845,9 @@ intel_dp_drrs_compute_config(struct intel_dp *int=
el_dp,
> >  	struct intel_connector *intel_connector =3D intel_dp->attached_connec=
tor;
> >  	struct drm_i915_private *dev_priv =3D dp_to_i915(intel_dp);
> >  =

> > +	if (pipe_config->vrr.enable)
> > +		return;
> > +
> >  	/*
> >  	 * DRRS and PSR can't be enable together, so giving preference to PSR
> >  	 * as it allows more power-savings by complete shutting down display,
> > -- =

> > 2.19.1
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
