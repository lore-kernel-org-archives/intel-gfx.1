Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184C8C531CB
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Jul 2026 08:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966AA10E559;
	Thu, 23 Jul 2026 08:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jqeyPULi";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AF210E559
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Jul 2026 08:48:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E2AD8600AD;
 Thu, 23 Jul 2026 08:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051AA1F000E9;
 Thu, 23 Jul 2026 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784796536;
 bh=jnfgcIDjWjGBmfPss1B/4w8t+8fmcgwIHllwECFvMQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=jqeyPULiYnM1e9ingq14o7m6jNIiw8jkILyj5fIWkzSfGDWIc+jmkDtHd/SeN/wzT
 hKCdd0mzK5oNrrGQhFxRBSAXA9+Uw6KGcm4WxgeL9t6+RFCeq3soua06SxZGcq6GaJ
 u/rMe7ja28p90v0kgKKuAHcfii/EtbHQ3UECQIo81aGmUIrEZkjg+ch5+tVmqMCIUM
 44b0Fr4eRQXY8L5fq3rqHnAey9GI/Bipt7PiapT79wB0+LVm0llOXOxjjTGeiClyL0
 rLP50OsEDGAqE+avUtkfzLKNVCDE+VC9SOAzJ5v2+zoW3pmItT9XQsX2OY6ocfUiSf
 TUG4kD+mRgJtg==
Date: Thu, 23 Jul 2026 10:48:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 krzysztof.karas@intel.com
Subject: Re: [PATCH 1/6] drm/i915: Convert driver init/PCI/params license
 headers to SPDX
Message-ID: <amHOy6LgmASmm9r9@zenone.zhora.eu>
References: <cover.1784713895.git.sebastian.brzezinka@intel.com>
 <3b7af1481b89841e0cfaa17b34068441e975f437.1784713895.git.sebastian.brzezinka@intel.com>
 <amDH7Q1pNN76zcTS@kniemiec-mobl1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amDH7Q1pNN76zcTS@kniemiec-mobl1>
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

Hi,

On Wed, Jul 22, 2026 at 04:08:45PM +0200, Krzysztof Niemiec wrote:
> On 2026-07-22 at 12:29:18 +0200, Sebastian Brzezinka wrote:
> > Replace the verbose MIT license boilerplate in the core driver
> > init, PCI enumeration and module parameter files with the
> > corresponding SPDX-License-Identifier tag. This preserves the
> > existing copyright notices while removing duplicated legal text, per
> > Documentation/process/license-rules.rst.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_driver.c | 25 ++-----------------------
> >  drivers/gpu/drm/i915/i915_drv.h    | 25 ++-----------------------
> >  drivers/gpu/drm/i915/i915_params.c | 21 +--------------------
> >  drivers/gpu/drm/i915/i915_params.h | 21 +--------------------
> >  drivers/gpu/drm/i915/i915_pci.c    | 21 +--------------------
> >  5 files changed, 7 insertions(+), 106 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index ce6d20958320..3beeccbed949 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -1,30 +1,9 @@
> > -/* i915_drv.c -- i830,i845,i855,i865,i915 driver -*- linux-c -*-
> > - */
> > +// SPDX-License-Identifier: MIT
> >  /*
> > + * i915_drv.c -- i830,i845,i855,i865,i915 driver -*- linux-c -*-
> >   *
> >   * Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
> >   * All Rights Reserved.
> 
> I'll ask cause I'm not sure - Can we put an SPDX identifier on this if
> there's "All Rights Reserved" in the license? The original text of the
> MIT license doesn't have it, so I *think* it would make it a derivative
> license. Right now the phrase "All Rights Reserved" is vacuous because
> all the members of the convention that requires the use of it are now
> also all members of the convention saying that it's implicit; but strictly
> technically speaking the text of the license on this file IS different
> than original MIT.
> 
> It's probably not that big of a deal and/or I'm not fully informed on
> this (there's a bunch of files in the kernel, even new-ish ones, that do
> "All Rights Reserved" with SPDX: MIT, so maybe this is allowed) - but I
> think it's worth double checking.

I don't really know what "All Rights Reserved" means in this
context, but this is out of the license itself. What the patch is
doing is to replace the MIT license with the SPDX identifier and
leave things as they are.

What can be done is to add Intel as a copirighter, giving that
also Intel has been contributing to this file. But it's not
strictly necessary to the scope of this series.

Andi
