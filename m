Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DB0C61DD9
	for <intel-gfx@archiver.kernel.org>; Sun, 30 Aug 2026 22:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B8210E220;
	Sun, 30 Aug 2026 22:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V83mcKKL";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB50410E220
 for <intel-gfx@lists.freedesktop.org>; Sun, 30 Aug 2026 22:44:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 41E1641E8A;
 Sun, 30 Aug 2026 22:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E8B1F000E9;
 Sun, 30 Aug 2026 22:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788129856;
 bh=qjvVrfpvEq6xQiZwfw476AT3IS9YPvQCsONoxq5pBks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=V83mcKKLEss1XYIymJxfnO9Rqy02IwbYCOdLuwBj6hmXfRWMOKB7Z7TRa9N++7lPU
 VDEf4k/dnZSJaCMaRNP0F+gb50LuTdilviyyPa5wN32/76TFTa4aSQS7RWyRSQIRyg
 vXHZd/h+atdk6JnV2o4zE89Gp2NciojsopHrU6XXAIdYr3SyHMQvUU2pMYNAbn5c/b
 0aM0vQo/RDwxDMO/xxkGHCRyaV48usq/kCWao2dwrLc0y6+zMZQgkDaKjR7B5hUMkW
 BlI1Le9qMlCBU8bJX7pFV/6goaIi5V0Agt/CLS6VNLVnha2aBUfk201SAltGzASCeT
 XdkZq7cOS2uhw==
Date: Mon, 31 Aug 2026 00:44:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net, 
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Fix request use-after-free in heartbeat()
Message-ID: <apSwfmDiwsuyQT6I@zenone.zhora.eu>
References: <20260808184302.1509585-1-shuangpeng.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808184302.1509585-1-shuangpeng.kernel@gmail.com>
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

Hi Shuangpeng,

On Sat, Aug 08, 2026 at 02:43:02PM -0400, Shuangpeng Bai wrote:
> heartbeat() detaches engine->heartbeat.systole with xchg() before
> checking whether the request has completed. If the request is complete,
> dropping the detached systole reference may free it. Concurrently,
> idle_pulse() can observe the empty slot and publish a newer request.
> 
> The worker then sees a non-NULL engine->heartbeat.systole, but continues
> to dereference its stale local rq. The newer request can therefore make
> the shared-slot check succeed after the old request has been freed,
> causing use-after-free accesses to emitted_jiffies, submit, and sched.
> 
> If the detached request is incomplete, heartbeat() can also overwrite a
> newer request published by idle_pulse() when it unconditionally restores
> the old pointer.
> 
> Use cmpxchg() both when idle_pulse() publishes a request and when
> heartbeat() restores the detached request. Drop the detached reference
> when restoration loses the race, and reload rq from the shared slot
> before dereferencing it.
> 
> A KASAN-enabled i915 mock selftest reproduces the use-after-free before
> this change and completes without a report after the fix.
> 
> Fixes: bf9bd6a5128a ("drm/i915/gt: Track the most recent pulse for the heartbeat")
> Cc: stable@vger.kernel.org # v5.11+

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Your patch looks correct, although I don't think the Fixes tag
is.  I believe the actual fix is:

Fixes: 4c71fd099513 ("drm/i915/gt: fix refcount underflow in intel_engine_park_heartbeat")
Cc: <stable@vger.kernel.org> # v7.0+

That commit introduced the early xchg() which hides the old
request from idle_pulse() and replaces it with a new one.

I'm going to resend the patch so that it can be picked up by our
CI.

Thanks,
Andi
