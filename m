Return-Path: <SRS0=BHe2=NL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01763C4338F
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Aug 2021 06:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C65C361029
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Aug 2021 06:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C65C361029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EB26EA06;
	Fri, 20 Aug 2021 06:36:41 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE526EA06
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Aug 2021 06:36:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216754068"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="216754068"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 23:36:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="522970436"
Received: from schuenem-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.43.187])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 23:36:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, manasi.d.navare@intel.com
In-Reply-To: <YR6ZkGKymmjYDA0d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1629310010.git.jani.nikula@intel.com>
 <55a0b34ef28d035cad56b9e0c1886b5a12d18032.1629310010.git.jani.nikula@intel.com>
 <YR6ZkGKymmjYDA0d@intel.com>
Date: Fri, 20 Aug 2021 09:36:35 +0300
Message-ID: <87h7fkhbbg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH 13/17] drm/i915/dp: select 128b/132b channel
 encoding for UHBR rates
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

On Thu, 19 Aug 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Aug 18, 2021 at 09:10:48PM +0300, Jani Nikula wrote:
>> UHBR rates and 128b/132b channel encoding go hand in hand.
>>=20
>> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/dri=
vers/gpu/drm/i915/display/intel_dp_link_training.c
>> index 031c753fca56..01f0adc585d0 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> @@ -495,7 +495,8 @@ intel_dp_prepare_link_train(struct intel_dp *intel_d=
p,
>>  				  &rate_select, 1);
>>=20=20
>>  	link_config[0] =3D crtc_state->vrr.enable ? DP_MSA_TIMING_PAR_IGNORE_E=
N : 0;
>> -	link_config[1] =3D DP_SET_ANSI_8B10B;
>> +	link_config[1] =3D crtc_state->port_clock > 1000000 ?
>
> Should this be >=3D ?

Yes, whoops, thanks!

>
>> +		DP_SET_ANSI_128B132B : DP_SET_ANSI_8B10B;
>>  	drm_dp_dpcd_write(&intel_dp->aux, DP_DOWNSPREAD_CTRL, link_config, 2);
>>=20=20
>>  	intel_dp->DP |=3D DP_PORT_EN;
>> --=20
>> 2.20.1

--=20
Jani Nikula, Intel Open Source Graphics Center
