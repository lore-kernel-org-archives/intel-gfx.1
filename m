Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E4DC4450A
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Jul 2026 13:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C920710F07D;
	Wed, 15 Jul 2026 13:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QtZvxav6";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3180C10F07A
 for <intel-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 13:46:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 00B8940B8D;
 Wed, 15 Jul 2026 13:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485FA1F000E9;
 Wed, 15 Jul 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784123168;
 bh=nRQUTH25xByA2vPHOC8ALAbvZAlrixx2C8+6slnIi1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=QtZvxav6fuh5dy8WvPeTpj6eoAFcVeeRwYKNedNWPCGEz+lefqfW1BwPFP9JhPPal
 B6og5aUHVzPtxkO2d9S0AEvMAY226A64sbqsguikXxpX/mT1buCKq1q3b+ndIPtzwY
 VnG++fGOE+U4hGXQGV/QSrfnZTVkzH6YnOt+0oHTGL5m3ZPDTCgTUE+WzQCcBMpoW0
 SdI30cVtGu7IvqUUKtB6OfZM0EGGMqkL9sq6NwrwwJ08SjnTYzKLyrUQRPq8xHH4xd
 O1AwG2CoWdMyxW4lVEzKcCOx4B5qKq182c1ZBkGYzn+ggvg8LL6fd3OpjOzZyIb5CW
 cNy4vjxMgXBQg==
Date: Wed, 15 Jul 2026 15:46:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Emre Cecanpunar <emreleno@gmail.com>, intel-gfx@lists.freedesktop.org, 
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, 
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/selftests: Fix GT PM sort comparators
Message-ID: <aleOtSq5Eq5AXbvY@zenone.zhora.eu>
References: <20260714220430.238433-1-emreleno@gmail.com>
 <eb96c43d-2dd1-4c45-be68-762c861b90a1@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb96c43d-2dd1-4c45-be68-762c861b90a1@ursulin.net>
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

Hi Tvrtko,

I was about to r-b this patch.

On Wed, Jul 15, 2026 at 01:14:11PM +0100, Tvrtko Ursulin wrote:
> On 14/07/2026 23:04, Emre Cecanpunar wrote:
> > Compare the sampled clock values instead of their addresses. Comparing
> > addresses leaves the samples unsorted, preventing the code from discarding
> > the minimum and maximum samples.
> > 
> > Fixes: 1a5392479207 ("drm/i915/selftests: Measure CS_TIMESTAMP")

Normally we don't keep the Fixes tag for selftest patches as it
doesn't have an impact in the real world and it doesn't bring any
benefit to backport.

Andi

> > Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
