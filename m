Return-Path: <SRS0=eb9m=BW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1B5C433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 20:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4509C20774
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 20:31:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="l2naly2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4509C20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31246E19C;
	Wed, 12 Aug 2020 20:31:44 +0000 (UTC)
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ADB6E19C
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2020 20:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id B94163F515;
 Wed, 12 Aug 2020 22:31:40 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=l2naly2Q; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sj3-F8T7Mjrj; Wed, 12 Aug 2020 22:31:39 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id A521D3F4FC;
 Wed, 12 Aug 2020 22:31:39 +0200 (CEST)
Received: from localhost.localdomain (jfdmzpr03-ext.jf.intel.com
 [134.134.139.72])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 87F61360507;
 Wed, 12 Aug 2020 22:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1597264298; bh=ZgnMTZNhOttAWahWBaBS1RYwIQbFOB+dNxZ5L5JCo6Y=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=l2naly2Qt9wAfY+wpxOncNg1eB5V4yG6mwQtiOpwtuFfYwmHhZlSYCnQCPj59DEv8
 RyMi32TrP83+4Yt1pSUn15pWzGJ4VNFZ6L88PfyVNxoiB2j6WKlFHxCOFV7TSBL9LK
 mioKXt5gneubrd4tEx33GsUUBEqkg8vUrHMMmTXQ=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20200810103103.303818-1-maarten.lankhorst@linux.intel.com>
 <20200810103103.303818-25-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <57bdc835-3c54-f763-c7c5-22819c6f09c4@shipmail.org>
Date: Wed, 12 Aug 2020 22:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810103103.303818-25-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 24/24] drm/i915: Add ww locking to
 pin_to_display_plane
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


On 8/10/20 12:31 PM, Maarten Lankhorst wrote:
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Commit message, please.


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c | 65 ++++++++++++++++------
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  1 +
>   2 files changed, 49 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 8ebceebd11b0..c0d153284984 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -37,6 +37,12 @@ void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj)
>   	i915_gem_object_unlock(obj);
>   }
>   
> +void i915_gem_object_flush_if_display_locked(struct drm_i915_gem_object *obj)
> +{
> +	if (i915_gem_object_is_framebuffer(obj))
> +		__i915_gem_object_flush_for_display(obj);
> +}
> +
>   /**
>    * Moves a single object to the WC read, and possibly write domain.
>    * @obj: object to act on
> @@ -197,18 +203,12 @@ int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
>   	if (ret)
>   		return ret;
>   
> -	ret = i915_gem_object_lock_interruptible(obj, NULL);
> -	if (ret)
> -		return ret;
> -
>   	/* Always invalidate stale cachelines */
>   	if (obj->cache_level != cache_level) {
>   		i915_gem_object_set_cache_coherency(obj, cache_level);
>   		obj->cache_dirty = true;
>   	}
>   
> -	i915_gem_object_unlock(obj);
> -
>   	/* The cache-level will be applied when each vma is rebound. */
>   	return i915_gem_object_unbind(obj,
>   				      I915_GEM_OBJECT_UNBIND_ACTIVE |
> @@ -255,6 +255,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
>   	struct drm_i915_gem_caching *args = data;
>   	struct drm_i915_gem_object *obj;
>   	enum i915_cache_level level;
> +	struct i915_gem_ww_ctx ww;
>   	int ret = 0;
>   
>   	switch (args->caching) {
> @@ -293,7 +294,18 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
>   		goto out;
>   	}
>   
> -	ret = i915_gem_object_set_cache_level(obj, level);
> +	i915_gem_ww_ctx_init(&ww, true);
> +retry:
> +	ret = i915_gem_object_lock(obj, &ww);
> +	if (!ret)
> +		ret = i915_gem_object_set_cache_level(obj, level);
> +
> +	if (ret == -EDEADLK) {
> +		ret = i915_gem_ww_ctx_backoff(&ww);
> +		if (!ret)
> +			goto retry;
> +	}
> +	i915_gem_ww_ctx_fini(&ww);

Why a ww transaction for a single lock?

/Thomas


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
