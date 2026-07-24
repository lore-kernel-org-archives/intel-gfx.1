Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C622DC531F9
	for <intel-gfx@archiver.kernel.org>; Fri, 24 Jul 2026 12:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4345910F3AA;
	Fri, 24 Jul 2026 12:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XJQF79jx";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6113710F3B1
 for <intel-gfx@lists.freedesktop.org>; Fri, 24 Jul 2026 12:50:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D1DB2401B5;
 Fri, 24 Jul 2026 12:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48DB1F000E9;
 Fri, 24 Jul 2026 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784897423;
 bh=DMUAK746HwD0qpfTN1u8MbpFh5dukrP3B7f5W7sHeJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XJQF79jxCW05176ZeAjsEGozhJ+fme4U65HvpRHvCx39gAHNHJ9/909roaZ3C4NRl
 ZMEwNws/2CxDMI0qypaMfBp0kBTS2rtzB0uI01k0VT1oGcEiA5ZCJf2/B3+LLs0jqo
 thObAtrHflKZnDhJZWcSAkHh+X3ZvfE4WfvaaClHk4GK2UgY6SeR+IFzVIhS+dKvEX
 Wza8jpnz+HmTq2O2DjUWMuVsP3yAPm1iSnQFGvmQqL/DWBOFdbaXN66qC6LB2z4Hnw
 3NSJwSxAakx5XfrRwandCZOUu6G9hrutXfwyPFoXKMC6xYQCbPAYLFIdF+C9lnC0Zx
 BOiBH3qY8zwxw==
Date: Fri, 24 Jul 2026 14:50:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org, alex.zuo@intel.com, 
 jani.nikula@linux.intel.com, andi.shyti@intel.com, krzysztof.karas@intel.com
Subject: Re: [PATCH v4] drm/i915/gt: Use poll_timeout_us in place of sliding
 sleep window
Message-ID: <amNfS-1am2g3MGP3@zenone.zhora.eu>
References: <20260706153510.1466259-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706153510.1466259-1-jonathan.cavitt@intel.com>
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

> +	/*
> +	 * We use a lazy spin wait loop here as we believe that if the CT
> +	 * buffers are sized correctly the flow control condition should be
> +	 * rare. Reserving the maximum size in the G2H credits as we don't know
> +	 * how big the response is going to be.
> +	 */
> +	timedout = poll_timeout_us_atomic(err = ct_lazy_spin(ct, &request, action,
> +							     len, response_buf,
> +							     response_buf_size,
> +							     status),
> +					  err != -EBUSY, USEC_PER_MSEC,
> +					  POLL_TIMEOUT_DUR, false);

now poll timeout is not running in atomic context, is there any
problem in using simply poll_timeout_us() instead of its
_atomic() brother?

Andi

> +
> +	/* This is only the case if ct is deadlocked or we time out */
> +	if (ct->stall_time != KTIME_MAX)
> +		return timedout ?: err;
> +
> +	/* Otherwise, ct_write failed and we need to clean up */
>  	if (unlikely(err))
>  		goto unlink;
>  
> -- 
> 2.53.0
> 
