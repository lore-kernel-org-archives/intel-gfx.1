Return-Path: <SRS0=Ww0K=JM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B255C433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Apr 2021 15:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A9B61153
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Apr 2021 15:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10A9B61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C58F6E524;
	Thu, 15 Apr 2021 15:34:36 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16CF6E524
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Apr 2021 15:34:34 +0000 (UTC)
IronPort-SDR: EUz5pb3bCDhIteGHXHpQl1dHy5Su9ElHcS4F6ESDxtX/RbhCcIReofcfzGZcK84jrWpAxORGvV
 QxWh48Cezb7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="192748070"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="192748070"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 08:34:33 -0700
IronPort-SDR: 5xgnaZqSXkxu9f+u1UCB1GRC4okAsNZhP0cttUtZjwFxPsOBB/fPbF2kjgfSAIVsgzvqRnxuUE
 YG91BE0y5YcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="451166163"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 15 Apr 2021 08:34:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Apr 2021 18:34:30 +0300
Date: Thu, 15 Apr 2021 18:34:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <YHhdBnR0oOoSdxvz@intel.com>
References: <20210414022309.30898-1-ville.syrjala@linux.intel.com>
 <20210414022309.30898-3-ville.syrjala@linux.intel.com>
 <87r1jcewd8.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r1jcewd8.fsf@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915: Rewrite the FBC tiling check
 a bit
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

On Wed, Apr 14, 2021 at 06:09:23PM +0300, Jani Nikula wrote:
> On Wed, 14 Apr 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > Write the tiling check in a nicer form.
> >
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_fbc.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm=
/i915/display/intel_fbc.c
> > index 04d9c7d22b04..178243a6d3a2 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> > @@ -681,11 +681,9 @@ static bool tiling_is_valid(struct drm_i915_privat=
e *dev_priv,
> >  {
> >  	switch (modifier) {
> >  	case DRM_FORMAT_MOD_LINEAR:
> > -		if (DISPLAY_VER(dev_priv) >=3D 9)
> > -			return true;
> > -		return false;
> > -	case I915_FORMAT_MOD_X_TILED:
> >  	case I915_FORMAT_MOD_Y_TILED:
> > +		return DISPLAY_VER(dev_priv) >=3D 9;
> =

> So this adds the version check on I915_FORMAT_MOD_Y_TILED which didn't
> have it before?

Yeah, but Y tile scanout is gen9+ anyway. Should have pointed
that out in the commit msg I suppose.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
