Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6F7C4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 09:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622F623D39
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 09:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622F623D39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66FC6E415;
	Thu, 10 Dec 2020 09:53:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9D26E415;
 Thu, 10 Dec 2020 09:53:32 +0000 (UTC)
IronPort-SDR: oIOrslPf6jXwwVDGgSkQ6nVZv0mMA3MF3p3VOSjVJ4xdcDmv0HCqxpivXO8CD/6NzXkqnA2lOn
 6Kb8WNtzuyow==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="235822211"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="235822211"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 01:53:31 -0800
IronPort-SDR: kRAPUN+BIxOSpYDWTwSl8/02jvKIfPo9YFwnf9M00usxv6Uf+qpuzBNchJnWZh1Q//Pj1QPENx
 LZhRvdlot/+Q==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="318989169"
Received: from yechielg-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.81.29])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 01:53:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Navare\, Manasi" <manasi.d.navare@intel.com>
In-Reply-To: <20201208202659.GD474@labuser-Z97X-UD5H>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1607429866.git.jani.nikula@intel.com>
 <43fba75d89525413aed0bdbb082c26b09458bd46.1607429866.git.jani.nikula@intel.com>
 <20201208202659.GD474@labuser-Z97X-UD5H>
Date: Thu, 10 Dec 2020 11:53:25 +0200
Message-ID: <87zh2m7zsa.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 5/6] drm/i915/bios: fill in DSC
 rc_model_size from VBT
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 08 Dec 2020, "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> On Tue, Dec 08, 2020 at 02:33:54PM +0200, Jani Nikula wrote:
>> The VBT fields match the DPCD data, so use the same helper.
>> 
>> Cc: Manasi Navare <manasi.d.navare@intel.com>
>> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Only for DSI so far right?

Yes. We'll still need a patch to start using the rc_model_size from DPCD
for DP.

> In that case looks good
>
> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Thanks for the reviews. Pushed up to and including this one to
drm-intel-next. The last patch in the series still to be reviewed.

BR,
Jani.


>
> Manasi
>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bios.c | 11 +++--------
>>  1 file changed, 3 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
>> index 4cc949b228f2..06c3310446a2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -2555,16 +2555,11 @@ static void fill_dsc(struct intel_crtc_state *crtc_state,
>>  			      crtc_state->dsc.slice_count);
>>  
>>  	/*
>> -	 * FIXME: Use VBT rc_buffer_block_size and rc_buffer_size for the
>> -	 * implementation specific physical rate buffer size. Currently we use
>> -	 * the required rate buffer model size calculated in
>> -	 * drm_dsc_compute_rc_parameters() according to VESA DSC Annex E.
>> -	 *
>>  	 * The VBT rc_buffer_block_size and rc_buffer_size definitions
>> -	 * correspond to DP 1.4 DPCD offsets 0x62 and 0x63. The DP DSC
>> -	 * implementation should also use the DPCD (or perhaps VBT for eDP)
>> -	 * provided value for the buffer size.
>> +	 * correspond to DP 1.4 DPCD offsets 0x62 and 0x63.
>>  	 */
>> +	vdsc_cfg->rc_model_size = drm_dsc_dp_rc_buffer_size(dsc->rc_buffer_block_size,
>> +							    dsc->rc_buffer_size);
>>  
>>  	/* FIXME: DSI spec says bpc + 1 for this one */
>>  	vdsc_cfg->line_buf_depth = VBT_DSC_LINE_BUFFER_DEPTH(dsc->line_buffer_depth);
>> -- 
>> 2.20.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
