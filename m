Return-Path: <SRS0=VbzJ=K2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38DFC47080
	for <intel-gfx@archiver.kernel.org>; Mon, 31 May 2021 14:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C3C61375
	for <intel-gfx@archiver.kernel.org>; Mon, 31 May 2021 14:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81C3C61375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F816E92F;
	Mon, 31 May 2021 14:17:39 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC376E4CA;
 Mon, 31 May 2021 14:17:37 +0000 (UTC)
IronPort-SDR: QiVKFILcAI8awq7HF1obVgf2TEvQhAPs4ujj4C8vDPXg7hNwCImjj0zMUltJC3Nbcntnqjd9XZ
 JAOnwPpJEIHA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183722204"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="183722204"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 07:17:36 -0700
IronPort-SDR: o+4H46Vr4s7uPnf5KkUMFBJInONSirljm5G6YzrZmr8tA+fMjMaJoloaKDeZFjqWVYl3pMTSET
 HLODNjw261lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="482110184"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 31 May 2021 07:17:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 31 May 2021 17:17:33 +0300
Date: Mon, 31 May 2021 17:17:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Message-ID: <YLTv/Z8j9rCf2koN@intel.com>
References: <1622176443-12682-1-git-send-email-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622176443-12682-1-git-send-email-vidya.srinivas@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] [RFC] tests/kms_prime:
 Aligned pitch to 64 byte for Intel platforms
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 charlton.lin@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 10:04:03AM +0530, Vidya Srinivas wrote:
> For Intel platforms, pitch needs to be 64 byte aligned.
> Kernel code vgem_gem_dumb_create which is platform generic code
> doesnt do the alignment. This causes frame buffer creation to fail
> on Intel platforms where the pitch is not 64 byte aligned.
> =

> tests: test run on Intel platforms with panel resolution 1366x768
> =

> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_prime.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 8cb2ca2a9dc3..fdc941fe8100 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -51,6 +51,8 @@ static struct {
>  	{ .r =3D 1.0, .g =3D 0.0, .b =3D 0.0, .color =3D 0xffff0000 },
>  };
>  =

> +bool check_platform;
> +
>  IGT_TEST_DESCRIPTION("Prime tests, focusing on KMS side");
>  =

>  static bool has_prime_import(int fd)
> @@ -101,7 +103,7 @@ static void prepare_scratch(int exporter_fd, struct d=
umb_bo *scratch,
>  	scratch->bpp =3D 32;
>  =

>  	scratch->handle =3D kmstest_dumb_create(exporter_fd,
> -			scratch->width,
> +			check_platform? ALIGN(scratch->width, 64): scratch->width,

The dumb_create ioctl already does this for us.

>  			scratch->height,
>  			scratch->bpp,
>  			&scratch->pitch,
> @@ -262,6 +264,7 @@ igt_main
>  =

>  		/* ANY =3D anything that is not VGEM */
>  		first_fd =3D __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
> +		check_platform =3D is_i915_device(first_fd);
>  		igt_require(first_fd >=3D 0);
>  =

>  		second_fd =3D __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
> -- =

> 2.7.4
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
