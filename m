Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AD3C4361B
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 21:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A3820578
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 21:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A3820578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C338B899D4;
	Wed, 16 Dec 2020 21:23:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B928C899D4
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Dec 2020 21:23:06 +0000 (UTC)
IronPort-SDR: ZnKfF+0bOm8x250GLCCq7nBZM265LTUn638jbAIsHLC5Z94+AlKOpN3ps7GlRL9Kst17CfT5cS
 3WEFKLIaFLHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="175282298"
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; d="scan'208";a="175282298"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 13:23:06 -0800
IronPort-SDR: WGOnbXkNREbxv5m2Lo+kWZZXZxoZ5337GXuUY9j4fKNWW6e3zmvpZiOXck5JMrzWBLcqU4oJ9H
 WLioRnQzObjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; d="scan'208";a="337799910"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 16 Dec 2020 13:23:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Dec 2020 13:23:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Dec 2020 13:23:04 -0800
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.1713.004;
 Wed, 16 Dec 2020 13:23:04 -0800
From: "Tang, CQ" <cq.tang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Thread-Topic: [PATCH i-g-t] i915/gem_softpin: Check the last 32b page is
 excluded
Thread-Index: AQHW0+1k3efpfQ7lCEOV9x7Ew6k+Fan6O0BQ
Date: Wed, 16 Dec 2020 21:23:04 +0000
Message-ID: <a0e150fe3b9d4083934d0015e59457c8@intel.com>
References: <20201216205232.1365213-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201216205232.1365213-1-chris@chris-wilson.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_softpin: Check the last 32b
 page is excluded
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



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Wednesday, December 16, 2020 12:53 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: Chris Wilson <chris@chris-wilson.co.uk>; Tang, CQ <cq.tang@intel.com>
> Subject: [PATCH i-g-t] i915/gem_softpin: Check the last 32b page is excluded
> 
> In order to prevent issues with 32b stateless address, the last page under 4G
> is excluded for non-48b objects.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: CQ Tang <cq.tang@intel.com>
> ---
>  tests/i915/gem_softpin.c | 37
> +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c index
> a3e6dcac3..703beb77d 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -156,6 +156,39 @@ static void test_zero(int i915)
>  	gem_close(i915, object.handle);
>  }
> 
> +static void test_32b_last_page(int i915) {
> +	uint64_t sz, gtt = gem_aperture_size(i915);
> +	struct drm_i915_gem_exec_object2 object = {
> +		.flags = EXEC_OBJECT_PINNED,
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(&object),
> +		.buffer_count = 1,
> +	};
> +
> +	/*
> +	 * The last page under 32b is excluded for !48b objects in order to
> +	 * prevent issues with stateless addressing.
> +	 */
> +
> +	igt_require(gtt >= 1ull << 32);
> +	object.handle = batch_create(i915, &sz),

Where is this batch_create() version?

--CQ

> +
> +	object.offset = 1ull << 32;
> +	object.offset -= sz;
> +	igt_assert_f(__gem_execbuf(i915, &execbuf) == -EINVAL,
> +		     "execbuf succeeded with object.offset=%llx
> + %"PRIx64"\n",
> +		     object.offset, sz);
> +
> +	object.offset -= 4096;
> +	igt_assert_f(__gem_execbuf(i915, &execbuf) == 0,
> +		     "execbuf failed with object.offset=%llx + %"PRIx64"\n",
> +		     object.offset, sz);
> +
> +	gem_close(i915, object.handle);
> +}
> +
>  static void test_softpin(int fd)
>  {
>  	const uint32_t size = 1024 * 1024;
> @@ -622,6 +655,10 @@ igt_main
>  		igt_require(gem_uses_full_ppgtt(fd));
>  		test_zero(fd);
>  	}
> +	igt_subtest("32b-excludes-last-page") {
> +		igt_require(gem_uses_full_ppgtt(fd));
> +		test_32b_last_page(fd);
> +	}
>  	igt_subtest("softpin")
>  		test_softpin(fd);
>  	igt_subtest("overlap")
> --
> 2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
