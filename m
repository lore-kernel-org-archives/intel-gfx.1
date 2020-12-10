Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A16BC4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 18:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E454422581
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 18:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E454422581
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B78B6E439;
	Thu, 10 Dec 2020 18:45:36 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1766E439
 for <Intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 18:45:34 +0000 (UTC)
IronPort-SDR: foVo9W3x2h/A4XqX8Nk9nKO25/zqH59S+TMY7SN40DSihhcT8EKBFoX0ZUnX+SJ4v/Y//t/E2Q
 3dFS/YEKvxXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="259027140"
X-IronPort-AV: E=Sophos;i="5.78,409,1599548400"; d="scan'208";a="259027140"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 10:45:33 -0800
IronPort-SDR: /XYhx8oLzA3gqQchFhx3JcBoCwwmOHLq4B77wOlLKwNRpPUUD8Js6OhL9E2sXQVK1HuLsjWNz3
 a1T946+Fa4Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,409,1599548400"; d="scan'208";a="319747392"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 10 Dec 2020 10:45:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Dec 2020 20:45:30 +0200
Date: Thu, 10 Dec 2020 20:45:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <X9JsylVFlr9ufO3/@intel.com>
References: <20201210173545.1508568-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210173545.1508568-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Stop peeking at kernel
 internals for counting interrupts
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
Cc: Intel-gfx@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 05:35:45PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> =

> Peeking at kernel internals is bad taste so instead we keep our own
> counter which also solves the problem of shared interrupt lines.
> =

> Additional cost should be way below noise relative to mmio reads.
> =

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  drivers/gpu/drm/i915/i915_drv.h |  3 +++
>  drivers/gpu/drm/i915/i915_irq.c | 16 ++++++++++++++++
>  drivers/gpu/drm/i915/i915_pmu.c | 19 +------------------
>  3 files changed, 20 insertions(+), 18 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 5d04b282c060..de5cdcdc46b0 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -889,6 +889,9 @@ struct drm_i915_private {
>  	/* protects the irq masks */
>  	spinlock_t irq_lock;
>  =

> +	/** Overall irq handler invocations. */
> +	u64 irq_count;
> +
>  	bool display_irqs_enabled;
>  =

>  	/* To control wakeup latency, e.g. for irq-driven dp aux transfers. */
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index b245109f73e3..a88c1da025f1 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -1596,6 +1596,8 @@ static irqreturn_t valleyview_irq_handler(int irq, =
void *arg)
>  	if (!intel_irqs_enabled(dev_priv))
>  		return IRQ_NONE;
>  =

> +	dev_priv->irq_count++;

Would rather have to be something like
if (ret =3D=3D IRQ_HANDLED)
	irq_count++;

if we really wanted to count only our interrupts when the
irq line is shared.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
