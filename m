Return-Path: <SRS0=x7Pm=FN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267DDC4361B
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 16:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92722343B
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 16:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92722343B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D496EA7A;
	Wed,  9 Dec 2020 16:06:32 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133206EA7A
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Dec 2020 16:06:30 +0000 (UTC)
IronPort-SDR: PMFO7DZYulcNXQgttZSGiMrERvB2SrerF280zEvNMZxmm8SIlKD9TOAVahgYnPawE453mNi09M
 dEy2HJQEiVew==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="161150497"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="161150497"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 08:06:29 -0800
IronPort-SDR: zFvSuK6gzcuRmik+qQLSvfggTSUaxIRKt5rCuERCbHWFuoeSoXaxJtP26VXQywfiVKVuwmAC/r
 8FonCIOvt1QA==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="318339073"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 08:06:28 -0800
Date: Wed, 9 Dec 2020 21:23:02 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Imre Deak <imre.deak@intel.com>
Message-ID: <20201209155302.GM30377@intel.com>
References: <20201209153952.3397959-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209153952.3397959-1-imre.deak@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 2020-12-09 at 21:09:52 +0530, Imre Deak wrote:
> For an enabled DSC during HW readout the corresponding power reference
> is taken along the CRTC power domain references in
> get_crtc_power_domains(). Remove the incorrect get ref from the DSI
> encoder hook.
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
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
> -- 
> 2.25.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
