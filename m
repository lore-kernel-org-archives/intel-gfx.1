Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC972606A31C
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2026 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ccEYJlZK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4492410E969;
	Thu, 26 Nov 2026 08:30:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A8210E95A
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2026 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795681808; x=1827217808;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=IgALbm61eTsV/MrJIoiDFkqC+hx4kr3sy7xaKzicBW8=;
 b=ccEYJlZKl3bqr4ahsck3tnUcV7cjTGmS97zsT7DYbm+qCclUjz9fEhsr
 JRClfqi1Oi6ydUrXoue06sWWQyrkw99QZgY0Cq6cCoMgULB1Jm/X84KT8
 4kSBrw99chadxRxN+eGIVpZC+s92T1GTRA/uLZVCgBLuv7bzNXYCqTUwj
 A+cOurHq4bjOENwoGiZk+93p9rJzi2iUe6uxi8cfSh+3AJ1zF9lVTJZ5k
 vjSTwG8sR3Fa8JxJsIC7flOVLE9befaz2kr6SLpQY49Ocwbf5Z6NaTzi2
 8KMCMBz2VUKYbFFZHsowIh4SecLz/LJh66LeNREykPqXLAttCyxBdnAGP g==;
X-CSE-ConnectionGUID: P9qKEd28QI+bUEoqAEd4Dw==
X-CSE-MsgGUID: ehDfufooT1WCcgUaf80PKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4492377"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4492377"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:29:54 -0800
X-CSE-ConnectionGUID: sJZ/36bYQK+e+fMG3JNZjA==
X-CSE-MsgGUID: kJnOd8qTQsijdNwN6pAlkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12146496"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:29:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/sbi: add and use intel_sbi_rmw()
In-Reply-To: <awX2Kv_A7kZs92fU@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124170441.1600907-1-jani.nikula@intel.com>
 <awX2Kv_A7kZs92fU@intel.com>
