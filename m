Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C61BC61DC4
	for <intel-gfx@archiver.kernel.org>; Thu, 27 Aug 2026 23:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2481310E429;
	Thu, 27 Aug 2026 23:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FueCmjX7";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7858110E429
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 Aug 2026 23:17:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 36DAD4401F;
 Thu, 27 Aug 2026 23:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735461F00ACA;
 Thu, 27 Aug 2026 23:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787872673;
 bh=hJKINFK6R4Y8CvG1h3zqBAnO161Doi+B+2zDkY9S/Cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=FueCmjX7yvybSu8MRPkUYZ5jMTMMqNPMm3ov8bDuPaSYB3vqUwC01Hq976BvouXJe
 FB4MpMJFGNt7c3iPrXG7w5Tvqvq5vE+nYE4AodndwndkjX7/1qr5OzQVuo4XIGNmFn
 70MJSjFzjsLFGKQY3Xa0/xhPjKL0LKOhB+8iqu2/tpSKDnML/xovsSLYywEaRX2npE
 nELJWB0xnJiT+bqf3r7b8FX/Li+zhU4wmsrapKo52fn+gzB1lEjxsliyqLe70wuXiy
 bPIfRIwhMxpOZ6NYudLCFGUqAA6ujUFi0OxKeGc8JqH9skvNMd9yy1m9gjCJhA/Do+
 WdjiXwkHyGgbg==
Date: Fri, 28 Aug 2026 01:17:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com, 
 krzysztof.karas@intel.com, krzysztof.niemiec@intel.com,
 chris.p.wilson@intel.com
Subject: Re: [PATCH] drm/i915/selftests: Fix unlocked mm.stolen in reset
 selftest
Message-ID: <apDFQTbBkAzFX5uc@zenone.zhora.eu>
References: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
 <ao8a-Y4re7PRKjIr@zenone.zhora.eu>
 <DKZLAJT619PA.2D39BHW4MUAIT@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKZLAJT619PA.2D39BHW4MUAIT@intel.com>
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

Hi Sebastian,

> On Wed Aug 26, 2026 at 7:31 PM CEST, Andi Shyti wrote:
> > Have you checked sashiko's reviews? They look valid to me.
> >
> I checked, and there are already existing issues, probably wrth fixing,
> but they're outside the scope of this patch.

actually you are in the middle of those issues :-)

> > ...
> >
> >> @@ -95,9 +96,12 @@ __igt_reset_stolen(struct intel_gt *gt,
> >>  				      ggtt->error_capture.start,
> >>  				      PAGE_SIZE);
> >>  
> >> -		if (!__drm_mm_interval_first(&gt->i915->mm.stolen,
> >> -					     page << PAGE_SHIFT,
> >> -					     ((page + 1) << PAGE_SHIFT) - 1))
> >> +		mutex_lock(&gt->i915->mm.stolen_lock);
> >> +		unused = !__drm_mm_interval_first(&gt->i915->mm.stolen,
> >> +						  page << PAGE_SHIFT,
> >> +						  ((page + 1) << PAGE_SHIFT) - 1);
> >> +		mutex_unlock(&gt->i915->mm.stolen_lock);
> >> +		if (unused)
> >
> > this is always false.
> Nothing really changes here, even if the if statement is always false,
> we still need to guarantee safe access.

I'm not getting your point. Do you mean that if nothing changes I
can add things like "if (0) do_whatever_you_want;"?

Thanks,
Andi
