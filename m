Return-Path: <SRS0=vatO=HF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF350C433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 15:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D7A64F58
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 15:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D7A64F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D672C6EB1E;
	Wed,  3 Feb 2021 15:40:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6DC6EB1E
 for <intel-gfx@lists.freedesktop.org>; Wed,  3 Feb 2021 15:40:00 +0000 (UTC)
IronPort-SDR: 7mdtPXpu7tviHl1ibebhFfpYfCVT9PdrWy3IaJdCWzSrsj+1Phbx5wyd3DLn6dUfJSW98xU9j7
 +MevqVpkl3RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="200019991"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="200019991"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 07:39:59 -0800
IronPort-SDR: ResFNo7cQHdUtzftjsMelIY0cUiQVl8eFrcxQOaKiOKf0vtZ8AHRY1jOSNdfDRfIuGKmGrAodO
 Q0TScvLbOtMw==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="392486499"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 07:39:57 -0800
Date: Wed, 3 Feb 2021 17:39:52 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20210203153952.GB598493@ideak-desk.fi.intel.com>
References: <20210127181909.128094-1-imre.deak@intel.com>
 <20210128191349.GE142820@ideak-desk.fi.intel.com>
 <YBqLlRYq00BEP/4i@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBqLlRYq00BEP/4i@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable runtime power management
 during shutdown
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 01:40:05PM +0200, Ville Syrj=E4l=E4 wrote:
> On Thu, Jan 28, 2021 at 09:13:49PM +0200, Imre Deak wrote:
> > On Wed, Jan 27, 2021 at 08:19:09PM +0200, Imre Deak wrote:
> > > At least on some TGL platforms PUNIT wants to access some display HW
> > > registers, but it doesn't handle display power managment (disabling DC
> > > states as required) and so this register access will lead to a hang. =
To
> > > prevent this disable runtime power management for poweroff and reboot.
> > > =

> > > Reported-and-tested-by: Khaled Almahallawy <khaled.almahallawy@intel.=
com>
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > =

> > Chris or Ville, could you ack if you see no problem with this?
> =

> Looks consistent enough with the other paths.
> =

> I guess we're now powering on pretty much everything before
> reboot shutdown due to the INIT domain?

Yes all, except for GLK+ DDI_IO and ICL+ AUX since the enabling of those
has a restriction wrt. other modeset sequence steps.

> Hopefully no harm in that.

The only requirement is to disable DC states and all/most power wells
should be eventually removed from the INIT domain. For now I wanted to
get this sequence closer to the module reload one. I can add a code
comment about these details.

> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> > > ---
> > >  drivers/gpu/drm/i915/i915_drv.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i=
915_drv.c
> > > index 0037b81d991e..6f83cca8e27b 100644
> > > --- a/drivers/gpu/drm/i915/i915_drv.c
> > > +++ b/drivers/gpu/drm/i915/i915_drv.c
> > > @@ -1054,6 +1054,8 @@ static void intel_shutdown_encoders(struct drm_=
i915_private *dev_priv)
> > >  void i915_driver_shutdown(struct drm_i915_private *i915)
> > >  {
> > >  	disable_rpm_wakeref_asserts(&i915->runtime_pm);
> > > +	intel_runtime_pm_disable(&i915->runtime_pm);
> > > +	intel_power_domains_disable(i915);
> > >  =

> > >  	i915_gem_suspend(i915);
> > >  =

> > > @@ -1069,7 +1071,10 @@ void i915_driver_shutdown(struct drm_i915_priv=
ate *i915)
> > >  	intel_suspend_encoders(i915);
> > >  	intel_shutdown_encoders(i915);
> > >  =

> > > +	intel_power_domains_driver_remove(i915);
> > >  	enable_rpm_wakeref_asserts(&i915->runtime_pm);
> > > +
> > > +	intel_runtime_pm_driver_release(&i915->runtime_pm);
> > >  }
> > >  =

> > >  static bool suspend_to_idle(struct drm_i915_private *dev_priv)
> > > -- =

> > > 2.25.1
> > > =

> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
