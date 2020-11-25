Return-Path: <SRS0=W/nN=E7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41965C56202
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 16:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEEEA206F7
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 16:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEEEA206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449266EA12;
	Wed, 25 Nov 2020 16:18:06 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896BA6EA12
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 16:18:04 +0000 (UTC)
IronPort-SDR: Fhj3OqyU6Oi9I1D/hHTfigNnypJxPtLhIMyguLRr9oywZlfKd0ImwH+bsqoYJPxudvXagVkQxU
 98WFehAIjpXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="172258255"
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; d="scan'208";a="172258255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 08:17:58 -0800
IronPort-SDR: qZ7VFEFYND6jBtZ70uPJL/ySGPEkLgafWADMykN32BuwYFE3WHZ7oUqMv2atkmS5e5oEbATCoG
 qXHOBP2lfIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; d="scan'208";a="370813157"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 25 Nov 2020 08:17:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 25 Nov 2020 18:17:55 +0200
Date: Wed, 25 Nov 2020 18:17:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <20201125161755.GN6112@intel.com>
References: <20201119155050.20328-2-uma.shankar@intel.com>
 <20201119193614.25914-1-uma.shankar@intel.com>
 <d5698ec6956ff3f0df5d3bcce9b836fcd06ef7d0.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5698ec6956ff3f0df5d3bcce9b836fcd06ef7d0.camel@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [v3 1/2] drm/i915/display/tgl: Disable FBC with PSR2
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 10:03:35PM +0000, Souza, Jose wrote:
> On Fri, 2020-11-20 at 01:06 +0530, Uma Shankar wrote:
> > There are some corner cases wrt underrun when we enable
> > FBC with PSR2 on TGL. Recommendation from hardware is to
> > keep this combination disabled.
> > =

> > Bspec: 50422 HSD: 14010260002
> > =

> > v2: Added psr2 enabled check from crtc_state (Anshuman)
> > Added Bspec link and HSD referneces (Jose)
> > =

> > v3: Moved the logic to disable fbc to intel_fbc_update_state_cache
> > and removed the crtc->config usages, as per Ville's recommendation.
> > =

> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> > =A0drivers/gpu/drm/i915/display/intel_fbc.c | 9 +++++++++
> > =A01 file changed, 9 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm=
/i915/display/intel_fbc.c
> > index a5b072816a7b..cb29c6f068f9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> > @@ -701,6 +701,15 @@ static void intel_fbc_update_state_cache(struct in=
tel_crtc *crtc,
> > =A0	struct drm_framebuffer *fb =3D plane_state->hw.fb;
> > =A0
> > =

> > =

> > =

> > =A0	cache->plane.visible =3D plane_state->uapi.visible;
> > +
> > +	/*
> > +	 * Tigerlake is not supporting FBC with PSR2.
> > +	 * Recommendation is to keep this combination disabled
> > +	 * Bspec: 50422 HSD: 14010260002
> > +	 */
> > +	if (crtc_state->has_psr2 && IS_TIGERLAKE(dev_priv))
> > +		cache->plane.visible =3D false;
> =

> Looks like a hack to me, would be better add a psr2 variable in intel_fbc=
_state_cache.

The plan is to remove most things from that cache anyway since it's
mostly pointless stuff that should just be handled directly via
the plane/crtc states. Not really convinced it makes sense to add
more crap to it at this time. So IMO this is good enough for now.

> We also would need have a PSR2 reason set in no_fbc_reason and handle it =
in IGT.

I think that no_fbc_reason is rather pointless as well. Would make
life a lot simpler if we didn't have to worry about it. So tempted
to just nuke it.

> =

> > +
> > =A0	if (!cache->plane.visible)
> > =A0		return;
> > =A0
> > =

> > =

> > =

> =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
