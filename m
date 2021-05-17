Return-Path: <SRS0=7o8F=KM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6EEC433B4
	for <intel-gfx@archiver.kernel.org>; Mon, 17 May 2021 06:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7034D61241
	for <intel-gfx@archiver.kernel.org>; Mon, 17 May 2021 06:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7034D61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA086E049;
	Mon, 17 May 2021 06:45:59 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BE16E03C;
 Mon, 17 May 2021 06:45:57 +0000 (UTC)
IronPort-SDR: vfm7vzVmoNQ7SPwQp67XoJH2G3uCzCYIusWvGg+V6mNXHG5CA4N9yjquv7Egm/tkBBp3eh+xmG
 GWOV9SL2XsJA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="221428826"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="221428826"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2021 23:45:57 -0700
IronPort-SDR: 2+CGy7NWdzxDdJI4WjmOvSs2E9A5KTxRq+KSdUWdZVlbbh0h5c5ZUCzbZIg/vXcbFMxjKp3Bnh
 h7tB4nGEwOrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="437627308"
Received: from unknown (HELO coxu-arch-shz) ([10.239.160.26])
 by fmsmga008.fm.intel.com with ESMTP; 16 May 2021 23:45:55 -0700
Date: Mon, 17 May 2021 14:45:55 +0800 (CST)
From: Colin Xu <colin.xu@intel.com>
X-X-Sender: coxu_arch@coxu-arch-shz
To: Zhenyu Wang <zhenyuw@linux.intel.com>
In-Reply-To: <20210511083332.1740601-3-zhenyuw@linux.intel.com>
Message-ID: <alpine.LNX.2.22.419.2105171445480.16753@coxu-arch-shz>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-3-zhenyuw@linux.intel.com>
User-Agent: Alpine 2.22 (LNX 419 2020-04-12)
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 2/3] Revert "vfio/gvt: fix DRM_I915_GVT
 dependency on VFIO_MDEV"
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
 Arnd Bergmann <arnd@arndb.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 11 May 2021, Zhenyu Wang wrote:

> This reverts commit adaeb718d46f6b42a3fc1dffd4f946f26b33779a.
>
> As I915_GVT dependency is resolved, revert this temporary hack.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
> drivers/gpu/drm/i915/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 69f57ca9c68d..8f15bfb5faac 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -102,7 +102,7 @@ config DRM_I915_GVT
> 	bool "Enable Intel GVT-g graphics virtualization host support"
> 	depends on DRM_I915
> 	depends on 64BIT
> -	depends on VFIO_MDEV=y || VFIO_MDEV=DRM_I915
> +	depends on VFIO_MDEV
> 	default n
> 	help
> 	  Choose this option if you want to enable Intel GVT-g graphics
> -- 
> 2.31.0
>
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>

Reviewed-by: Colin Xu <colin.xu@intel.com>

--
Best Regards,
Colin Xu
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
