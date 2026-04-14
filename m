Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2706AED7B9A
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Apr 2026 10:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8705D10E06D;
	Tue, 14 Apr 2026 10:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CwwKUyli";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9367510E06D
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Apr 2026 10:25:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4950243045;
 Tue, 14 Apr 2026 10:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AEFC2BCB4;
 Tue, 14 Apr 2026 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776162359;
 bh=zfUclQwCQMcTFGwQkm93CYEfEeaHT9/PFou3kTysz/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwwKUyli5Bxcv0Pi2b0TO4voxXpqtT3KK6ow3OuHL6E/U7RnTU3uVfTkv2tEE8Dq6
 i0RjPv6JZK+e+P1W9nDADj8qQ7Qu0z7ojmjZYCaID5lVi0J8IEFm/KQfLurCXx/wFr
 gFA0GDS2PhE9nEJO4gDYNhAkndZRQCek6mN0g7PXFc+afEy7MsbDLDJqha+1ToZplX
 hzNQh9yumII0Sz/8fXQjA+1Bn1eKCFVmRIW7cjKBz/vHcBB6HY2NgATCAxy4/obXTE
 ZZGCD1ovcRhZ0LSWYL9S2lSdgT+0g4tfofbZ2ShyOObFYdNRLMiZXV+nChdc+o4zwj
 kmuBtBA70Ufnw==
Date: Tue, 14 Apr 2026 12:25:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jia Yao <jia.yao@intel.com>
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org, 
 Shuicheng Lin <shuicheng.lin@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maciej Plewka <maciej.plewka@intel.com>
Subject: Re: [PATCH v2] drm/i915/dg2: Add per-context control for
 Wa_22013059131
Message-ID: <ad4V09-JiU4kH2BW@zenone.zhora.eu>
References: <20260410140619.736008-1-jia.yao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410140619.736008-1-jia.yao@intel.com>
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

...

> +	case I915_CONTEXT_PARAM_WA_22013059131:
> +		if (args->size)
> +			ret = -EINVAL;
> +		else if (args->value)
> +			pc->user_flags |= BIT(UCONTEXT_WA_22013059131);
> +		else
> +			pc->user_flags &= ~BIT(UCONTEXT_WA_22013059131);
> +		break;

Should we check here for the platform type?

Andi

> +
>  	case I915_CONTEXT_PARAM_RECOVERABLE:
>  		if (args->size)
>  			ret = -EINVAL;
