Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EFECDB466
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Jun 2026 09:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280A810E144;
	Thu, 25 Jun 2026 09:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ktKZ9q29";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E8310E144
 for <intel-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 09:11:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 15D7E414FE;
 Thu, 25 Jun 2026 09:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFEE1F000E9;
 Thu, 25 Jun 2026 09:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782378707;
 bh=V34tprc/VvAXvQiecTPoKtIGl8tAZb+hGLf+GaiXG3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ktKZ9q29C7BbnoedYcHSIs+hDD7w81wGoTjsM0rUoYGlrCOA7vV/aGLnuYPiJ8+4h
 EUSQpNBZsOk2VHhyWl93hyMhLwTIAYQZeqsBjkhdIL8jFImYtrF/3b6DU/R5p6fmPQ
 4ht4sBf2CdxwWCNECmvQE9gbIauzEd5i/fs1kC4BIOr1guZVFgMbOPIsl/t3PdPzHy
 gvfPd8/xSsCYo6o0P0v7vzNU6UhN90BDx5lAMVK70a+3Esn4GazEADb6D4238ouHa6
 2rC/2fqVkLg2a8xXNsZiVy3bRZd7mWXPYLv05/if18qLlrzBKR5BbLid3+kM5YYeHM
 9V8h4aEv1oxGQ==
Date: Thu, 25 Jun 2026 11:11:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jia Yao <jia.yao@intel.com>
Cc: intel-gfx@lists.freedesktop.org, 
 Shuicheng Lin <shuicheng.lin@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maciej Plewka <maciej.plewka@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v7] drm/i915/dg2: Add per-context control for
 Wa_22013059131
Message-ID: <ajzwt0GjkgvTZZNJ@zenone.zhora.eu>
References: <20260623221521.1183124-1-jia.yao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623221521.1183124-1-jia.yao@intel.com>
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

Hi Jia,

On Tue, Jun 23, 2026 at 10:15:21PM +0000, Jia Yao wrote:
> Wa_22013059131 sets FORCE_1_SUB_MESSAGE_PER_FRAGMENT in LSC_CHICKEN_BIT_0
> at engine init, but this is known to cause GPU hangs in certain workloads.
> Add I915_CONTEXT_PARAM_WA_22013059131 so userspace that handles the
> workaround itself (e.g. by limiting SLM size) can set it to 1 to let the
> kernel know bit 15 programming is not needed for that context.
> 
> LSC_CHICKEN_BIT_0 is not context-saved by hardware, so the kernel restores
> the correct value on every context switch via the indirect context
> batchbuffer to avoid leaking state between contexts. The old unconditional
> application of Wa22013059131 in intel_workarounds.c is removed.
> 
> v7:
> - Reject ioctl with -ENODEV on non-DG2-G11 platforms
> 
> v6:
> - Remove excessive blank lines
> 
> v5:
> - Remove fix and stable
> 
> v4:
> - Add a link of the userspace using this API
> 
> v3:
> - Kernel-internal context will not change workaround settings
> 
> Bspec: 54833
> Link: https://github.com/intel/compute-runtime/pull/919
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maciej Plewka <maciej.plewka@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
