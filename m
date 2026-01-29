Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCDAD6101A
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jan 2026 14:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66E210E86D;
	Thu, 29 Jan 2026 14:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMuHsy3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E50010E874
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jan 2026 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769696955; x=1801232955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rH6nDmXf1+xTHI5+13GwAaIseMia/bFUNXNU7oCNsrU=;
 b=iMuHsy3cSxL7K7LmAja3TZIFTLHWhNA4QqdJGSSNoBrzWFHsTttOcJfH
 u09KrlhF7XEefhKilkv6lHvBn4HnkSIFFOrcKvTTbY4bwez4H1s0jdHZE
 sxpUJBGgDCHg2lfwAD2jn8dLvIzDHkvs35bHLVS256kUWoQ8jdXCqx6O5
 BJDoXEgL35p6ONcGhE3bK4e5r2dyFQkfM1lawMU+A2lwKsRzzktlWEZxB
 vxqYuQFXCDLjMfFA+oUb9Yi6W/Suxt81/DgKJWvLyrmpIG2zhmOIrBjil
 5CXWv/inolrt5/JbCiVVWzMLkzUsNP+h7q5YprUYQ+3kaK/KAmzFRqFkb Q==;
X-CSE-ConnectionGUID: CS4cLmKJSpq1qaqhvueOjw==
X-CSE-MsgGUID: NBsz2JYWS+WcNoW/CoFWmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96400096"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="96400096"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 06:29:14 -0800
X-CSE-ConnectionGUID: 5/mlllJQT7+5E5buhQ7NJA==
X-CSE-MsgGUID: RRPJdAWrQj2TeGA69DQL1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="207705590"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 06:29:10 -0800
Date: Thu, 29 Jan 2026 15:29:07 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, maxime.ripard@kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v6 0/2] Miscellaneous fixes in drm code
Message-ID: <aXtus9Lh67K-iKH4@ashyti-mobl2.lan>
References: <20260120154824.1864085-1-krzysztof.karas@intel.com>
 <aXtFHm4Y94jf0YXd@ashyti-mobl2.lan>
 <52e0096c310d346b23fa65b56837b4e0ecc09d58@intel.com>
 <aXtinG2JIhLjNWK6@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXtinG2JIhLjNWK6@ashyti-mobl2.lan>
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

On Thu, Jan 29, 2026 at 02:37:32PM +0100, Andi Shyti wrote:
> On Thu, Jan 29, 2026 at 03:10:44PM +0200, Jani Nikula wrote:
> > On Thu, 29 Jan 2026, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > > Hi Krzysztof,
> > >
> > >> Krzysztof Karas (2):
> > >>   drm: Warn before division by 0 would occur
> > >>   drm: Avoid suspicious operations in drm_fb_dma_get_gem_addr()
> > >> 
> > >>  drivers/gpu/drm/drm_fb_dma_helper.c | 7 +++++--
> > >>  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > merged to drm-intel-gt-next.
> > 
> > ...but neither commit belongs in drm-intel-gt-next, they belong in
> > drm-misc-next!
> > 
> > Cc: drm-misc maintainers, how do you want to resolve this?
> 
> Ah... sorry! I was taken by the habit!

Joonas has reverted them. Thanks a lot, Joonas!

Andi
