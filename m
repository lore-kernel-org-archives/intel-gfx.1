Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE94C433E7
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 17:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA4420838
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 17:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="LZUaLWPD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA4420838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287026E0F8;
	Mon, 12 Oct 2020 17:05:17 +0000 (UTC)
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AE56E4A2
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2020 17:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 1C1E93F516;
 Mon, 12 Oct 2020 19:05:13 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=LZUaLWPD; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElirmlYyfL26; Mon, 12 Oct 2020 19:05:12 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id A084C3F429;
 Mon, 12 Oct 2020 19:05:10 +0200 (CEST)
Received: from CitrixDT-070.SSPE.ch.intel.com (unknown [134.134.137.77])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 32899361CA4;
 Mon, 12 Oct 2020 19:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1602522310; bh=fD3PEsfA9UTUkn1eyuFXFwki/WjM9jIa7uz6mZwzqOE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=LZUaLWPDn/4RjTZpzkBfKB7zRG6TMbXMTBaZqlc8RS0oTGv1r4ewWXTUmsPN65hgQ
 r4/+QiaBkmMyQns9FjTA9qNZzeFTW16RovWmej6ZL8kLoXQXhzQn0mX4p8jg3OxIai
 8uRgZgyNlvmx9V/FEBCs1HJZg09qqfYZgAiOydbw=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201012144706.555345-1-maarten.lankhorst@linux.intel.com>
 <20201012144706.555345-15-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <dafc6638-a68c-8867-e018-d3e4412d6944@shipmail.org>
Date: Mon, 12 Oct 2020 19:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201012144706.555345-15-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2 14/61] drm/i915: Fix userptr so we do not
 have to worry about obj->mm.lock, v2.
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


On 10/12/20 4:46 PM, Maarten Lankhorst wrote:
> Instead of doing what we do currently, which will never work with
> PROVE_LOCKING, do the same as AMD does, and something similar to
> relocation slowpath. When all locks are dropped, we acquire the
> pages for pinning. When the locks are taken, we transfer those
> pages in .get_pages() to the bo. As a final check before installing
> the fences, we ensure that the mmu notifier was not called; if it is,
> we return -EAGAIN to userspace to signal it has to start over.
>
> Changes since v1:
> - Unbinding is done in submit_init only. submit_begin() removed.

Perhaps an early check for invalidation instead of submit_init?

> - MMU_NOTFIER -> MMU_NOTIFIER
>

...

> -		ret = i915_gem_object_unbind(obj,
> -					     I915_GEM_OBJECT_UNBIND_ACTIVE |
> -					     I915_GEM_OBJECT_UNBIND_BARRIER);
> -		if (ret == 0)
> -			ret = __i915_gem_object_put_pages(obj);
> -		i915_gem_object_put(obj);
> -		if (ret)
> -			return ret;
> +	mutex_lock(&i915->mm.notifier_lock);
>   
> -		spin_lock(&mn->lock);
> +	mmu_interval_set_seq(mni, cur_seq);
>   
> -		/*
> -		 * As we do not (yet) protect the mmu from concurrent insertion
> -		 * over this range, there is no guarantee that this search will
> -		 * terminate given a pathologic workload.
> -		 */
> -		it = interval_tree_iter_first(&mn->objects, range->start, end);
> -	}
> -	spin_unlock(&mn->lock);
> +	mutex_unlock(&i915->mm.notifier_lock);
>   

Could we perhaps make use of the fact that we attach the fence before 
checking for invalidation and thus ditch the per mm mm.notifier_lock 
completely, that is

execbuf:

attach_fence();
smp_mb();
check_seqno_for_invalidation();

notifier:

set_seqno_for_invalidation();
smp_mb();
wait_for_fence().

The other stuff protected by that lock appears to be per object only and 
could be kept under a per object spinlock or perhaps mutex. 
obj->userptr.lock?

/Thomas


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
