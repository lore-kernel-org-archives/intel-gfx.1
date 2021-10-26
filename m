Return-Path: <SRS0=bGS0=PO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669B0C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 17:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D99260E8F
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 17:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D99260E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9086789C9D;
	Tue, 26 Oct 2021 17:07:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE06789C9D
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Oct 2021 17:07:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="230224687"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="230224687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 09:05:19 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="497408850"
Received: from flaboura-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 09:05:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>
In-Reply-To: <YXfMpUTtd9MwTsU3@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211026084208.2574-1-jani.nikula@intel.com>
 <20211026093407.11381-1-jani.nikula@intel.com> <YXfMpUTtd9MwTsU3@intel.com>
Date: Tue, 26 Oct 2021 19:05:13 +0300
Message-ID: <877ddzkc06.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/dp: fix integer overflow in
 128b/132b data rate calculation
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

On Tue, 26 Oct 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Oct 26, 2021 at 12:34:07PM +0300, Jani Nikula wrote:
>> The intermediate value 1000000 * 10 * 9671 overflows 32 bits, so force
>> promotion to a bigger type.
>>=20
>> >From the logs:
>>=20
>> [drm:intel_dp_compute_config [i915]] DP link rate required 3657063 avail=
able -580783288
>>=20
>> v2: Use mul_u32_u32() (Ville)
>>=20
>> Fixes: 48efd014f0ea ("drm/i915/dp: add max data rate calculation for UHB=
R rates")
>> Cc: Manasi Navare <manasi.d.navare@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i=
915/display/intel_dp.c
>> index f5dc2126d140..537c689a1528 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -352,7 +352,7 @@ intel_dp_max_data_rate(int max_link_rate, int max_la=
nes)
>>  		 */
>>  		int max_link_rate_kbps =3D max_link_rate * 10;
>>=20=20
>> -		max_link_rate_kbps =3D DIV_ROUND_CLOSEST_ULL(max_link_rate_kbps * 967=
1, 10000);
>> +		max_link_rate_kbps =3D DIV_ROUND_CLOSEST_ULL(mul_u32_u32(max_link_rat=
e_kbps, 9671), 10000);
>>  		max_link_rate =3D max_link_rate_kbps / 8;
>>  	}
>>=20=20
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
