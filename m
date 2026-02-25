Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51336FD3767
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Feb 2026 15:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF59810E363;
	Wed, 25 Feb 2026 15:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPoAc/OA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F4D10E363;
 Wed, 25 Feb 2026 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772033906; x=1803569906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=51uIVEcCb4gb+d1It8eAaGS6CNeLNEuK+vziL4H4Ri4=;
 b=NPoAc/OAw7e/hWClrACzUC4cenQ2mOS8K4sxoEam0i9UmkSID1ABCc+v
 ede/CdnuA/1nv1D1LmlrfZAY78ECdlUqOY3Q3pYnIkLd79/DXehdZc26K
 Z7Mft3Ma0iri996jom10fAyBzKsQK9MysTUC5+Ja0hZVCx4ooHoq3JAXu
 eofdTstZDVJydYUU2fChqae5NGF94i6zTf2a5p2Kgz2T+LIuBptVck8zV
 Ku3lPtP2eZ2qiuLT6+2CEnWgsrzAGo3M5OP/eOaIOd8SHPSvAFEuhnQqW
 SkTiy/A+8Wr+2RzjtHUUUzv+Ls89ZUFElxaGphzjv3qeVXUDrdt+amGZs g==;
X-CSE-ConnectionGUID: MrYzIHnsQCiqk5zcxo13lQ==
X-CSE-MsgGUID: +eIDYm01T8+D4B0oPx09hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72779090"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72779090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 07:38:26 -0800
X-CSE-ConnectionGUID: jka7VdglRxy7hZV4SlBbkQ==
X-CSE-MsgGUID: e26hBsa+Q5uywkAApWbkUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220877144"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 07:38:21 -0800
Date: Wed, 25 Feb 2026 16:38:18 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915: Fix potential overflow of shmem scatterlist
 length
Message-ID: <aZ8XaheEIW8Opb3Q@ashyti-mobl2.lan>
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
 <aZ7h4pJlB70wf7In@zenone.zhora.eu>
 <5887622.44csPzL39Z@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5887622.44csPzL39Z@jkrzyszt-mobl2.ger.corp.intel.com>
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

> > For clarity this can be written as
> > 
> > 		nr_pages = min_t(unsigned long,
> > 				folio_nr_pages(folio), page_count - i);
> > 		nr_pages = min_t(unsigned long, nr_pages, max_pages);
> 
> Do you think the min_array() is less clear?  Let's see what others say.

min_array() is clear, it's the ((unsigned long[]) { ... }) that
iis nice and fancy but of difficult first read. But, as I said,
it can stay, I don't have a strong opinion, maybe I'd have done
the same.

Andi
