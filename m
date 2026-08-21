Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171D0C5DF87
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 09:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80A910E195;
	Fri, 21 Aug 2026 09:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIaP39Ii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C5A10E195;
 Fri, 21 Aug 2026 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787306367; x=1818842367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=USJQuOGh4rBBA+etQm6HlEbtVAQLcPKSTM+2Tp7bYhA=;
 b=bIaP39IiwHocYTarO74GzTIPT/anNwFddB0jH6ifFRMaZNw9liwbotoP
 BXxxU7PWVURe/cU3ubt2Tg22w5OXS+JUxMP+tyJPtYrbxSTn6AIEyHZiZ
 KopW3XiQWHEdDd7FtKwbfDgD0rx18Ckx5bWSsS3FbfOaH8kXykzYcDNBW
 5OFfGnEvdf22XT9qUfzENrz4XkkeIAcKShbfXZNSrFBL5EhaZIfewxD6i
 iDe5Ch9q8U5nc4Q9yuEcYFK3mkN+55LZIuVoV09aXHRdXF6uRngHc76Wk
 gfw78PepdXR/IbNjaFdbZErY22UKqh3owi4AH1Lvm57J35UWcYdWzJAOQ w==;
X-CSE-ConnectionGUID: USF6msbWRpivBlf+xGf0gw==
X-CSE-MsgGUID: knb1uzuVQyypkErrXfUiHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87623057"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87623057"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:59:26 -0700
X-CSE-ConnectionGUID: 2XnEqZdrRya77NyvLm/esw==
X-CSE-MsgGUID: ka0ffEB7TpGtVfgs6PfM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="266888269"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 02:59:24 -0700
Date: Fri, 21 Aug 2026 11:59:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/i915_module_load: Ignore missing PCI
 reset
Message-ID: <20260821095906.qvwkrqqsw5ucwvme@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20260820184304.1968012-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260820184304.1968012-2-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,
On 2026-08-20 at 20:41:43 +0200, Janusz Krzysztofik wrote:
> Subtest fault-injection now performs PCI device reset before every driver
> bind attempt and fails if that reset doesn't succeed.  That was OK if all
> devices being tested supported a PCI reset method.  However, machines
> with DG1 SKU 0x4905 used in CI suffer from device breakage and system
> freezes after any PCI reset attempts, triggering CI job aborts.  That's
> going to change soon with an upcoming kernel patch that disables PCI
> reset capabilities on that card.
> 
> Attempt PCI reset and fail if not successful only if supported, otherwise
> submit a debug message and continue the exercise.  With that in place,
> the subtest should no longer abort CI jobs on DG1 as soon as the above
> mentioned kernel fix is in place.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/i915_module_load.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
> index 26e30a1000..68e2386465 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -463,7 +463,8 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[],
>  	injection_list_add(function_name);
>  	set_retval(function_name, inject_error);
>  
> -	igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
> +	if (!igt_debug_on(!igt_sysfs_has_attr(devicefd, "reset")))
> +		igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
>  	igt_kmod_bind("i915", pci_slot);
>  
>  	err = -errno;
> -- 
> 2.54.0
> 
