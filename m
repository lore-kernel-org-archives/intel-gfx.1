Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56912606A321
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jmTea9TK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFC810E25A;
	Mon,  9 Nov 2026 14:27:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A984E10E25A
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794234466; x=1825770466;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=dHPa8ycUsfh0aOSEhWvCNiPJBXcVuDkuyab5t03UsJY=;
 b=jmTea9TKDHXoeHAg93qJBJTCpRxBiNnyZCmLpMKwGiD65cG2CY1z91Mr
 +Yrv25dSx5pLEk/Ds0t7dXOF1W8eRES0PI9mRls/prYt4b5Rn94jagibF
 sq9tD8rMMkYZAHq+lyZtaxL8UB6fjrWHKBe5cT3s5fv4OmWcBrmZRBDsT
 fSh+tYO9r+lLQYUyYBkPxodsmY/16/gwvbK94+h8QPZxlKHCuShxYWOEX
 SGPwRKSo0vNUUbZPwauJHomj5HP/g95y8ORndtu+5pSehTiobZm71w8/M
 A0IQU37syw5KZ4hkXqTZt2ijyCO3Fv+P1+wVDEeiWumO5cZ3piDtFB016 w==;
X-CSE-ConnectionGUID: 3vbeIIDDS2KN8t9+HLhHxQ==
X-CSE-MsgGUID: TqTaT7KmQ5KSgXYnzN6KMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2982244"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2982244"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:27:45 -0800
X-CSE-ConnectionGUID: TaTeZtjbR02AtEhxsoIOtQ==
X-CSE-MsgGUID: 2FpuFtzHTlmMETw6Fx2ZtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7765120"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:27:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i915/irq: Check the master bit outside
 gen11_gu_misc_irq_ack()
In-Reply-To: <20261109123012.8110-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
 <20261109123012.8110-4-ville.syrjala@linux.intel.com>
Date: Mon, 09 Nov 2026 16:27:41 +0200
Message-ID: <0ed8eef5270646619eb0ef30807f6f80327132be@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 09 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Pull the master GEN11_GU_MISC_IRQ bit check out from
> gen11_gu_misc_irq_ack(). This is just to make the code more
> consistent, with all the other sub irq handlers already checking
> the master bit(s) in the top level irq handlers.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_irq.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index b3fc3e31a5d4..648d76600c49 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -493,14 +493,10 @@ static inline void gen11_master_intr_enable(void __=
iomem * const regs)
>  	raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, GEN11_MASTER_IRQ);
>  }
>=20=20
> -static u32 gen11_gu_misc_irq_ack(void __iomem * const regs,
> -				 u32 master_ctl)
> +static u32 gen11_gu_misc_irq_ack(void __iomem * const regs)
>  {
>  	u32 iir;
>=20=20
> -	if (!(master_ctl & GEN11_GU_MISC_IRQ))
> -		return 0;
> -
>  	iir =3D raw_reg_read(regs, GEN11_GU_MISC_IIR);
>  	if (likely(iir))
>  		raw_reg_write(regs, GEN11_GU_MISC_IIR, iir);
> @@ -514,8 +510,8 @@ static irqreturn_t gen11_irq_handler(int irq, void *a=
rg)
>  	struct intel_display *display =3D i915->display;
>  	void __iomem * const regs =3D intel_uncore_regs(&i915->uncore);
>  	struct intel_gt *gt =3D to_gt(i915);
> +	u32 gu_misc_iir =3D 0;
>  	u32 master_ctl;
> -	u32 gu_misc_iir;
>=20=20
>  	if (!intel_irqs_enabled(i915))
>  		return IRQ_NONE;
> @@ -534,7 +530,8 @@ static irqreturn_t gen11_irq_handler(int irq, void *a=
rg)
>  	if (master_ctl & GEN11_DISPLAY_IRQ)
>  		intel_display_irq_handler(display, NULL);
>=20=20
> -	gu_misc_iir =3D gen11_gu_misc_irq_ack(regs, master_ctl);
> +	if (master_ctl & GEN11_GU_MISC_IRQ)
> +		gu_misc_iir =3D gen11_gu_misc_irq_ack(regs);
>=20=20
>  	gen11_master_intr_enable(regs);
>=20=20
> @@ -575,7 +572,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	struct intel_gt *gt =3D to_gt(i915);
>  	void __iomem * const regs =3D intel_uncore_regs(gt->uncore);
>  	u32 master_tile_ctl, master_ctl;
> -	u32 gu_misc_iir;
> +	u32 gu_misc_iir =3D 0;
>=20=20
>  	if (!intel_irqs_enabled(i915))
>  		return IRQ_NONE;
> @@ -603,7 +600,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	if (master_ctl & GEN11_DISPLAY_IRQ)
>  		intel_display_irq_handler(display, NULL);
>=20=20
> -	gu_misc_iir =3D gen11_gu_misc_irq_ack(regs, master_ctl);
> +	if (master_ctl & GEN11_GU_MISC_IRQ)
> +		gu_misc_iir =3D gen11_gu_misc_irq_ack(regs);
>=20=20
>  	dg1_master_intr_enable(regs);

--=20
Jani Nikula, Intel
