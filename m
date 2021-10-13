Return-Path: <SRS0=fYpC=PB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D545DC433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Oct 2021 10:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B96B60ED4
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Oct 2021 10:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B96B60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8146EA13;
	Wed, 13 Oct 2021 10:59:26 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C6B6EA13
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Oct 2021 10:59:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="288272224"
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="288272224"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 03:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="524586216"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 13 Oct 2021 03:59:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 Oct 2021 13:59:03 +0300
Date: Wed, 13 Oct 2021 13:59:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <YWa79w8LWIi3tpcn@intel.com>
References: <cover.1634119597.git.jani.nikula@intel.com>
 <YWa3QeJ3s0+9+fbH@intel.com> <87sfx5xkuq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sfx5xkuq.fsf@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 0/1] drm/i915: vlv sideband
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

On Wed, Oct 13, 2021 at 01:47:09PM +0300, Jani Nikula wrote:
> On Wed, 13 Oct 2021, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Wed, Oct 13, 2021 at 01:11:58PM +0300, Jani Nikula wrote:
> >> Three main ideas here:
> >> 
> >> - vlv sideband only has the name "sideband" in common with the rest of
> >>   intel_sideband.[ch]
> >
> > I wouldn't put it like that. There are two actual sideband 
> > implementtions in that file:
> > - vlv/chv iosf sideband (vlv_sideband)
> > - lpt/wpt iosf sideband (intel_sbi)
> >
> > And the third thing in that file is the snb+ pcode mailbox stuff,
> > which has nothing to do with sideband.
> 
> Fair enough... but no opposition to the splitting out of vlv/chv iosf
> sideband? vlv_sideband.[ch] like here? I'm fine with renaming too.
> 
> I can follow up with lpt/wpt iosf split out (intel_sbi.[ch]?) and snb+
> pcode (intel_pcode.[ch]?).

Yeah, I guess just full split is the cleanest. Those names seem OK
to me. Or I suppose we could rename the intel_sbi stuff to lpt_sbi
or something? Might not be worth the hassle. Adding a small comment
to intel_sbi.c to document what it's for should be sufficient reminder.

> I think we've just put all of them together way back when this was all
> probably bundled in i915_drv.c or something...

Yeah. I think the common thread was that you need to go through
a mailbox, but the file name didn't really reflect that.

-- 
Ville Syrjälä
Intel
