Return-Path: <SRS0=lJ7G=P5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA34C433FE
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 10:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AFB36115A
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 10:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AFB36115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A300C6E0C5;
	Wed, 10 Nov 2021 10:31:46 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6359E6E0C5
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Nov 2021 10:31:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="256333824"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="256333824"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:31:44 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="492045757"
Received: from rahuldut-mobl.amr.corp.intel.com (HELO localhost)
 ([10.249.33.152])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:31:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <877ddh5t4l.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211109120428.15211-1-vandita.kulkarni@intel.com>
 <877ddh5t4l.fsf@intel.com>
Date: Wed, 10 Nov 2021 12:31:40 +0200
Message-ID: <87tugk47zn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915/tgl/dsi: Gate the ddi
 clocks after pll mapping"
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

On Tue, 09 Nov 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 09 Nov 2021, Vandita Kulkarni <vandita.kulkarni@intel.com> wrote:
>> This reverts commit 991d9557b0c457fb92bc49ddde24a7d9ce6144a8.
>> The Bspec was updated recently with the pll ungate sequence
>> similar to that of icl dsi enable sequence.
>> Hence reverting.
>>
>> Bspec:49187
>
> Please add a space after : in the Bspec tag, and please add a Fixes: tag
> while applying.

Pushed, thanks for the patch.

BR,
Jani.

>
>>
>> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>> ---
>>  drivers/gpu/drm/i915/display/icl_dsi.c | 10 ++--------
>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
>> index 2337c0b54586..edc38fbd2545 100644
>> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
>> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
>> @@ -698,10 +698,7 @@ static void gen11_dsi_map_pll(struct intel_encoder *encoder,
>>  	intel_de_write(dev_priv, ICL_DPCLKA_CFGCR0, val);
>>  
>>  	for_each_dsi_phy(phy, intel_dsi->phys) {
>> -		if (DISPLAY_VER(dev_priv) >= 12)
>> -			val |= ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy);
>> -		else
>> -			val &= ~ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy);
>> +		val &= ~ICL_DPCLKA_CFGCR0_DDI_CLK_OFF(phy);
>>  	}
>>  	intel_de_write(dev_priv, ICL_DPCLKA_CFGCR0, val);
>>  
>> @@ -1137,8 +1134,6 @@ static void
>>  gen11_dsi_enable_port_and_phy(struct intel_encoder *encoder,
>>  			      const struct intel_crtc_state *crtc_state)
>>  {
>> -	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>> -
>>  	/* step 4a: power up all lanes of the DDI used by DSI */
>>  	gen11_dsi_power_up_lanes(encoder);
>>  
>> @@ -1164,8 +1159,7 @@ gen11_dsi_enable_port_and_phy(struct intel_encoder *encoder,
>>  	gen11_dsi_configure_transcoder(encoder, crtc_state);
>>  
>>  	/* Step 4l: Gate DDI clocks */
>> -	if (DISPLAY_VER(dev_priv) == 11)
>> -		gen11_dsi_gate_clocks(encoder);
>> +	gen11_dsi_gate_clocks(encoder);
>>  }
>>  
>>  static void gen11_dsi_powerup_panel(struct intel_encoder *encoder)

-- 
Jani Nikula, Intel Open Source Graphics Center
