Return-Path: <SRS0=w1eM=KC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E8AC433B4
	for <intel-gfx@archiver.kernel.org>; Fri,  7 May 2021 18:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC4E6144F
	for <intel-gfx@archiver.kernel.org>; Fri,  7 May 2021 18:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC4E6144F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11616E0E3;
	Fri,  7 May 2021 18:42:33 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21106E0E3
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 May 2021 18:42:32 +0000 (UTC)
IronPort-SDR: 6/7uYosuHyZMfnUoTmvbfNxCHISqwqvbh8QvxqCs7gbKgHbofHgXcPDYPTJSYagzzlGyb+pBNM
 IwyNpDiOyl2g==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="195678976"
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; d="scan'208";a="195678976"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 11:42:32 -0700
IronPort-SDR: UsNcfiPHdiLC7US+N2DIAG62vBDMj8uNupCxg25Y56wiuQHVIf7mekzAC+T+ge3gHOebAIibAm
 nalwc5XW4qFg==
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; d="scan'208";a="390118689"
Received: from jma2-mobl2.ccr.corp.intel.com (HELO intel.com) ([10.254.37.251])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 11:42:30 -0700
Date: Fri, 7 May 2021 14:42:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YJWKE/bz4KyopJU2@intel.com>
References: <20210328225709.18541-16-daniele.ceraolospurio@intel.com>
 <20210427104504.2720-1-anshuman.gupta@intel.com>
 <YIhePcRcpKEoBmAE@intel.com>
 <96d9782a7e864448a4d311f4eeaa6923@intel.com>
 <YIv+QNTlV9ef0QzH@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIv+QNTlV9ef0QzH@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 15/16] drm/i915/pxp: black pixels on pxp
 disabled
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Gaurav, Kumar" <kumar.gaurav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 03:55:28PM +0300, Ville Syrj=E4l=E4 wrote:
> On Fri, Apr 30, 2021 at 07:12:53AM +0000, Gupta, Anshuman wrote:
> > =

> > =

> > > -----Original Message-----
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Sent: Wednesday, April 28, 2021 12:26 AM
> > > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > Cc: intel-gfx@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@inte=
l.com>;
> > > Gaurav, Kumar <kumar.gaurav@intel.com>; Shankar, Uma
> > > <uma.shankar@intel.com>; Ceraolo Spurio, Daniele
> > > <daniele.ceraolospurio@intel.com>
> > > Subject: Re: [PATCH v3 15/16] drm/i915/pxp: black pixels on pxp disab=
led
> > > =

> > > On Tue, Apr 27, 2021 at 04:15:04PM +0530, Anshuman Gupta wrote:
> > > > When protected sufaces has flipped and pxp session is disabled,
> > > > display black pixels by using plane color CTM correction.
> > > >
> > > > v2:
> > > > - Display black pixels in aysnc flip too.	=

> > > =

> > > We can't change any of that with an async flip.
> > I was thinking of an scenario , when application flip the protected sur=
faces with synchronous flips
> > and driver has enable the plane decryption, can application issue an in=
termediate async flip with
> > protected surfaces afterwards ?
> > If above is possible, is it possible to display black pixels in case of=
 pxp session invalidation at the time of
> > Plane commit?   =

> =

> We'll just have to refuse the async flip if the session has
> been invalidated.

This seems the simplest way... but the effect would be different right?
We wouldn't get the desired blank screen, but frozen screen?!

Any possibility of a blank screen on this scenario?

> =

> -- =

> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
