Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F64EA3C23
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Apr 2026 11:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED3010E233;
	Thu,  9 Apr 2026 11:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GuZg+OT/";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340EF10E233
 for <intel-gfx@lists.freedesktop.org>; Thu,  9 Apr 2026 11:16:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2CC2460123;
 Thu,  9 Apr 2026 11:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F363C4CEF7;
 Thu,  9 Apr 2026 11:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775733391;
 bh=lAV+50AFkzPS11L7MKGeTU40be6tnje7C1xDV59QzJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GuZg+OT/mMnVcT4IuRpS1QpVjhqcwEBk+6H+TeRuNdShYin5CGAKb93Sah6RC7roz
 xhhnWhOa1CydMI3+v51fKI7LNkR3WXxchebs72XwxH+fcSUkYT6j6WKBSQ3LYrv90q
 KPkUOUkVJI7NKpJhLyikrMs52SyblYLaYQOfHHKDSDtwNhCk65ZNljCbu9nNEnRI9t
 T8e3SWwlVkxMvcIQOx7vIj/P524vSD8zsGAFvdzuzUihM36XxYDlhRJ27+H8vU6sT+
 zcvv8Sk4pFXC7f5mIyw2K3yeTmslRp9skJHpoiRaOsEbyEJJc+p6F9AnZ4mf32cZyk
 3e458oMy7J9SQ==
Date: Thu, 9 Apr 2026 13:16:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [RFC v5 2/2] drm/i915/selftests: Run vma tests only if
 current->mm is present
Message-ID: <adeJHZAEuDKsimJt@zenone.zhora.eu>
References: <20260409080825.2191535-1-krzysztof.karas@intel.com>
 <20260409080825.2191535-3-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409080825.2191535-3-krzysztof.karas@intel.com>
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

>  	ret = i915_live_subtests(tests, i915);
> +	if (ret)
> +		return ret;
>  
> -	if (unuse_mm)
> -		kthread_unuse_mm(current->active_mm);
> +	if (current->mm)
> +		ret = i915_live_subtests(vma_tests, i915);
> +	else
> +		pr_warn("No current->mm to safely borrow userspace memory from. Skipping VMA tests.\n");

This line is too long and, what's the probability to end up here?

Andi

>  
>  	return ret;
>  }
> -- 
> 2.34.1
> 
