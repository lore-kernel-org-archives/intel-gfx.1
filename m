Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AD1606A322
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMjJxN1V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFAD10E23A;
	Mon,  9 Nov 2026 12:37:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A973010F25F
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 12:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794227829; x=1825763829;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=RaLJ5EVm+vbwPeg2bfYFvFt/DjrT9TWH+LFRN5c96oI=;
 b=JMjJxN1V/ryAiXhuWHuxt0V/Fb3LUGhHDIX2a1sbwvZl1tQdPz+X+v7U
 V8hleADuS8qScIcDLsk4zpg2kp7NjSmD6+KTBLeq3t4Ygnx8sgvrtMep8
 yYaAvW2YqwbmT0ys6Mh2f8ANuTJeMnYs4x4o4mcU2FpIkzDukope3OGlS
 gSMOT11jYjiqiqaIsS+bIT0KuPyA3l4fl3nT84jpp6K7Rg/2LpQzNbGlB
 FnWQA8AmHzdL2eZ4QkW+J75w96cRttsr8n+CoxuPrtw4GNfAChcu2RsOX
 QnnaMbpO87fZxsSKhU9TzKzqdS4WQ5prSjGTZ+NqwYu7U4Q8K7h6+ul9D A==;
X-CSE-ConnectionGUID: 0vC+HbVmST+lE96884oXCQ==
X-CSE-MsgGUID: FJoAHC62TJ6xFIM1j/W8oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2864038"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2864038"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:37:09 -0800
X-CSE-ConnectionGUID: srKWhry8QDGCiSt8OsawxA==
X-CSE-MsgGUID: f4LVL+BEQsKlGbeUkC4AtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8014404"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:37:08 -0800
Date: Mon, 9 Nov 2026 14:37:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/i915/irq: Don't call gen8_gt_irq_handler()
 needlessly
Message-ID: <avG-cZIl6qt08iKX@intel.com>
References: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
 <20261109123012.8110-2-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261109123012.8110-2-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Nov 09, 2026 at 02:30:10PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> We already have GEN8_GT_IRQS to teel whether any of the GT

s/teel/test/ lol

> interrupts need processing. If none of the relevant bits are
> set skip the whole gen8_gt_irq_handler(), as a micro optimization.
> We already do the equivalent for the display irqs, so why not
> do it for GT irqs as well.
> 
> Originally gen8_gt_irq_handler() was a static inline, so this
> probably wouldn't have made sense. But these days it's a proper
> function call every time.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_irq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 0762017d9089..448c4730d178 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -455,7 +455,8 @@ static irqreturn_t gen8_irq_handler(int irq, void *arg)
>  	}
>  
>  	/* Find, queue (onto bottom-halves), then clear each source */
> -	gen8_gt_irq_handler(to_gt(dev_priv), master_ctl);
> +	if (master_ctl & GEN8_GT_IRQS)
> +		gen8_gt_irq_handler(to_gt(dev_priv), master_ctl);
>  
>  	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
>  	if (master_ctl & ~GEN8_GT_IRQS) {
> -- 
> 2.56.0

-- 
Ville Syrjälä
Intel
