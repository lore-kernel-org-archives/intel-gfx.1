Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB4AFF885A
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Apr 2026 15:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBC510E110;
	Tue, 28 Apr 2026 15:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m70Vdp7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877FE10EC2A
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Apr 2026 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777389039; x=1808925039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e5Aia3lapZCgq06YmkguDvKlMUCzM00XkmsLRADP1b4=;
 b=m70Vdp7/pDSucpYieLv088nxykEU3pbvTshchaE631cK7VfxiIaIGzfM
 b0O3Ic3kGGiCqpGpWMdg+DVO4R1b4lnup/T6C+ybBV2vi+++KuKXHaId/
 vIxQJ26MFDZXgf6e2EjFH371SqmsLPyuh7BDO3rZod/N2ZQuYWBFmVowJ
 42W5sfSD+DxABQDcjn8Lh6PMQkzjhAZpqvk5B+avsmbGMKUjrE4v0gzCG
 1PKBoHlGXQaa+P2Bncda7bOURMcST/ooWSpaScapjsj/BFNZl/H7WfCrn
 OO6JY3y82wZUQygdcwgf1qWD+YhSMPym/CI1W3pJRA/zjtV/PuJCkrB7z w==;
X-CSE-ConnectionGUID: 1JCZuI6rRvWVVLgID7QZrQ==
X-CSE-MsgGUID: nKXPHwHKSbar9Fe6hxqugw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="100956937"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="100956937"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 08:10:39 -0700
X-CSE-ConnectionGUID: 7PjhBtMuTKOXhlbiVK1IvA==
X-CSE-MsgGUID: o6TJOrI2RcyL8j2rfIAfYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="235737806"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 08:10:37 -0700
Date: Tue, 28 Apr 2026 17:10:35 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915: skip __i915_request_skip() for already
 signaled requests
Message-ID: <afDN6xd-WoqNXQU-@ashyti-mobl2.lan>
References: <fe76921d35b6ae85aa651822726d0d9815aa5362.1776339012.git.sebastian.brzezinka@intel.com>
 <yoap6axokl3wt2cirb76uugga76ligklznoubcq7p4tgr3gkh7@4tpiryb7u7y4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yoap6axokl3wt2cirb76uugga76ligklznoubcq7p4tgr3gkh7@4tpiryb7u7y4>
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

On Mon, Apr 20, 2026 at 09:18:03AM +0000, Krzysztof Karas wrote:
> On 2026-04-16 at 13:31:18 +0200, Sebastian Brzezinka wrote:
> > After a GPU reset the HWSP is zeroed, so previously completed
> > requests appear incomplete. If such a request is picked up during
> > reset_rewind() and marked guilty, i915_request_set_error_once()
> > returns early (fence already signaled), leaving fence.error without
> > a fatal error code. The subsequent __i915_request_skip() then hits:
> > ```
> > GEM_BUG_ON(!fatal_error(rq->fence.error))
> > ```
> > 
> > Fixes a kernel BUG observed on Sandy Bridge (Gen6) during
> By "Fixes" do you mean this patch? Or are you referring to the
> tag "Fixes:" below? If former would be the case, then imperative
> form might be better: Fix.

Pour parler: the imperative is used in the last paragraph:
"Guard" :-)

> 
> In any case the patch looks sane:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> 
> > heartbeat-triggered engine resets.
> > ```
> > kernel BUG at drivers/gpu/drm/i915/i915_request.c:556!
> > RIP: __i915_request_skip+0x15e/0x1d0 [i915]
> > ...
> > __i915_request_reset+0x212/0xa70 [i915]
> > reset_rewind+0xe4/0x280 [i915]
> > intel_gt_reset+0x30d/0x5b0 [i915]
> > heartbeat+0x516/0x530 [i915]
> > ```
> > 
> > Guard __i915_request_skip() with i915_request_signaled(), if the
> > fence is already signaled, the ring content is committed and there
> > is nothing left to skip.
> > 
> > Cc: stable@vger.kernel.org
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/13729
> > Fixes: 36e191f0644b ("drm/i915: Apply i915_request_skip() on submission")
> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
