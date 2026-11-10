Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6967F606A321
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kc6ZxiOx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0690F10E232;
	Tue, 10 Nov 2026 13:38:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E62C10E232
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794317913; x=1825853913;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=COXo2jY+V5H0M4W053PX5rKQs6oD+2g1UOJiaKSwPIg=;
 b=Kc6ZxiOxkN5lAKgbfFQtB51Y3LYwoGJxtOBGCTD01zP39kk1WSffuMmG
 QOCXmtESt/2iGnl/SHxk8/ik3Cnae0YJ9vVhc74eJYw5AT2Mx6vtW+wDK
 Cn3ikgKiGNBYVgWEOZ5RvoOsOI4tM8IKv2Xz+LYXkYIZ8i/f0YeYaMba2
 Hbs+rDCuXTtK+XZtJoadV6qCWLhAR0oz2Z2ojPBUlWgeMyOiiLLPevuYY
 N+zjloW0sLyUrQj4tpj1ILaO4EKlykncghyZOGHTr4L4iBxHqm7bLzeQd
 J5I1eu3TUfKUgOq1vBb0G0cr/nNwjNpgKYvT/ZUb3AYhVNqJFxs2Jr+AM A==;
X-CSE-ConnectionGUID: tXtQy65yTL6fjSpdhc/R5A==
X-CSE-MsgGUID: oEavYp9aQMaKT7SAN8AdPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2949584"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2949584"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:38:33 -0800
X-CSE-ConnectionGUID: NlCkxADRSkqt8wehBV4jfQ==
X-CSE-MsgGUID: 6HzqykXnSDqell+Q8wVzuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8297745"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.4])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:38:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/i915: Move GEN11 irq registers back into
 i915_reg.h
In-Reply-To: <20261110125942.11010-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261110125942.11010-1-ville.syrjala@linux.intel.com>
Date: Tue, 10 Nov 2026 15:38:22 +0200
Message-ID: <72419282c5a0bab737c8867b63889e04da0de92a@intel.com>
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

On Tue, 10 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The GEN11_* irq register definitions aren't needed outside the
> core i915 irq code anymore. Move the definitions from the global
> intel_gmd_interrupt_regs.h header back into the private i915_reg.h.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_reg.h              | 19 +++++++++++++++++++
>  include/drm/intel/intel_gmd_interrupt_regs.h | 19 -------------------
>  2 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index d873072b7a92..9c2f4c74e405 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -681,10 +681,29 @@
>  						      GEN8_PCU_IER, \
>  						      GEN8_PCU_IIR)
>=20=20
> +#define GEN11_GU_MISC_ISR	_MMIO(0x444f0)
> +#define GEN11_GU_MISC_IMR	_MMIO(0x444f4)
> +#define GEN11_GU_MISC_IIR	_MMIO(0x444f8)
> +#define GEN11_GU_MISC_IER	_MMIO(0x444fc)
> +#define  GEN11_GU_MISC_GSE	(1 << 27)
> +
> +#define GEN11_GU_MISC_IRQ_REGS		I915_IRQ_REGS(GEN11_GU_MISC_IMR, \
> +						      GEN11_GU_MISC_IER, \
> +						      GEN11_GU_MISC_IIR)
> +
>  #define DG1_MSTR_TILE_INTR		_MMIO(0x190008)
>  #define   DG1_MSTR_IRQ			REG_BIT(31)
>  #define   DG1_MSTR_TILE(t)		REG_BIT(t)
>=20=20
> +#define GEN11_GFX_MSTR_IRQ		_MMIO(0x190010)
> +#define  GEN11_MASTER_IRQ		(1 << 31)
> +#define  GEN11_PCU_IRQ			(1 << 30)
> +#define  GEN11_GU_MISC_IRQ		(1 << 29)
> +#define  GEN11_DISPLAY_IRQ		(1 << 16)
> +#define  GEN11_GT_DW_IRQ(x)		(1 << (x))
> +#define  GEN11_GT_DW1_IRQ		(1 << 1)
> +#define  GEN11_GT_DW0_IRQ		(1 << 0)
> +
>  #define IVB_CHICKEN3		_MMIO(0x4200c)
>  #define   CHICKEN3_DGMG_REQ_OUT_FIX_DISABLE	REG_BIT(5)
>  #define   CHICKEN3_DGMG_DONE_FIX_DISABLE	REG_BIT(2)
> diff --git a/include/drm/intel/intel_gmd_interrupt_regs.h b/include/drm/i=
ntel/intel_gmd_interrupt_regs.h
> index ce66c4151e76..0d85ec907396 100644
> --- a/include/drm/intel/intel_gmd_interrupt_regs.h
> +++ b/include/drm/intel/intel_gmd_interrupt_regs.h
> @@ -58,25 +58,6 @@
>  #define  GEN8_GT_BCS_IRQ		(1 << 1)
>  #define  GEN8_GT_RCS_IRQ		(1 << 0)
>=20=20
> -#define GEN11_GU_MISC_ISR	_MMIO(0x444f0)
> -#define GEN11_GU_MISC_IMR	_MMIO(0x444f4)
> -#define GEN11_GU_MISC_IIR	_MMIO(0x444f8)
> -#define GEN11_GU_MISC_IER	_MMIO(0x444fc)
> -#define  GEN11_GU_MISC_GSE	(1 << 27)
> -
> -#define GEN11_GU_MISC_IRQ_REGS		I915_IRQ_REGS(GEN11_GU_MISC_IMR, \
> -						      GEN11_GU_MISC_IER, \
> -						      GEN11_GU_MISC_IIR)
> -
> -#define GEN11_GFX_MSTR_IRQ		_MMIO(0x190010)
> -#define  GEN11_MASTER_IRQ		(1 << 31)
> -#define  GEN11_PCU_IRQ			(1 << 30)
> -#define  GEN11_GU_MISC_IRQ		(1 << 29)
> -#define  GEN11_DISPLAY_IRQ		(1 << 16)
> -#define  GEN11_GT_DW_IRQ(x)		(1 << (x))
> -#define  GEN11_GT_DW1_IRQ		(1 << 1)
> -#define  GEN11_GT_DW0_IRQ		(1 << 0)
> -
>  #define SCPD0		_MMIO(0x209c) /* 915+ only */
>  #define  SCPD_FBC_IGNORE_3D			(1 << 6)
>  #define  CSTATE_RENDER_CLOCK_GATE_DISABLE	(1 << 5)

--=20
Jani Nikula, Intel
