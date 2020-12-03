Return-Path: <SRS0=sbLu=FH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A216C64E8A
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 11:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B7322201
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Dec 2020 11:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B7322201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0BF6E99A;
	Thu,  3 Dec 2020 11:12:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C696E9B2;
 Thu,  3 Dec 2020 11:12:31 +0000 (UTC)
IronPort-SDR: d3kR/iBznKKHcQFLU0B6WimG/5TnMUBDkUGFzztT6F/XmMS4R+Ir3fr+RHfvQaTekOQ0sSQosQ
 lEX9CnRcDdDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="191405402"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="191405402"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 03:12:31 -0800
IronPort-SDR: gfY19NmtkxHDKSG4JVnhmnvQWWEwwwE4BKcTynSEGMQ4YCIeMCgbsqio2Oc+fj5qz7BRs9OkxQ
 sjKua80N/W6Q==
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="550445583"
Received: from pjfraser-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.11.14])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 03:12:27 -0800
Date: Thu, 3 Dec 2020 13:12:24 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <X8jH5D//XHDsXKtQ@intel.intel>
References: <X8ilneOcJAjwqU4t@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X8ilneOcJAjwqU4t@mwanda>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Check the correct variable
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
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dan,

> There is a copy and paste bug in this code.  It's supposed to check
> "obj2" instead of checking "obj" a second time.
> 
> Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index 23a6132c5f4e..412e21604a05 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
>  		return PTR_ERR(obj);
>  
>  	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -	if (IS_ERR(obj)) {
> -		err = PTR_ERR(obj);
> +	if (IS_ERR(obj2)) {
> +		err = PTR_ERR(obj2);

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
