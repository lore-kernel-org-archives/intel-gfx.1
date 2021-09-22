Return-Path: <SRS0=at8c=OM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49F9C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 14:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A324611C9
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 14:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A324611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AB86EC04;
	Wed, 22 Sep 2021 14:38:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEE76EC04
 for <intel-gfx@lists.freedesktop.org>; Wed, 22 Sep 2021 14:38:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="246049001"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="246049001"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 07:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="454754362"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 22 Sep 2021 07:37:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Sep 2021 17:37:27 +0300
Date: Wed, 22 Sep 2021 17:37:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <YUs/p0XtyT/fcw4I@intel.com>
References: <20210907113658.1351456-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210907113658.1351456-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Add HDR mode helper
 function
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 07, 2021 at 05:06:58PM +0530, Tejas Upadhyay wrote:
> Add helper function with returns if HDR mode in on
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Sorry for the lag. This kept slipping my mind.

I fixed up the alignment a bit and pushed to drm-intel-next. Thanks.

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 1f447ba776c7..51008600a180 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -182,6 +182,12 @@ static void intel_update_czclk(struct drm_i915_private *dev_priv)
>  		dev_priv->czclk_freq);
>  }
>  
> +static bool is_hdr_mode(const struct intel_crtc_state *crtc_state)
> +{
> +	return (crtc_state->active_planes & ~(icl_hdr_plane_mask() |
> +		BIT(PLANE_CURSOR))) == 0;
> +}
> +
>  /* WA Display #0827: Gen9:all */
>  static void
>  skl_wa_827(struct drm_i915_private *dev_priv, enum pipe pipe, bool enable)
> @@ -5257,8 +5263,7 @@ static void bdw_set_pipemisc(const struct intel_crtc_state *crtc_state)
>  			PIPEMISC_YUV420_MODE_FULL_BLEND;
>  
>  	if (DISPLAY_VER(dev_priv) >= 11 &&
> -	    (crtc_state->active_planes & ~(icl_hdr_plane_mask() |
> -					   BIT(PLANE_CURSOR))) == 0)
> +	    is_hdr_mode(crtc_state))
>  		val |= PIPEMISC_HDR_MODE_PRECISION;
>  
>  	if (DISPLAY_VER(dev_priv) >= 12)
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
