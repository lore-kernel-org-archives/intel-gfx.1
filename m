Return-Path: <SRS0=tpVi=GB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178B7C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Dec 2020 12:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C05C92078D
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Dec 2020 12:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C05C92078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614A08961D;
	Tue, 29 Dec 2020 12:17:15 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859EF8961D
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Dec 2020 12:17:14 +0000 (UTC)
IronPort-SDR: 70fW8vVs8/3M8f+AA66SDymriFb4IhJRpJ51ksss7oXbEESiRMDWjbMRZBggUN5hQtVB2tpLzq
 vu6cI1NxCypQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="194975538"
X-IronPort-AV: E=Sophos;i="5.78,457,1599548400"; d="scan'208";a="194975538"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2020 04:17:14 -0800
IronPort-SDR: kAj2362U0bGSplqEVnWYPtyMuaaA7k5cur+Fy+xY3nffPJxujQd6cVLyQ1WdmCHKqqdNnzIuKo
 1VuCIsMO0o8w==
X-IronPort-AV: E=Sophos;i="5.78,457,1599548400"; d="scan'208";a="376041568"
Received: from nabyrne-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.27.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2020 04:17:12 -0800
Date: Tue, 29 Dec 2020 14:17:08 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <X+sY3mt1mLT8hFvc@intel.intel>
References: <20201228155229.9516-1-chris@chris-wilson.co.uk>
 <20201228155229.9516-4-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228155229.9516-4-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 04/54] drm/i915: Mark up protected uses of
 'i915_request_completed'
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Chris,

> When we know that we are inside the timeline mutex, or inside the
> submission flow (under active.lock or the holder's rcu lock), we know
> that the rq->hwsp is stable and we can use the simpler direct version.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c     |  2 +-
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c     |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c       |  2 +-
>  drivers/gpu/drm/i915/gt/intel_reset.c           |  3 +--
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c |  4 +++-
>  drivers/gpu/drm/i915/gt/intel_timeline.c        |  4 ++--
>  drivers/gpu/drm/i915/i915_request.c             | 15 +++++++--------
>  7 files changed, 17 insertions(+), 17 deletions(-)

have you also missed a couple of cases in
intel_execlists_submission.c and i915_scheduler.c?

[...]

> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index b85b6f3dcd60..e0b4291393ec 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -151,8 +151,7 @@ static void mark_innocent(struct i915_request *rq)
>  void __i915_request_reset(struct i915_request *rq, bool guilty)
>  {
>  	RQ_TRACE(rq, "guilty? %s\n", yesno(guilty));
> -
> -	GEM_BUG_ON(i915_request_completed(rq));
> +	GEM_BUG_ON(__i915_request_is_complete(rq));

aren't you outside the lock here?

Andi

>  
>  	rcu_read_lock(); /* protect the GEM context */
>  	if (guilty) {
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
