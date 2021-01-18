Return-Path: <SRS0=QT0F=GV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96ACC43381
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Jan 2021 16:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61AB2222BB
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Jan 2021 16:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61AB2222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCCE6E3F5;
	Mon, 18 Jan 2021 16:52:17 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC0C6E3F5
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Jan 2021 16:52:16 +0000 (UTC)
IronPort-SDR: v1Uqr3LK6Ye5ElrYncPoII9d0qW64cSpR430POdh7xsb2X29IfwAJXKb1JeM08DGWoKkMYUNDG
 tNHlv/UlJuyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="165915704"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="165915704"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 08:52:14 -0800
IronPort-SDR: cJtLg8ol2U+s3844m/lmPpUxpn2HtWogATlAsLgWwCZVinPSuR77268qTF+2mDLp4bPuUxgAVp
 R7wYZhid4e9g==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="569237122"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 08:52:13 -0800
Date: Mon, 18 Jan 2021 18:52:04 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20210118165204.GA1070820@ideak-desk.fi.intel.com>
References: <20210118162107.18424-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118162107.18424-1-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable TRAINING_PATTERN_SET
 before stopping the TPS transmission
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 06:21:07PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> DP spec says:
> "The Source device shall start sending the idle pattern after
>  it has cleared the Training_Pattern byte in the DPCD."
> =

> Currently we do these in operations in the opposite order.
> Swap them around to match the spec.
> =

> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Makes sense:
Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index d8c6d7054d11..2d3396bfc207 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -697,9 +697,9 @@ static bool intel_dp_disable_dpcd_training_pattern(st=
ruct intel_dp *intel_dp,
>   * @intel_dp: DP struct
>   * @crtc_state: state for CRTC attached to the encoder
>   *
> - * Stop the link training of the @intel_dp port, disabling the test patt=
ern
> - * symbol generation on the port and disabling the training pattern in
> - * the sink's DPCD.
> + * Stop the link training of the @intel_dp port, disabling the training
> + * pattern in the sink's DPCD, and disabling the test pattern symbol
> + * generation on the port.
>   *
>   * What symbols are output on the port after this point is
>   * platform specific: On DDI/VLV/CHV platforms it will be the idle patte=
rn
> @@ -713,10 +713,9 @@ void intel_dp_stop_link_train(struct intel_dp *intel=
_dp,
>  {
>  	intel_dp->link_trained =3D true;
>  =

> -	intel_dp_program_link_training_pattern(intel_dp,
> -					       crtc_state,
> -					       DP_TRAINING_PATTERN_DISABLE);
>  	intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
> +	intel_dp_program_link_training_pattern(intel_dp, crtc_state,
> +					       DP_TRAINING_PATTERN_DISABLE);
>  }
>  =

>  static bool
> -- =

> 2.26.2
> =

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
