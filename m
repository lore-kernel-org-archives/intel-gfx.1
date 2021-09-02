Return-Path: <SRS0=rOxW=NY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61A9C432BE
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 12:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68206610D2
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 12:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68206610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112926E52A;
	Thu,  2 Sep 2021 12:59:29 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA706E52A
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Sep 2021 12:59:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="219112903"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="219112903"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 05:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="467413921"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 02 Sep 2021 05:59:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Sep 2021 15:59:24 +0300
Date: Thu, 2 Sep 2021 15:59:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Message-ID: <YTDKrJTd6VnV+08K@intel.com>
References: <20210622093424.886133-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <YS+EuzTIv5YWfzIL@intel.com>
 <SN6PR11MB3421B0900C9A9770B19367F5DFCE9@SN6PR11MB3421.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN6PR11MB3421B0900C9A9770B19367F5DFCE9@SN6PR11MB3421.namprd11.prod.outlook.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH V4] drm/i915/gen11: Disable cursor clock
 gating in HDR mode
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

On Thu, Sep 02, 2021 at 11:07:06AM +0000, Surendrakumar Upadhyay, TejaskumarX wrote:
> 
> 
> > -----Original Message-----
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Sent: 01 September 2021 19:19
> > To: Surendrakumar Upadhyay, TejaskumarX
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org
> > Subject: Re: [Intel-gfx] [PATCH V4] drm/i915/gen11: Disable cursor clock
> > gating in HDR mode
> > 
> > On Tue, Jun 22, 2021 at 03:04:24PM +0530, Tejas Upadhyay wrote:
> > > Display underrun in HDR mode when cursor is enabled.
> > > RTL fix will be implemented CLKGATE_DIS_PSL_A bit 28-46520h.
> > > As per W/A 1604331009, Disable cursor clock gating in HDR mode.
> > >
> > > Bspec : 33451
> > >
> > > Changes since V3:
> > > 	- Disable WA when not in HDR mode or cursor plane not active - Ville
> > > 	- Extract required args from crtc_state - Ville
> > > 	- Create HDR mode API using bdw_set_pipemisc ref - Ville
> > > 	- Tested with HDR video as well full setmode, WA applies and
> > disables
> > > Changes since V2:
> > >         - Made it general gen11 WA
> > >         - Removed WA needed check
> > >         - Added cursor plane active check
> > >         - Once WA enable, software will not disable Changes since V1:
> > >         - Modified way CLKGATE_DIS_PSL bit 28 was modified
> > >
> > > Cc: Souza Jose <jose.souza@intel.com>
> > > Signed-off-by: Tejas Upadhyay
> > > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_display.c | 27 ++++++++++++++++++++
> > >  drivers/gpu/drm/i915/i915_reg.h              |  5 ++++
> > >  2 files changed, 32 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > > b/drivers/gpu/drm/i915/display/intel_display.c
> > > index 6be1b31af07b..e1ea03b918df 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -358,6 +358,13 @@ static void intel_update_czclk(struct
> > drm_i915_private *dev_priv)
> > >  		dev_priv->czclk_freq);
> > >  }
> > >
> > > +static bool
> > > +is_hdr_mode(const struct intel_crtc_state *crtc_state) {
> > > +	return (crtc_state->active_planes & ~(icl_hdr_plane_mask() |
> > > +		BIT(PLANE_CURSOR))) == 0;
> > > +}
> > 
> > Please use this in bdw_set_pipemisc() as well. This could be a separate prep
> > patch actually.
> > 
> > > +
> > >  /* WA Display #0827: Gen9:all */
> > >  static void
> > >  skl_wa_827(struct drm_i915_private *dev_priv, enum pipe pipe, bool
> > > enable) @@ -383,6 +390,23 @@ icl_wa_scalerclkgating(struct
> > drm_i915_private *dev_priv, enum pipe pipe,
> > >  		               intel_de_read(dev_priv, CLKGATE_DIS_PSL(pipe)) &
> > > ~DPFR_GATING_DIS);  }
> > >
> > > +/* Wa_1604331009:icl,jsl,ehl */
> > > +	static void
> > > +icl_wa_cursorclkgating(const struct intel_crtc_state *crtc_state) {
> > > +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> > > +	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> > > +
> > > +	if (is_hdr_mode(crtc_state) &&
> > > +	    crtc_state->active_planes & BIT(PLANE_CURSOR) &&
> > > +	    IS_GEN(dev_priv, 11))
> > > +		intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(crtc->pipe),
> > > +			     CURSOR_GATING_DIS, CURSOR_GATING_DIS);
> > > +	else
> > > +		intel_de_rmw(dev_priv, CLKGATE_DIS_PSL(crtc->pipe),
> > > +			     CURSOR_GATING_DIS, 0);
> > > +}
> > > +
> > >  static bool
> > >  is_trans_port_sync_slave(const struct intel_crtc_state *crtc_state)
> > > { @@ -2939,6 +2963,9 @@ static void intel_pre_plane_update(struct
> > > intel_atomic_state *state,
> > >  	    needs_scalerclk_wa(new_crtc_state))
> > >  		icl_wa_scalerclkgating(dev_priv, pipe, true);
> > >
> > > +	/* Wa_1604331009:icl,jsl,ehl */
> > > +	icl_wa_cursorclkgating(new_crtc_state);
> > 
> > This looks a bit wrong. We shouldn't turn the clock gating back on until after
> > HDR mode has been disabled.
> > 
> > So please model this after skl_wa_827() and icl_wa_scalerclkgating() so that
> > a) the ordering is correct, and b) the code between all three w/as looks
> > consistent.
> 
> I did not get what you are suggesting here. Can you please put psudo? Currently as far as I see icl_wa_cursorclkgating is already modelled  after skl_wa_827() and icl_wa_scalerclkgating(). Are referring same 
> Or something else?

It should look something like:

intel_pre_plane_update()
{
	if (!needs_cursorclk_wa(old_crtc_state) &&
	    needs_cursorclk_wa(new_crtc_state))
		icl_wa_cursorclkgating(..., true);
}

intel_post_plane_update()
{
	if (needs_cursorclk_wa(old_crtc_state) &&
	    !needs_cursorclk_wa(new_crtc_state))
		icl_wa_cursorclkgating(..., false);
}


-- 
Ville Syrjälä
Intel
