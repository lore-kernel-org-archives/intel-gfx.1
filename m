Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0E9CD343F
	for <intel-gfx@archiver.kernel.org>; Thu,  7 May 2026 12:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCEB10F050;
	Thu,  7 May 2026 12:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YPA4pcb9";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1710F050
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 May 2026 12:08:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA5DC61119;
 Thu,  7 May 2026 12:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCF4C2BCB8;
 Thu,  7 May 2026 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778155688;
 bh=tNuRhkd7h+e6+sHheOR7DJNt4goXA1jo987OsBWY+z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YPA4pcb93hHrL6S6+XbyUeUqW9pqoCRM0mmhLnfb+e4BKuHb3ABeu0E2gmOCxryzm
 IdkWr6EYvsDLTjS6HMjBq1wbx+/YLDZDb+CTZ1JUyhaBnvFXYlmmijv8PTwetnHp8z
 tco1aCHEgDE+KoS49RTBsuperueu3cQv2YQObMoGTN8S9tDvIwbHcDta4ykN08hova
 IyiUE9QYOeUn/AZlpTDKLB3MDzi3wYcMiY+jNjvOEzdf6UmbWrVvKCbrnLLeX/kWOb
 pmKv8MLxGfEg0TgsB/ncxBmtQbDdOIjimwL/fdSdlIg/dA/hU+BCk6yXCR0EY1359E
 AXk9kG2W/EJbA==
Date: Thu, 7 May 2026 14:08:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v8 1/2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Message-ID: <afyAZI18ZgFn9L4_@zenone.zhora.eu>
References: <20260430105724.1590552-1-krzysztof.karas@intel.com>
 <20260430105724.1590552-2-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430105724.1590552-2-krzysztof.karas@intel.com>
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

> +	/*
> +	 * If we are running in a kthread on a multi NUMA system and the user passed
> +	 * a valid PID of a userspace task, then we may borrow its address space
> +	 * to prepare a safe environment for the mmap selftests.
> +	 */
> +	if (!current->mm) {
> +		struct pid *u_pid = find_get_pid(u_pid_nr);
> +		struct task_struct *task;
> +
> +		if (!u_pid) {
> +			pr_warn("Could not find PID: %d\n", u_pid_nr);
> +			goto run_tests;
> +		}
> +
> +		task = get_pid_task(u_pid, PIDTYPE_PID);
> +		put_pid(u_pid);
> +		if (!task) {
> +			pr_warn("Could not find userspace task for PID: %d\n", u_pid_nr);
> +			goto run_tests;
> +		}
> +
> +		mm = get_task_mm(task);
> +		put_task_struct(task);
> +		if (!mm) {
> +			pr_warn("Could not find address space of task with PID: %d\n", u_pid_nr);
> +			goto run_tests;
> +		}
> +
> +		kthread_use_mm(mm);
> +		if (unlikely(!current->mm)) {
> +			mmput(mm);
> +			mm = NULL;
> +			pr_warn("Could not set mm as current->mm\n");
> +		}
> +	}

Didn't we agree once that this would go into a separate function?

Andi

> +run_tests:
>  	/* Tests are listed in order in i915_*_selftests.h */
>  	for (; count--; st++) {
>  		if (!st->enabled)
>  			continue;
>  
>  		cond_resched();
> -		if (signal_pending(current))
> +		if (signal_pending(current)) {
> +			if (mm) {
> +				mmput_async(mm);
> +				kthread_unuse_mm(mm);
> +			}
>  			return -EINTR;
> +		}

...
