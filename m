Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BA0F433CE
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Apr 2026 22:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0610E75E;
	Wed, 15 Apr 2026 22:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PFJsM7Gb";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF2610E75E
 for <intel-gfx@lists.freedesktop.org>; Wed, 15 Apr 2026 22:21:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 71FDF60120;
 Wed, 15 Apr 2026 22:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF01C19424;
 Wed, 15 Apr 2026 22:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776291673;
 bh=gJ/kN9wbwiF+63xjVNAKTASDc9WyMPMA3WVnh7UUX+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PFJsM7Gb/tnQRFRk13ruZNbPIXS9peNhkYMOfol4h7SS663t2y/Q1ELnvS07EmR7/
 977+nNBNYKuH8mhZu/faa/317avWdjgjl/HvA3Ec5tCHZx/cF4i1aqwHZfkxK69MON
 cbTH1juVuYnCE+p0F1bokFc4lLWKeHJ6EaVRMB1MOxvAPeB08qLuCyKlTIqirMKGGl
 akoWdCcXdrEowRk4ACpgsOPf6fn37607MC7lUw6CxZknvYWOBuQ+PQwrKedD92KFXh
 tsY65AAJYju3IsovszbNKSZBQs5t9/vLZGJtSwxXFovoqH9Oj20OiCpHPeBJDiVrgX
 pZ81sCyukU7zQ==
Date: Thu, 16 Apr 2026 00:21:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v6 1/2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Message-ID: <aeANlr7LDN9GjXn3@zenone.zhora.eu>
References: <20260415092111.2767839-1-krzysztof.karas@intel.com>
 <20260415092111.2767839-2-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415092111.2767839-2-krzysztof.karas@intel.com>
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

> @@ -201,6 +238,21 @@ static int __run_selftests(const char *name,
>  	pr_info(DRIVER_NAME ": Performing %s selftests with st_random_seed=0x%x st_timeout=%u\n",
>  		name, i915_selftest.random_seed, i915_selftest.timeout_ms);
>  
> +	/**
> +	 * If we are running in a kthread on a multi NUMA system and the user passed
> +	 * a valid PID of a userspace task, then we may borrow its address space
> +	 * to prepare a safe environment for the mmap selftests.
> +	 */
> +	if (!current->mm && u_pid_nr) {
> +		mm = get_mm(u_pid_nr);
> +		if (mm) {
> +			kthread_use_mm(mm);
> +			mmput_async(mm);
> +			if (unlikely(!current->mm))
> +				pr_warn("Could not set mm as current->mm\n");
> +		}
> +	}
> +
>  	/* Tests are listed in order in i915_*_selftests.h */
>  	for (; count--; st++) {

In this loop you have a few returns and we skip the mm cleanup.

Andi

>  		if (!st->enabled)
> @@ -226,6 +278,9 @@ static int __run_selftests(const char *name,
>  		 st->name, err))
>  		err = -1;
>  
> +	if (mm)
> +		kthread_unuse_mm(mm);
> +
>  	return err;
>  }
