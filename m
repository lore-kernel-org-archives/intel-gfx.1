Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E823D74EDC
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Jan 2026 15:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4ED10EB16;
	Fri, 23 Jan 2026 15:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgD2HUtM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003BD10EB16
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Jan 2026 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769181002; x=1800717002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LNtZ1Qf6tIJe75+LbTNEti1ULJVvR4N4RHtOBr5SMKc=;
 b=KgD2HUtMTvc2NbiIqVvG0LT76VtyWCcGFpNl3OKlazRnltP0AjSFLEcI
 GIvdsligwq1/WczxZ4kDpn26hE/oiskn8qOsmD1lJc1bHKVn1Ul03jWsl
 UDeWSJwiRHmqvwNEMw/ZUMDu+RevtQj6JOnp2dpLtCmIxvxYMuDElY/kU
 DSdprVYLFXR2mg+eHUYZlUoC4NfCvBWPRxJ2QXrZbMCmsmNkDcpq4uubr
 g6b1VY//jO6ey/4Ed+0pNnZ8aHfk41kljpcD9aJNMcKBs8fC5+qjKLTYb
 WDuVKUcerGJ+KAuD59tDAdR2Zp7x5+JNRPBgJbRdR1NnweMxpxJ/40tyJ g==;
X-CSE-ConnectionGUID: BUVLAjJ8Qqukm14bjW5aVg==
X-CSE-MsgGUID: bknT9tSbTFiBVzo1fvkYsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69454391"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="69454391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 07:10:02 -0800
X-CSE-ConnectionGUID: rYQnmOa0TlyyCfLxH52G/w==
X-CSE-MsgGUID: GUMY+p09SC2qgFY8wLeaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="238295466"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 07:10:00 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH] drm/i915: Add vgpu.entry list initialization
Date: Fri, 23 Jan 2026 16:09:57 +0100
Message-ID: <117947272.nniJfEyVGO@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7updbd6x7fmw4g3tdf3r27xblf4www7xxsxyrncc35jokiuxvr@rflx6oxm5au5>
References: <7updbd6x7fmw4g3tdf3r27xblf4www7xxsxyrncc35jokiuxvr@rflx6oxm5au5>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Friday, 23 January 2026 11:11:30 CET Krzysztof Karas wrote:
> It was observed that during fault injection testing the
> vgpu.entry remains uninitialized when taking the error path,
> which results in warnings [1]:
> 
> <6> [491.828427] list_del corruption, ffff88812cd2d0c8->next is NULL
> <4> [491.828430] WARNING: lib/list_debug.c:52 at
>  __list_del_entry_valid_or_report+0x6f/0x120, CPU#2: i915_module_loa/2921
> 
> Add initialization step to intel_vgpu_detect().

I do second Sebastian's comment on that.

> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> 
> Example of failure from intel-gfx-ci:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8711/shard-dg2-5/igt@i915_module_load@fault-injection.html#dmesg-warnings385

Is there an issue focused on that problem open on our Gitlab?  If yes then I 
think it's better to provide a link it instead.  The report you refer to may 
disappear soon.  And, a stable link should be better added with a Link: or 
even Closes: tag instead of here.

> 
>  drivers/gpu/drm/i915/i915_vgpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
> index d29a06ea51a5..362282b20f7b 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -67,6 +67,7 @@ void intel_vgpu_detect(struct drm_i915_private *dev_priv)
>  	u64 magic;
>  	u16 version_major;
>  	void __iomem *shared_area;
> +	INIT_LIST_HEAD(&dev_priv->vgpu.entry);

In addition to what Sebastian already stated, please avoid placing executable 
statements in declaration sections.

Thanks,
Janusz

>  
>  	BUILD_BUG_ON(sizeof(struct vgt_if) != VGT_PVINFO_SIZE);
>  
> 




