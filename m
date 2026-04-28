Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856A4FF8868
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Apr 2026 14:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F6A10ED32;
	Tue, 28 Apr 2026 14:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gK1t5nAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B212610ED32
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Apr 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777388253; x=1808924253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GEUNKlIzEqkNBVh7GxaHyP062E6Rv8wfSBvyo+9uM5Y=;
 b=gK1t5nASfuWwaDg5cDHYsdvz0hjG8ut1Gw4qjalE8IkAZ1sogmyEV1oi
 BqcsZGUyZ4I7anRZWENDcG2oxXm1hSXzP45z5YQ7+v2Mzr9KJC8UoMKLD
 3buioK0F/qBhqZ7xiyvGLcHVnOjiB/dKtOIl9lic6bRTCWp/f14qfj68H
 UC9nHgiJmPmrGsAzNDdd5smV9QnjK1E4pboPd+rJSi8nqE+2knth8mDMy
 szdRJJPvRB1fdOupg/9T2HpDrkEwBNxsDjiMS3fx1BhmL95x4E8isfn0I
 1F0Qi8XOdlWW4D38tXtR02xb2efSMKdSpk4cFTwa8hycVvEQj1uh7GOlS w==;
X-CSE-ConnectionGUID: 2MXqJCQsSUGqjs9dsorkUQ==
X-CSE-MsgGUID: OsQNcO2EQtGRMrYIfNcamQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80873874"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="80873874"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:57:33 -0700
X-CSE-ConnectionGUID: 6TonqhcnSLiYzh9V6EChYQ==
X-CSE-MsgGUID: DoyHL34cTyCJZyB11wkDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="232955155"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:57:32 -0700
Date: Tue, 28 Apr 2026 16:57:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v7 1/2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Message-ID: <afDK2Q_jxoiw0zIM@ashyti-mobl2.lan>
References: <20260421061716.3341529-1-krzysztof.karas@intel.com>
 <20260421061716.3341529-2-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421061716.3341529-2-krzysztof.karas@intel.com>
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

On Tue, Apr 21, 2026 at 06:17:15AM +0000, Krzysztof Karas wrote:
> Migration testing in i915 assumes current task's address space
> to allocate new userspace mapping and uses it without
> registering real user for that address space in mm_struct.
> On single NUMA node setups PCI probe executes in the same
> context as userspace process calling the test (i915_selftest
> from IGT), but when multiple nodes are available, the PCI code
> puts probe into a kernel workqueue. This switches execution to
> a kworker, which does not have its own address space in
> userspace and must borrow such memory from another process, so
> "current->active_mm" is unknown at the start of the test.
> 
> It was observed that mm->mm_users would occasionally be 0
> or drop to 0 during the test due to short delay between
> scheduling and executing work in forked process, which reaped
> userspace mappings, further leading to failures upon reading
> from userland memory.
> 
> Prevent this by adding a PID parameter to a trusted task, so its
> mm struct may be used if needed.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
> Fixes: 34b1c1c71d37 ("i915/selftest/igt_mmap: let mmap tests run in kthread")
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

...

> +	/**
> +	 * If we are running in a kthread on a multi NUMA system and the user passed
> +	 * a valid PID of a userspace task, then we may borrow its address space
> +	 * to prepare a safe environment for the mmap selftests.
> +	 */

Sebastian is right here, the "**" is more for the documentation,
it can be removed before pushing.

Andi

> +	if (!current->mm && u_pid_nr) {
> +		mm = get_mm(u_pid_nr);
> +		if (mm) {

...
