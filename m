Return-Path: <SRS0=Ww0K=JM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9817FC433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Apr 2021 22:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B95E610FC
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Apr 2021 22:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B95E610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5646EB0A;
	Thu, 15 Apr 2021 22:12:39 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BAC6EB0A
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Apr 2021 22:12:38 +0000 (UTC)
IronPort-SDR: L2XJqlO3C3rfykhLd3CAnREWSKrUUKB0vmyx/LKuCnRsX13CWeViXYjQIy/FKCyV4x2ouApe+u
 0yHCf0fsFLyw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="195064731"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="195064731"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 15:12:38 -0700
IronPort-SDR: 4/VMmYbKJ0QuW4GM+ld1RczYWZPH/5LrHRKR0Cequefg0/PP7QwMu9n+Ib1Ylb8Wkr5Enbscf1
 NRnmlZ8xzoGA==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="615778210"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 15:12:36 -0700
Date: Fri, 16 Apr 2021 01:12:33 +0300
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Message-ID: <20210415221233.GB3262868@ideak-desk.fi.intel.com>
References: <20210414155208.3161335-1-imre.deak@intel.com>
 <20210414155208.3161335-11-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414155208.3161335-11-imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH 10/11] drm/i915/adl_p: Require a minimum of
 8 tiles stride for DPT FBs
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 06:52:07PM +0300, Imre Deak wrote:
> The specification only requires DPT FB strides to be POT aligned, but
> there seems to be also a minimum of 8 stride tile requirement. Scanning
> out FBs with < 8 stride tiles will result in pipe faults (even though
> the stride is POT aligned).

This is now confirmed in bspec (index 53393).

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Acked-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index bd862f77762a2..2ee10ece27c57 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -609,7 +609,11 @@ plane_view_dst_stride_tiles(const struct intel_frame=
buffer *fb, int color_plane,
>  			    unsigned int pitch_tiles)
>  {
>  	if (intel_fb_needs_pot_stride_remap(fb))
> -		return roundup_pow_of_two(pitch_tiles);
> +		/*
> +		 * ADL_P, the only platform needing a POT stride has a minimum
> +		 * of 8 stride tiles.
> +		 */
> +		return roundup_pow_of_two(max(pitch_tiles, 8u));
>  	else
>  		return pitch_tiles;
>  }
> -- =

> 2.27.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
