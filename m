Return-Path: <SRS0=BkXb=GK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA10C433E6
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 17:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13F6D233CE
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 17:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13F6D233CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661D26E4B7;
	Thu,  7 Jan 2021 17:28:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5CE6E4B7
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 17:28:33 +0000 (UTC)
IronPort-SDR: OUsHQdC9cdUBlWJobONn4r3VInwbhsnc23ivh92l4zzgMkizaGefSec/jS6YxRRm5Qh68/c4FD
 UJP+UJYWcw5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="165155107"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="165155107"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 09:28:32 -0800
IronPort-SDR: FUhAkRmVUG+tNcn3/t08AR56NYt4ggSbkkCFxIvobEJaD0m8krGOBZDIw7xMdaxKjy+QA3slPB
 nzgd1Mg4EsLg==
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="422651383"
Received: from muhymini-mobl.amr.corp.intel.com (HELO localhost)
 ([10.213.207.83])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 09:28:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Saichandana S <saichandana.s@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20210104103036.1443-1-saichandana.s@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210104103036.1443-1-saichandana.s@intel.com>
Date: Thu, 07 Jan 2021 19:28:27 +0200
Message-ID: <87sg7czmf8.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/debugfs : PM_REQ and PM_RES
 registers
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
Cc: saichandana.s@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 04 Jan 2021, Saichandana S <saichandana.s@intel.com> wrote:
> From: Saichandana <saichandana.s@intel.com>
>
> PM_REQ register provides the value of the last PM request from PCU to
> Display Engine.PM_RES register provides the value of the last PM
> response from Display Engine to PCU.This debugfs will be used by
> DC9 IGT test to know about "DC9 Ready" status.
>
> B.Spec : 49501, 49502
>
> Signed-off-by: Saichandana <saichandana.s@intel.com>
> ---
>  .../drm/i915/display/intel_display_debugfs.c  | 30 +++++++++++++++++++
>  drivers/gpu/drm/i915/i915_reg.h               |  8 +++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index cd7e5519ee7d..551fb1a90bb3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -559,6 +559,36 @@ static int i915_dmc_info(struct seq_file *m, void *unused)
>  	return 0;
>  }
>  
> +static int i915_pm_req_res_info(struct seq_file *m, void *unused)
> +{
> +	struct drm_i915_private *dev_priv = node_to_i915(m->private);

All new code should call the local variable "i915".

> +	struct intel_csr *csr = &dev_priv->csr;
> +	const char *status;
> +
> +	if (!HAS_CSR(dev_priv))
> +		return -ENODEV;
> +	if (!csr->dmc_payload)
> +		return 0;
> +	seq_printf(m, "PM debug request 0 (0x45284): 0x%08x\n",
> +		   intel_de_read(dev_priv, PM_REQ_DBG_0));
> +	seq_printf(m, "PM debug request 1 (0x45288): 0x%08x\n",
> +		   intel_de_read(dev_priv, PM_REQ_DBG_1));
> +	seq_printf(m, "PM debug response 0 (0x4528C): 0x%08x\n",
> +		   intel_de_read(dev_priv, PM_RSP_DBG_0));
> +	seq_printf(m, "PM debug response 1 (0x45290): 0x%08x\n",
> +		   intel_de_read(dev_priv, PM_RSP_DBG_1));

Like I said before [1], do *not* dump the registers. We have userspace
tools for dumping register contents as-is when you need that for debug
purposes. And even the userspace tool can do some register content
parsing. See tools/intel_reg in igt.

The only reason to have a debugfs file is to provide some other, added
value that a register dump can't provide.

[1] http://lore.kernel.org/r/87mtyl8vpu.fsf@intel.com

> +	status = (intel_de_read(dev_priv, PM_RSP_DBG_1) & MASK_DC9_BIT) ? "yes" : "no";

See yesno() in i915_utils.h. You probably don't want the local variable
for the string.

> +
> +	seq_printf(m, "Time to Next Fill = 0x%0x\n",
> +		   (intel_de_read(dev_priv, PM_RSP_DBG_0) & ~MASK_RSP_0));
> +	seq_printf(m, "Time to Next VBI = 0x%0x\n",
> +		   ((intel_de_read(dev_priv, PM_RSP_DBG_0) & MASK_RSP_0)) >> 16);
> +	seq_printf(m, "Selective Exit Latency = 0x%0x\n",
> +		   (intel_de_read(dev_priv, PM_RSP_DBG_1) & MASK_RSP_1));

There's a bunch of unnecessary parenthesis around the 3rd parameter to
seq_printf.

> +	seq_printf(m, "DC9 Ready = %s\n", status);
> +	return 0;
> +}
> +
>  static void intel_seq_print_mode(struct seq_file *m, int tabs,
>  				 const struct drm_display_mode *mode)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0023c023f472..3e9ed555f928 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -371,6 +371,14 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define VLV_G3DCTL		_MMIO(0x9024)
>  #define VLV_GSCKGCTL		_MMIO(0x9028)
>  
> +#define PM_REQ_DBG_0		_MMIO(0x45284)
> +#define PM_REQ_DBG_1		_MMIO(0x45288)
> +#define PM_RSP_DBG_0		_MMIO(0x4528C)
> +#define PM_RSP_DBG_1		_MMIO(0x45290)
> +#define MASK_RSP_0		(0xFFFF << 16)
> +#define MASK_RSP_1		(7 << 0)
> +#define MASK_DC9_BIT		(1 << 17)

This is a random location in i915_reg.h, out of place.

Please also read the big comment near the top of this file.

BR,
Jani.


> +
>  #define GEN6_MBCTL		_MMIO(0x0907c)
>  #define   GEN6_MBCTL_ENABLE_BOOT_FETCH	(1 << 4)
>  #define   GEN6_MBCTL_CTX_FETCH_NEEDED	(1 << 3)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
