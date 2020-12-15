Return-Path: <SRS0=+CuI=FT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBC8C4361B
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 18:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4E722ADC
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 18:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4E722ADC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94BA89CA4;
	Tue, 15 Dec 2020 18:01:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938B089CA4
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Dec 2020 18:01:35 +0000 (UTC)
IronPort-SDR: bVgJNd6oONEXxTlwse8We//3q0+brsE6nXWuUrQDXge9zGrbV4VQjyV71t48oo67DxTxTpbRTE
 V7o+0qe9AX9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="175033748"
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="175033748"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 10:01:31 -0800
IronPort-SDR: 44YCj4C6RlrYiRe9LSZmKNWmKWf+jhWAMShCm+ctTFQnOEjh71zA0BY/e9hGgzO+x3tOXgnRCq
 zr36pbmRyhXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="337489236"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 15 Dec 2020 10:01:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Dec 2020 20:01:27 +0200
Date: Tue, 15 Dec 2020 20:01:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Message-ID: <X9j5908SZDj2gJQQ@intel.com>
References: <20201214221934.2478240-1-andrescj@google.com>
 <9448bc8ea67a49d6a1ebf208824e5472@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9448bc8ea67a49d6a1ebf208824e5472@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Prevent double YUV range
 correction on HDR planes
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
Cc: Andres Calderon Jaramillo <andrescj@chromium.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Andres Calderon Jaramillo <andrescj@google.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Venkatesh Reddy,
 Sushma" <sushma.venkatesh.reddy@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 10:57:03PM +0000, Shankar, Uma wrote:
> =

> =

> > -----Original Message-----
> > From: andrescj via sendgmr <andrescj@andrescj-cros-specialist.c.googler=
s.com>
> > On Behalf Of Andres Calderon Jaramillo
> > Sent: Tuesday, December 15, 2020 3:50 AM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: Shankar, Uma <uma.shankar@intel.com>; Venkatesh Reddy, Sushma
> > <sushma.venkatesh.reddy@intel.com>; seanpaul@chromium.org; Andres
> > Calderon Jaramillo <andrescj@chromium.org>
> > Subject: [PATCH] drm/i915/display: Prevent double YUV range correction =
on HDR
> > planes
> > =

> > From: Andres Calderon Jaramillo <andrescj@chromium.org>
> > =

> > Prevent the ICL HDR plane pipeline from performing YUV color range corr=
ection
> > twice when the input is in limited range.
> > =

> > Before this patch the following could happen: user space gives us a YUV=
 buffer in
> > limited range; per the pipeline in [1], the plane would first go throug=
h a "YUV
> > Range correct" stage that expands the range; the plane would then go th=
rough
> > the "Input CSC" stage which would also expand the range because
> > icl_program_input_csc() would use a matrix and an offset that assume li=
mited-
> > range input; this would ultimately cause dark and light colors to appea=
r darker
> > and lighter than they should respectively.
> > =

> > This is an issue because if a buffer switches between being scanned out=
 and
> > being composited with the GPU, the user will see a color difference.
> > If this switching happens quickly and frequently, the user will perceiv=
e this as a
> > flickering.
> > =

> > [1] https://01.org/sites/default/files/documentation/intel-gfx-prm-osrc=
-icllp-
> > vol12-displayengine_0.pdf#page=3D281
> =

> Change looks good to me, double conversion should not be done.
> Plane input csc coefficients take care of the limited range.

Might make sense to actually use the hw range correction instead.
Would avoid having to keep around two sets of coefficients.

Also the question now becomes: How can our tests be passing if
we're doing the range correction twice?

> =

> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> =

> > Signed-off-by: Andres Calderon Jaramillo <andrescj@chromium.org>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 761be8deaa9b..aeea344b06ad 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -4811,6 +4811,13 @@ u32 glk_plane_color_ctl(const struct intel_crtc_=
state
> > *crtc_state,
> >  			plane_color_ctl |=3D
> > PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
> >  	} else if (fb->format->is_yuv) {
> >  		plane_color_ctl |=3D PLANE_COLOR_INPUT_CSC_ENABLE;
> > +
> > +		/*
> > +		 * Disable the YUV range correction stage because the input CSC
> > +		 * stage already takes care of range conversion by using separate
> > +		 * matrices and offsets depending on the color range.
> > +		 */
> > +		plane_color_ctl |=3D
> > PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
> >  	}
> > =

> >  	return plane_color_ctl;
> > --
> > 2.29.2.684.gfbc64c5ab5-goog
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
