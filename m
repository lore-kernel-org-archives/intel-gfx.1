Return-Path: <SRS0=x+Hj=G4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFADC433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 17:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B99C22D04
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 17:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B99C22D04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7876E0C6;
	Mon, 25 Jan 2021 17:51:10 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF6C6E0C6
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 17:51:08 +0000 (UTC)
IronPort-SDR: 4tBEzMEjub+9Dg0UhDOGgOnw3y/YGk8EPBxqnfL8e2dmAsD7VtYTXGijLjrs2Z68tutJ4Iw6Z2
 kSvWcVsKVUvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="166870295"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="166870295"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 09:51:08 -0800
IronPort-SDR: qtpxy26jhgwdbc26/eCSz65/huDQXzIsYyoxRrz9ulxuDI7wX6UkbsXTtA5ZaMOtS40ZCkKulw
 HOvMytSms6UA==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="577501217"
Received: from vlesnikx-mobl1.amr.corp.intel.com (HELO ldmartin-desk1)
 ([10.212.30.223])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 09:51:05 -0800
Date: Mon, 25 Jan 2021 09:51:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aditya Swarup <aditya.swarup@intel.com>
Message-ID: <20210125175102.rjmonvdwwlsylxhv@ldmartin-desk1>
X-Patchwork-Hint: comment
References: <20210125140753.347998-1-aditya.swarup@intel.com>
 <20210125140753.347998-5-aditya.swarup@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125140753.347998-5-aditya.swarup@intel.com>
Subject: Re: [Intel-gfx] [PATCH 04/10] drm/i915/adl_s: Add PHYs for
 Alderlake S
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 06:07:47AM -0800, Aditya Swarup wrote:
>From: Anusha Srivatsa <anusha.srivatsa@intel.com>
>
>Alderlake-S has 5 combo phys, add reg definitions for
>combo phys and update the port to phy helper for ADL-S.
>
>v2:
>- Change IS_GEN() >=3D 12 to IS_TIGERLAKE() in intel_phy_is_tc()
>and return false for platforms RKL,DG1 and ADLS.(mdroper)

changelog here is missing v3: fix intel_phy_is_tc breakage for DG1

but only for completeness... I remembered there was an issue in this
patch but I was not finding what it was and went to check. This one lgtm


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>Cc: Imre Deak <imre.deak@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>Signed-off-by: Aditya Swarup <aditya.swarup@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_display.c | 12 +++++++-----
> drivers/gpu/drm/i915/i915_reg.h              |  5 ++++-
> 2 files changed, 11 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/dr=
m/i915/display/intel_display.c
>index 7ec7d94b8cdb..acf06feffd3e 100644
>--- a/drivers/gpu/drm/i915/display/intel_display.c
>+++ b/drivers/gpu/drm/i915/display/intel_display.c
>@@ -5668,6 +5668,8 @@ bool intel_phy_is_combo(struct drm_i915_private *dev=
_priv, enum phy phy)
> {
> 	if (phy =3D=3D PHY_NONE)
> 		return false;
>+	else if (IS_ALDERLAKE_S(dev_priv))
>+		return phy <=3D PHY_E;
> 	else if (IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv))
> 		return phy <=3D PHY_D;
> 	else if (IS_JSL_EHL(dev_priv))
>@@ -5680,11 +5682,9 @@ bool intel_phy_is_combo(struct drm_i915_private *de=
v_priv, enum phy phy)
>
> bool intel_phy_is_tc(struct drm_i915_private *dev_priv, enum phy phy)
> {
>-	if (IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv))
>-		return false;
>-	else if (INTEL_GEN(dev_priv) >=3D 12)
>+	if (IS_TIGERLAKE(dev_priv))
> 		return phy >=3D PHY_D && phy <=3D PHY_I;
>-	else if (INTEL_GEN(dev_priv) >=3D 11 && !IS_JSL_EHL(dev_priv))
>+	else if (IS_ICELAKE(dev_priv))
> 		return phy >=3D PHY_C && phy <=3D PHY_F;
> 	else
> 		return false;
>@@ -5692,7 +5692,9 @@ bool intel_phy_is_tc(struct drm_i915_private *dev_pr=
iv, enum phy phy)
>
> enum phy intel_port_to_phy(struct drm_i915_private *i915, enum port port)
> {
>-	if ((IS_DG1(i915) || IS_ROCKETLAKE(i915)) && port >=3D PORT_TC1)
>+	if (IS_ALDERLAKE_S(i915) && port >=3D PORT_TC1)
>+		return PHY_B + port - PORT_TC1;
>+	else if ((IS_DG1(i915) || IS_ROCKETLAKE(i915)) && port >=3D PORT_TC1)
> 		return PHY_C + port - PORT_TC1;
> 	else if (IS_JSL_EHL(i915) && port =3D=3D PORT_D)
> 		return PHY_A;
>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_r=
eg.h
>index 8b9bbc6bacb1..0fe499840b82 100644
>--- a/drivers/gpu/drm/i915/i915_reg.h
>+++ b/drivers/gpu/drm/i915/i915_reg.h
>@@ -1874,10 +1874,13 @@ static inline bool i915_mmio_reg_valid(i915_reg_t =
reg)
> #define _ICL_COMBOPHY_B			0x6C000
> #define _EHL_COMBOPHY_C			0x160000
> #define _RKL_COMBOPHY_D			0x161000
>+#define _ADL_COMBOPHY_E			0x16B000
>+
> #define _ICL_COMBOPHY(phy)		_PICK(phy, _ICL_COMBOPHY_A, \
> 					      _ICL_COMBOPHY_B, \
> 					      _EHL_COMBOPHY_C, \
>-					      _RKL_COMBOPHY_D)
>+					      _RKL_COMBOPHY_D, \
>+					      _ADL_COMBOPHY_E)
>
> /* CNL/ICL Port CL_DW registers */
> #define _ICL_PORT_CL_DW(dw, phy)	(_ICL_COMBOPHY(phy) + \
>-- =

>2.27.0
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