Date: Thu, 26 Nov 2026 10:29:50 +0200
Message-ID: <5b0684d5641c89547d226441a22d219a991316d0@intel.com>
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
> On Tue, Nov 24, 2026 at 07:04:41PM +0200, Jani Nikula wrote:
>> Almost all of SBI access is read-modify-write with separate reads and
>> writes. Add intel_sbi_rmw() modeled after intel_de_rwm(), and use it to
>> make the code more concise and easier to read.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  .../gpu/drm/i915/display/intel_pch_refclk.c   | 144 +++++-------------
>>  drivers/gpu/drm/i915/display/intel_sbi.c      |  12 ++
>>  drivers/gpu/drm/i915/display/intel_sbi.h      |   2 +
>>  3 files changed, 49 insertions(+), 109 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.c b/drivers/g=
pu/drm/i915/display/intel_pch_refclk.c
>> index 5f88663ef5e8..fe9dbc2b21ee 100644
>> --- a/drivers/gpu/drm/i915/display/intel_pch_refclk.c
>> +++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
>> @@ -36,91 +36,32 @@ static void lpt_fdi_reset_mphy(struct intel_display =
*display)
>>  /* WaMPhyProgramming:hsw */
>>  static void lpt_fdi_program_mphy(struct intel_display *display)
>>  {
>> -	u32 tmp;
>> -
>>  	lpt_fdi_reset_mphy(display);
>>=20=20
>> -	tmp =3D intel_sbi_read(display, 0x8008, SBI_MPHY);
>> -	tmp &=3D ~(0xFF << 24);
>> -	tmp |=3D (0x12 << 24);
>> -	intel_sbi_write(display, 0x8008, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x2008, SBI_MPHY);
>> -	tmp |=3D (1 << 11);
>> -	intel_sbi_write(display, 0x2008, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x2108, SBI_MPHY);
>> -	tmp |=3D (1 << 11);
>> -	intel_sbi_write(display, 0x2108, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x206C, SBI_MPHY);
>> -	tmp |=3D (1 << 24) | (1 << 21) | (1 << 18);
>> -	intel_sbi_write(display, 0x206C, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x216C, SBI_MPHY);
>> -	tmp |=3D (1 << 24) | (1 << 21) | (1 << 18);
>> -	intel_sbi_write(display, 0x216C, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x2080, SBI_MPHY);
>> -	tmp &=3D ~(7 << 13);
>> -	tmp |=3D (5 << 13);
>> -	intel_sbi_write(display, 0x2080, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x2180, SBI_MPHY);
>> -	tmp &=3D ~(7 << 13);
>> -	tmp |=3D (5 << 13);
>> -	intel_sbi_write(display, 0x2180, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x208C, SBI_MPHY);
>> -	tmp &=3D ~0xFF;
>> -	tmp |=3D 0x1C;
>> -	intel_sbi_write(display, 0x208C, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x218C, SBI_MPHY);
>> -	tmp &=3D ~0xFF;
>> -	tmp |=3D 0x1C;
>> -	intel_sbi_write(display, 0x218C, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x2098, SBI_MPHY);
>> -	tmp &=3D ~(0xFF << 16);
>> -	tmp |=3D (0x1C << 16);
>> -	intel_sbi_write(display, 0x2098, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x2198, SBI_MPHY);
>> -	tmp &=3D ~(0xFF << 16);
>> -	tmp |=3D (0x1C << 16);
>> -	intel_sbi_write(display, 0x2198, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x20C4, SBI_MPHY);
>> -	tmp |=3D (1 << 27);
>> -	intel_sbi_write(display, 0x20C4, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x21C4, SBI_MPHY);
>> -	tmp |=3D (1 << 27);
>> -	intel_sbi_write(display, 0x21C4, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x20EC, SBI_MPHY);
>> -	tmp &=3D ~(0xF << 28);
>> -	tmp |=3D (4 << 28);
>> -	intel_sbi_write(display, 0x20EC, tmp, SBI_MPHY);
>> -
>> -	tmp =3D intel_sbi_read(display, 0x21EC, SBI_MPHY);
>> -	tmp &=3D ~(0xF << 28);
>> -	tmp |=3D (4 << 28);
>> -	intel_sbi_write(display, 0x21EC, tmp, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x8008, 0xFF << 24, 0x12 << 24, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x2008, 0, 1 << 11, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x2108, 0, 1 << 11, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x206C, 0, (1 << 24) | (1 << 21) | (1 << 18), S=
BI_MPHY);
>> +	intel_sbi_rmw(display, 0x216C, 0, (1 << 24) | (1 << 21) | (1 << 18), S=
BI_MPHY);
>> +	intel_sbi_rmw(display, 0x2080, 7 << 13, 5 << 13, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x2180, 7 << 13, 5 << 13, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x208C, 0xFF, 0x1C, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x218C, 0xFF, 0x1C, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x2098, 0xFF << 16, 0x1C << 16, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x2198, 0xFF << 16, 0x1C << 16, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x20C4, 0, 1 << 27, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x21C4, 0, 1 << 27, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x20EC, 0xF << 28, 4 << 28, SBI_MPHY);
>> +	intel_sbi_rmw(display, 0x21EC, 0xF << 28, 4 << 28, SBI_MPHY);
>
> If only the diff would group these in a sane way :/
>
> Went a bit cross-eyed looking at this, but it looks correct to me.
> Asked Claude to double check it and it didn't spot any unintended
> changes either.
>
> Claude did spot a "rmw" vs. "rwm" typo in the commit message,
> and...
>
>>  }
>>=20=20
>>  void lpt_disable_iclkip(struct intel_display *display)
>>  {
>> -	u32 temp;
>> -
>>  	intel_de_write(display, PIXCLK_GATE, PIXCLK_GATE_GATE);
>>=20=20
>>  	intel_sbi_lock(display);
>>=20=20
>> -	temp =3D intel_sbi_read(display, SBI_SSCCTL6, SBI_ICLK);
>> -	temp |=3D SBI_SSCCTL_DISABLE;
>> -	intel_sbi_write(display, SBI_SSCCTL6, temp, SBI_ICLK);
>> +	intel_sbi_rmw(display, SBI_SSCCTL6, 0, SBI_SSCCTL_DISABLE, SBI_ICLK);
>>=20=20
>>  	intel_sbi_unlock(display);
>>  }
>> @@ -185,7 +126,6 @@ void lpt_program_iclkip(const struct intel_crtc_stat=
e *crtc_state)
>>  	struct intel_display *display =3D to_intel_display(crtc_state);
>>  	int clock =3D crtc_state->hw.adjusted_mode.crtc_clock;
>>  	struct iclkip_params p;
>> -	u32 temp;
>>=20=20
>>  	lpt_disable_iclkip(display);
>>=20=20
>> @@ -205,25 +145,23 @@ void lpt_program_iclkip(const struct intel_crtc_st=
ate *crtc_state)
>>  	intel_sbi_lock(display);
>>=20=20
>>  	/* Program SSCDIVINTPHASE6 */
>> -	temp =3D intel_sbi_read(display, SBI_SSCDIVINTPHASE6, SBI_ICLK);
>> -	temp &=3D ~SBI_SSCDIVINTPHASE_DIVSEL_MASK;
>> -	temp |=3D SBI_SSCDIVINTPHASE_DIVSEL(p.divsel);
>> -	temp &=3D ~SBI_SSCDIVINTPHASE_INCVAL_MASK;
>> -	temp |=3D SBI_SSCDIVINTPHASE_INCVAL(p.phaseinc);
>> -	temp |=3D SBI_SSCDIVINTPHASE_DIR(p.phasedir);
>> -	temp |=3D SBI_SSCDIVINTPHASE_PROPAGATE;
>> -	intel_sbi_write(display, SBI_SSCDIVINTPHASE6, temp, SBI_ICLK);
>> +	intel_sbi_rmw(display, SBI_SSCDIVINTPHASE6,
>> +		      SBI_SSCDIVINTPHASE_DIVSEL_MASK |
>> +		      SBI_SSCDIVINTPHASE_INCVAL_MASK,
>
> ... we both noticed that we don't clear the DIR bit here,
> which means if it was set previously it'll remain set
> when p.phasedir=3D=3D0 (which it always is).
>
> But according to the spec we shouldn't even be touching
> that bit (its specific meaning isn't even documented).
> So the code actually matches the spec by accident. This
> bit is probably some prehistoric leftover that we should
> just completely nuke.
>
> Anyways, this patch is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, fixed the rwm typo and added much of the above as a note to the
commit message while pushing.

>
>> +		      SBI_SSCDIVINTPHASE_DIVSEL(p.divsel) |
>> +		      SBI_SSCDIVINTPHASE_INCVAL(p.phaseinc) |
>> +		      SBI_SSCDIVINTPHASE_DIR(p.phasedir) |
>> +		      SBI_SSCDIVINTPHASE_PROPAGATE,
>> +		      SBI_ICLK);
>>=20=20
>>  	/* Program SSCAUXDIV */
>> -	temp =3D intel_sbi_read(display, SBI_SSCAUXDIV6, SBI_ICLK);
>> -	temp &=3D ~SBI_SSCAUXDIV_FINALDIV2SEL(1);
>> -	temp |=3D SBI_SSCAUXDIV_FINALDIV2SEL(p.auxdiv);
>> -	intel_sbi_write(display, SBI_SSCAUXDIV6, temp, SBI_ICLK);
>> +	intel_sbi_rmw(display, SBI_SSCAUXDIV6,
>> +		      SBI_SSCAUXDIV_FINALDIV2SEL(1),
>> +		      SBI_SSCAUXDIV_FINALDIV2SEL(p.auxdiv),
>> +		      SBI_ICLK);
>>=20=20
>>  	/* Enable modulator and associated divider */
>> -	temp =3D intel_sbi_read(display, SBI_SSCCTL6, SBI_ICLK);
>> -	temp &=3D ~SBI_SSCCTL_DISABLE;
>> -	intel_sbi_write(display, SBI_SSCCTL6, temp, SBI_ICLK);
>> +	intel_sbi_rmw(display, SBI_SSCCTL6, SBI_SSCCTL_DISABLE, 0, SBI_ICLK);
>>=20=20
>>  	intel_sbi_unlock(display);
>>=20=20
>> @@ -277,7 +215,7 @@ int lpt_get_iclkip(struct intel_display *display)
>>  static void lpt_enable_clkout_dp(struct intel_display *display,
>>  				 bool with_spread, bool with_fdi)
>>  {
>> -	u32 reg, tmp;
>> +	u32 reg;
>>=20=20
>>  	if (drm_WARN(display->drm, with_fdi && !with_spread,
>>  		     "FDI requires downspread\n"))
>> @@ -288,26 +226,19 @@ static void lpt_enable_clkout_dp(struct intel_disp=
lay *display,
>>=20=20
>>  	intel_sbi_lock(display);
>>=20=20
>> -	tmp =3D intel_sbi_read(display, SBI_SSCCTL, SBI_ICLK);
>> -	tmp &=3D ~SBI_SSCCTL_DISABLE;
>> -	tmp |=3D SBI_SSCCTL_PATHALT;
>> -	intel_sbi_write(display, SBI_SSCCTL, tmp, SBI_ICLK);
>> +	intel_sbi_rmw(display, SBI_SSCCTL, SBI_SSCCTL_DISABLE, SBI_SSCCTL_PATH=
ALT, SBI_ICLK);
>>=20=20
>>  	udelay(24);
>>=20=20
>>  	if (with_spread) {
>> -		tmp =3D intel_sbi_read(display, SBI_SSCCTL, SBI_ICLK);
>> -		tmp &=3D ~SBI_SSCCTL_PATHALT;
>> -		intel_sbi_write(display, SBI_SSCCTL, tmp, SBI_ICLK);
>> +		intel_sbi_rmw(display, SBI_SSCCTL, SBI_SSCCTL_PATHALT, 0, SBI_ICLK);
>>=20=20
>>  		if (with_fdi)
>>  			lpt_fdi_program_mphy(display);
>>  	}
>>=20=20
>>  	reg =3D HAS_PCH_LPT_LP(display) ? SBI_GEN0 : SBI_DBUFF0;
>> -	tmp =3D intel_sbi_read(display, reg, SBI_ICLK);
>> -	tmp |=3D SBI_GEN0_CFG_BUFFENABLE_DISABLE;
>> -	intel_sbi_write(display, reg, tmp, SBI_ICLK);
>> +	intel_sbi_rmw(display, reg, 0, SBI_GEN0_CFG_BUFFENABLE_DISABLE, SBI_IC=
LK);
>>=20=20
>>  	intel_sbi_unlock(display);
>>  }
>> @@ -320,9 +251,7 @@ void lpt_disable_clkout_dp(struct intel_display *dis=
play)
>>  	intel_sbi_lock(display);
>>=20=20
>>  	reg =3D HAS_PCH_LPT_LP(display) ? SBI_GEN0 : SBI_DBUFF0;
>> -	tmp =3D intel_sbi_read(display, reg, SBI_ICLK);
>> -	tmp &=3D ~SBI_GEN0_CFG_BUFFENABLE_DISABLE;
>> -	intel_sbi_write(display, reg, tmp, SBI_ICLK);
>> +	intel_sbi_rmw(display, reg, SBI_GEN0_CFG_BUFFENABLE_DISABLE, 0, SBI_IC=
LK);
>>=20=20
>>  	tmp =3D intel_sbi_read(display, SBI_SSCCTL, SBI_ICLK);
>>  	if (!(tmp & SBI_SSCCTL_DISABLE)) {
>> @@ -389,10 +318,7 @@ static void lpt_bend_clkout_dp(struct intel_display=
 *display, int steps)
>>  		tmp =3D 0x00000000;
>>  	intel_sbi_write(display, SBI_SSCDITHPHASE, tmp, SBI_ICLK);
>>=20=20
>> -	tmp =3D intel_sbi_read(display, SBI_SSCDIVINTPHASE, SBI_ICLK);
>> -	tmp &=3D 0xffff0000;
>> -	tmp |=3D sscdivintphase[idx];
>> -	intel_sbi_write(display, SBI_SSCDIVINTPHASE, tmp, SBI_ICLK);
>> +	intel_sbi_rmw(display, SBI_SSCDIVINTPHASE, 0x0000ffff, sscdivintphase[=
idx], SBI_ICLK);
>>=20=20
>>  	intel_sbi_unlock(display);
>>  }
>> diff --git a/drivers/gpu/drm/i915/display/intel_sbi.c b/drivers/gpu/drm/=
i915/display/intel_sbi.c
>> index b636a0060d39..e671a8b5f3be 100644
>> --- a/drivers/gpu/drm/i915/display/intel_sbi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_sbi.c
>> @@ -81,6 +81,18 @@ void intel_sbi_write(struct intel_display *display, u=
16 reg, u32 value,
>>  	intel_sbi_rw(display, reg, destination, &value, false);
>>  }
>>=20=20
>> +u32 intel_sbi_rmw(struct intel_display *display, u16 reg, u32 clear, u3=
2 set,
>> +		  enum intel_sbi_destination destination)
>> +{
>> +	u32 old, val;
>> +
>> +	old =3D intel_sbi_read(display, reg, destination);
>> +	val =3D (old & ~clear) | set;
>> +	intel_sbi_write(display, reg, val, destination);
>> +
>> +	return old;
>> +}
>> +
>>  void intel_sbi_init(struct intel_display *display)
>>  {
>>  	mutex_init(&display->sbi.lock);
>> diff --git a/drivers/gpu/drm/i915/display/intel_sbi.h b/drivers/gpu/drm/=
i915/display/intel_sbi.h
>> index 841f77a142a1..5e4afbbf25a6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_sbi.h
>> +++ b/drivers/gpu/drm/i915/display/intel_sbi.h
>> @@ -23,5 +23,7 @@ u32 intel_sbi_read(struct intel_display *display, u16 =
reg,
>>  		   enum intel_sbi_destination destination);
>>  void intel_sbi_write(struct intel_display *display, u16 reg, u32 value,
>>  		     enum intel_sbi_destination destination);
>> +u32 intel_sbi_rmw(struct intel_display *display, u16 reg, u32 clear, u3=
2 set,
>> +		  enum intel_sbi_destination destination);
>>=20=20
>>  #endif /* _INTEL_SBI_H_ */
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
