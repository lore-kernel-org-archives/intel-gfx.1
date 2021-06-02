Return-Path: <SRS0=VOyE=K4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BACC4708F
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 08:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB7F61159
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 08:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFB7F61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460206E04A;
	Wed,  2 Jun 2021 08:22:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710B96E04A
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Jun 2021 08:22:06 +0000 (UTC)
IronPort-SDR: dgz69W31k//3BLCR1Yajf+N5UOdgWiH281HLg2u4UhBWbBZY5RH70zgpgjwWnGH0SNH/qdEQ+9
 9a6vSAimbTNA==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="203731077"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="203731077"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 01:22:05 -0700
IronPort-SDR: ibmfBmcnWKJ+TU9kiN4rXsdTLWPr/W0puTyHA3Arj3Xnd1jpheDRCEBe1HeyHCXBKDgKYPUxoH
 yp8q2d+wmEBA==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="399639518"
Received: from unknown (HELO intel.com) ([10.223.74.179])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 01:22:03 -0700
Date: Wed, 2 Jun 2021 13:36:51 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Imre Deak <imre.deak@intel.com>
Message-ID: <20210602080650.GE8620@intel.com>
References: <20210526143729.2563672-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526143729.2563672-1-imre.deak@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/ddi: Flush encoder power
 domain ref puts during driver unload
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 2021-05-26 at 20:07:27 +0530, Imre Deak wrote:
> An async-put on an encoder specific power domain (for instance the AUX
> PW domain) may be pending when removing the encoder. Make sure any such
> async-puts are complete while the corresponding encoder is still in place
> since at least AUX power wells require this to do a power well->PHY
> lookup.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 3d89186741539..d0d11c9c8d13b 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4063,9 +4063,11 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
>  
>  static void intel_ddi_encoder_destroy(struct drm_encoder *encoder)
>  {
> +	struct drm_i915_private *i915 = to_i915(encoder->dev);
>  	struct intel_digital_port *dig_port = enc_to_dig_port(to_intel_encoder(encoder));
>  
>  	intel_dp_encoder_flush_work(encoder);
> +	intel_display_power_flush_work(i915);
>  
>  	drm_encoder_cleanup(encoder);
>  	if (dig_port)
> -- 
> 2.27.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
