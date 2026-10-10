Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F939CA6017
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Oct 2026 03:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FA510E21D;
	Sat, 10 Oct 2026 03:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ObnZ8otk";
	dkim-atps=neutral
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF210E7C7
 for <intel-gfx@lists.freedesktop.org>; Sat, 10 Oct 2026 03:59:12 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-cc7cc8aafe6so112577a12.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 09 Oct 2026 20:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791604752; x=1792209552; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=C2sBX9RzAUijwlycitpdPIp/C+J3gojjvyNQwGnJMzc=;
 b=ObnZ8otkq2GwFSt6w7l2V11CMtX1Vw6EwC6WCVGZngv8bYTzj3erF7WwzEWvRkNKzm
 XwS34rvY5Wpgmmo9QqLwgXEUr1qxnby7ZatdhFlgeoIn39tNyMARu8RuA0iqLb2frNqx
 pXL+Y/df/DrvgsC+jvAkb5k+aIDWqy9wmyqKm9a7Emhm+Xpe4GIsygvDCgidEQ8TkNHY
 1gxodycCv/CAQah5oKjbDZxSq+QJMBf4Qe5qH1KU9xEPUUyj2f7EGkO9mMByV2edsUbc
 IGqCgRFCyzwAlFXcda/L1wS5hrCcpj101jISNdrXByQ//8L/9WdjtehyGtn1wGQ9X5WZ
 QTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791604752; x=1792209552;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C2sBX9RzAUijwlycitpdPIp/C+J3gojjvyNQwGnJMzc=;
 b=WvRn68YEM3nnKvQSqQIDr2UsOeAgu+TEJdF5sotMFiDerOqCON0QY/ShrHGcj7K2o8
 iOJdg77M7ZW9h+Vy6D7RnzIe3OZ53MgkISuBFNna3YgKSL3ARFPHTgte/E3dZ/16NTBa
 4FOT66R3IjDgg8i2QKIo5yj3NT5uHSXPJ37eFXukf7PbQaPzBvHfd4mLSnQTqqCd1xS+
 aiAoehe7zwSjh0vTeZ4we+flr0iD5KKyxFZ8DcUWnvEDuLA01zoybqFz2WtI2y5zU0rJ
 bnAkkLZ2k/DD2vM6sC/XvAQqEccL/zWO3D9UC44Y86+KF4TrMimJJ1eb3lrRLKbh0tUF
 gBAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwyG239KeOsd0+HkKCNXgspT3RPsXoXhcZCQjJUKXaUET1RJPp7XzpE0XVDTW0AE0+0Laz5l5fbcz4=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIUgSgmtVtb1+kkuvZDaY6+jlNVLyiigIM+YO1JGCFiYHGuXwFG
 +sGuXwiqNzuokcKI9FEs5WHn1uwAYeMZNp5rZMpGsEsKzB3d5ECbCtK7
X-Gm-Gg: AYBFou0S/4P1f4pnxJl+r/MA7xhHVVrvacb/PrRWYxTW6HhbKAzwzq/7MRllAZachSb
 BT9E5i+px2kP/ZhAK0R52eYLxO0oG54KYqc+DPCJJ5KXWwqS6FX6Ixpe9bf2KJcMxe6YrKJK8XV
 kuI1BO4+4bbVeDr5Xsnzj8ytCZIpY22FrHq6Et00eg3j4O3VIGwuTSxLe3rQWAvKgy9VCAQWF0Y
 eHzydpXjzk46IYv0KcVYS/wzI4Vt3rV9jetdXIvELGi8bX9cKGWWX4m2g+VCQzaC/T7yuBa2WZi
 WAMDvJbsNUHtCZ9s549x3bFc/ggqH9wEWQ9ULmjBkTCcTBlOXawpC20RHl1lkB6594uPx9jz63g
 1VD4UWAwlZQ6XJClbcpJi7Qo0P96IBjp82uZxqX2pre1ywdgvENethPEQf+2lWO0anomVHe94z4
 T44A8a2S5HRW3Ws0p7C1PlBM0+/f1ShvKPen01+9UYQmvkVU1fNvNk3nmIX7Ur6e4Cbsnq3xVrZ
 mlqgCRgPNGFOTj+u3AwF8LmqyfuwEacVg==
X-Received: by 2002:a17:90b:134c:b0:3a0:cbe2:9e0c with SMTP id
 98e67ed59e1d1-3ab3b0285d5mr2844887a91.63.1791604752082; 
 Fri, 09 Oct 2026 20:59:12 -0700 (PDT)
Received: from localhost (softbank126159121187.bbtec.net. [126.159.121.187])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ab338676besm3793206a91.1.2026.10.09.20.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 20:59:11 -0700 (PDT)
Date: Sat, 10 Oct 2026 12:59:09 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, zhiw@nvidia.com
Subject: Re: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is
 still in use
Message-ID: <asm4DV84UitLCbve@dell-wzy>
References: <20261004212403.208681-1-oss.patchbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004212403.208681-1-oss.patchbox@gmail.com>
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

On Sun, Oct 04, 2026 at 05:22:39PM -0400, Yuho Choi wrote:
> intel_gvt_dma_map_guest_page() unmaps and frees the cache entry of a
> gfn when it is requested with a different size, and maps the page again.
> The entry is still referenced: shadow GTT entries and dma-bufs keep
> using its DMA address after the page is unpinned and the DMA mapping is
> torn down.

I don't think this is *real*, as code would simply destroy entry in
that case, and there won't be on-the-fly dma operation on that, as
guest mem setup is totally before execlist submission, if guest driver
changed mapping by ignoring gvt emulated execlist status, that's just bad...

> When the new mapping gets the same DMA address, their later
> intel_gvt_dma_unmap_guest_page() calls also drop the references of the
> new entry.
> 
> Keep the existing entry instead. A 2M mapping covers a 4K request for
> its first page, so take a reference on it. If the entry is smaller than
> the request, fail and let the caller split the 2M entry into 4K pages,
> as it already does when a 2M mapping cannot be set up.
>

So this change would always force 2M to split into 4K? why?

> Fixes: 7366aeb77cd8 ("drm/i915/gvt: fix incorrect cache entry for guest page mapping")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Compile-tested only (x86_64 defconfig + DRM_I915_GVT_KVMGT, W=1, sparse).
> 
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index ec62db5cc3675..9a3e305253469 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1626,19 +1626,15 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>  		ret = __gvt_cache_add(vgpu, gfn, *dma_addr, size);
>  		if (ret)
>  			goto err_unmap;
> -	} else if (entry->size != size) {
> -		/* the same gfn with different size: unmap and re-map */
> -		gvt_dma_unmap_page(vgpu, gfn, entry->dma_addr, entry->size);
> -		__gvt_cache_remove_entry(vgpu, entry);
> -
> -		ret = gvt_dma_map_page(vgpu, gfn, dma_addr, size);
> -		if (ret)
> -			goto err_unlock;
> -
> -		ret = __gvt_cache_add(vgpu, gfn, *dma_addr, size);
> -		if (ret)
> -			goto err_unmap;
> +	} else if (entry->size < size) {
> +		/*
> +		 * The smaller mapping may still be in use, so don't replace
> +		 * it. Fail and let the caller map the range in smaller pages.
> +		 */
> +		ret = -EBUSY;
> +		goto err_unlock;
>  	} else {
> +		/* A mapping of the same or a larger size covers the request */
>  		kref_get(&entry->ref);
>  		*dma_addr = entry->dma_addr;
>  	}
> 
> base-commit: 7704c4c5bb127673b4f0ead839919db573559e38
> -- 
> 2.43.0
