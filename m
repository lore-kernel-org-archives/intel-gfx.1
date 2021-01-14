Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E11EC433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 15:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D01BC2311F
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 15:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D01BC2311F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710EE6E415;
	Thu, 14 Jan 2021 15:31:50 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFF56E415
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 15:31:49 +0000 (UTC)
IronPort-SDR: 1Su4STX0Kb1pE80IkqR60EF8eeAQPtmr0o/7Ls1CndUZqeJxvYmFWNdSRmtcNCY9ODNvkwsTSn
 z1RVWI1ApX/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166055406"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="166055406"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 07:31:48 -0800
IronPort-SDR: PZzP/JyjyI4qeC7pGhGMh4qLsVfOCq5QDjdK1H/KQdv9wRNaqJjOJCvKTfTYkuojr/TolSqvpI
 jF5H2ldxoabQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="389827308"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 14 Jan 2021 07:31:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 14 Jan 2021 17:31:42 +0200
Date: Thu, 14 Jan 2021 17:31:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Message-ID: <YABj3sk5eF43yhwm@intel.com>
References: <20210114092236.20477-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114092236.20477-1-shawn.c.lee@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915: support two CSC module on gen11
 and later
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
Cc: Cooper Chiou <cooper.chiou@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 05:22:36PM +0800, Lee Shawn C wrote:
> There are two CSC on pipeline on gen11 and later platform.
> User space application is allowed to enable CTM and RGB
> to YCbCr coversion at the same time now.
> =

> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Cooper Chiou <cooper.chiou@intel.com>
> Cc: Shankar Uma <uma.shankar@intel.com>
> =

> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 1a0f00f37ca9..721d5ce1ed2b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8303,7 +8303,8 @@ static int intel_crtc_compute_config(struct intel_c=
rtc *crtc,
>  		return -EINVAL;
>  	}
>  =

> -	if ((pipe_config->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420 ||
> +	if ((INTEL_GEN(dev_priv) < 11) &&
> +	    (pipe_config->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420 ||
>  	     pipe_config->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444) &&
>  	     pipe_config->hw.ctm) {

Didn't realize we had this check here. It should really be moved
into {ivb,glk}_color_check().

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
