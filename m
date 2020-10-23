Return-Path: <SRS0=RNxq=D6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9614EC4363A
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 17:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E3120E65
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 17:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E3120E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8E16E311;
	Fri, 23 Oct 2020 17:17:13 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBD06E311
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 17:17:12 +0000 (UTC)
IronPort-SDR: uzTeVCpOmxt1a7ynS46hLokpwdaIJEEDaCla7vPgTuSNBHjZ09tkFii5MCZbpUxVXf8t3H4gxv
 NfIjJJ1PyORg==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="167800989"
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; d="scan'208";a="167800989"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 10:17:11 -0700
IronPort-SDR: 1XnpC7wRfncpSEIZK26ecRU/WQgCU1YWcCdceguP6DjENZAc1bKYluSgnVqTBUJkXpziwBsPMX
 Aznd0D243A8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; d="scan'208";a="349262006"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 23 Oct 2020 10:17:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Oct 2020 20:17:08 +0300
Date: Fri, 23 Oct 2020 20:17:08 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <20201023171708.GW6112@intel.com>
References: <20201022054223.25071-1-manasi.d.navare@intel.com>
 <20201022054223.25071-4-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201022054223.25071-4-manasi.d.navare@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH v11 03/12] drm/i915/dp: Some reshuffling in
 mode_valid as prep for bigjoiner modes
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

On Wed, Oct 21, 2020 at 10:42:14PM -0700, Manasi Navare wrote:
> No functional changes. This patch just moves some mode checks
> around to prepare for adding bigjoiner related mode validation
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 818daab252f3..2c29e7f5281b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -721,6 +721,9 @@ intel_dp_mode_valid(struct drm_connector *connector,
>  	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
>  		return MODE_NO_DBLESCAN;
>  =

> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		return MODE_H_ILLEGAL;
> +
>  	if (intel_dp_is_edp(intel_dp) && fixed_mode) {
>  		if (mode->hdisplay > fixed_mode->hdisplay)
>  			return MODE_PANEL;
> @@ -731,6 +734,9 @@ intel_dp_mode_valid(struct drm_connector *connector,
>  		target_clock =3D fixed_mode->clock;
>  	}
>  =

> +	if (mode->clock < 10000)
> +		return MODE_CLOCK_LOW;
> +

No idea what this check is actually trying to achieve, but
since it was already there no harm in moving it around.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  	max_link_clock =3D intel_dp_max_link_rate(intel_dp);
>  	max_lanes =3D intel_dp_max_lane_count(intel_dp);
>  =

> @@ -771,12 +777,6 @@ intel_dp_mode_valid(struct drm_connector *connector,
>  	    target_clock > max_dotclk)
>  		return MODE_CLOCK_HIGH;
>  =

> -	if (mode->clock < 10000)
> -		return MODE_CLOCK_LOW;
> -
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		return MODE_H_ILLEGAL;
> -
>  	status =3D intel_dp_mode_valid_downstream(intel_connector,
>  						mode, target_clock);
>  	if (status !=3D MODE_OK)
> -- =

> 2.19.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
