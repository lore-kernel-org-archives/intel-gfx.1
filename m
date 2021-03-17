Return-Path: <SRS0=PXPa=IP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF848C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 18:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C2F64E31
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 18:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C2F64E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EFB6E83F;
	Wed, 17 Mar 2021 18:04:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F10C6E83F
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 18:04:09 +0000 (UTC)
IronPort-SDR: avq/T0BC/bmMQdSLWMMtkK4/uUyCPv9rNUpQ7vJxVmqhvIDV4HqPMBLblhRZSspVultSdbO9H+
 7VbYIm8F0pjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="186159254"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="186159254"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 11:04:08 -0700
IronPort-SDR: bpAUgvrqHr9Img2SEOg3t8CSTtcmHL+afRh3RtpK71qU1nG5ItBVUXXFC6wVkvAfcR+3GN+7XP
 XZSiA5DmVtuw==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="412751325"
Received: from jpferrer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.46.99])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 11:04:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210311223632.3191939-25-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210311223632.3191939-1-matthew.d.roper@intel.com>
 <20210311223632.3191939-25-matthew.d.roper@intel.com>
Date: Wed, 17 Mar 2021 20:04:03 +0200
Message-ID: <877dm5odws.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 24/56] drm/i915/adl_p: Add PCI Devices IDs
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

On Thu, 11 Mar 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
> From: Clinton Taylor <Clinton.A.Taylor@intel.com>
>
> Add 12 known PCI device IDs
>
> Bspec: 55376
> Cc: Caz Yokoyama <caz.yokoyama@intel.com>
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Clinton Taylor <Clinton.A.Taylor@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  include/drm/i915_pciids.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> index ebd0dd1c35b3..6607b65e7ae2 100644
> --- a/include/drm/i915_pciids.h
> +++ b/include/drm/i915_pciids.h
> @@ -645,4 +645,24 @@
>  	INTEL_VGA_DEVICE(0x4692, info), \
>  	INTEL_VGA_DEVICE(0x4693, info)
>  
> +/* ADL-P */
> +#define INTEL_ADLP_IDS(info) \
> +	INTEL_VGA_DEVICE(0x46A0, info), \
> +	INTEL_VGA_DEVICE(0x46A1, info), \
> +	INTEL_VGA_DEVICE(0x46A2, info), \
> +	INTEL_VGA_DEVICE(0x46A3, info), \
> +	INTEL_VGA_DEVICE(0x46A6, info), \
> +	INTEL_VGA_DEVICE(0x46A8, info), \
> +	INTEL_VGA_DEVICE(0x46AA, info), \
> +	INTEL_VGA_DEVICE(0x462A, info), \
> +	INTEL_VGA_DEVICE(0x4626, info), \
> +	INTEL_VGA_DEVICE(0x4628, info), \
> +	INTEL_VGA_DEVICE(0x46B0, info), \
> +	INTEL_VGA_DEVICE(0x46B1, info), \
> +	INTEL_VGA_DEVICE(0x46B2, info), \
> +	INTEL_VGA_DEVICE(0x46B3, info), \
> +	INTEL_VGA_DEVICE(0x46C0, info), \
> +	INTEL_VGA_DEVICE(0x46C1, info), \
> +	INTEL_VGA_DEVICE(0x46C2, info), \
> +	INTEL_VGA_DEVICE(0x46C3, info)

Nitpick, this loses the blank line here.

>  #endif /* _I915_PCIIDS_H */

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
