Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B460A2609
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CoiPvDzh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB2A11214C;
	Thu, 26 Nov 2026 08:21:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC0210E457
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2026 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795681273; x=1827217273;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XrKbSYQ/5IGFQMi4IspMvqte1MhzFR06SRyWHZ1z884=;
 b=CoiPvDzhY68SRNTm+Cuc9Fk2OjPuNfvDBDV6huOTJrjICcbekWO0OJ21
 gFvPaoeQLdowM1H1afsc/ZvjOEqXfWwQoNOeYh6SWADzhsYhy9TwRfugH
 pLQAH7uvVE+Se0BBesEOSWhqdFan6YgUSqzbTJH1GmH9P3NW+Tfshl7yM
 YtWrPTStzXpUEMQF4U5BcBQQQRGOh/QABnbN82Q4TZMESHSmxoG8A83xF
 MOsFyiukUEU2kRpKK2gJwU1GQ+HcIBVX/lklJDROpqP072lz36PzcB1SX
 zJwzjaUz1tzpzo9dlDWRXiowJUlQFPOypBN+QClsL1o7c06Mm54i5yW8V Q==;
X-CSE-ConnectionGUID: Saeu11x4SG2Tg89N0EcY8w==
X-CSE-MsgGUID: Pi853kw1Q3O+ZK9wtE4bMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4468008"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4468008"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:19:46 -0800
X-CSE-ConnectionGUID: nGd/0O6kS1OHhFMBCB6olw==
X-CSE-MsgGUID: ETRSFrYXRGW6NUIhiYSf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12711494"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:19:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/uncore: hide uncore forcewake iterators
In-Reply-To: <awbpx5Rcrc677txa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124181405.1669126-1-jani.nikula@intel.com>
 <20261124181405.1669126-2-jani.nikula@intel.com>
 <awXsjTEyzIWAIhOP@intel.com>
 <2fc2f86379a7db6bb8e3b91707aeaf01354362ab@intel.com>
 <awbpx5Rcrc677txa@intel.com>
Date: Thu, 26 Nov 2026 10:19:43 +0200
Message-ID: <4e57a575d6cace44edf6cdd2e11b0bd8ec09c428@intel.com>
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

On Wed, 25 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Nov 25, 2026 at 11:12:11AM +0200, Jani Nikula wrote:
>> On Tue, 24 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
>> > On Tue, Nov 24, 2026 at 08:14:05PM +0200, Jani Nikula wrote:
>> >> There are no users of for_each_fw_domain_masked() and
>> >> for_each_fw_domain() left outside of intel_uncore.c. Hide them from t=
he
>> >> rest of the driver.
>> >>=20
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/i915/intel_uncore.c | 8 ++++++++
>> >>  drivers/gpu/drm/i915/intel_uncore.h | 8 --------
>> >>  2 files changed, 8 insertions(+), 8 deletions(-)
>> >>=20
>> >> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i9=
15/intel_uncore.c
>> >> index 02f6000b203e..cefcec468963 100644
>> >> --- a/drivers/gpu/drm/i915/intel_uncore.c
>> >> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>> >> @@ -42,6 +42,14 @@
>> >>  #define FORCEWAKE_ACK_TIMEOUT_MS 50
>> >>  #define GT_FIFO_TIMEOUT_MS	 10
>> >>=20=20
>> >> +/* Iterate over initialised fw domains */
>> >> +#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__)=
 \
>> >> +	for (tmp__ =3D (mask__); tmp__ ;) \
>> >> +		for_each_if(domain__ =3D (uncore__)->fw_domain[__mask_next_bit(tmp=
__)])
>> >> +
>> >> +#define for_each_fw_domain(domain__, uncore__, tmp__) \
>> >> +	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore_=
_, tmp__)
>> >> +
>> >
>> > Selftests use these. Do they include the whole .c file or something?
>>=20
>> Yes. I hate it, but I'm dodging that battle.
>
> Hmm, yeah looks like the normal file includes the selftest file
> at the end. I was first looking for the opposite and was confused=20
> when I didn't find it.
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, both pushed to din.

>
>>=20
>> >
>> >>  struct intel_uncore *to_intel_uncore(struct drm_device *drm)
>> >>  {
>> >>  	return &to_i915(drm)->uncore;
>> >> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i9=
15/intel_uncore.h
>> >> index d5de6a172ff3..1819c9430181 100644
>> >> --- a/drivers/gpu/drm/i915/intel_uncore.h
>> >> +++ b/drivers/gpu/drm/i915/intel_uncore.h
>> >> @@ -175,14 +175,6 @@ struct intel_uncore {
>> >>  	unsigned int user_forcewake_count;
>> >>  };
>> >>=20=20
>> >> -/* Iterate over initialised fw domains */
>> >> -#define for_each_fw_domain_masked(domain__, mask__, uncore__, tmp__)=
 \
>> >> -	for (tmp__ =3D (mask__); tmp__ ;) \
>> >> -		for_each_if(domain__ =3D (uncore__)->fw_domain[__mask_next_bit(tmp=
__)])
>> >> -
>> >> -#define for_each_fw_domain(domain__, uncore__, tmp__) \
>> >> -	for_each_fw_domain_masked(domain__, (uncore__)->fw_domains, uncore_=
_, tmp__)
>> >> -
>> >>  static inline bool
>> >>  intel_uncore_has_forcewake(const struct intel_uncore *uncore)
>> >>  {
>> >> --=20
>> >> 2.47.3
>>=20
>> --=20
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
