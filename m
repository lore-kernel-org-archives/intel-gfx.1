Return-Path: <SRS0=HSM9=GJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E75C433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 06:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC6222CAF
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 06:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDC6222CAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F3189CB9;
	Wed,  6 Jan 2021 06:22:46 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFCF89CB9;
 Wed,  6 Jan 2021 06:22:44 +0000 (UTC)
IronPort-SDR: HEE3xNjzA/pBA241JEVikuE/8mnE2BGiQ9HsY4PeOvorNQYZ4ATZHA+RodINlV1vniB0f8i+MC
 20Z6tVmHDqVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="195780163"
X-IronPort-AV: E=Sophos;i="5.78,479,1599548400"; d="scan'208";a="195780163"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 22:22:43 -0800
IronPort-SDR: kxx60llrNYhUi7Ab9diz139irC8bQpuInoWZ0b0Cw11T9jhje1JYIYTSDs5asKev6vK5ZPVoLE
 3zmChfgFrwmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,479,1599548400"; d="scan'208";a="350695960"
Received: from kmsmsx602.gar.corp.intel.com ([172.21.219.142])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jan 2021 22:22:42 -0800
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 kmsmsx602.gar.corp.intel.com (172.21.219.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 Jan 2021 14:22:42 +0800
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138]) by
 pgsmsx603.gar.corp.intel.com ([10.108.199.138]) with mapi id 15.01.1713.004;
 Wed, 6 Jan 2021 14:22:42 +0800
From: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Thread-Topic: [PATCH i-g-t 1/2] i915/gem_ctx_isolation: Protect
 inject_reset_context() from banning
Thread-Index: AQHW41WAy7REUaLOYUiH/qeoubefTaoaIdqA
Date: Wed, 6 Jan 2021 06:22:41 +0000
Message-ID: <e23a47877414426ca157eb3c5f36d4e7@intel.com>
References: <20210105112536.3284632-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210105112536.3284632-1-chris@chris-wilson.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/2] i915/gem_ctx_isolation: Protect
 inject_reset_context() from banning
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Tuesday, January 5, 2021 4:56 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: igt-dev@lists.freedesktop.org; Chris Wilson <chris@chris-wilson.co.uk>;
> Nayana, Venkata Ramana <venkata.ramana.nayana@intel.com>
> Subject: [PATCH i-g-t 1/2] i915/gem_ctx_isolation: Protect
> inject_reset_context() from banning
> 
> Disable banning as we deliberately inject GPU resets to test isolation.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> ---
>  tests/i915/gem_ctx_isolation.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 58a35b487..4f1742685 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -762,10 +762,21 @@ static void isolation(int fd,  #define S4 (4 << 8)
> #define SLEEP_MASK (0xf << 8)
> 
> +static uint32_t create_reset_context(int i915) {
> +	struct drm_i915_gem_context_param param = {
> +		.ctx_id = gem_context_clone_with_engines(i915, 0),
> +		.param = I915_CONTEXT_PARAM_BANNABLE,
> +	};
> +
> +	gem_context_set_param(i915, &param);
> +	return param.ctx_id;
> +}
> +
>  static void inject_reset_context(int fd, const struct intel_execution_engine2
> *e)  {
>  	struct igt_spin_factory opts = {
> -		.ctx = gem_context_clone_with_engines(fd, 0),
> +		.ctx = create_reset_context(fd),
>  		.engine = e->flags,
>  		.flags = IGT_SPIN_FAST,
>  	};
> --
> 2.30.0

Reviewed-by:  Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
