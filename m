Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC0FC4742C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 14:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B1B23A32
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 14:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B1B23A32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54CC89E0E;
	Mon, 16 Nov 2020 14:53:21 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2E289DFC;
 Mon, 16 Nov 2020 14:53:20 +0000 (UTC)
IronPort-SDR: iXRAgd8R1jeU+m7Jg/R+XERqj2slkdiiwdfXYlcFe31R0pYNx8wpBLkcsmoG0LHpptfY/lNsAk
 dZBWLQA/lE1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="170926019"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="170926019"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 06:53:19 -0800
IronPort-SDR: Gl1rcPRxJ+XvwYI+vs58iyVeLI50eMw7cWM6RqAbTgOk2ZMfsvTM8BgXSbAaemBonUdp9xp4C0
 nj3l8uy5+C0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="329699657"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga006.jf.intel.com with ESMTP; 16 Nov 2020 06:53:17 -0800
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id ECFE75C2038; Mon, 16 Nov 2020 16:51:19 +0200 (EET)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>, zhangxiaoxu5@huawei.com,
 chris@chris-wilson.co.uk, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20201116144112.3673011-1-zhangxiaoxu5@huawei.com>
References: <20201116144112.3673011-1-zhangxiaoxu5@huawei.com>
Date: Mon, 16 Nov 2020 16:51:19 +0200
Message-ID: <87v9e5mk2g.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Fix wrong return value
 of perf_series_engines()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Zhang Xiaoxu <zhangxiaoxu5@huawei.com> writes:

> If intel context create failed, the perf_series_engines() will return 0
> rather than error, because we doesn't initialize the return value.
>
> Fixes: cbfd3a0c5a55 ("drm/i915/selftests: Add request throughput measurement to perf")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/selftests/i915_request.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 6b512fc13ca7..e424a6d1a68c 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -2469,8 +2469,10 @@ static int perf_series_engines(void *arg)
>  		struct intel_context *ce;
>  
>  		ce = intel_context_create(engine);
> -		if (IS_ERR(ce))
> +		if (IS_ERR(ce)) {
> +			err = PTR_ERR(ce);
>  			goto out;
> +		}
>  
>  		err = intel_context_pin(ce);
>  		if (err) {
> -- 
> 2.25.4
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
