Return-Path: <SRS0=maCC=IV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263D1C433C1
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 13:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBBD7619B3
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 13:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBBD7619B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4DA6E89E;
	Tue, 23 Mar 2021 13:38:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F696E134;
 Tue, 23 Mar 2021 13:38:17 +0000 (UTC)
IronPort-SDR: Fsmqrwa0Xy/isqSZcxgg9BQb4H6uj6LcgTeVxNxcmvDmEun/CU0V82aFlbIvGmlvT2E4nid26b
 WCrtIh8f7aLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="187159386"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="187159386"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 06:38:17 -0700
IronPort-SDR: Ehj61Lvj6WxrC8ZgMcN0B8segxHvcEf64UuNcAqxJo3EU4Jy/9tEf0HlIl/O7btS2WyGruvcVl
 YlYtDRjEwSKQ==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="414989102"
Received: from abdulla1-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.251.23.100])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 06:38:16 -0700
Date: Tue, 23 Mar 2021 09:38:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YFnvRtUNgERZKzNs@intel.com>
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <20210323084453.366863-2-daniel.vetter@ffwll.ch>
 <YFng89ujYxcyJQmN@intel.com> <YFnouVsaKs2odAqq@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFnouVsaKs2odAqq@phenom.ffwll.local>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/doc: Add RFC section
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 02:10:17PM +0100, Daniel Vetter wrote:
> On Tue, Mar 23, 2021 at 08:37:07AM -0400, Rodrigo Vivi wrote:
> > On Tue, Mar 23, 2021 at 09:44:53AM +0100, Daniel Vetter wrote:
> > > Motivated by the pre-review process for i915 gem/gt features, but
> > > probably useful in general for complex stuff.
> > > 
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  Documentation/gpu/index.rst |  1 +
> > >  Documentation/gpu/rfc.rst   | 16 ++++++++++++++++
> > >  2 files changed, 17 insertions(+)
> > >  create mode 100644 Documentation/gpu/rfc.rst
> > > 
> > > diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> > > index c9a51e3bfb5a..df58cb826d68 100644
> > > --- a/Documentation/gpu/index.rst
> > > +++ b/Documentation/gpu/index.rst
> > > @@ -16,6 +16,7 @@ Linux GPU Driver Developer's Guide
> > >     vga-switcheroo
> > >     vgaarbiter
> > >     todo
> > > +   rfc
> > 
> > I understand the motivation here so I didn't commented earlier, but looking now,
> > I'm wondering that this section will polute the official doc...
> 
> We already have this problem between documentation meant for kernel driver
> developers and documentation meant for userspace developers around uapi
> and all that. "who is the audience here" is very ill-defined for our
> current set of docs in Documentation/gpu :-(

you have a point...

another thing that I don't like is the overhead, but otoh it forces us to
write more docs...

with all the pros and cons understood, let's move on...

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> So I agree with you, but I also don't think this will make things worse.
> -Daniel
> 
> > 
> > >  
> > >  .. only::  subproject and html
> > >  
> > > diff --git a/Documentation/gpu/rfc.rst b/Documentation/gpu/rfc.rst
> > > new file mode 100644
> > > index 000000000000..9d0ff2921af8
> > > --- /dev/null
> > > +++ b/Documentation/gpu/rfc.rst
> > > @@ -0,0 +1,16 @@
> > > +===============
> > > +GPU RFC Section
> > > +===============
> > > +
> > > +For complex work, especially new uapi, it is often good to nail the high level
> > > +design issues before getting lost in the code details. This section is meant to
> > > +host such documentation:
> > > +
> > > +* Each RFC should be a section in this file, explaining the goal and main design
> > > +  considerations.
> > > +
> > > +* For uapi structures add a file to this directory with and then pull the
> > > +  kerneldoc in like with real uapi headers.
> > > +
> > > +* Once the code has landed move all the documentation to the right places in
> > > +  the main core, helper or driver sections.
> > > -- 
> > > 2.31.0
> > > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
