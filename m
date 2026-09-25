Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C71AC9830D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 07:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9A610E5A5;
	Fri, 25 Sep 2026 07:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRk+uvqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4556A10E5A5;
 Fri, 25 Sep 2026 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790322861; x=1821858861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PJDAV/NFxyHPQvM3tB9nKVe6/iruS2EGKw1ziCqORAs=;
 b=YRk+uvqCNpGBgXcBmrot3+PDZ6rMKVolupC8NyHi2hRsn8BwtoCUhZ6O
 j8VgA7pi3uQaEdFSKZn1F7s4uYIpjPwE9SAoPiGpruHpZYKXhVu0cfGNn
 rFG6K9+UOhn4Gq/7jrTsxPvbXXJqdH5BhldwOa45xN/V2DXHHe+hZnhSJ
 lNrBj14+HK23GDUXAt5sTGXQ14+mjvZd15Dqto560huVvShxmKeU1tiur
 mbgrGxAyw7ciWSXo/lUfsTehMGgv/iQzqhxQ6i3MdT2XHrg+YvOA7s/f4
 KjxaivFw3SZE+jIwy1Uic0HIDv1vTyLCISYjjgY4JyD7dWFrUoNjZRZ3+ A==;
X-CSE-ConnectionGUID: ixnmtoHqSvKseqD7I0xftw==
X-CSE-MsgGUID: TF+1q9e3SC+PaQQvHzHLqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94924000"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="94924000"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 00:54:21 -0700
X-CSE-ConnectionGUID: qkNizncYTeGINIm67CI2vQ==
X-CSE-MsgGUID: NEMTj2nCRruDS2UPgzSjGQ==
X-ExtLoop1: 1
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 00:54:19 -0700
Date: Fri, 25 Sep 2026 09:54:16 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/gem_softpin: Skip safe-alignment
 without full-ppgtt
Message-ID: <hrhmsdfbgata43oftcsxewh4saerdeqt5dmmvotyrxyv5nbthp@iolo6rxdlyeb>
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
 <20260924152443.829382-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924152443.829382-5-janusz.krzysztofik@linux.intel.com>
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

On Thu, Sep 24, 2026 at 05:24:17PM +0200, Janusz Krzysztofik wrote:
> gem_detect_min_start_offset_for_region(), gem_detect_safe_start_offset()
> and gem_detect_safe_alignment() exist solely to bootstrap
> intel_allocator's start offset and default alignment. Without
> full-ppgtt the kernel can't see the ranges intel_allocator considers
> reserved and may hand them out to other users, so calling these
> helpers is pointless there, as already acknowledged by
> __intel_bb_create() which enforces relocations and skips the
> allocator entirely in that case.
> 
> gem_softpin@safe-alignment called these helpers unconditionally,
> outside the file's full-ppgtt gated subtest group. Require
> gem_uses_full_ppgtt() directly on this subtest so it is skipped
> instead of exercising meaningless values.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15527
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Assisted-by: GitHub Copilot (Claude Sonnet 5)
> ---
>  tests/intel/gem_softpin.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
> index e67259b001..3fafde94ba 100644
> --- a/tests/intel/gem_softpin.c
> +++ b/tests/intel/gem_softpin.c
> @@ -1573,8 +1573,19 @@ int igt_main()
>  	}
>  
>  	igt_describe("Check start offset and alignment detection.");
> -	igt_subtest("safe-alignment")
> +	igt_subtest("safe-alignment") {
> +		/*
> +		 * The min-start-offset/alignment probing helpers exist
> +		 * solely to bootstrap intel_allocator, which the driver
> +		 * itself only relies on under full-ppgtt (see the comment
> +		 * in __intel_bb_create()). Without full-ppgtt the kernel
> +		 * can't see the ranges intel_allocator considers reserved
> +		 * and may hand them out to other users, making the detected
> +		 * values meaningless.
> +		 */
> +		igt_require(gem_uses_full_ppgtt(fd));

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		safe_alignment(fd);
> +	}
>  
>  	igt_describe("Check softpinning of a gem buffer object.");
>  	igt_subtest("softpin")
> -- 
> 2.55.0
> 
