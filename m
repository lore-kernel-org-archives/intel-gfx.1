Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDFE606A693
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cgurv0Pz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1724F10E06F;
	Wed, 25 Nov 2026 09:12:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B2710E06F
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2026 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795597934; x=1827133934;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=aNukOzmlXVqA/8iQWnrnYysxtma7Ts3S2ZJ9/rBGiC0=;
 b=cgurv0PzZgz3Y8iYFXcvAkEgCKrlTNL2pwQC7CYsW7iqKQg3UehUhqFL
 6Kc9AMlXY+6HGu0QOyjO6a3h/OdpzBe1GWCS/QHG87WPEeiHiJizzn4Fa
 KWVYQUHd2mpSI4JaYI5bkTSboaxWU0Gc4tW5nvCkBRP+iZn5q25fUB1ZQ
 2QuOJxBCGzl84VqfclDx0KPVVEELp543+DQ9Jh2WV2j32QBo33vniVcQL
 qvINFjhmynw1Wq/jNStInHru07VfaJmwY5OmXGqqouX4cD9ww2nPQxa3U
 6i4ZIGJlYkV/NDaDhAXfxji57S+tBLjlZ03Y7tpntSetiwlxfm5UkucJT A==;
X-CSE-ConnectionGUID: dVutmMvmQF6Op1REUcWydQ==
X-CSE-MsgGUID: Uw9JTwW5S5KnzSBJzL6qUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4325867"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4325867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:12:14 -0800
X-CSE-ConnectionGUID: fN/TxFPnRDOiBt3hCxAqgg==
X-CSE-MsgGUID: nyCtA6PtT3OBGW9gCLH8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12126437"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:12:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/uncore: hide uncore forcewake iterators
In-Reply-To: <awXsjTEyzIWAIhOP@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124181405.1669126-1-jani.nikula@intel.com>
 <20261124181405.1669126-2-jani.nikula@intel.com>
 <awXsjTEyzIWAIhOP@intel.com>
Date: Wed, 25 Nov 2026 11:12:11 +0200
Message-ID: <2fc2f86379a7db6bb8e3b91707aeaf01354362ab@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Nov 24, 2026 at 08:14:05PM +0200, Jani Nikula wrote:
>> There are no users of for_each_fw_domain_masked() and
>> for_each_fw_domain() left outside of intel_uncore.c. Hide them from the
>> rest of the driver.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/intel_uncore.c | 8 ++++++++
>>  drivers/gpu/drm/i915/intel_uncore.h | 8 --------
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/=
intel_uncore.c
>> index 02f6000b203e..cefcec468963 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.c
>> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>> @@ -42,6 +42,14 @@
>>  #define FORCEWAKE_ACK_TIMEOUT_MS 50
>>  #define GT_FIFO_TIMEOUT_MS	 10
>>=20=20
>> +/* Iterate over initialised fw domains */
>> +#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__) \
>> +	for (tmp__ =3D (mask__); tmp__ ;) \
>> +		for_each_if(domain__ =3D (uncore__)->fw_domain[__mask_next_bit(tmp__)=
])
>> +
>> +#define for_each_fw_domain(domain__, uncore__, tmp__) \
>> +	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore__, =
tmp__)
>> +
>
> Selftests use these. Do they include the whole .c file or something?

Yes. I hate it, but I'm dodging that battle.

>
>>  struct intel_uncore *to_intel_uncore(struct drm_device *drm)
>>  {
>>  	return &to_i915(drm)->uncore;
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/=
intel_uncore.h
>> index d5de6a172ff3..1819c9430181 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.h
>> +++ b/drivers/gpu/drm/i915/intel_uncore.h
>> @@ -175,14 +175,6 @@ struct intel_uncore {
>>  	unsigned int user_forcewake_count;
>>  };
>>=20=20
>> -/* Iterate over initialised fw domains */
>> -#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__) \
>> -	for (tmp__ =3D (mask__); tmp__ ;) \
>> -		for_each_if(domain__ =3D (uncore__)->fw_domain[__mask_next_bit(tmp__)=
])
>> -
>> -#define for_each_fw_domain(domain__, uncore__, tmp__) \
>> -	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore__, =
tmp__)
>> -
>>  static inline bool
>>  intel_uncore_has_forcewake(const struct intel_uncore *uncore)
>>  {
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
