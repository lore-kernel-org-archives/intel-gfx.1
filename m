Return-Path: <SRS0=eaB6=PN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5399AC433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 15:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE0460F92
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 15:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DE0460F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E46D89F89;
	Mon, 25 Oct 2021 15:44:29 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C1589F89;
 Mon, 25 Oct 2021 15:44:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="229541446"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="229541446"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 08:42:38 -0700
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="446684809"
Received: from dscaswel-mobl2.ger.corp.intel.com (HELO [10.213.242.254])
 ([10.213.242.254])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 08:42:29 -0700
To: Wan Jiabing <wanjiabing@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net
References: <20211025113316.24424-1-wanjiabing@vivo.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <58331d3d-c3e3-0e82-eb7a-469c6e72d7a7@intel.com>
Date: Mon, 25 Oct 2021 16:42:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211025113316.24424-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use ERR_CAST instead of
 ERR_PTR(PTR_ERR())
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

On 25/10/2021 12:32, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3117:15-22: WARNING:
> ERR_CAST can be used with eb->requests[i].
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Pushed to drm-intel-gt-next. Thanks.

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 4d7da07442f2..eb2dcaf78d08 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3114,7 +3114,7 @@ eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
>   		/* Allocate a request for this batch buffer nice and early. */
>   		eb->requests[i] = i915_request_create(eb_find_context(eb, i));
>   		if (IS_ERR(eb->requests[i])) {
> -			out_fence = ERR_PTR(PTR_ERR(eb->requests[i]));
> +			out_fence = ERR_CAST(eb->requests[i]);
>   			eb->requests[i] = NULL;
>   			return out_fence;
>   		}
> 
