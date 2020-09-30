Return-Path: <SRS0=p/WI=DH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EF3C4727E
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 13:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA3F2071E
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 13:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA3F2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C546E39B;
	Wed, 30 Sep 2020 13:57:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5A6E39B
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 13:57:27 +0000 (UTC)
IronPort-SDR: JE0g+FeoaLK4GU8e7AxyLGDN8aVNpUbxUVjlQYNoP8t660gsFCx7oKeX0ADB6zKvIx3o1gXnt4
 GcqVRhnWjCQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="159834678"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="159834678"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 06:57:26 -0700
IronPort-SDR: 7cav7syGVfzMKbWFmdUcKHJY6bcn7CjIWdGbAE+CgCPXbgHdM5I8lFCyk0z1qSFMCFZfQyoMOu
 oZgPzaN6t13A==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="294614149"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 06:57:25 -0700
Date: Wed, 30 Sep 2020 16:57:22 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20200930135722.GB867650@ideak-desk.fi.intel.com>
References: <20200929233449.32323-1-ville.syrjala@linux.intel.com>
 <20200929233449.32323-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929233449.32323-3-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 02/11] drm/i915:
 s/old_crtc_state/crtc_state/
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

On Wed, Sep 30, 2020 at 02:34:40AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> intel_dp_enable_port() is called during the enable sequence,
> so there is nothing old about the passed in crtc state.
> Rename it.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index ff96540c8612..3586d79f5599 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3850,7 +3850,7 @@ g4x_set_link_train(struct intel_dp *intel_dp,
>  }
>  =

>  static void intel_dp_enable_port(struct intel_dp *intel_dp,
> -				 const struct intel_crtc_state *old_crtc_state)
> +				 const struct intel_crtc_state *crtc_state)
>  {
>  	struct drm_i915_private *dev_priv =3D dp_to_i915(intel_dp);
>  =

> @@ -3865,7 +3865,7 @@ static void intel_dp_enable_port(struct intel_dp *i=
ntel_dp,
>  	 * fail when the power sequencer is freshly used for this port.
>  	 */
>  	intel_dp->DP |=3D DP_PORT_EN;
> -	if (old_crtc_state->has_audio)
> +	if (crtc_state->has_audio)
>  		intel_dp->DP |=3D DP_AUDIO_OUTPUT_ENABLE;
>  =

>  	intel_de_write(dev_priv, intel_dp->output_reg, intel_dp->DP);
> -- =

> 2.26.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
