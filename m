Return-Path: <SRS0=BkXb=GK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3C4C433DB
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 07:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 602D522EBF
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 07:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 602D522EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF72489D00;
	Thu,  7 Jan 2021 07:01:47 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1004689D00
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 07:01:45 +0000 (UTC)
IronPort-SDR: 0PpyOSnvIb2YKObSWQYLy2nABL7UA08Mwt0roeeT8yUFUJPLJDxQL86IG1gWOBayGmpaK6Logr
 c9En0t+CTqHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="177486008"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="177486008"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 23:01:45 -0800
IronPort-SDR: 81FEXICojYJA/BMkmyzqT4C0UT3xdsQa+sty37kgIN78BHRhDdFtgk4UKcutXmqGY3EDUqOmWV
 FpuASSHiamOw==
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="361871634"
Received: from muhymini-mobl.amr.corp.intel.com (HELO localhost)
 ([10.213.207.83])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 23:01:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20201209153952.3397959-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201209153952.3397959-1-imre.deak@intel.com>
Date: Thu, 07 Jan 2021 09:01:40 +0200
Message-ID: <87a6tl1b8r.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/icl: Fix initing the DSI DSC power
 refcount during HW readout
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 09 Dec 2020, Imre Deak <imre.deak@intel.com> wrote:
> For an enabled DSC during HW readout the corresponding power reference
> is taken along the CRTC power domain references in
> get_crtc_power_domains(). Remove the incorrect get ref from the DSI
> encoder hook.

Does this fix [1] which is v5.11-rc2 on TGL DSI? Should we pick this up
for fixes?


BR,
Jani.


[1] https://intel-gfx-ci.01.org/tree/drm-intel-fixes/CI_DIF_538/fi-tgl-dsi/igt@gem_exec_suspend@basic-s0.html



>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index a9439b415603..b3533a32f8ba 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1616,10 +1616,6 @@ static void gen11_dsi_get_power_domains(struct intel_encoder *encoder,
>  
>  	get_dsi_io_power_domains(i915,
>  				 enc_to_intel_dsi(encoder));
> -
> -	if (crtc_state->dsc.compression_enable)
> -		intel_display_power_get(i915,
> -					intel_dsc_power_domain(crtc_state));
>  }
>  
>  static bool gen11_dsi_get_hw_state(struct intel_encoder *encoder,

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
