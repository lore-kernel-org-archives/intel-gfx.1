Return-Path: <SRS0=KOmL=OR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E741AC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 11:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11BA6108E
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 11:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B11BA6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CB6898ED;
	Mon, 27 Sep 2021 11:09:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5899E898ED
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Sep 2021 11:09:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="204606620"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="204606620"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:09:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="537664723"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:09:05 -0700
Date: Mon, 27 Sep 2021 04:20:53 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <20210927112053.GA28287@labuser-Z97X-UD5H>
References: <20210913144440.23008-1-ville.syrjala@linux.intel.com>
 <20210913144440.23008-3-ville.syrjala@linux.intel.com>
 <20210920075210.GA439@labuser-Z97X-UD5H>
 <YUnU1AK4qKEZeV3v@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUnU1AK4qKEZeV3v@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Intel-gfx] [PATCH 02/16] drm/i915: Disable all planes before
 modesetting any pipes
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

On Tue, Sep 21, 2021 at 03:49:24PM +0300, Ville Syrjälä wrote:
> On Mon, Sep 20, 2021 at 12:52:15AM -0700, Navare, Manasi wrote:
> > On Mon, Sep 13, 2021 at 05:44:26PM +0300, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > Let's disable planes on all pipes affected by the modeset before
> > > we start doing the actual modeset. This means we have less
> > > random planes enabled during the modeset, and it also mirrors
> > > what we already do when enabling pipes on skl+ since we enable
> > > planes on all pipes as the very last step. As a bonus we also
> > > nuke a bunch og bigjoiner special casing.
> > > 
> > > I've occasionally pondered about going even furher here and
> > > doing the pre_plane_update() stuff for all pipes first, then
> > > actually disabling the planes, and finally running the rest
> > > of the modeset sequence. This would potentially allow
> > > parallelizing all the extra vblank waits across multiple pipes,
> > > and would make the plane disable even more atomic. But let's
> > > go one step a time here.
> > 
> > So you are moving the plane disables all together in the commit_disables()?
> > But dont we need to pass old_crtc_state->bigjoiner_linked_crtc) crtc in case of bigjoiner?
> > How is that handled?
> 
> Whether bigjoiner is used or not is irrelevant when disabling the
> planes.
>

So basically now you disable planes for all the crtcs in state that have been active?

Makes sense to me

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi
 
> > 
> > Regards
> > Manasi
> > 
> > > 
> > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_display.c | 28 +++++++++-----------
> > >  1 file changed, 13 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > > index cd150512d275..afa26911c236 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -9785,18 +9785,13 @@ static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
> > >  
> > >  	drm_WARN_ON(&dev_priv->drm, old_crtc_state->bigjoiner_slave);
> > >  
> > > -	intel_crtc_disable_planes(state, crtc);
> > > -
> > >  	/*
> > >  	 * We still need special handling for disabling bigjoiner master
> > >  	 * and slaves since for slave we do not have encoder or plls
> > >  	 * so we dont need to disable those.
> > >  	 */
> > > -	if (old_crtc_state->bigjoiner) {
> > > -		intel_crtc_disable_planes(state,
> > > -					  old_crtc_state->bigjoiner_linked_crtc);
> > > +	if (old_crtc_state->bigjoiner)
> > >  		old_crtc_state->bigjoiner_linked_crtc->active = false;
> > > -	}
> > >  
> > >  	/*
> > >  	 * We need to disable pipe CRC before disabling the pipe,
> > > @@ -9823,6 +9818,18 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
> > >  	u32 handled = 0;
> > >  	int i;
> > >  
> > > +	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> > > +					    new_crtc_state, i) {
> > > +		if (!intel_crtc_needs_modeset(new_crtc_state))
> > > +			continue;
> > > +
> > > +		if (!old_crtc_state->hw.active)
> > > +			continue;
> > > +
> > > +		intel_pre_plane_update(state, crtc);
> > > +		intel_crtc_disable_planes(state, crtc);
> > > +	}
> > > +
> > >  	/* Only disable port sync and MST slaves */
> > >  	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> > >  					    new_crtc_state, i) {
> > > @@ -9841,7 +9848,6 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
> > >  		    !intel_dp_mst_is_slave_trans(old_crtc_state))
> > >  			continue;
> > >  
> > > -		intel_pre_plane_update(state, crtc);
> > >  		intel_old_crtc_state_disables(state, old_crtc_state,
> > >  					      new_crtc_state, crtc);
> > >  		handled |= BIT(crtc->pipe);
> > > @@ -9855,14 +9861,6 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
> > >  		    old_crtc_state->bigjoiner_slave)
> > >  			continue;
> > >  
> > > -		intel_pre_plane_update(state, crtc);
> > > -		if (old_crtc_state->bigjoiner) {
> > > -			struct intel_crtc *slave =
> > > -				old_crtc_state->bigjoiner_linked_crtc;
> > > -
> > > -			intel_pre_plane_update(state, slave);
> > > -		}
> > > -
> > >  		if (old_crtc_state->hw.active)
> > >  			intel_old_crtc_state_disables(state, old_crtc_state,
> > >  						      new_crtc_state, crtc);
> > > -- 
> > > 2.32.0
> > > 
> 
> -- 
> Ville Syrjälä
> Intel
