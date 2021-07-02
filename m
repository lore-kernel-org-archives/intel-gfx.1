Return-Path: <SRS0=xVQy=L2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CC5C11F68
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Jul 2021 12:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A74761413
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Jul 2021 12:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A74761413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B306E16D;
	Fri,  2 Jul 2021 12:43:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6A6E165;
 Fri,  2 Jul 2021 12:43:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="196013394"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="196013394"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 05:43:02 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="455940626"
Received: from juanniex-mobl.ger.corp.intel.com (HELO [10.213.253.90])
 ([10.213.253.90])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 05:43:01 -0700
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-9-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <96b1625f-1b72-d28c-6d92-02bd5d255277@linux.intel.com>
Date: Fri, 2 Jul 2021 13:42:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701202427.1547543-9-matthew.d.roper@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 08/53] drm/i915/xehp: Extra media engines -
 Part 2 (interrupts)
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 01/07/2021 21:23, Matt Roper wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Xe_HP can have a lot of extra media engines. This patch adds the
> interrupt handler support for them.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c | 13 ++++++++++++-
>   drivers/gpu/drm/i915/i915_reg.h        |  3 +++
>   2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index c13462274fe8..b2de83be4d97 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -184,7 +184,13 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>   	intel_uncore_write(uncore, GEN11_BCS_RSVD_INTR_MASK,	~0);
>   	intel_uncore_write(uncore, GEN11_VCS0_VCS1_INTR_MASK,	~0);
>   	intel_uncore_write(uncore, GEN11_VCS2_VCS3_INTR_MASK,	~0);
> +	if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
> +		intel_uncore_write(uncore, GEN12_VCS4_VCS5_INTR_MASK,   ~0);
> +	if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
> +		intel_uncore_write(uncore, GEN12_VCS6_VCS7_INTR_MASK,   ~0);
>   	intel_uncore_write(uncore, GEN11_VECS0_VECS1_INTR_MASK,	~0);
> +	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
> +		intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~0);
>   
>   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
>   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
> @@ -218,8 +224,13 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   	intel_uncore_write(uncore, GEN11_BCS_RSVD_INTR_MASK, ~smask);
>   	intel_uncore_write(uncore, GEN11_VCS0_VCS1_INTR_MASK, ~dmask);
>   	intel_uncore_write(uncore, GEN11_VCS2_VCS3_INTR_MASK, ~dmask);
> +	if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
> +		intel_uncore_write(uncore, GEN12_VCS4_VCS5_INTR_MASK, ~dmask);
> +	if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
> +		intel_uncore_write(uncore, GEN12_VCS6_VCS7_INTR_MASK, ~dmask);
>   	intel_uncore_write(uncore, GEN11_VECS0_VECS1_INTR_MASK, ~dmask);

Poor 0-1 sandwiched between 4-7 and 2-3. ;) With hopefully order restored:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> -
> +	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
> +		intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~dmask);
>   	/*
>   	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>   	 * is enabled/disabled.
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index d4546e871833..cb1716b6ce72 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8076,7 +8076,10 @@ enum {
>   #define GEN11_BCS_RSVD_INTR_MASK	_MMIO(0x1900a0)
>   #define GEN11_VCS0_VCS1_INTR_MASK	_MMIO(0x1900a8)
>   #define GEN11_VCS2_VCS3_INTR_MASK	_MMIO(0x1900ac)
> +#define GEN12_VCS4_VCS5_INTR_MASK	_MMIO(0x1900b0)
> +#define GEN12_VCS6_VCS7_INTR_MASK	_MMIO(0x1900b4)
>   #define GEN11_VECS0_VECS1_INTR_MASK	_MMIO(0x1900d0)
> +#define GEN12_VECS2_VECS3_INTR_MASK	_MMIO(0x1900d4)
>   #define GEN11_GUC_SG_INTR_MASK		_MMIO(0x1900e8)
>   #define GEN11_GPM_WGBOXPERF_INTR_MASK	_MMIO(0x1900ec)
>   #define GEN11_CRYPTO_RSVD_INTR_MASK	_MMIO(0x1900f0)
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
