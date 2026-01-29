Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC94D61013
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jan 2026 13:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E065410E02B;
	Thu, 29 Jan 2026 13:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAiyZ2mQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB06B10E02B
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jan 2026 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769693857; x=1801229857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iz0KttqIBwnNO8Z+I0WDIhJ6AGOKKZmSPClOtk0VSdY=;
 b=mAiyZ2mQV9nxP9erhgvhogMMGY4iI8LAizGSUZgZLX0Yb0F5YWjyu6Wh
 37fUAq/hyjB5RjUPqfIuY0PYl/DqR4nvD5XQ0PxGfzl5tbIQHj99VPZzs
 7+cX60aHaz+4C3SHzSQq3ctxlTxMP5QQZ+fuGfBiOruh5MbN54uqGP4/U
 N9YgIoiePBhZyJizED8Fxn4K4OOfItXj4Vp+ptjU97uEy+y9EnwH5G+VV
 3z3u5ui7SP+JApv3S6FCJ3jw6RZZCERHJUJUcqHwxMA9AyKa7zBug1TAN
 NUnp1QfehiUgl7zMuXbFHp4yyicmNigk3M/opZrpo5QMZDUN9oNUjzeDY Q==;
X-CSE-ConnectionGUID: /kOHCJw6RPmbhB9R+SKRKA==
X-CSE-MsgGUID: 6kj90h3oT5Chsl0CtOMlXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69947158"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="69947158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 05:37:37 -0800
X-CSE-ConnectionGUID: IjjSuNNzQ2OOxn8Kr3q54Q==
X-CSE-MsgGUID: bPKsQIkaTlGVT+JnacZIhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213076354"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 05:37:35 -0800
Date: Thu, 29 Jan 2026 14:37:32 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, maxime.ripard@kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 0/2] Miscellaneous fixes in drm code
Message-ID: <aXtinG2JIhLjNWK6@ashyti-mobl2.lan>
References: <20260120154824.1864085-1-krzysztof.karas@intel.com>
 <aXtFHm4Y94jf0YXd@ashyti-mobl2.lan>
 <52e0096c310d346b23fa65b56837b4e0ecc09d58@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52e0096c310d346b23fa65b56837b4e0ecc09d58@intel.com>
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

On Thu, Jan 29, 2026 at 03:10:44PM +0200, Jani Nikula wrote:
> On Thu, 29 Jan 2026, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > Hi Krzysztof,
> >
> >> Krzysztof Karas (2):
> >>   drm: Warn before division by 0 would occur
> >>   drm: Avoid suspicious operations in drm_fb_dma_get_gem_addr()
> >> 
> >>  drivers/gpu/drm/drm_fb_dma_helper.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > merged to drm-intel-gt-next.
> 
> ...but neither commit belongs in drm-intel-gt-next, they belong in
> drm-misc-next!
> 
> Cc: drm-misc maintainers, how do you want to resolve this?

Ah... sorry! I was taken by the habit!

Andi
