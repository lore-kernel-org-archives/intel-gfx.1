Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DCB606A321
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jzdw+j24
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E7410F3C6;
	Mon,  9 Nov 2026 14:26:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE9210F3E9
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794234386; x=1825770386;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=ysPS1LcuGRAbsTSp9BZvalg2z0csWg1MU9ABFDcipy0=;
 b=Jzdw+j24hAurSTTlbmOVgo/uC/eYYXgANBs7ee22WkzUO86BCTzhf+LX
 /q3DrOFEc4IFU1fK2EgRGxTWJJm75MqbVDPCuOZCyBIe/Q3dZIecId0eN
 Ye3zZliIifcYu8rM+eVJ2B4Ns9Irb/bLfgrD88IoP/xG6IWS1sICNrj9w
 1JNGyiPu8ElJdyhytSEAUdpHtnBpUH4alFMLKh2BSYoRmeTFeDFDrjtqa
 Ls3u124NHgxmE+14oa059ewz+NzYo/1PnBc8LR88g7VuOjWhEu0WcXkdw
 WWtdr+jCK/W0eAqPYGlRIqYzl7r2Vxmtmf7xoWooLR5idRCZJJDHSJRzB Q==;
X-CSE-ConnectionGUID: CJdddfPjRZOdnW4YXz4onQ==
X-CSE-MsgGUID: eeg7OzWoS9myGiiaOvyQxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2951842"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2951842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:26:26 -0800
X-CSE-ConnectionGUID: QN7dUF7/QUazGV1c8bB+Ww==
X-CSE-MsgGUID: 8/5dz8B/SVqzNvuVAiiFGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7888877"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:26:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/irq: Don't call gen11_gt_irq_handler()
 needlessly
In-Reply-To: <20261109123012.8110-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
 <20261109123012.8110-3-ville.syrjala@linux.intel.com>
Date: Mon, 09 Nov 2026 16:26:22 +0200
Message-ID: <ab20947e2f4ad111782f3af7a3f98ad64c9cfd32@intel.com>
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
> Define GEN11_GT_IRQS (we already have the gen8 counterpart
> GEN8_GT_IRQS) and use it to skip the entire gen11_gt_irq_handler()
> call if none of the relevant bits are set, as a micro
> optimization.
>
> In addition to the redundant function call we also now skip
> the redundant gt->irq_lock spinlock which is taken unconditionally
> in gen11_gt_irq_handler().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_irq.h | 3 +++
>  drivers/gpu/drm/i915/i915_irq.c        | 6 ++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.h b/drivers/gpu/drm/i91=
5/gt/intel_gt_irq.h
> index 41cad38668c5..c8cc247778f0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.h
> @@ -12,6 +12,9 @@
>=20=20
>  struct intel_gt;
>=20=20
> +#define GEN11_GT_IRQS (GEN11_GT_DW_IRQ(0) | \
> +		       GEN11_GT_DW_IRQ(1))
> +
>  #define GEN8_GT_IRQS (GEN8_GT_RCS_IRQ | \
>  		      GEN8_GT_BCS_IRQ | \
>  		      GEN8_GT_VCS0_IRQ | \
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 448c4730d178..b3fc3e31a5d4 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -527,7 +527,8 @@ static irqreturn_t gen11_irq_handler(int irq, void *a=
rg)
>  	}
>=20=20
>  	/* Find, queue (onto bottom-halves), then clear each source */
> -	gen11_gt_irq_handler(gt, master_ctl);
> +	if (master_ctl & GEN11_GT_IRQS)
> +		gen11_gt_irq_handler(gt, master_ctl);
>=20=20
>  	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
>  	if (master_ctl & GEN11_DISPLAY_IRQ)
> @@ -596,7 +597,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		return IRQ_NONE;
>  	}
>=20=20
> -	gen11_gt_irq_handler(gt, master_ctl);
> +	if (master_ctl & GEN11_GT_IRQS)
> +		gen11_gt_irq_handler(gt, master_ctl);
>=20=20
>  	if (master_ctl & GEN11_DISPLAY_IRQ)
>  		intel_display_irq_handler(display, NULL);

--=20
Jani Nikula, Intel
