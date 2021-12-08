Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15775C433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Dec 2021 15:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C206E8A9;
	Wed,  8 Dec 2021 15:23:33 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8321F6E868;
 Wed,  8 Dec 2021 15:23:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="225107100"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="225107100"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 07:23:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="679916734"
Received: from faerberc-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.209.148])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 07:23:30 -0800
Date: Wed, 8 Dec 2021 17:23:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <YbDN7pb6WUIWselA@intel.intel>
References: <20211208145800.27246-1-ramalingam.c@intel.com>
 <20211208145800.27246-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208145800.27246-3-ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Sanitycheck device iomem on
 probe
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Ram,

> +static int intel_memory_region_memtest(struct intel_memory_region *mem,
> +				       void *caller)
> +{
> +	struct drm_i915_private *i915 = mem->i915;
> +	int err = 0;
> +
> +	if (!mem->io_start)
> +		return 0;
> +
> +	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> +		err = iomemtest(mem, caller);

I don't understand the debugging part of the iomemtest, if memory
is failing we wouldn't relise if DEBUG_GEM is not enabled.

In any case,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
