Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E0AC64E7A
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 22:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343C320870
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 22:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 343C320870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D2F6E934;
	Tue,  1 Dec 2020 22:31:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793186E934
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 22:31:13 +0000 (UTC)
IronPort-SDR: SlU+4a4mB4dbVopZfBdzmleQWC8z+miPE/Qh7uShqHt5fRX8fRp/j7n0nscZkIgD3O4sXnGnV3
 PAUQ3xc+GvZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="237047288"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="237047288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 14:31:11 -0800
IronPort-SDR: QypKGDnofSobw9RhAijxan2eryyAHjXa/hxNzEV8XG2LrA1oGNrLLbjFUwqmsakx6QP0KStbJh
 3QNTpS3Fw/nA==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="537712169"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 14:31:11 -0800
Date: Tue, 1 Dec 2020 14:34:07 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20201201223401.GA22347@labuser-Z97X-UD5H>
References: <20201022222709.29386-1-manasi.d.navare@intel.com>
 <20201022222709.29386-10-manasi.d.navare@intel.com>
 <87d00lscga.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d00lscga.fsf@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Intel-gfx] [PATCH 09/11] drm/i915/display/vrr: Disable VRR in
 modeset disable path
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

On Tue, Nov 10, 2020 at 01:01:09PM +0200, Jani Nikula wrote:
> On Thu, 22 Oct 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
> > This patch disables the VRR enable and VRR PUSH
> > bits in the HW during commit modeset disable sequence.
> >
> > Thsi disable will happen when the port is disabled
> > or when the userspace sets VRR prop to false and
> > requests to disable VRR.
> >
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
> >  drivers/gpu/drm/i915/display/intel_vrr.c | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_vrr.h |  1 +
> >  3 files changed, 25 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm=
/i915/display/intel_ddi.c
> > index 391c51979334..565155af3fb9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -3819,6 +3819,8 @@ static void intel_ddi_post_disable(struct intel_a=
tomic_state *state,
> >  =

> >  		intel_disable_pipe(old_crtc_state);
> >  =

> > +		intel_vrr_disable(old_crtc_state);
> > +
> >  		intel_ddi_disable_transcoder_func(old_crtc_state);
> >  =

> >  		intel_dsc_disable(old_crtc_state);
> > diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm=
/i915/display/intel_vrr.c
> > index ec1ce88e869c..5075ecb9b5a7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> > @@ -119,3 +119,25 @@ void intel_vrr_send_push(const struct intel_crtc_s=
tate *crtc_state)
> >  		pipe_name(pipe));
> >  }
> >  =

> > +void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
> > +{
> > +	struct intel_crtc *crtc =3D to_intel_crtc(old_crtc_state->uapi.crtc);
> > +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> =

> Haven't commented on all patches, but please use i915 instead of
> dev_priv for new code, throughout.
> =

> > +	enum pipe pipe =3D crtc->pipe;
> > +	u32 trans_vrr_ctl =3D 0, trans_push =3D 0;
> =

> Unnecessary initializations, and in fact unnecessary variables with
> intel_de_rmw.
>

Okay yes will try using the intel_de_rmw here and use the (VRR_CTL_FLIP_LIN=
E_EN | VRR_CTL_VRR_ENABLE) directly in the clear field
 =

> > +
> > +	if (!old_crtc_state->vrr.enable)
> > +		return;
> > +
> > +	trans_vrr_ctl =3D intel_de_read(dev_priv, TRANS_VRR_CTL(pipe));
> > +	trans_vrr_ctl &=3D ~(VRR_CTL_FLIP_LINE_EN | VRR_CTL_VRR_ENABLE);
> > +	intel_de_write(dev_priv, TRANS_VRR_CTL(pipe), trans_vrr_ctl);
> > +
> > +	trans_push =3D intel_de_read(dev_priv, TRANS_PUSH(pipe));
> > +	trans_push &=3D ~TRANS_PUSH_EN;
> > +	intel_de_write(dev_priv, TRANS_PUSH(pipe), trans_push);
> =

> Please use intel_de_rmw for both.
> =

> > +
> > +	drm_dbg(&dev_priv->drm, "Disabling VRR on Pipe (%c)\n",
> > +		pipe_name(pipe));
> =

> drm_dbg_kms, "pipe %c" is the convention.

Okay will correct it

Thanks for the above feedback I will fix them in the next rev

Manasi


> =

> > +}
> > +
> > diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm=
/i915/display/intel_vrr.h
> > index a6b78e1676cb..8c6fd2d1bee5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> > @@ -20,5 +20,6 @@ void intel_vrr_compute_config(struct intel_dp *intel_=
dp,
> >  void intel_vrr_enable(struct intel_encoder *encoder,
> >  		      const struct intel_crtc_state *crtc_state);
> >  void intel_vrr_send_push(const struct intel_crtc_state *crtc_state);
> > +void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state);
> >  =

> >  #endif /* __INTEL_VRR_H__ */
> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
