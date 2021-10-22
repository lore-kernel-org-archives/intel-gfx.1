Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4B2C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 09:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7119D60F8F
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 09:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7119D60F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1CB6E90B;
	Fri, 22 Oct 2021 09:03:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFF66E90B;
 Fri, 22 Oct 2021 09:03:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="226717213"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="226717213"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 02:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="534675696"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 22 Oct 2021 02:02:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Oct 2021 12:02:55 +0300
Date: Fri, 22 Oct 2021 12:02:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <YXJ+PwVjT8Xbfb32@intel.com>
References: <20211021181847.1543341-1-lucas.demarchi@intel.com>
 <YXG6BGEtId+5oXFH@intel.com>
 <20211021213213.rl7dyux3sfaczyit@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021213213.rl7dyux3sfaczyit@ldmartin-desk2>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915: remove CNL leftover
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

On Thu, Oct 21, 2021 at 02:32:13PM -0700, Lucas De Marchi wrote:
> On Thu, Oct 21, 2021 at 10:05:40PM +0300, Ville Syrjälä wrote:
> >On Thu, Oct 21, 2021 at 11:18:47AM -0700, Lucas De Marchi wrote:
> >> We left the definition IS_CANNONLAKE() macro while removing it from the
> >> tree due to having to merge the changes in different branches. Now that
> >> everything is back in sync and nobody is using IS_CANNONLAKE(), we can
> >> safely ditch it.
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >
> >Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> >I found another leftover somewhere else, but now I forgot where
> >it was. I guess it'll come back to me eventually.
> 
> drivers/gpu/drm/i915/intel_pch.c, which I suspect is what you're talking
> about due to your recent patches. But that one is correct as we still
> have Cannon Lake Point (and I never remember if P in CNP is for PCH or
> Point) 
> 
> there is another one in a comment in drivers/gpu/drm/i915/gt/intel_gt.c,
> too.

Sleeping on it helped, I now remember that it's the SAGV block time.

-- 
Ville Syrjälä
Intel
