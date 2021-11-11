Return-Path: <SRS0=C8BW=P6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299CDC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Nov 2021 16:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77DB61152
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Nov 2021 16:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D77DB61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE5F6E17F;
	Thu, 11 Nov 2021 16:42:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436BC6E17D;
 Thu, 11 Nov 2021 16:42:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="319157569"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="319157569"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 08:42:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="470848936"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 11 Nov 2021 08:42:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 18:42:39 +0200
Date: Thu, 11 Nov 2021 18:42:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Message-ID: <YY1H//+XISVMFZNL@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut
 range struct for HDR planes
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
Cc: intel-gfx@lists.freedesktop.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 10:17:17AM -0500, Harry Wentland wrote:
> 
> 
> On 2021-09-06 17:38, Uma Shankar wrote:
> > Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> > planes have different capabilities, implemented respective
> > structure for the HDR planes.
> > 
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c | 52 ++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> > index afcb4bf3826c..6403bd74324b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
> >  	}
> >  }
> >  
> > + /* FIXME input bpc? */
> > +__maybe_unused
> > +static const struct drm_color_lut_range d13_degamma_hdr[] = {
> > +	/* segment 1 */
> > +	{
> > +		.flags = (DRM_MODE_LUT_GAMMA |
> > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +			  DRM_MODE_LUT_INTERPOLATE |
> > +			  DRM_MODE_LUT_NON_DECREASING),
> > +		.count = 128,
> > +		.input_bpc = 24, .output_bpc = 16,
> > +		.start = 0, .end = (1 << 24) - 1,
> > +		.min = 0, .max = (1 << 24) - 1,
> > +	},
> > +	/* segment 2 */
> > +	{
> > +		.flags = (DRM_MODE_LUT_GAMMA |
> > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +			  DRM_MODE_LUT_INTERPOLATE |
> > +			  DRM_MODE_LUT_REUSE_LAST |
> > +			  DRM_MODE_LUT_NON_DECREASING),
> > +		.count = 1,
> > +		.input_bpc = 24, .output_bpc = 16,
> > +		.start = (1 << 24) - 1, .end = 1 << 24,
> > +		.min = 0, .max = (1 << 27) - 1,
> > +	},
> > +	/* Segment 3 */
> > +	{
> > +		.flags = (DRM_MODE_LUT_GAMMA |
> > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +			  DRM_MODE_LUT_INTERPOLATE |
> > +			  DRM_MODE_LUT_REUSE_LAST |
> > +			  DRM_MODE_LUT_NON_DECREASING),
> > +		.count = 1,
> > +		.input_bpc = 24, .output_bpc = 16,
> > +		.start = 1 << 24, .end = 3 << 24,
> > +		.min = 0, .max = (1 << 27) - 1,
> > +	},
> > +	/* Segment 4 */
> > +	{
> > +		.flags = (DRM_MODE_LUT_GAMMA |
> > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +			  DRM_MODE_LUT_INTERPOLATE |
> > +			  DRM_MODE_LUT_REUSE_LAST |
> > +			  DRM_MODE_LUT_NON_DECREASING),
> > +		.count = 1,
> > +		.input_bpc = 24, .output_bpc = 16,
> > +		.start = 3 << 24, .end = 7 << 24,
> > +		.min = 0, .max = (1 << 27) - 1,
> > +	},
> > +};
> 
> If I understand this right, userspace would need this definition in order
> to populate the degamma blob. Should this sit in a UAPI header?

My original idea (not sure it's fully realized in this series) is to
have a new GAMMA_MODE/etc. enum property on each crtc (or plane) for
which each enum value points to a kernel provided blob that contains
one of these LUT descriptors. Userspace can then query them dynamically
and pick the best one for its current use case.

The algorithm for choosing the best one might be something like:
- prefer LUT with bpc >= FB bpc, but perhaps not needlessly high bpc
- prefer interpolated vs. direct lookup based on current needs (eg. X
  could prefer direct lookup to get directcolor visuals).
- prefer one with extended range values if needed
- for HDR prefer smaller step size in dark tones,
  for SDR perhaps prefer a more uniform step size

Or maybe we should include some kind of usage hints as well?

And I was thinking of even adding a new property type (eg.
ENUM_BLOB) just for this sort of usecase. That could let us
have a bit more generic code to do all the validation around
the property values and whatnot.

The one nagging concern I really have with GAMMA_MODE is how a
mix of old and new userspace would work. Though that is more 
of a generic issue with any new property really.

-- 
Ville Syrjälä
Intel
