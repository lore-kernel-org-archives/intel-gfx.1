Return-Path: <SRS0=c41V=KQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359B3C04FF3
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 23:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB50613F7
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 23:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB50613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C36F93A;
	Fri, 21 May 2021 23:29:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836626F93A
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 May 2021 23:29:40 +0000 (UTC)
IronPort-SDR: JHYELFwn+rY9auY/WfP8OZamfSorQiqcafSiWw6qgPEe/Rb/Vgl8/NXeJFuUEqwUyMGQpUvStv
 mJSLW7l5lI3A==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="201628525"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="201628525"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 16:29:39 -0700
IronPort-SDR: FCTjgzXsKZH93tj0SvqqzD0y7++vu12CoyLQZEghnYN5UDLwI+wXS5WcPvCQC6JepxIUGc0sOL
 NpmIZFji0XPQ==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="545613364"
Received: from nfreij-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.33.58])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 16:29:38 -0700
Date: Fri, 21 May 2021 16:29:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20210521232937.yh5i7y44cewk6pni@ldmartin-desk2>
References: <20210521230114.2563-1-anusha.srivatsa@intel.com>
 <20210521230114.2563-4-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521230114.2563-4-anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/dmc: Move struct intel_dmc to
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

On Fri, May 21, 2021 at 04:01:10PM -0700, Anusha Srivatsa wrote:
>Move struct intel_dmc from i915_drv.h to intel_dmc.h.
>
>v2: Add includes along with moving the struct.
>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_dmc.h | 21 +++++++++++++++++++++
> drivers/gpu/drm/i915/i915_drv.h          | 18 +-----------------
> 2 files changed, 22 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc.h b/drivers/gpu/drm/i915/display/intel_dmc.h
>index 64816f4a71b6..8baeb85cf8db 100644
>--- a/drivers/gpu/drm/i915/display/intel_dmc.h
>+++ b/drivers/gpu/drm/i915/display/intel_dmc.h
>@@ -6,12 +6,33 @@
> #ifndef __INTEL_DMC_H__
> #define __INTEL_DMC_H__
>
>+#include <drm/drm_util.h>

I can't find what this is for in this patch. You actually need
<linux/workqueue.h>

other than that,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+#include "intel_wakeref.h"
>+#include "i915_reg.h"
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
