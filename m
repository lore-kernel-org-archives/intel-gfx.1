Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC01F01832
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Mar 2026 11:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C7A10ED1E;
	Fri,  6 Mar 2026 11:56:02 +0000 (UTC)
Received: from mgamail.intel.com (unknown [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8288810ED02;
 Fri,  6 Mar 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772798152; x=1804334152;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jhajdyzSpC7nFWT4fIB5OrPUA7tIYSt6gs/Wi1JoeiM=;
 b=L7hISM+1uIkSNiQZ4dnvmjRO7c/tknu3XRD+gFvv5ecmMrCRjturUP0M
 l5SjFJ3Z4vG6eINurzacdhjuIxHtc0HL9vtRtRhmnjSM8JD71PRJBZSQU
 tmwyxJmtBH7ZW4JQdG5Jv3VrBwnaiF2X+jyefmWzjv4M1tIoF6zRWpxrq
 WaFkbvFYeJBewQEDuLcP5BitWSPV8QpBRphexOPBM470wW7RQIVzX6zy1
 9CaomlG+mZoDSXOyyXMZ7Rk1WLA6LqeySDvcnhr5jDUiO/9YbX0olzUvi
 3gWFU22s6E0yYOSvH82p9d0rumUwnHuKuMj02lcIbwKyf155235W9cFN9 g==;
X-CSE-ConnectionGUID: anoxmUPxQFqrWXFk73xzbQ==
X-CSE-MsgGUID: 5QnNx53TQCCsjX+87dNU8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96519711"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="96519711"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:55:52 -0800
X-CSE-ConnectionGUID: Hc/ejmfCRfeOBPJkr0sNTQ==
X-CSE-MsgGUID: wK1Q8qqgRS24XNLN/ZK7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="219125272"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.236])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:55:47 -0800
Date: Fri, 6 Mar 2026 12:55:44 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915: Fix potential overflow of shmem scatterlist
 length
Message-ID: <aarAwOWXOhcMYGqc@ashyti-mobl2.lan>
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
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

On Tue, Feb 24, 2026 at 10:49:06AM +0100, Janusz Krzysztofik wrote:
> When a scatterlists table of a GEM shmem object of size 4 GB or more is
> populated with pages allocated from a folio, unsigned int .length
> attribute of a scatterlist may get overflowed if total byte length of
> pages allocated to that single scatterlist happens to reach or cross the
> 4GB limit.  As a consequence, users of the object may suffer from hitting
> unexpected, premature end of the object's backing pages.
> 
> [278.780187] ------------[ cut here ]------------
> [278.780377] WARNING: CPU: 1 PID: 2326 at drivers/gpu/drm/i915/i915_mm.c:55 remap_sg+0x199/0x1d0 [i915]
> ...
> [278.780654] CPU: 1 UID: 0 PID: 2326 Comm: gem_mmap_offset Tainted: G S   U              6.17.0-rc1-CI_DRM_16981-ged823aaa0607+ #1 PREEMPT(voluntary)
> [278.780656] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
> [278.780658] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> [278.780659] RIP: 0010:remap_sg+0x199/0x1d0 [i915]
> ...
> [278.780786] Call Trace:
> [278.780787]  <TASK>
> [278.780788]  ? __apply_to_page_range+0x3e6/0x910
> [278.780795]  ? __pfx_remap_sg+0x10/0x10 [i915]
> [278.780906]  apply_to_page_range+0x14/0x30
> [278.780908]  remap_io_sg+0x14d/0x260 [i915]
> [278.781013]  vm_fault_cpu+0xd2/0x330 [i915]
> [278.781137]  __do_fault+0x3a/0x1b0
> [278.781140]  do_fault+0x322/0x640
> [278.781143]  __handle_mm_fault+0x938/0xfd0
> [278.781150]  handle_mm_fault+0x12c/0x300
> [278.781152]  ? lock_mm_and_find_vma+0x4b/0x760
> [278.781155]  do_user_addr_fault+0x2d6/0x8e0
> [278.781160]  exc_page_fault+0x96/0x2c0
> [278.781165]  asm_exc_page_fault+0x27/0x30
> ...
> 
> That issue was apprehended by the author of a change that introduced it,
> and potential risk even annotated with a comment, but then never addressed.
> 
> When adding folio pages to a scatterlist table, take care of byte length
> of any single scatterlist not exceeding max_segment.
> 
> Fixes: 0b62af28f249b ("i915: convert shmem_sg_free_table() to use a folio_batch")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: stable@vger.kernel.org # v6.5+
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Applied to drm-intel-gt-next.

Thanks,
Andi
