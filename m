Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD59606A7F7
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LmJ5KDMm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D1610E4F7;
	Tue, 10 Nov 2026 13:40:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8788510E4F7
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794318015; x=1825854015;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=qAUfsb4vOzkW8D6XbeYwTo9XMyvM19ovSlKx6nBZhxo=;
 b=LmJ5KDMmgpTF9AJz10+81cw8k0g9C8KGlcH15cX+IDiaYjLb9YEuQfIq
 8JgZbTdhAGmoUnc2r+M24/CN1lQdb4MDgFGOUWyJ4SwvpehcZ60Y++G9D
 X0u8g/EvczhLlXGIAeZvyBolxDmcLU6vxEDVNY9S4jPxngEilcOgibL/t
 +weGyWI2ThGL6n7D6Iaa1cSWYTXmjDnlSjAKhsM+ZrSXuJPI6prQaAXG/
 AiD0FMyzXf0gRBURtBC5oHgu+JCb3JzFhh904XcfZZNwrKOyGU/8CVwOA
 6dBz4yagdboGjPVfuxd8OsNLvFhFs+Bub4l7Y296Z6Cey51lwXXb7Zt16 g==;
X-CSE-ConnectionGUID: zSN1XPQ/RB+JePkKYCqzlw==
X-CSE-MsgGUID: 2u+DhNa/T1+QJkA57p19Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3063106"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3063106"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:40:15 -0800
X-CSE-ConnectionGUID: KvBsKZhUQQihhIAIc6zQEg==
X-CSE-MsgGUID: hYL39PnfSh6ioq/Qrz7pDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8173135"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.4])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:40:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915: Clean up GEN11 irq regs
In-Reply-To: <20261110125942.11010-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261110125942.11010-1-ville.syrjala@linux.intel.com>
 <20261110125942.11010-2-ville.syrjala@linux.intel.com>
Date: Tue, 10 Nov 2026 15:40:11 +0200
Message-ID: <2042e25277785689aab220ec7a56ad4c20a08906@intel.com>
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

On Tue, 10 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use REG_BIT() and fix up the indentation for the GEN11 irq bits.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_reg.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 9c2f4c74e405..39b02e80f759 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -685,7 +685,7 @@
>  #define GEN11_GU_MISC_IMR	_MMIO(0x444f4)
>  #define GEN11_GU_MISC_IIR	_MMIO(0x444f8)
>  #define GEN11_GU_MISC_IER	_MMIO(0x444fc)
> -#define  GEN11_GU_MISC_GSE	(1 << 27)
> +#define   GEN11_GU_MISC_GSE	REG_BIT(27)
>=20=20
>  #define GEN11_GU_MISC_IRQ_REGS		I915_IRQ_REGS(GEN11_GU_MISC_IMR, \
>  						      GEN11_GU_MISC_IER, \
> @@ -696,13 +696,13 @@
>  #define   DG1_MSTR_TILE(t)		REG_BIT(t)
>=20=20
>  #define GEN11_GFX_MSTR_IRQ		_MMIO(0x190010)
> -#define  GEN11_MASTER_IRQ		(1 << 31)
> -#define  GEN11_PCU_IRQ			(1 << 30)
> -#define  GEN11_GU_MISC_IRQ		(1 << 29)
> -#define  GEN11_DISPLAY_IRQ		(1 << 16)
> -#define  GEN11_GT_DW_IRQ(x)		(1 << (x))
> -#define  GEN11_GT_DW1_IRQ		(1 << 1)
> -#define  GEN11_GT_DW0_IRQ		(1 << 0)
> +#define   GEN11_MASTER_IRQ		REG_BIT(31)
> +#define   GEN11_PCU_IRQ			REG_BIT(30)
> +#define   GEN11_GU_MISC_IRQ		REG_BIT(29)
> +#define   GEN11_DISPLAY_IRQ		REG_BIT(16)
> +#define   GEN11_GT_DW_IRQ(x)		REG_BIT(x)
> +#define   GEN11_GT_DW1_IRQ		REG_BIT(1)
> +#define   GEN11_GT_DW0_IRQ		REG_BIT(0)
>=20=20
>  #define IVB_CHICKEN3		_MMIO(0x4200c)
>  #define   CHICKEN3_DGMG_REQ_OUT_FIX_DISABLE	REG_BIT(5)

--=20
Jani Nikula, Intel
