Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC57606A33E
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HJD1sjwt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F1A10F3BB;
	Mon,  9 Nov 2026 14:24:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E7A10F3BB
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794234278; x=1825770278;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=zBwbLTPI8JHFdFsMrCbslZBG1AaSsZPAJ5a0IZzBqZA=;
 b=HJD1sjwtH+HzSgChzbzegh6XbN6HENey/jlf0uMeGNu8/WKppQTqkz61
 stEPQWdubVOcnW89q9tjaF2sDnKAbdLcBmMP42gM6U8PJH5mhFaC4AXcL
 /ATqm7Y9qYi5Wx3L6IOsIbmNCtGF2srcnaFfY+GkteMdBzinywn0/ry2j
 VrCmBfqZqx31FvxCwMOcsweBYo4Hyh8oG7D3AlwfO4ma22jGC+EVgYIo6
 Jha0tEmJ5ZK29nUM8WJ11Bpy2kyJvHghBilGf+Hr6q9dxPZ4iGsoAxYvh
 rReCNMnnRtin1IqxV+FQ8QKKW+4ziCHiZ6m9TQOfmRGoSTnnx/Ghh/kRd A==;
X-CSE-ConnectionGUID: UhJdcBT/SVqMKK6gwTuPTg==
X-CSE-MsgGUID: QU2vAq1ESQyB4GZdj6+FmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2853665"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2853665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:24:37 -0800
X-CSE-ConnectionGUID: 4uhpXvGHQPicSOpLp4DDtQ==
X-CSE-MsgGUID: T2LiMkPnSciLSmWBfFrnJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8227424"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:24:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/i915/irq: Don't call gen8_gt_irq_handler()
 needlessly
In-Reply-To: <20261109123012.8110-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
 <20261109123012.8110-2-ville.syrjala@linux.intel.com>
Date: Mon, 09 Nov 2026 16:24:31 +0200
Message-ID: <52d812a102fe9fc43a5811e700d8cf90085ff874@intel.com>
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

On Mon, 09 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We already have GEN8_GT_IRQS to teel whether any of the GT
> interrupts need processing. If none of the relevant bits are
> set skip the whole gen8_gt_irq_handler(), as a micro optimization.
> We already do the equivalent for the display irqs, so why not
> do it for GT irqs as well.
>
> Originally gen8_gt_irq_handler() was a static inline, so this
> probably wouldn't have made sense. But these days it's a proper
> function call every time.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

With the typo fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_irq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 0762017d9089..448c4730d178 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -455,7 +455,8 @@ static irqreturn_t gen8_irq_handler(int irq, void *ar=
g)
>  	}
>=20=20
>  	/* Find, queue (onto bottom-halves), then clear each source */
> -	gen8_gt_irq_handler(to_gt(dev_priv), master_ctl);
> +	if (master_ctl & GEN8_GT_IRQS)
> +		gen8_gt_irq_handler(to_gt(dev_priv), master_ctl);
>=20=20
>  	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
>  	if (master_ctl & ~GEN8_GT_IRQS) {

--=20
Jani Nikula, Intel
