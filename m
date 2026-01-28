Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43EED3F083
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jan 2026 16:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C4210E12C;
	Wed, 28 Jan 2026 16:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N85VWZYC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE3510E12C
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jan 2026 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769619409; x=1801155409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OJ3DHRokHGAcrhvMuXmcDAZpACOL/+JnPcbI0C0bVKk=;
 b=N85VWZYCXbkv9s5Z7Q6eN2TU/Q12F4YJ1jVVtNUrvsO7hz3/vEs/Gdcn
 lZVtPehiGNMJ+PhVAiIYhAdQfOef84bMMmNm8EcHWiphowIcb6FTV4Smi
 P/HKmTWmw082xmZaL5gnocGPAkkT37fg92GqBLXpNi5rtIK3HyL8uR9Ha
 N57rYsOu2Zo6BIvU0Uen41nHDeRPU+yFoIxiLDmD8pqMmjxXj4HkmcHUQ
 Zdn5o3nfOWq8V+rc/YONlruu9qhmCT2nph6zwyQvWta30PkW2AGiIs5o9
 A8E4KUGDqO2uCk69v7jIeD7shWFTdBkgAX/VyDH4ptzXWlzzAAVdWxmuT g==;
X-CSE-ConnectionGUID: 5ohKC5ccRaGhnX5Ye/S4wQ==
X-CSE-MsgGUID: BFRauc7ZTriB/WlK8RIFAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88413919"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="88413919"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:56:28 -0800
X-CSE-ConnectionGUID: B6TKFT0LT7CpufsQ4OVIrQ==
X-CSE-MsgGUID: Y1TlePqWSZ2/Ajt2j9DkhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207927265"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:56:26 -0800
Date: Wed, 28 Jan 2026 17:56:23 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Add vgpu.entry list initialization
Message-ID: <aXo_t0nqu-TMow4-@ashyti-mobl2.lan>
References: <7updbd6x7fmw4g3tdf3r27xblf4www7xxsxyrncc35jokiuxvr@rflx6oxm5au5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7updbd6x7fmw4g3tdf3r27xblf4www7xxsxyrncc35jokiuxvr@rflx6oxm5au5>
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

nice catch, but the fix looks a bit messy to me.

...

> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
> index d29a06ea51a5..362282b20f7b 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -67,6 +67,7 @@ void intel_vgpu_detect(struct drm_i915_private *dev_priv)
>  	u64 magic;
>  	u16 version_major;
>  	void __iomem *shared_area;
> +	INIT_LIST_HEAD(&dev_priv->vgpu.entry);

Despite what Sebastian is suggesting, I think the place is right
(or almost right).

But I wouldn't fix it this way. Initializing virtual GPUs is not
mandatory, indeed it fails only during delete that is the only
function that doesn't check whether the list is initialized.

I would rather check whether the list is initialized before
trying to delete it, with a nice comment saying that the list
might not have been initialized and we want to avoid accessing an
invalid list.

Andi

>  	BUILD_BUG_ON(sizeof(struct vgt_if) != VGT_PVINFO_SIZE);
>  
> -- 
> 2.43.0
> 
> 
> -- 
> Best Regards,
> Krzysztof
