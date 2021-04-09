Return-Path: <SRS0=Zf8m=JG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCD6C433B4
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Apr 2021 07:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA396611B0
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Apr 2021 07:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA396611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0416EB89;
	Fri,  9 Apr 2021 07:54:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B33A6EB89;
 Fri,  9 Apr 2021 07:54:09 +0000 (UTC)
IronPort-SDR: Wlo0TAaJ/egnRgHiXSLZ/+/gvbx+PkndEIwTeXMy36cJ2k15J7htPqNbTcoAik7enWdhoFLcE8
 /x2uj66GM24A==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="278989333"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="278989333"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 00:54:08 -0700
IronPort-SDR: bgMp97WvIgB5Zn9+2wM1rI6kamTLDahoFAzimb6GQDlL1Oq+Aqsa70WMk4mFGLMIhtX4TeIS70
 EJ2iBjcMWoCA==
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="520193734"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 00:54:07 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lUlyq-0001Tm-Ef; Fri, 09 Apr 2021 10:55:04 +0300
Date: Fri, 9 Apr 2021 10:55:04 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YHAIWNZrEeEqFhaW@platvala-desk.ger.corp.intel.com>
References: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
 <YGW2pTimwjHEDf3M@platvala-desk.ger.corp.intel.com>
 <YG9j3HqjZCk71Dmi@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG9j3HqjZCk71Dmi@phenom.ffwll.local>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH i-g-t] gem_watchdog: Fix autotools build
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
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 10:13:16PM +0200, Daniel Vetter wrote:
> On Thu, Apr 01, 2021 at 03:03:49PM +0300, Petri Latvala wrote:
> > On Thu, Apr 01, 2021 at 12:43:16PM +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > Correcting a brain malfunction while typing in Makefile.sources.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> Isn't autotools now going away with Arek's series?

Yes. But this breakage happened before autotools removal landed.


-- 
Petri Latvala


> -Daniel
> 
> > 
> > 
> > > ---
> > >  tests/Makefile.sources | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > > index e992285fedc5..194df8e27dd0 100644
> > > --- a/tests/Makefile.sources
> > > +++ b/tests/Makefile.sources
> > > @@ -464,7 +464,7 @@ TESTS_progs += gem_wait
> > >  gem_wait_SOURCES = i915/gem_wait.c
> > >  
> > >  TESTS_progs += gem_watchdog
> > > -gem_exec_watchdog_SOURCES = i915/gem_watchdog.c
> > > +gem_watchdog_SOURCES = i915/gem_watchdog.c
> > >  
> > >  TESTS_progs += gem_workarounds
> > >  gem_workarounds_SOURCES = i915/gem_workarounds.c
> > > -- 
> > > 2.27.0
> > > 
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
