Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4CCC43458
	for <intel-gfx@archiver.kernel.org>; Sat, 27 Jun 2026 01:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D2410E0B7;
	Sat, 27 Jun 2026 01:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iMK5Kd4l";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E3E10E0B7
 for <intel-gfx@lists.freedesktop.org>; Sat, 27 Jun 2026 01:09:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F24F9600AA;
 Sat, 27 Jun 2026 01:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B841F000E9;
 Sat, 27 Jun 2026 01:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782522581;
 bh=mNXxYQ45Yr6I49SeTQR1fr+Cwu6dd1zxbxVljMsu3TA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=iMK5Kd4l+9UlCrIc75M22ODvFi64gmCoFJ4wmOrK25a4vdSYfOc7BaahsWBJhXm8T
 YX9M+QD7BiHWNNcwVo+DLGoZJAlJ2nSp44BqVogMXnARsud/3kq141AB38ZyaHqaSr
 SPatM5R+tM3WZSz+hOXVgH2K700ohkI3BCXGGb8ZujDwUbprARHkaAad2q5sFZiIsT
 CZrQglrrk7YNhAo7FhCJy+XuLqGEsvIvH/W4A3+17YEaKtbxy2P6jW04h9W1oaI956
 WpNKJWx7bYjRohBnt2+T1JMeBX+gSAP8ZFTYkztFtFUNkw9buVcubrinon5jeFLjpE
 RCHZuCmUWMDjw==
Date: Sat, 27 Jun 2026 03:09:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org, saurabhg.gupta@intel.com, 
 alex.zuo@intel.com
Subject: Re: [PATCH] drm/i915/gt: Enforce some loop limits
Message-ID: <aj8fO7TiPBZEbau5@zenone.zhora.eu>
References: <20260303181531.9953-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303181531.9953-2-jonathan.cavitt@intel.com>
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

On Tue, Mar 03, 2026 at 06:15:32PM +0000, Jonathan Cavitt wrote:
> The functions intel_guc_send_busy_loop and ct_send can theoretically
> loop forever.  In the former case, intel_guc_send_busy_loop can iterate
> forever if intel_guc_send_nb repeatedly returns -EBUSY.  In the latter
> case, ct_send can loop forever if the guc-to-host or host-to-guc buffers
> get stuck in a full state.
> 
> Rework the sleep_period_ms values here to count the number of loops that
> have occurred and exit after 20.  This lets both functions run for 10
> minutes before escaping with -EBUSY (except in the former case if atomic
> execution is enabled, but 20 consecutive failures in that case should
> still be reported regardless).
> 
> This also technically solves a static analysis issue wherein
> sleep_period_ms could overflow, but it would take over three weeks of
> perpetual sleeping on these functions to ever hit that overflow, so it's
> debatable whether this actually needed fixing or not.  At any rate, it's

This comment is superfluous. It doesn't add anything useful to
the commit message.

I also wouldn't treat this as a fix if the issue was found by
a static analyser rather than encountered in practice.

> better to exit early in the error case.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 10 +++++++---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  8 +++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 053780f562c1..b4bf12193f75 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -361,7 +361,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>  					   bool loop)
>  {
>  	int err;
> -	unsigned int sleep_period_ms = 1;
> +	unsigned int loop_count = 0;
>  	bool not_atomic = !in_atomic() && !irqs_disabled();
>  
>  	/*
> @@ -377,13 +377,17 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>  retry:
>  	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
>  	if (unlikely(err == -EBUSY && loop)) {
> +		if (loop_count >= 20)
> +			return -EBUSY;
> +
>  		if (likely(not_atomic)) {
> -			if (msleep_interruptible(sleep_period_ms))
> +			if (msleep_interruptible(1 << loop_count))

This, definitely is not 10 minutes, but much more.

Besides, msleep_interruptible(1 << 19) is huge! I think we should
cut it down to a maximum or reschedule. This was already this
way, so that there is no reson to change it now, but we need to
think of a better way of sleeping.

>  				return -EINTR;
> -			sleep_period_ms = sleep_period_ms << 1;
>  		} else {
>  			cpu_relax();

It's interesting how the atomic path waits much less than the non
atomic. Perhaps we don't really need those huge sleeps in non
atomic?

Andi

>  		}
> +
> +		loop_count++;
>  		goto retry;
>  	}
