Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE5110F995F
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Apr 2026 16:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979DD10E6BE;
	Wed,  8 Apr 2026 16:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuyLnVLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725CC10E6BE
 for <intel-gfx@lists.freedesktop.org>; Wed,  8 Apr 2026 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775666842; x=1807202842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WLpmhN0T14LxZztndy2Pg8E7CuDRpN8/TR4X0mAoBos=;
 b=JuyLnVLiRIyQco04cVGn0OnwJVmQPP0SQ0VsPS9LdsMEttRycNkaGOLW
 lTW25Y/5pCKZgVFlCcaF9OZlaaj9hfDCBol9aMaIA9eyP9dyVOcoSRF4b
 rzJ9w+DmgMTEiQPs5qe94QUFxuD0Ya8xCe6Yb/w7BQoY5V8n2X/xsdNup
 kAVtfr4oChkgV0xppTbTwa/+lUduubxHd+PVgmuVEO3kUlqETg3fyRAIk
 GW1dfKXzcba5G1tCt3KKmFWnJCDPgHUIS9RJEm23Z5B8TqEMSK5MsqXKT
 jxZHsJoU6xpgixJ5Kucdj4nTEF0tqHGChd626Z1O4Miqpu1bI5/BZP3sP w==;
X-CSE-ConnectionGUID: NufccT64TFezZf2bLXUr4A==
X-CSE-MsgGUID: LQfXOwd5TbyjdfoTKvgrxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80252616"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80252616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 09:47:21 -0700
X-CSE-ConnectionGUID: AMefIGNPRduC0Ux+ewFD1w==
X-CSE-MsgGUID: hc6+EXcCS0qAU4wnhOVXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="223758672"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.73])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 09:47:19 -0700
Date: Wed, 8 Apr 2026 19:47:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?=
 =?utf-8?Q?lure_for_drm=2Fi915=2Fdisplay?= =?utf-8?Q?=3A?= stop using the
 configurable fence timeout (rev2)
Message-ID: <adaGlN70oHVlk6K4@intel.com>
References: <20251112155612.8320-1-jani.nikula@intel.com>
 <176310680567.54560.8073003092226406962@10055242dc62>
 <3692f126b907c442d76a93957073660d7d9ffd12@intel.com>
 <aSXmTMWeOXjnYNSB@intel.com>
 <dc4d04b4-2d29-4a19-8d11-58051673e0a6@intel.com>
 <44f9b69d23678458f0ab3ff4bec5c45cb05535b8@intel.com>
 <4d0e3bfe-d3e3-43fb-8964-b9647e914a61@intel.com>
 <ac7ffc50c676979359a7363374030beb61d6cfff@intel.com>
 <dcaf9a16-a462-4b04-8b7b-29f03e4ea523@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcaf9a16-a462-4b04-8b7b-29f03e4ea523@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Apr 08, 2026 at 05:49:58PM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2026-04-08 kl. 17:14, skrev Jani Nikula:
> > On Thu, 02 Apr 2026, Maarten Lankhorst <maarten.lankhorst@intel.com> wrote:
> >> Den 2026-04-02 kl. 11:40, skrev Jani Nikula:
> >>> On Wed, 03 Dec 2025, Maarten Lankhorst <maarten.lankhorst@intel.com> wrote:
> >>>> Hey,
> >>>>
> >>>> Den 2025-11-25 kl. 18:24, skrev Ville Syrjälä:
> >>>>> On Tue, Nov 25, 2025 at 03:55:02PM +0200, Jani Nikula wrote:
> >>>>>> Maarten, Ville, any ideas what to do about these?
> >>>>> Looks like we need the timeout to unbreak the modeset vs. reset
> >>>>> deadlock in a timely fashion.
> >>>>>
> >>>>> I'm not where we signal/error the fences the modeset is waiting
> >>>>> for, but I guess that must be happening after the whole reset
> >>>>> sequence is done. Doing that earlier would seem like another
> >>>>> solution, but dunno what other fallout it would have.
> >>>> intel_prepare_plane_fb() adds all dma-resv fences for old_obj on
> >>>> intel_crtc_needs_modeset(), does it change anything if we remove that,
> >>>> at least for the GPU reset commit?
> >>> We dropped the ball here a bit, and I'm a bit clueless as to what to
> >>> do. Except we'll need to unify i915 and xe here somehow.
> >>>
> >>> Alternatives:
> >>>
> >>> - Remove the timeout from i915 (the patch at hand), and fix the fallout
> >>>   somehow.
> >>>
> >>> - Add the timeout to xe, and fix the fallout, if any.
> >>>
> >>> - Add the timeout to display parent interface, which is a bit meh.
> >>>
> >>>
> >> The mention in the commit is old_obj needs to be wait for flip_done, I do not believe this
> >> is the case that it was ever used in hardware supported by xe, so for xe the wait can be dropped entirely.
> >>
> >> Is this required for i915 still? In that case you can just eliminate
> >> the wait only for xe.
> > Trouble is, doing things differently basically means using the parent
> > interface no matter what.
> >
> The specific wait mentioned in intel_plane_prepare_plane_fb is only
> used in pre-universal plane overlay support, and in xf86-video-intel
> driver on < gen9. (source:
> intel_skylake_info specifies gen = 0110,
> and sna_wait_for_scanline() returns false for gen >= 0110 on sna.)
> 
> Adding a < GEN9 check would be sufficient, and not driver specific.

How does skipping the wait for the old obj fence help if we're stuck
waiting on the new obj fence?

-- 
Ville Syrjälä
Intel
