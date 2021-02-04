Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF8AC433E6
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 10:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030B064DF4
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 10:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030B064DF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADEF6ED13;
	Thu,  4 Feb 2021 10:44:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF84A6EC96;
 Thu,  4 Feb 2021 10:44:38 +0000 (UTC)
IronPort-SDR: 6SeG6iGmwGUhXhkn9KAYsVXY5+qZ76PgrmaxGDOQDQRhM5KcOHJtLn+ZEq6bxjNI0qN26OOGrR
 4h0ZheBBMN4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="200204519"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="200204519"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 02:44:37 -0800
IronPort-SDR: PVOI/G2+/ZiQWeX5LUb4HtD1Ld7CVXQhvQyVaAW11Nq0aIYkKueAedfuUUi80zuDxgX09iFQS8
 IN+encK524Uw==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="393103840"
Received: from dbmayer-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.1])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 02:44:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin King <colin.king@canonical.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <20210203110803.17894-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210203110803.17894-1-colin.king@canonical.com>
Date: Thu, 04 Feb 2021 12:44:31 +0200
Message-ID: <87eehwf6y8.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH][next] drm/i915/display: fix spelling
 mistake "Couldnt" -> "Couldn't"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 03 Feb 2021, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a drm_dbg message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, pushed to drm-intel-next.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8c12d5375607..a338720cee2e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2650,7 +2650,7 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
>  	if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
>  		int ret, mode;
>  
> -		drm_dbg(&dev_priv->drm, "Couldnt set FRL mode, continuing with TMDS mode\n");
> +		drm_dbg(&dev_priv->drm, "Couldn't set FRL mode, continuing with TMDS mode\n");
>  		ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
>  		mode = drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, NULL);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
