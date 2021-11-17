Return-Path: <SRS0=4n+h=QE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CADC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 18:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C5061BF4
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 18:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82C5061BF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874716E7E2;
	Wed, 17 Nov 2021 18:51:43 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95996E7E2;
 Wed, 17 Nov 2021 18:51:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="297450041"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="297450041"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 10:51:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="472839433"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 10:51:41 -0800
Date: Wed, 17 Nov 2021 10:51:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20211117185139.GD2020422@mdroper-desk1.amr.corp.intel.com>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-6-matthew.d.roper@intel.com>
 <YZVNR9i5nkJZIORP@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZVNR9i5nkJZIORP@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915/dg2: extend Wa_1409120013
 to DG2
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 08:43:19PM +0200, Ville Syrjälä wrote:
> On Tue, Nov 16, 2021 at 09:48:18AM -0800, Matt Roper wrote:
> > From: Matt Atwood <matthew.s.atwood@intel.com>
> > 
> > Extend existing workaround 1409120013 to DG2.
> 
> I don't see this listed for DG2.

This seems to be problem with the DG2 query since for some reason they
marked this workaround as 'driver_change_required' rather than
'driver_permanent_wa' in the database and that prevents it from showing
up in some of the queries properly.  The DG2-specific ID number
to check is 1409222275.


Matt

> 
> > 
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/intel_pm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> > index 89dc7f69baf3..e721c421cc58 100644
> > --- a/drivers/gpu/drm/i915/intel_pm.c
> > +++ b/drivers/gpu/drm/i915/intel_pm.c
> > @@ -7444,9 +7444,9 @@ static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
> >  
> >  static void gen12lp_init_clock_gating(struct drm_i915_private *dev_priv)
> >  {
> > -	/* Wa_1409120013:tgl,rkl,adl-s,dg1 */
> > +	/* Wa_1409120013:tgl,rkl,adl-s,dg1,dg2 */
> >  	if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv) ||
> > -	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv))
> > +	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv) || IS_DG2(dev_priv))
> >  		intel_uncore_write(&dev_priv->uncore, ILK_DPFC_CHICKEN,
> >  				   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
> >  
> > -- 
> > 2.33.0
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
