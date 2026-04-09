Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A2CEA3C23
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Apr 2026 11:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C299610E79C;
	Thu,  9 Apr 2026 11:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IKmRobJR";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B80810E79C
 for <intel-gfx@lists.freedesktop.org>; Thu,  9 Apr 2026 11:09:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 450A740670;
 Thu,  9 Apr 2026 11:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DD8C4CEF7;
 Thu,  9 Apr 2026 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775732989;
 bh=LZ1ZSlM56iiJAsHuDR8nZ5PFpwQjXCTH3XOQYqxJQwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IKmRobJRcU8zpsU4fhq65b/RVStqFL2u15TDdVn7k0YDdNce2UIejdvy7xRokZXv+
 et8MJBUTj1w1No3ZF5x89jkTfstEa+HJDyn+1mCDvw7LMrEtPXgdKOtuYLn6Xe3FZC
 uPm4Yc3cvtW1yCB5lPoR2q0kyvTST8lSvvSbEcriDnxSJ5Ch3i4EfWkK/trdsxqCaO
 +zVV5mIP7PzZ+T/6VlC8g/jrSauoDhjdPgmQL7DKdwODC7FY2RadxV2XhnXn3TtCmL
 qdfqBoTf9jD+N2hTg2GAnBkyv/Jk5jXg9XBUrNXcloWwAqDev4topyrbqQ4tfVF4xz
 B/lrQewQ7L01A==
Date: Thu, 9 Apr 2026 13:09:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v4 1/2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Message-ID: <adeCdrdcZZWa98VY@zenone.zhora.eu>
References: <20260408083034.2060372-1-krzysztof.karas@intel.com>
 <20260408083034.2060372-2-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408083034.2060372-2-krzysztof.karas@intel.com>
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

> +		if (!u_pid_nr) {
> +			pr_warn("No current->mm and no PID provided to safely borrow userspace memory from.\n"
> +				"This may lead to switching off tests requiring that for mappings");

This line is too long (please check with checkpatch). The message
is to long. We don't need to provide a full explanation. You can
actually just write something like "No usable userspace mm".

jkk

> +			goto run_tests;
> +		}
> +
> +		u_pid = find_get_pid(u_pid_nr);
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
> +		mmput_async(mm);
> +		if (unlikely(!current->mm)) {
> +			pr_warn("Could not set mm as current->mm\n");
> +		}

Please remove the two brackets here.

On a general note, I'm not a big fan of the goto's used for
jumping around the code, unless it's an exit point.

Perhaps this can be written as:

	if (!current->mm) {
		mm = a_new_function(...);
		if (mm) {
			kthread_use_mm(mm);
			...
		}
		...
	}

Thanks,
Andi

> +	}
> +
