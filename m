Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEA6CD37AC
	for <intel-gfx@archiver.kernel.org>; Wed, 13 May 2026 17:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CE810EF96;
	Wed, 13 May 2026 17:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2dx4kGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FB410EF96
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 May 2026 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778692793; x=1810228793;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OqCdIeKS141ROw5r0s40d984bpEiUsxDCPEW8taWPLY=;
 b=G2dx4kGSRlLWVtefLLwTlO1FU0y+lWjIPurwWbtCm2fgur50Z01KCWSv
 bilLDrA+yaoTrIjcKOwjbE7RoaMsXirIjc6cGGQRG7Ctu8mZm++9+1uGe
 SvHoK0LVKorIQr1zDCRqPoD8uFcNhsMOF4xD5SzowYIiUXbqRwMfEib4b
 gTskPlcdkjrhHySmJooehOBLfX4BtI89sBajnWvI7pO9pwJX58GSWwJhE
 v839OG5A5ZKO1VgT2x+QALTXzP0bZI8f5oh26V1DXryoAzDVYOfQ/CAr1
 rJ+RmlpYEO5VnW1LNJIVkig+gt3FoC1kWdN8tCUiFoATEEWS8YwHgxXvE w==;
X-CSE-ConnectionGUID: 6ZL36bUBRrOl/7KSwBzlRg==
X-CSE-MsgGUID: mm8czl5STfGsZ2XwUIJxZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83240314"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="83240314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:19:53 -0700
X-CSE-ConnectionGUID: JhRg/3IHRqqSSRWoMhaTcA==
X-CSE-MsgGUID: 86OeN+YkTqiJkZHuS2sPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="233875038"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.124])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:19:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND] drm/i915/sdvo: use the i2c bus locking functions
In-Reply-To: <agSLeFMnZTpyPVlv@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260513080103.169402-1-jani.nikula@intel.com>
 <agSLeFMnZTpyPVlv@intel.com>
Date: Wed, 13 May 2026 20:19:49 +0300
Message-ID: <cc75f4672e1b33dcd21cdf687be16ce6bae71381@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 13 May 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, May 13, 2026 at 11:01:03AM +0300, Jani Nikula wrote:
>> Use i2c_lock_bus(), i2c_trylock_bus(), and i2c_unlock_bus() instead of
>> poking at i2c adapter's lock_ops directly.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to din.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_sdvo.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm=
/i915/display/intel_sdvo.c
>> index 23c511a9a2ad..ba54c90828f4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
>> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
>> @@ -3319,7 +3319,7 @@ static void proxy_lock_bus(struct i2c_adapter *ada=
pter,
>>  	struct intel_sdvo_ddc *ddc =3D adapter->algo_data;
>>  	struct intel_sdvo *sdvo =3D ddc->sdvo;
>>=20=20
>> -	sdvo->i2c->lock_ops->lock_bus(sdvo->i2c, flags);
>> +	i2c_lock_bus(sdvo->i2c, flags);
>>  }
>>=20=20
>>  static int proxy_trylock_bus(struct i2c_adapter *adapter,
>> @@ -3328,7 +3328,7 @@ static int proxy_trylock_bus(struct i2c_adapter *a=
dapter,
>>  	struct intel_sdvo_ddc *ddc =3D adapter->algo_data;
>>  	struct intel_sdvo *sdvo =3D ddc->sdvo;
>>=20=20
>> -	return sdvo->i2c->lock_ops->trylock_bus(sdvo->i2c, flags);
>> +	return i2c_trylock_bus(sdvo->i2c, flags);
>>  }
>>=20=20
>>  static void proxy_unlock_bus(struct i2c_adapter *adapter,
>> @@ -3337,7 +3337,7 @@ static void proxy_unlock_bus(struct i2c_adapter *a=
dapter,
>>  	struct intel_sdvo_ddc *ddc =3D adapter->algo_data;
>>  	struct intel_sdvo *sdvo =3D ddc->sdvo;
>>=20=20
>> -	sdvo->i2c->lock_ops->unlock_bus(sdvo->i2c, flags);
>> +	i2c_unlock_bus(sdvo->i2c, flags);
>>  }
>>=20=20
>>  static const struct i2c_lock_operations proxy_lock_ops =3D {
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
