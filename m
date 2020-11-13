Return-Path: <SRS0=JclI=ET=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B75C4742C
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 14:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3948320715
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 14:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3948320715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F026E4F3;
	Fri, 13 Nov 2020 14:27:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB496E4F3
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 14:27:33 +0000 (UTC)
IronPort-SDR: R0EYVv2f6/95o+/4Ib7zQD7xAs9ENIU0jAqn7PHVEQ8l9ldNeUtdTEDfxZVDJ8nnoZcDagXY7b
 /a92TC7IyUpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="150327413"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="150327413"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 06:27:33 -0800
IronPort-SDR: CcoW9VxUZNPBAXt34ZF/tIio1vpyzN0Ixrbhhzc6E5arDkhQsqC9IJC+QT7HMdZz9K4PDT0AeI
 EwcnhDCUZ0hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="366952920"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 13 Nov 2020 06:27:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Nov 2020 16:27:30 +0200
Date: Fri, 13 Nov 2020 16:27:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20201113142730.GX6112@intel.com>
References: <20201112191718.16683-1-ville.syrjala@linux.intel.com>
 <20201112191718.16683-4-ville.syrjala@linux.intel.com>
 <20201112194812.GC15399@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112194812.GC15399@labuser-Z97X-UD5H>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: Move hw.active assignment
 into intel_crtc_get_pipe_config()
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

On Thu, Nov 12, 2020 at 11:48:12AM -0800, Navare, Manasi wrote:
> On Thu, Nov 12, 2020 at 09:17:15PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > No reason to make the callers of intel_crtc_get_pipe_config()
> > populate hw.active. Let's do it in intel_crtc_get_pipe_config()
> > itself. hw.enable we leave up to the callers since it's slightly
> > different for readout vs. state check.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index a8287414937c..889642bef192 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -11412,7 +11412,12 @@ static bool intel_crtc_get_pipe_config(struct =
intel_crtc_state *crtc_state)
> >  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> >  	struct drm_i915_private *i915 =3D to_i915(crtc->base.dev);
> >  =

> > -	return i915->display.get_pipe_config(crtc, crtc_state);
> > +	if (!i915->display.get_pipe_config(crtc, crtc_state))
> > +		return false;
> > +
> > +	crtc_state->hw.active =3D true;
> > +
> > +	return true;
> =

> In that case this function can just return a void right, we are not catch=
ing the return value in the caller anyways now

There is a third caller.

> =

> With that change
> =

> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> =

> Manasi
> =

> >  }
> >  =

> >  static u32 intel_cursor_base(const struct intel_plane_state *plane_sta=
te)
> > @@ -14430,7 +14435,7 @@ verify_crtc_state(struct intel_crtc *crtc,
> >  =

> >  	pipe_config->hw.enable =3D new_crtc_state->hw.enable;
> >  =

> > -	pipe_config->hw.active =3D intel_crtc_get_pipe_config(pipe_config);
> > +	intel_crtc_get_pipe_config(pipe_config);
> >  =

> >  	/* we keep both pipes enabled on 830 */
> >  	if (IS_I830(dev_priv) && pipe_config->hw.active)
> > @@ -18742,8 +18747,9 @@ static void intel_modeset_readout_hw_state(stru=
ct drm_device *dev)
> >  		intel_crtc_free_hw_state(crtc_state);
> >  		intel_crtc_state_reset(crtc_state, crtc);
> >  =

> > -		crtc_state->hw.active =3D crtc_state->hw.enable =3D
> > -			intel_crtc_get_pipe_config(crtc_state);
> > +		intel_crtc_get_pipe_config(crtc_state);
> > +
> > +		crtc_state->hw.enable =3D crtc_state->hw.active;
> >  =

> >  		crtc->base.enabled =3D crtc_state->hw.enable;
> >  		crtc->active =3D crtc_state->hw.active;
> > -- =

> > 2.26.2
> > =

> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
