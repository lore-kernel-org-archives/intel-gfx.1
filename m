Return-Path: <SRS0=GdbL=FM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79387C433FE
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 11:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0458623A9B
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 11:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0458623A9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAAE6E0C4;
	Tue,  8 Dec 2020 11:56:39 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E99F6E0C4;
 Tue,  8 Dec 2020 11:56:38 +0000 (UTC)
IronPort-SDR: 836kIYqGw8PGS74lExpUtT5/Q26bWXW11umzYtn8eRD/doUQtzqizLstkJOffHdC9fdehqmUVA
 gde5/AWs8wxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="170366770"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="170366770"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 03:56:38 -0800
IronPort-SDR: mCRvMYaNT1JG5X6l6JmM3r542frTcI7sc2WiYgqBf3duTOlsLd7tVVXCSV5P4ah9Ya7+ntqF5f
 emU4JiZT7GYw==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="437349376"
Received: from sgarry-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.87.216])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 03:56:36 -0800
Date: Tue, 8 Dec 2020 13:56:33 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <X89p8cxixzgFd8tn@intel.intel>
References: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/2] i915/query: Cross-check engine
 list against execbuf interface
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Chris,

> -	/* Check results match the legacy GET_PARAM (where we can). */
> +	/* Confirm the individual engines exist with EXECBUFFER2 */
>  	for (i = 0; i < engines->num_engines; i++) {
>  		struct drm_i915_engine_info *engine =
>  			(struct drm_i915_engine_info *)&engines->engines[i];
> +		I915_DEFINE_CONTEXT_PARAM_ENGINES(p_engines, 1) = {
> +			.engines = { engine->engine }
> +		};
> +		struct drm_i915_gem_context_param param = {
> +			.param = I915_CONTEXT_PARAM_ENGINES,
> +			.value = to_user_pointer(&p_engines),
> +			.size = sizeof(p_engines),
> +		};
> +
> +		struct drm_i915_gem_exec_object2 obj = {};
> +		struct drm_i915_gem_execbuffer2 execbuf = {
> +			.buffers_ptr = to_user_pointer(&obj),
> +			.buffer_count = 1,
> +		};
>  
>  		igt_debug("%u: class=%u instance=%u flags=%llx capabilities=%llx\n",
>  			  i,
> @@ -689,6 +713,15 @@ static void engines(int fd)
>  			  engine->engine.engine_instance,
>  			  engine->flags,
>  			  engine->capabilities);
> +		gem_context_set_param(fd, &param);
> +		igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
> +	}
> +	gem_context_reset_engines(fd, 0);
> +
> +	/* Check results match the legacy GET_PARAM (where we can). */
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct drm_i915_engine_info *engine =
> +			(struct drm_i915_engine_info *)&engines->engines[i];

I would have liked it with one single for loop, perhaps resetting
engines individually.

But this works, as well and I'm not strong with this:

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
