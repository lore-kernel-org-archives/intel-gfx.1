Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBBAD340A1
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jan 2026 16:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBD110E597;
	Tue, 27 Jan 2026 16:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9kvC+iI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC2A10E597
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769531424; x=1801067424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eCji8D2wcCd8Dso0CqbmZYZhUYA1gqN2wkWjuYzQtiw=;
 b=X9kvC+iIDS/tuyVzDtcSSmayCICdeWxWkMkDHAVY11m+UY4RenlNLPW4
 IGH1cQntuC+SOwdUceXM/mNroYOGQfSDS8kKwKE5qkrkn+JX7CHgunjhI
 t6SA3A9nnXrD8wyzuRGngcw6J94MkG2QkayoTArqbQnZsCW1jFWuOhJdB
 M1i5isBsCtNLjXdO77Rt57KZe3eAeFGibpSLXPIXOsiKX8QVMxsIl8pv+
 QfaAJJ00rbPtJ8ea8KB2Fw+erz6K8MUa3NGXzuj50b5HjrxAEvGnwv+DN
 ekQWxhc8uoKvgbOXH0Yt7lIDbqGhAx13XFAsLtisyf042C2EDqgZlkIyk A==;
X-CSE-ConnectionGUID: ppkGn/nWSYmDrww3v+RO5w==
X-CSE-MsgGUID: UqliXdHnSWqnXmXKQoPu9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81037719"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81037719"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 08:30:24 -0800
X-CSE-ConnectionGUID: RgUpohd6SRO8lijo0TTovQ==
X-CSE-MsgGUID: aWhsCZfvSwSmaw1yUw5hXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207625050"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.74])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 08:30:20 -0800
Date: Tue, 27 Jan 2026 17:30:18 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v6] drm/i915/selftests: Keep mock file open during
 unfaultable migrate with fill
Message-ID: <aXjn_isdWcdiCo_O@ashyti-mobl2.lan>
References: <6xc74s3mbmtliqxihtxbok32jobhc26vfm5mu6cod4ywov6utf@ujp3rmqcwmr3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6xc74s3mbmtliqxihtxbok32jobhc26vfm5mu6cod4ywov6utf@ujp3rmqcwmr3>
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

On Wed, Jan 14, 2026 at 04:04:21PM +0000, Krzysztof Karas wrote:
> igt_mmap_migrate() tests migration with various parameters.
> In one of the cases, where FILL and UNFAULTABLE flags are set,
> during first stages of this test, a mock file is opened in
> igt_mmap_offset(), which results in allocating GEM objects for
> page table structures and scratch in GPU mappable memory.
> 
> Then, also in igt_mmap_offset(), the file is closed (fput) and
> the cleanup of these objects is scheduled on a delayed worqueue,
> which is designed to execute after unspecified amount of time.
> 
> Next, the test calls igt_fill_mappable() to fill mappable GPU
> memory. At this point, three scenarios are possible
> (N = max size of GPU memory for this test in MiB):
>  1) the objects allocated for the mock file get cleaned up after
>     crucial part of the test is over, so the memory is full with
>     the 1 MiB they occupy and N - 1 MiB added by
>     igt_fill_mappable(), so the migration fails properly;
>  2) the object cleanup fires before igt_fill_mappable()
>     completes, so the whole memory is populated with N MiB from
>     igt_fill_mappable(), so migration fails as well;
>  3) the object cleanup is performed right after fill is done,
>     so only N - 1 MiB are in the mappable portion of GPU memory,
>     allowing the migration to succeed - we'd expect no space
>     left to perform migration, but an object was able to fit in
>     the remaining 1 MiB, which caused get_user() to succeed, so
>     a page fault did not fail.
> 
> The test incorrectly assumes that the GPU mappable memory state
> is unchanging during the test. Amend this by keeping the mock
> file open until migration and page fault checking is complete.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>

acked and merged to drm-intel-gt-next.

Thanks,
Andi
