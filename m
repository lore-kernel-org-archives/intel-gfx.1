Return-Path: <SRS0=GdbL=FM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BCEC433FE
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 13:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81AE423AA9
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 13:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81AE423AA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E9E89E65;
	Tue,  8 Dec 2020 13:49:50 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33C389E65
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Dec 2020 13:49:49 +0000 (UTC)
IronPort-SDR: 7wpE8puwlyH37P7hIy60VqDK4gQUEXoWrCj2h8utH0xK8p6hahQCUSnngU0ZGa7GOMZMf266Uu
 INTVYLB8qa/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="160938115"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="160938115"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 05:49:48 -0800
IronPort-SDR: PVUAar3+nnlEuC6rXC/0QGdC0+3ICOXRsh5En+SB2dUza1tFJlb79Zr5DP+EfHSx7uhhnUDxg7
 bFgloPa1kqIQ==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="407624594"
Received: from basm-mobl1.gar.corp.intel.com (HELO [10.252.54.35])
 ([10.252.54.35])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 05:49:48 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201207193824.18114-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9a0ffb3a-616e-0eb0-eed5-42f1e97f527b@linux.intel.com>
Date: Tue, 8 Dec 2020 13:49:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207193824.18114-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 01/20] drm/i915/gem: Drop false
 !i915_vma_is_closed assertion
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 07/12/2020 19:38, Chris Wilson wrote:
> Closed vma are protected by the GT wakeref held as we lookup the vma, so
> we know that the vma will not be freed as we process it for the execbuf.
> Instead we expect to catch the closed status of the context, and simply
> allow the close-race on an individual vma to be washed away.
> 
> Longer term, the GT wakeref protection will be removed by explicit
> vma.kref tracking.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2245
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index b07dc1156a0e..193996144c84 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -534,8 +534,6 @@ eb_add_vma(struct i915_execbuffer *eb,
>   	struct drm_i915_gem_exec_object2 *entry = &eb->exec[i];
>   	struct eb_vma *ev = &eb->vma[i];
>   
> -	GEM_BUG_ON(i915_vma_is_closed(vma));
> -
>   	ev->vma = vma;
>   	ev->exec = entry;
>   	ev->flags = entry->flags;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
