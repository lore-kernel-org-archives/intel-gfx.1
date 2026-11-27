Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D6606A31C
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2026 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aRtvdWQG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E62112CB7;
	Fri, 27 Nov 2026 18:08:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89FE112CB1
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Nov 2026 18:08:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 812754518F;
 Fri, 27 Nov 2026 18:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503351F00893;
 Fri, 27 Nov 2026 18:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795802891;
 bh=BGrI6uYzRz1TszNBBClVAfEb3MTdoDZU7+fE58UdTDE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=aRtvdWQGiEcCGTyuaPKyyMXf2pbUtsHXE17SUM1Tp6ZMgcbQ6ao6B0wvN4/dnKPyi
 IvrPZziUAuiizRG6orXQVFiMtRqa663jpT/yHLmlpPef/bC3HnS2SJsb8TMjkZhW6x
 jyvB8AUMruxbzk4A17hn+z/aKPtRCcxnsGhgZ53xuwEhGQ+wlQPYc88Lf3s/hQMMu2
 Cx2QZeL0xno2JKnK0Xs7cUCIEeR7DAIYk+hGKMADxHUidi6wvqR3pP6yPWnDw/EsIB
 xHDycwGfzdHXwOhJXuOcljv7cuJ4ZhfmrD0uir1vC/3hsnEy7r+fQyhn37iBh7Yd4j
 waeGnJ+7XobZA==
Message-ID: <sashiko-outbox-238045@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/i915/gvt: reduce some display includes
To: "Jani Nikula" <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <11a0a2afacdf720d9da8df2f8bed773edfb80d3d.1795802238.git.jani.nikula@intel.com>
References: <cover.1795802238.git.jani.nikula@intel.com>
 <11a0a2afacdf720d9da8df2f8bed773edfb80d3d.1795802238.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 18:08:10 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/i915/gvt: leftover intel_dpio_phy.h include in mmio.c
--

commit bfb839a271fa5e5315ca732afa20ab6d5fd14754
Author: Jani Nikula <jani.nikula@intel.com>

drm/i915/gvt: reduce some display includes

This commit duplicates a few DPLL, FBC, and DPIO definitions in
drivers/gpu/drm/i915/gvt/display_registers.h so that GVT does not need to
include intel_dpio_phy.h, intel_dpll_mgr.h, or intel_fbc.h.

> diff --git a/drivers/gpu/drm/i915/gvt/display_registers.h b/drivers/gpu/d=
rm/i915/gvt/display_registers.h
> index 9505da8c43e08..7a18198cc5694 100644
> --- a/drivers/gpu/drm/i915/gvt/display_registers.h
> +++ b/drivers/gpu/drm/i915/gvt/display_registers.h
> @@ -34,6 +34,16 @@
>  #include "display/skl_watermark_regs.h"
>  #include "display/vlv_dsi_pll_regs.h"
> =20
> +/* some duplicate definitions to avoid extra display includes */
> +#define DPLL_ID_SKL_DPLL0 0
> +#define DPLL_ID_WRPLL1 0
> +#define DPLL_ID_WRPLL2 1
> +#define INTEL_FBC_A 0
> +#define DPIO_CH0 0
> +#define DPIO_CH1 1
> +#define DPIO_PHY0 0
> +#define DPIO_PHY1 1

[Severity: Low]
Should display/intel_dpio_phy.h also be removed from
drivers/gpu/drm/i915/gvt/mmio.c?

drivers/gpu/drm/i915/gvt/mmio.c still includes display/intel_dpio_phy.h
right before display_registers.h and only uses DPIO_PHY0 and DPIO_PHY1 in
intel_vgpu_reset_mmio(), so the DPIO identifiers end up defined as both
enum constants and preprocessor macros in that translation unit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795802238.gi=
t.jani.nikula@intel.com?part=3D3
