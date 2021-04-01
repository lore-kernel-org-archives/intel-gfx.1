Return-Path: <SRS0=2Jy7=I6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CACC433ED
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Apr 2021 09:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A611F6108B
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Apr 2021 09:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A611F6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E470D6EC7F;
	Thu,  1 Apr 2021 09:19:10 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DEC6E104;
 Thu,  1 Apr 2021 09:19:09 +0000 (UTC)
IronPort-SDR: CyEiclTk453qnNukeoAZWDuIUE1ih9ZUYe1zGQSquXy169BHywBIaC7RlRI/xgNrQ8tYDJjI1i
 uP9+wkHTSqCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="253537127"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="253537127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 02:19:05 -0700
IronPort-SDR: I1RNBi7QrW7yECoEw7BkJOI1sF0c2LAzlehbxfz3KfDFwGrzcPULvK22EoaBbBrm527+B7XyQi
 +hof1o0FaKxg==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="419114778"
Received: from chinchil-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.231.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 02:19:04 -0700
Date: Thu, 1 Apr 2021 05:19:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <YGWQB+8gWgmZ/6Mg@intel.com>
References: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Check actual RC6 status
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
Cc: Intel-gfx@lists.freedesktop.org,
 Eero T Tamminen <eero.t.tamminen@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 11:18:50AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> RC6 support cannot be simply established by looking at the static device
> HAS_RC6() flag. There are cases which disable RC6 at driver load time so
> use the status of those check when deciding whether to enumerate the rc6
> counter.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reported-by: Eero T Tamminen <eero.t.tamminen@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 41651ac255fa..a75cd1db320b 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -476,6 +476,8 @@ engine_event_status(struct intel_engine_cs *engine,
>  static int
>  config_status(struct drm_i915_private *i915, u64 config)
>  {
> +	struct intel_gt *gt = &i915->gt;
> +
>  	switch (config) {
>  	case I915_PMU_ACTUAL_FREQUENCY:
>  		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> @@ -489,7 +491,7 @@ config_status(struct drm_i915_private *i915, u64 config)
>  	case I915_PMU_INTERRUPTS:
>  		break;
>  	case I915_PMU_RC6_RESIDENCY:
> -		if (!HAS_RC6(i915))
> +		if (!gt->rc6.supported)

Is this really going to remove any confusion?
Right now it is there but with residency 0, but after this change the event is
not there anymore so I wonder if we are not just changing to a different kind
of confusion on users.

>  			return -ENODEV;

would a different return help somehow?

>  		break;
>  	case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
> -- 
> 2.27.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
