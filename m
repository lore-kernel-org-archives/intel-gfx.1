Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE36FF8868
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Apr 2026 15:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C2210E32B;
	Tue, 28 Apr 2026 15:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pd5rgNeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB09610E32B
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Apr 2026 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777389485; x=1808925485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G5jYe2Ro6yI72cEA7e8A3BYucfWE+49wWIUVMxyffVQ=;
 b=Pd5rgNeYTwuQHVQoycBLXQVO0iR4xR7C3JJfj5TkLSFeWq1vXlgmadQ3
 ifMqwgfdwtxUDmJonhs9M2rjCZGeJ74jy6tM1m63oCJrEAFAQJHF+DnyP
 aj2rhUPg3hz1AsdgnWxEeKJhye+z2NodmdUhtknjEQNGjEfOxfJvVZHGi
 j7iu5ft3y9yjl86j5R3YJ7r3+1PCI5DWRB7jqrmXL9x9C96/Cn8fsBOso
 rE9GOim+nQfZ+jx+nbsJWF2c9OkaXETRKYzm1MZaRutDDEr9Bmg9rlLAL
 tLQ/QmJg0RmYtF5MuQgc2vorFYPBPXj30IxiAuJCa1Yoj4nGG02C7hOi5 g==;
X-CSE-ConnectionGUID: pRo3Oh2KQ6KguhjGV2vSFg==
X-CSE-MsgGUID: bZtVL3JaRTi0+Rx4vUi7DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89761942"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89761942"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 08:18:04 -0700
X-CSE-ConnectionGUID: ELNJMs58Q4eN7enpR34rLw==
X-CSE-MsgGUID: 19SBxFJzRG6Q9sTks8Qczw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="257302027"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 08:18:02 -0700
Date: Tue, 28 Apr 2026 17:18:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jia Yao <jia.yao@intel.com>
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maciej Plewka <maciej.plewka@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/dg2: Add per-context control for
 Wa_22013059131
Message-ID: <afDPqHOR6FhmfROf@ashyti-mobl2.lan>
References: <20260417050956.1945481-1-jia.yao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417050956.1945481-1-jia.yao@intel.com>
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

On Fri, Apr 17, 2026 at 05:09:56AM +0000, Jia Yao wrote:
> Wa_22013059131 sets FORCE_1_SUB_MESSAGE_PER_FRAGMENT in LSC_CHICKEN_BIT_0
> at engine init, but this is known to cause GPU hangs in certain workloads.
> Add I915_CONTEXT_PARAM_WA_22013059131 so userspace that handles the
> workaround itself (e.g. by limiting SLM size) can set it to 1 to let the
> kernel know bit 15 programming is not needed for that context.
> 
> LSC_CHICKEN_BIT_0 is not context-saved by hardware, so the kernel restores
> the correct value on every context switch via the indirect context
> batchbuffer to avoid leaking state between contexts. The old unconditional
> application of Wa22013059131 in intel_workarounds.c is removed.
> 
> v3:
> - Kernel-internal context will not change workaround settings

Do we have a link of the userspace using this API?

Joonas, do we need also a documentation update here?

Thanks,
Andi

> Bspec: 54833
> Fixes: 645cc0b9d972 ("drm/i915/dg2: Add initial gt/ctx/engine workarounds")
> Cc: stable@vger.kernel.org
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maciej Plewka <maciej.plewka@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
