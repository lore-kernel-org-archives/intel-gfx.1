Return-Path: <SRS0=ggpC=KU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836B4C2B9F8
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 17:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472EC61378
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 17:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472EC61378
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16D76EA8B;
	Tue, 25 May 2021 17:27:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B146EA8B
 for <intel-gfx@lists.freedesktop.org>; Tue, 25 May 2021 17:27:18 +0000 (UTC)
IronPort-SDR: S47zSdcrCzNww3Xt6Y76GjdvZyHWHvUfNBZFZ6kT/iFTgH4w42ZpfmQVrDoJYdN46MxpN1KC7v
 07G4WvyDdGzQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182576673"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="182576673"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:27:16 -0700
IronPort-SDR: 7vS+4do2UmWshmjQXvO3OLOEhu/SlejDNs/3D0V7pkJ9W1HvmWf3R4qQAUcRW2b002tX9hvakf
 H1sY1RksvBNA==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="479404648"
Received: from zpatel-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.34.12])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:27:16 -0700
Date: Tue, 25 May 2021 10:27:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20210525172715.dd6sl2ix4r4pgdpu@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210524192103.4521-1-anusha.srivatsa@intel.com>
 <20210524192103.4521-4-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524192103.4521-4-anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [CI 3/3] drm/i915/dmc: Move struct intel_dmc to
 intel_dmc.h
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 12:21:03PM -0700, Anusha Srivatsa wrote:
>Move struct intel_dmc from i915_drv.h to intel_dmc.h.
>
>v2: Add includes along with moving the struct.
>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/intel_dmc.h | 21 +++++++++++++++++++++
> drivers/gpu/drm/i915/i915_drv.h          | 18 +-----------------
> 2 files changed, 22 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc.h b/drivers/gpu/drm/i915/display/intel_dmc.h
>index 64816f4a71b6..4c22f567b61b 100644
>--- a/drivers/gpu/drm/i915/display/intel_dmc.h
>+++ b/drivers/gpu/drm/i915/display/intel_dmc.h
>@@ -6,12 +6,33 @@
> #ifndef __INTEL_DMC_H__
> #define __INTEL_DMC_H__
>
>+#include "i915_reg.h"
>+#include "intel_wakeref.h"
>+#include <linux/workqueue.h>
>+
> struct drm_i915_private;
>
> #define DMC_VERSION(major, minor)	((major) << 16 | (minor))
> #define DMC_VERSION_MAJOR(version)	((version) >> 16)
> #define DMC_VERSION_MINOR(version)	((version) & 0xffff)
>
>+struct intel_dmc {
>+	struct work_struct work;
>+	const char *fw_path;
>+	u32 required_version;
>+	u32 max_fw_size; /* bytes */
>+	u32 *dmc_payload;
>+	u32 dmc_fw_size; /* dwords */
>+	u32 version;
>+	u32 mmio_count;
>+	i915_reg_t mmioaddr[20];
>+	u32 mmiodata[20];
>+	u32 dc_state;
>+	u32 target_dc_state;
>+	u32 allowed_dc_mask;
>+	intel_wakeref_t wakeref;
>+};
>+
> void intel_dmc_ucode_init(struct drm_i915_private *i915);
> void intel_dmc_load_program(struct drm_i915_private *i915);
> void intel_dmc_ucode_fini(struct drm_i915_private *i915);
>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>index 9cb02618ba15..b5962768a1f1 100644
>--- a/drivers/gpu/drm/i915/i915_drv.h
>+++ b/drivers/gpu/drm/i915/i915_drv.h
>@@ -67,6 +67,7 @@
> #include "display/intel_bios.h"
> #include "display/intel_display.h"
> #include "display/intel_display_power.h"
>+#include "display/intel_dmc.h"
> #include "display/intel_dpll_mgr.h"
> #include "display/intel_dsb.h"
> #include "display/intel_frontbuffer.h"
>@@ -328,23 +329,6 @@ struct drm_i915_display_funcs {
> 	void (*read_luts)(struct intel_crtc_state *crtc_state);
> };
>
>-struct intel_dmc {
>-	struct work_struct work;
>-	const char *fw_path;
>-	u32 required_version;
>-	u32 max_fw_size; /* bytes */
>-	u32 *dmc_payload;
>-	u32 dmc_fw_size; /* dwords */
>-	u32 version;
>-	u32 mmio_count;
>-	i915_reg_t mmioaddr[20];
>-	u32 mmiodata[20];
>-	u32 dc_state;
>-	u32 target_dc_state;
>-	u32 allowed_dc_mask;
>-	intel_wakeref_t wakeref;
>-};
>-
> enum i915_cache_level {
> 	I915_CACHE_NONE = 0,
> 	I915_CACHE_LLC, /* also used for snoopable memory on non-LLC */
>-- 
>2.25.0
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
