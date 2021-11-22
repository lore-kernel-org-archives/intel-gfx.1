Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59485C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Nov 2021 05:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F706EA1E;
	Mon, 22 Nov 2021 05:58:48 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D766E1F8;
 Mon, 22 Nov 2021 05:58:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="215441017"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="215441017"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 21:58:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="508816279"
Received: from mikolajk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.6.157])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 21:58:44 -0800
Date: Mon, 22 Nov 2021 06:58:41 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20211122055841.GA4959@zkempczy-mobl2>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/6] tests/api_intel_allocator: Fix
 build warning
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 12:59:40PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> .../tests/i915/api_intel_allocator.c: In function ‘basic_alloc’:
> .../tests/i915/api_intel_allocator.c:158:25: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
>   158 |                         if (j == i)
>       |                         ^~
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

I've already seen this on gcc 11.2.0 (Ubuntu 21.10) and got
locally same fix, so:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/i915/api_intel_allocator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index 4b74317ed3d0..6d7764ca3f51 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -157,7 +157,7 @@ static void basic_alloc(int fd, int cnt, uint8_t type)
>  		for (j = 0; j < cnt; j++) {
>  			if (j == i)
>  				continue;
> -				igt_assert(!overlaps(&obj[i], &obj[j]));
> +			igt_assert(!overlaps(&obj[i], &obj[j]));
>  		}
>  	}
>  
> -- 
> 2.32.0
> 
