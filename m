Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C983ECA5FC7
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 16:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A0010E27C;
	Wed, 30 Sep 2026 16:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aTppVnvw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A6610E27C
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 16:18:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2AB81402D5;
 Wed, 30 Sep 2026 16:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615B71F00898;
 Wed, 30 Sep 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790785127;
 bh=Akc/XzWEtGAB+YiuW8WoMFHqiSJbZbl38+B21BZ45PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=aTppVnvw3P1SH4ATiRhfkeBxsQnUMLTUirbO1r+L7A/rODJH+ejJ965dF++1MriYq
 8SQ7vlFc1OcAPZD+29viQmyml4ub4UVrJBmBu14BXnQ4ybbXQloVpJw0xauRDi1sUX
 V0kxtNdMdRwv+aNmIu40UC6obsCAEDHDXxwMzzd0P1Q8ae4tM20MovD9K6to8ygfcc
 Xo24WSN31+WmXaoYzNpsqBkdO9PSzyiJXurIkIr046Tl/gs+Ip6DP03sHUTQpcPaqC
 0GSbWe0Sgt0doW7oe8bnnW33N5G0hcoVltrhD/Qf//wc8Gy5NnDRr/Uf66UxTGTY+k
 lnbnrIFLw2QEw==
Date: Wed, 30 Sep 2026 18:18:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915: Use %p for pointer formatting
Message-ID: <ar02FfMUXSysE7CT@zenone.zhora.eu>
References: <20260918103725.cfYzL1Wt@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918103725.cfYzL1Wt@linutronix.de>
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

Hi Sebastian,

On Fri, Sep 18, 2026 at 12:37:25PM +0200, Sebastian Andrzej Siewior wrote:
> Commit 2563a4524febe ("drm/i915: restrict kernel address leak in
> debugfs") introduced the %pK modifier in order not to leak kernel
> pointer.
> Since commit ad67b74d2469d ("printk: hash addresses printed with
> %p") pointers are hashed by default and the behaviour can be controller
> by `hash_pointers' boot argument.
> The policy on %p is to not introduce new ones. Keeping the %p allows
> to assign an id to the object.
> Removing %pK makes it possible to remove its handling from the library.
> 
> Use %p instead %pK to allow debugging if needed.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

pushed to drm-intel-next.

Thanks,
Andi
