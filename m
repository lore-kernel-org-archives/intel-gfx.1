Return-Path: <SRS0=HG+d=D2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F18C433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 07:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DCCB205CB
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2020 07:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="mdmi7M1X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DCCB205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530BD6E8DB;
	Mon, 19 Oct 2020 07:02:49 +0000 (UTC)
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0886E8DA
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2020 07:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id EC63D3F565;
 Mon, 19 Oct 2020 09:02:45 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=mdmi7M1X; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fmv8odt3Rp_f; Mon, 19 Oct 2020 09:02:44 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 2D5E73F3F4;
 Mon, 19 Oct 2020 09:02:42 +0200 (CEST)
Received: from CitrixDT-070.SSPE.ch.intel.com (jfdmzpr06-ext.jf.intel.com
 [134.134.137.75])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 68ED4360C00;
 Mon, 19 Oct 2020 09:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1603090962; bh=WhCzXju63MdkDoCz2dgS44afCBAKyi9ofW3jDSq5yYk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mdmi7M1XyyFvLxBPsJNShM9dvQK6bD+6kiEQT9epiW4Gj9uGwt5I/N6CR68PGZAaO
 ywW1Ez7RT/raaZxQpOvyAlWavnDQbDb5BPKJsJtz9i24HHooLhWSg6jKGLgDxhggGv
 qj6lAri1iGPgwE2rHbWeI6xrsFb6Th+hU3Gp92Tw=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201016104444.1492028-1-maarten.lankhorst@linux.intel.com>
 <20201016104444.1492028-62-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <31f34a31-de86-90ff-1cb5-10f64bcf56a8@shipmail.org>
Date: Mon, 19 Oct 2020 09:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016104444.1492028-62-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 61/61] drm/i915: Keep userpointer
 bindings if seqcount is unchanged, v2.
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 10/16/20 12:44 PM, Maarten Lankhorst wrote:
> Instead of force unbinding and rebinding every time, we try to check
> if our notifier seqcount is still correct when pages are bound. This
> way we only rebind userptr when we need to, and prevent stalls.
>
> Changes since v1:
> - Missing mutex_unlock, reported by kbuild.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 27 ++++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index 8f05b6d90d54..b3fd5eecf0a1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -268,12 +268,33 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
>   	if (ret)
>   		return ret;
>   
> -	/* Make sure userptr is unbound for next attempt, so we don't use stale pages. */
> -	ret = i915_gem_object_userptr_unbind(obj, false);
> +	/* optimistically try to preserve current pages while unlocked */
> +	if (i915_gem_object_has_pages(obj) &&
> +	    !mmu_interval_check_retry(&obj->userptr.notifier,
> +				      obj->userptr.notifier_seq)) {
> +		spin_lock(&i915->mm.notifier_lock);
> +		if (obj->userptr.pvec &&
> +		    !mmu_interval_read_retry(&obj->userptr.notifier,
> +					     obj->userptr.notifier_seq)) {

In theory, although extremely unlikely, on 32-bit the internal seqno may 
wrap giving a false negative above, That could be remedied by clearing 
obj->userptr.notifier_seq in the notifier. (Even seqnos will always be 
considered invalid).

> +			obj->userptr.page_ref++;
> +
> +			/* We can keep using the current binding, this is the fastpath */
> +			ret = 1;
> +		}
> +		spin_unlock(&i915->mm.notifier_lock);
> +	}
> +
> +	if (!ret) {
> +		/* Make sure userptr is unbound for next attempt, so we don't use stale pages. */
> +		ret = i915_gem_object_userptr_unbind(obj, false);
> +	}
>   	i915_gem_object_unlock(obj);
> -	if (ret)
> +	if (ret < 0)
>   		return ret;
>   
> +	if (ret > 0)
> +		return 0;
> +
>   	notifier_seq = mmu_interval_read_begin(&obj->userptr.notifier);

This function will sleep until the core is done with the last 
invalidation, during which time all validation checks above will return 
false. We should place this call before any other checks in the function.

Furthermore the sleep is uninterruptible. We probably need a core change 
to get this right.

>   
>   	pvec = kvmalloc_array(num_pages, sizeof(struct page *), GFP_KERNEL);
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
