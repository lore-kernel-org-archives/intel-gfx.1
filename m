Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D99C98325
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 08:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BA210EA0D;
	Fri, 25 Sep 2026 08:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnYBaut4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4BC10E9F1;
 Fri, 25 Sep 2026 08:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790325641; x=1821861641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hLbGVzFLwL99Vp777ZumY3DpxGKxxiV5KwpvEfUyv7c=;
 b=WnYBaut44Q8pn8ZD5ZGINct7z4zsBEkjCQtZcD1OC6xBux8QiRc39mJc
 MlYeq42ISTqcc/tufNKpYUXJcfiem+JBf956FrpxT4tj0gId/BPIzqlTk
 iOBxHAab/SR0gbdedeQ1bb8zj5SEN8iUPBbggtkfsIZbvT2v+Dm9//mpv
 wSsyIGi5O3UmRBC4Jo39xlwjB3E6k/FNrMqaQTaxYGLbIpqp210/Cw/gi
 rqTS8xSFVYPPdPJxv1VvulHsTTxmx+iUmZbdlmhBAmTl7ksU57WNfwY73
 v1ohoYLnrEV9wFF9/sM3xmHldzWwGStq8ClnMYk4tubS8xudzt75X6XyN w==;
X-CSE-ConnectionGUID: dU0mUtnFS7iyahVWLDHuVQ==
X-CSE-MsgGUID: xneBYepgTVep5ODukNI34A==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101282719"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="101282719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 01:40:40 -0700
X-CSE-ConnectionGUID: 8q9W/b3STGCfwJnST7n1Mw==
X-CSE-MsgGUID: dz/5wMwZSn2BGjFb25gvGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="300539640"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 01:40:38 -0700
Date: Fri, 25 Sep 2026 10:40:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/gem_close_race: Skip offset
 probing without full-ppgtt
Message-ID: <7tycj7qmuxox256zwdz57uictfkg4fdufzvkfnwg3z4wrujnmd@oi6lpt7yhtz5>
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
 <20260924152443.829382-6-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924152443.829382-6-janusz.krzysztofik@linux.intel.com>
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

On Thu, Sep 24, 2026 at 05:24:18PM +0200, Janusz Krzysztofik wrote:
> gem_close_race computed exec_addr/data_addr via
> gem_detect_safe_start_offset() and gem_detect_safe_alignment()
> whenever the kernel disallowed relocations, without checking ppgtt
> mode. Those helpers exist solely to bootstrap intel_allocator and are
> meaningless without full-ppgtt, since the kernel can't see the ranges
> intel_allocator considers reserved and may hand them out to other
> users, as already acknowledged by __intel_bb_create() which enforces
> relocations and skips the allocator entirely in that case.
> 
> Require gem_uses_full_ppgtt() as well before enabling the softpin
> path, mirroring __intel_bb_create()'s logic, and skip the probing
> calls otherwise so the existing relocation fallback is used.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Assisted-by: GitHub Copilot (Claude Sonnet 5)
> ---
>  tests/intel/gem_close_race.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
> index b2688774d7..ff2877f67e 100644
> --- a/tests/intel/gem_close_race.c
> +++ b/tests/intel/gem_close_race.c
> @@ -348,11 +348,20 @@ int igt_main()
>  
>  		devid = intel_get_drm_devid(fd);
>  		has_64bit_relocations = intel_gen(devid) >= 8;
> -		has_softpin = !gem_has_relocations(fd);
> -		exec_addr = gem_detect_safe_start_offset(fd);
> -		data_addr = gem_detect_safe_alignment(fd);
> -		exec_addr = max_t(exec_addr, exec_addr, data_addr);
> -		data_addr += exec_addr;
> +		/*
> +		 * Without full-ppgtt the kernel can't see the ranges the
> +		 * detected offsets are meant to reserve and may hand them
> +		 * out to other users, so pinning at a detected offset isn't
> +		 * meaningful; fall back to relocations in that case, same
> +		 * as __intel_bb_create() does.
> +		 */
> +		has_softpin = !gem_has_relocations(fd) && gem_uses_full_ppgtt(fd);

Which platforms don't have relocations and are not using full ppgtt?

--
Zbigniew

> +		if (has_softpin) {
> +			exec_addr = gem_detect_safe_start_offset(fd);
> +			data_addr = gem_detect_safe_alignment(fd);
> +			exec_addr = max_t(exec_addr, exec_addr, data_addr);
> +			data_addr += exec_addr;
> +		}
>  
>  		gpu_count = igt_device_filter_count();
>  
> -- 
> 2.55.0
> 
