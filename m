Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FB0C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 16:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E475B64FE5
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 16:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E475B64FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCA06EE3E;
	Thu, 11 Mar 2021 16:05:48 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9242A6EE3E
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 16:05:46 +0000 (UTC)
IronPort-SDR: PL7nulSGw+BNPnkdBQ9k6lhA/sE0GqTTWRTvMA+9ub2krW8MNWd1TKpfZ7hAD9gcPZqY7at5en
 dDrkqtrtwTZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="186309357"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="186309357"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 08:05:46 -0800
IronPort-SDR: jIEqrNYHiuM0Z0gSx/4Jc9iVwNYfT4g7RBHR8vlBX+lp3vbmY09K6KXSNT2u7onsUNWWztZ6Tj
 FnTD8SR8k42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="409532023"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 11 Mar 2021 08:05:43 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Mar 2021 18:05:42 +0200
Date: Thu, 11 Mar 2021 18:05:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Message-ID: <YEo/1jEWQGWm5DFS@intel.com>
References: <20210310221736.2963264-1-imre.deak@intel.com>
 <20210310221736.2963264-3-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310221736.2963264-3-imre.deak@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 02/23] drm/i915/selftest: Fix error handling
 in igt_vma_remapped_gtt()
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 12:17:15AM +0200, Imre Deak wrote:
> An inner scope version of err shadows the variable in the outer scope,
> and err doesn't get set after a failure, fix these.
> =

> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/selftests/i915_vma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/=
i915/selftests/i915_vma.c
> index 065a9d82ad5c..2c067343d65f 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> @@ -890,7 +890,6 @@ static int igt_vma_remapped_gtt(void *arg)
>  			struct i915_vma *vma;
>  			u32 __iomem *map;
>  			unsigned int x, y;
> -			int err;
>  =

>  			vma =3D i915_gem_object_ggtt_pin(obj, &view, 0, 0, PIN_MAPPABLE);
>  			if (IS_ERR(vma)) {
> @@ -956,6 +955,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  						       *t =3D=3D I915_GGTT_VIEW_ROTATED ? "Rotated" : "Remapped",
>  						       val, exp);
>  						i915_vma_unpin_iomap(vma);
> +						err =3D -EINVAL;
>  						goto out;
>  					}
>  				}
> -- =

> 2.25.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
