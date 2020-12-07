Return-Path: <SRS0=NHSF=FL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94E6C4361B
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Dec 2020 11:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B24723340
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Dec 2020 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B24723340
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B651789CF5;
	Mon,  7 Dec 2020 11:10:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6446A89CF5
 for <Intel-gfx@lists.freedesktop.org>; Mon,  7 Dec 2020 11:10:58 +0000 (UTC)
IronPort-SDR: DIutbh+ukr7LKq3MsQ8/S2EJmH71Ux09VC4Pihz6v46+FA72Ima6NLTSZpyCw0H/iBmuITegao
 3Cvbgh81LKUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="153496248"
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="153496248"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 03:10:58 -0800
IronPort-SDR: Am5OsBfWyNk6MDf20QJf+8G47MC31YOmioReaWylPT7qZFHpevdiJqSXNJi5z55c2cDwVn4ATD
 Ds8g0CsIGPKQ==
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="317079818"
Received: from tcujba-mobl.ger.corp.intel.com (HELO localhost) ([10.252.9.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 03:10:56 -0800
MIME-Version: 1.0
In-Reply-To: <20201207002134.13731-5-sean.z.huang@intel.com>
References: <20201207002134.13731-1-sean.z.huang@intel.com>
 <20201207002134.13731-5-sean.z.huang@intel.com>
To: "Huang, Sean Z" <sean.z.huang@intel.com>, Intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160733945441.9322.7949963502281538695@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 07 Dec 2020 13:10:54 +0200
Subject: Re: [Intel-gfx] [RFC-v1 04/16] drm/i915/pxp: set KCR reg init
 during the boot time
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Huang, Sean Z (2020-12-07 02:21:22)
> Set the KCR init during the boot time, which is required by
> hardware, to allow us doing further protection operation such
> as sending commands to GPU or TEE
> 
> Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>

<SNIP>

> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -6,6 +6,7 @@
>  #include "i915_drv.h"
>  #include "intel_pxp.h"
>  #include "intel_pxp_context.h"
> +#include "intel_pxp_sm.h"
>  
>  static void intel_pxp_write_irq_mask_reg(struct drm_i915_private *i915, u32 mask)
>  {
> @@ -77,6 +78,8 @@ static void intel_pxp_irq_work(struct work_struct *work)
>  
>  int intel_pxp_init(struct drm_i915_private *i915)
>  {
> +       int ret;
> +
>         if (!i915)
>                 return -EINVAL;
>  
> @@ -92,13 +95,19 @@ int intel_pxp_init(struct drm_i915_private *i915)
>                 return -EFAULT;
>         }
>  
> +       ret = pxp_sm_set_kcr_init_reg(i915);

I think this should just be intel_pxp_sm_init() and then do whatever it
needs to initialize. Also as we plan on having only a single session, I
don't see why would we want a separate session management file/header.

So I would be inclined to just inline the KCR_INIT macro write here. If
this is moved to appropriate spot during intel_gt initialization, we
should have the hardware wakeref, so would be just a single
intel_uncore_write.

> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
> + */
> +
> +#include "gt/intel_context.h"
> +#include "gt/intel_engine_pm.h"
> +
> +#include "intel_pxp.h"
> +#include "intel_pxp_sm.h"
> +#include "intel_pxp_context.h"
> +
> +static int pxp_reg_write(struct drm_i915_private *i915, u32 offset, u32 regval)
> +{
> +       intel_wakeref_t wakeref;
> +
> +       if (!i915)
> +               return -EINVAL;

Again, GEM_BUG_ON(!i915) should suffice.

> +
> +       with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +               i915_reg_t reg_offset = {offset};

See below, here we convert from u32 to i915_reg_t.

> +
> +               intel_uncore_write(&i915->uncore, reg_offset, regval);
> +       }

I don't think we want to grab the wakeref at a low level reg_write
function but at a higher levels to clearly distinct functions that need
to access hardware and those who don't.

> +       return 0;
> +}
> +
> +int pxp_sm_set_kcr_init_reg(struct drm_i915_private *i915)
> +{
> +       int ret;
> +
> +       ret = pxp_reg_write(i915, KCR_INIT.reg, KCR_INIT_ALLOW_DISPLAY_ME_WRITES);

See above related to offset. Here we convert to u32. We shouldn't escape
the protection offered by _MMIO macro.

Based on the register name this feels like it should somehow be related
to display init?

> +       if (ret)
> +               drm_err(&i915->drm, "Failed to write()\n");

There is an error message in the upper level function, so one of these
becomes redundant.

After this has been moved to intel_gt init, the hardware wakeref is
definitely held

> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_SM_H__
> +#define __INTEL_PXP_SM_H__
> +
> +#include "i915_drv.h"
> +#include "i915_reg.h"
> +
> +/* KCR register definitions */
> +#define KCR_INIT            _MMIO(0x320f0)
> +#define KCR_INIT_MASK_SHIFT (16)
> +/* Setting KCR Init bit is required after system boot */
> +#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES (BIT(14) | (BIT(14) << KCR_INIT_MASK_SHIFT))

If this is only used from single place, it should go to the .c file
that uses it.

Regards, Joonas
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
