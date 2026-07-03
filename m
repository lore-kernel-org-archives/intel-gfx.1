Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70311C43458
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Jul 2026 15:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CA810F83A;
	Fri,  3 Jul 2026 15:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="De070to2";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD7810F83A
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Jul 2026 15:12:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 27EEC60051;
 Fri,  3 Jul 2026 15:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD041F000E9;
 Fri,  3 Jul 2026 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783091548;
 bh=jr5IVxRHAwxWCAC4MfReiKZ7aaVtoxwOCFZ2WmFMnhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=De070to2yUXdHkgQz8/QU2nGuuc6UBP4WDj7ADvSTfWhq7yIkTsAB1Iab7zXli0X/
 7uKBi/tjsmKJ1ztAkW0pAeWujSF0cNeFEdq9bxCGNSZ41KHF/XWbWK1bMXh+BXR3A0
 9zWOi98rh82VD33Vk9lF5LGoHqRhV3XPLVw616Wb3LhsZN2kYC5cx4UfXDXzrS4JN8
 8n0cgw9gUE2O6urVM0Wf8sreJOFFpxXZK2ObhpWFsY1kkLwufyflMy2kjlvrTsuSCz
 U1pu32u00QNSo9pE2d4izcv0kG2gMIdFNu5GnAG4GRI72Rrl5LAa7xl8dgJ8mfWGvd
 r2qggHAm8LamA==
Date: Fri, 3 Jul 2026 17:12:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org, alex.zuo@intel.com, 
 jani.nikula@linux.intel.com, andi.shyti@intel.com
Subject: Re: [PATCH v3] drm/i915/gt: Use poll_timeout_us in place of sliding
 sleep window
Message-ID: <akfLRFswIyWZgcby@zenone.zhora.eu>
References: <20260630152511.1401029-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630152511.1401029-1-jonathan.cavitt@intel.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Jonathan,

...

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 1c455d84bf9d..dc4a5486b42c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -716,7 +716,6 @@ static int ct_send(struct intel_guc_ct *ct,
>  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>  	struct ct_request request;
>  	unsigned long flags;
> -	unsigned int sleep_period_ms = 1;
>  	bool send_again;
>  	u32 fence;
>  	int err;
> @@ -736,22 +735,18 @@ static int ct_send(struct intel_guc_ct *ct,
>  	 * rare. Reserving the maximum size in the G2H credits as we don't know
>  	 * how big the response is going to be.
>  	 */
> -retry:
>  	spin_lock_irqsave(&ctb->lock, flags);
> -	if (unlikely(!h2g_has_room(ct, len + GUC_CTB_HDR_LEN) ||
> -		     !g2h_has_room(ct, GUC_CTB_HXG_MSG_MAX_LEN))) {
> +	err = poll_timeout_us_atomic(err = 0,
> +				     !h2g_has_room(ct, len + GUC_CTB_HDR_LEN) ||
> +				     !g2h_has_room(ct, GUC_CTB_HXG_MSG_MAX_LEN),
> +				     USEC_PER_MSEC, 600 * USEC_PER_SEC, false);

This changes the original flow quite a bit.

Before, the code checks whether there is room in the buffers. If
there is not, it drops the lock, checks for deadlock, sleeps, and
retries.

With this change, we keep polling for room until timeout, and
only then check for deadlock. On top of that, the polling is done
while holding the spinlock and with interrupts disabled.

I do not think this is a good tradeoff.

If we want to use poll_timeout_us_atomic(), I think the better
approach would be to move the current retry logic into a small
helper or callback replacing the condition inside
poll_timeout_use_atomic() that:

- takes the lock
- checks whether there is room
- drops the lock
- checks for deadlock
- returns the condition to the poll_timeout_timeout_us_atomic()

That would keep the old logic intact.

Andi
