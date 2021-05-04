Return-Path: <SRS0=qSOt=J7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A861C433B4
	for <intel-gfx@archiver.kernel.org>; Tue,  4 May 2021 08:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCC2613B3
	for <intel-gfx@archiver.kernel.org>; Tue,  4 May 2021 08:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCC2613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6446EAB1;
	Tue,  4 May 2021 08:50:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6136EAB1
 for <intel-gfx@lists.freedesktop.org>; Tue,  4 May 2021 08:50:12 +0000 (UTC)
IronPort-SDR: aj228Xeodjgag85ce3xRWYfsWwuN2IaxrHNSO0RDnAln+tzhYNmBWQYVI/C5P6oi/54v751zmc
 9DrCC6xqsjrw==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="185402420"
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="185402420"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 01:50:10 -0700
IronPort-SDR: 85n18rkspYy/M3DNO5qwjPOVO6fx1H3UfIBXTvXmhkAYvlpKHYTZPcZy79joo76ph58t3sG921
 8gMhR+JHlXvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="396055977"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 May 2021 01:50:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 May 2021 11:50:07 +0300
Date: Tue, 4 May 2021 11:50:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <YJEKvxfc7ASUMU+D@intel.com>
References: <cover.1620115982.git.jani.nikula@intel.com>
 <6c2f6afa4c8866f8c1714b4f8dba9ea2d1509e4a.1620115983.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c2f6afa4c8866f8c1714b4f8dba9ea2d1509e4a.1620115983.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/audio: fix indentation,
 remove extra braces
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

On Tue, May 04, 2021 at 11:14:01AM +0300, Jani Nikula wrote:
> Cleanup the code. No functional changes.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

for the series
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_audio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm=
/i915/display/intel_audio.c
> index 60083431228c..75871ee544a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -597,8 +597,8 @@ static void enable_audio_dsc_wa(struct intel_encoder =
*encoder,
>  		val |=3D HBLANK_EARLY_ENABLE_TGL(pipe);
>  =

>  	if (crtc_state->dsc.compression_enable &&
> -	    (crtc_state->hw.adjusted_mode.hdisplay >=3D 3840 &&
> -	    crtc_state->hw.adjusted_mode.vdisplay >=3D 2160)) {
> +	    crtc_state->hw.adjusted_mode.hdisplay >=3D 3840 &&
> +	    crtc_state->hw.adjusted_mode.vdisplay >=3D 2160) {
>  		/* Get hblank early enable value required */
>  		val &=3D ~HBLANK_START_COUNT_MASK(pipe);
>  		hblank_early_prog =3D calc_hblank_early_prog(encoder, crtc_state);
> -- =

> 2.20.1
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
