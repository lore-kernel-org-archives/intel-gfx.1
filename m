Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C63F433CC
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Apr 2026 22:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAD610E088;
	Wed, 15 Apr 2026 22:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="peXPYUf/";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C0510E088
 for <intel-gfx@lists.freedesktop.org>; Wed, 15 Apr 2026 22:23:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDD7744546;
 Wed, 15 Apr 2026 22:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C01C2BCB6;
 Wed, 15 Apr 2026 22:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776291806;
 bh=whBB/NgvGOSewdr924a5rZDGDmLDgwvj+vSE/l8rkP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=peXPYUf/tX77yiU5Cc1MPtkjD1DrcZ2u7F+ew9R+IFpProB2xirjOaeL/y5Kzp6Ef
 3e/E1y+Ym9seFonCjYHdpyIBcYHveCo/dGihT+3CPztOSY2WgNrzrr+M809Sr/M2y3
 aMUbd313HEsWYwTE7Y9rEgd62lGZLyAxMsnbrHYtLlZ6NnJXEfxCbKqpqIEDMAE7hY
 W7JinzIhgJJhLklRandnWWyaHxQnUWuxq3x0c+l4l8m+MHRY3mCf9OpkUYbdn+cX8u
 3Sj7Ib8kmJQrOtEgYzf26E/VmOkcs2UtIkjMHjX1ASjbwTGsVftBAxWXaHkZB4ILC0
 XRLMygqX8gX1w==
Date: Thu, 16 Apr 2026 00:23:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v6 2/2] drm/i915/selftests: Run vma tests only if
 current->mm is present
Message-ID: <aeAPXpMKYSCYibKc@zenone.zhora.eu>
References: <20260415092111.2767839-1-krzysztof.karas@intel.com>
 <20260415092111.2767839-3-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415092111.2767839-3-krzysztof.karas@intel.com>
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

Hi Krzysztof,

...

> -	if (unuse_mm)
> -		kthread_unuse_mm(current->active_mm);
> +	if (current->mm)
> +		ret = i915_live_subtests(vma_tests, i915);
> +	else
> +		pr_warn("No current->mm.\n");

This is a non-log. It's true that I asked to make logs a bit more
compact, but "No current->mm" means basically nothing.

Andi

>  
>  	return ret;
>  }
