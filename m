Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A3E83EF9
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Feb 2026 09:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD2A10E59B;
	Wed,  4 Feb 2026 09:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWgTejNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B93B10E599;
 Wed,  4 Feb 2026 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770197197; x=1801733197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S1nzuNSJMTBoOxH6sKw/202K31gvAx+KFP3lq5TqC5Y=;
 b=aWgTejNOMi/h2ZmSCwvlpgkr8O3oQM0znOzzQ0Us5KJZLqjQvc3Dp2Ii
 w/e0iWQnN62IF+wkVjnGPAK8xLVkvjRD5kzhhFhPYZ1JKG3w6nxsl8u4C
 Nobi4PbgzhcgQBmMhW8qpOBYTxbWrJKNOoXXvFduwSgSZrH7GTgUaf9OF
 TOGrC4gOuu5moO4aFIr0hx7rYHeGx11ziz3TW22Zpl/M0dt7Y1IuppaDy
 AFXIondUrW22rwWnY23Q9hr+5MXjT+mpS/TiNNw31XAqfKYVVyDhEa/xn
 d61hkrAAXCvRBQllsoA0I14MmXKo15RpxZo6HfOUL9j2ij9dqySfp/qvV Q==;
X-CSE-ConnectionGUID: XMo3ujGNQjGah5IVIhgOBw==
X-CSE-MsgGUID: IzhpAF1bQOWX9f519tM/CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71276396"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71276396"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:26:37 -0800
X-CSE-ConnectionGUID: n1iv16PmS3mg1jffErXZPg==
X-CSE-MsgGUID: AuorOw+QQMyB65iZEao1DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210153564"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.209])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:26:35 -0800
Date: Wed, 4 Feb 2026 10:26:32 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH v4] drm/i915/selftests: Defer signalling the request fence
Message-ID: <aYMQyMS1b5PhLPyv@ashyti-mobl2.lan>
References: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,

On Fri, Jan 30, 2026 at 07:45:08PM +0100, Krzysztof Niemiec wrote:
> The i915_active selftests live_active_wait and live_active_retire
> operate on an i915_active attached to a mock, empty request, created as
> part of test setup. A fence is attached to this request to control when
> the request is processed. The tests then wait for the completion of the
> active with __i915_active_wait(), and the test is considered successful
> if this results in setting a variable in the active callback.
> 
> However, the behavior of __i915_active_wait() is such that if the
> refcount for the active is 0, the function is almost completely skipped;
> waiting on a already completed active yields no effect. This includes a
> subsequent call to the retire() function of the active (which is the
> callback that the test is interested about, and which dictates whether
> its successful or not). So, if the active is completed before the
> aforementioned call to __i915_active_wait(), the test will fail.
> 
> Most of the test runs in a single thread, including creating the
> request, creating the fence for it, signalling that fence, and calling
> __i915_active_wait(). However, the request itself is handled
> asynchronously. This creates a race condition where if the request is
> completed after signalling the fence, but before waiting on its active,
> the active callback will not be invoked, failing the test.
> 
> Defer signalling the request's fence, to ensure the main test thread
> gets to call __i915_active_wait() before request completion.
> 
> v4:
> - Lower the delay timeout to 50ms (Jonathan)
> - Put the check on work_finished inside a helper function (Jonathan)
> 
> v3:
> - Embed the variables inside the live_active struct (Andi)
> - Move the schedule_delayed_work call closer to the wait (Andi)
> - Implement error handling in case an error state - the wait has
>   finished, but the deferred work didn't run - is somehow achieved (Andi)
> 
> v2:
> - Clarify the need for a fix a little more (Krzysztof K., Janusz)
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

BTW, I don't want to block this patch, I'm just not feeling
comfortable at merging it and I don't have better suggestions.

BTW, you already have consensus here:

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

And, BTW, can you please add comments through the lines so that
people understand what you are doing.

Moreover, as Janusz suggested I would also like to have a real
use case description of the issue and how it appeared in our
environment.

Thanks,
Andi
