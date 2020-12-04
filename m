Return-Path: <SRS0=5A7x=FI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEB1C433FE
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 16:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD61322B40
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 16:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD61322B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DC86E196;
	Fri,  4 Dec 2020 16:01:17 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88206E196
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Dec 2020 16:01:15 +0000 (UTC)
IronPort-SDR: i6UpZFNJgRovii43qYh/5Xh6ibnBrnWnbg1DSqZXDEu/+D4EyBy1j5b4uw/EVGzmdO7XFYA3s3
 nNOg1mRl4uYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="160451813"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="160451813"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 08:01:14 -0800
IronPort-SDR: 1w0/YtiZyn7B0fXWHaPp25c2hNEKaYc03i5FK2QIEX6jgOXH2Yxuun/U9etB8fRl+59URfTlTY
 5nBU7JFafQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="373960223"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 04 Dec 2020 08:01:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Dec 2020 18:01:11 +0200
Date: Fri, 4 Dec 2020 18:01:11 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <X8pdR3wUue1tNhJJ@intel.com>
References: <20201127220548.3713-1-chris@chris-wilson.co.uk>
 <20201201160517.GX6112@intel.com>
 <160686233758.408.13656920081137084390@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160686233758.408.13656920081137084390@build.alporthouse.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable outputs during unregister
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

On Tue, Dec 01, 2020 at 10:38:57PM +0000, Chris Wilson wrote:
> Quoting Ville Syrj=E4l=E4 (2020-12-01 16:05:17)
> > On Fri, Nov 27, 2020 at 10:05:48PM +0000, Chris Wilson wrote:
> > > Switch off the scanout during driver unregister, so we can shutdown t=
he
> > > HW immediately for unbind.
> > > =

> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > ---
> > >  drivers/gpu/drm/i915/i915_drv.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i=
915_drv.c
> > > index 320856b665a1..62d188e5cb8d 100644
> > > --- a/drivers/gpu/drm/i915/i915_drv.c
> > > +++ b/drivers/gpu/drm/i915/i915_drv.c
> > > @@ -738,6 +738,7 @@ static void i915_driver_unregister(struct drm_i91=
5_private *dev_priv)
> > >        * events.
> > >        */
> > >       drm_kms_helper_poll_fini(&dev_priv->drm);
> > > +     drm_atomic_helper_shutdown(&dev_priv->drm);
> > =

> > Looks like we already have this in remove(). Is that too late?
> =

> For the operations we do during unbind, yes.
> =

> For the core_hotplug/rebind dance, we have to reset the GPU while we
> still have runtime-pm operational and have pushed the reset to
> unregister (from experimentation that's as late as we can put it where
> the GPU works after rebinding and we don't corrupt the system on unbind,
> with the current hooks). You can guess how well gen3 likes that.
> =

> But I don't think the right answer is to skip the reset for gen3.
> Suppose we enable context support for gen3, then the reset would be
> required as well, and so we would still need the whole display
> shenanigans to turn it off. Moving the modeset to turn the display off
> to the end of userspace seems reasonable.

Yeah, just a bit odd to have the same call twice in the
sequence. Can we remove the second call at least?

Also a bit annoying the unload sequence no longer matches the
suspend sequence. Well, I guess it was never 100% anyway but
I think it was a bit closer before this patch. But the whole
thing is rather messy anyway so I guess t's not significantly
worse after this.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
