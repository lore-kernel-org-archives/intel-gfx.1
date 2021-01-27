Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACB9C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 12:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D114420781
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 12:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D114420781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327C26E7D1;
	Wed, 27 Jan 2021 12:53:11 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16F6E7D1;
 Wed, 27 Jan 2021 12:53:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23714177-1500050 for multiple; Wed, 27 Jan 2021 12:52:53 +0000
MIME-Version: 1.0
In-Reply-To: <20210127124135.11750-2-tzimmermann@suse.de>
References: <20210127124135.11750-1-tzimmermann@suse.de>
 <20210127124135.11750-2-tzimmermann@suse.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com
Date: Wed, 27 Jan 2021 12:52:55 +0000
Message-ID: <161175197533.2943.2162038120755672032@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v5 1/5] drm/i915: Remove references to
 struct drm_device.pdev
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Thomas Zimmermann (2021-01-27 12:41:31)
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 0188f877cab2..2a07a008de2e 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -146,7 +146,6 @@ struct drm_i915_private *mock_gem_device(void)
>         }
>  
>         pci_set_drvdata(pdev, i915);
> -       i915->drm.pdev = pdev;

Strictly this removal is still too early. Though it's a mock device and
we shouldn't be touching the pci_dev that often, semantically those
accesses are not removed until later.

>  
>         dev_pm_domain_set(&pdev->dev, &pm_domain);
>         pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> index 7270fc8ca801..5c7ae40bba63 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> @@ -74,7 +74,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
>         ppgtt->vm.i915 = i915;
>         ppgtt->vm.total = round_down(U64_MAX, PAGE_SIZE);
>         ppgtt->vm.file = ERR_PTR(-ENODEV);
> -       ppgtt->vm.dma = &i915->drm.pdev->dev;
> +       ppgtt->vm.dma = i915->drm.dev;

We can remove this shorthand later.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
