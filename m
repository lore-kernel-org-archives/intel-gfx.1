Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4810CC55179
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Aug 2026 11:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D087F10E035;
	Mon,  3 Aug 2026 11:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipZSIIqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B271210E035
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 Aug 2026 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785757299; x=1817293299;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Fwjg96QvCsBUIPrcba9cNtR0EAkWPU0XqVX0OTUUu1k=;
 b=ipZSIIqmMfLwLLAgQm0ZOE5pfkDyCYk1lTPW9JL3KGFvAeT0PiBD4hhT
 vLBp6qUfmPNf9WLPf0L7tIn74Dz7mBobDEod5/PEvgl9j28BQgo9hgw8e
 B59oXN0y8Agm5ZhT+U4EI76Rs1YYXgFXDs3aqLgcbkVnmp+er+zXZhIw/
 CA+R81WpR5OycOudXCG7u3JGC3oIXJUG2zKzzdy2zpCOe/kZvksVUl/Df
 v3t4mesprM2EUS+va1DSrSwMYGISRDnIrxcM5K4T7eG1Xts31KvClDNPT
 fwRrv5PF+F0Q81cMBGWa7KVtq027V5nFZ8BkL4AIOSETHXw70gKQQUcqQ w==;
X-CSE-ConnectionGUID: pXE0o0RYSeOvvqQYf2unKA==
X-CSE-MsgGUID: 1ddE3TRiQFyv486e6Q3miQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86372807"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86372807"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 04:41:38 -0700
X-CSE-ConnectionGUID: nt+HEkphTPG7SWq2rxZySw==
X-CSE-MsgGUID: 0nirgKFBR8G+QY9lqB6AOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="256871412"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 04:24:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Parth Kamani <parthvipulkamani@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: Offering to take a TODO item in i915
In-Reply-To: <CACa-pC3Z6KN247yJ9tnb9BZoqSHmXWOzo4LyBodGbQj7uCN=CQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CACa-pC3Z6KN247yJ9tnb9BZoqSHmXWOzo4LyBodGbQj7uCN=CQ@mail.gmail.com>
Date: Mon, 03 Aug 2026 14:24:43 +0300
Message-ID: <40500b41434cf52b25d094fbfdcf56a782fd4607@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 03 Aug 2026, Parth Kamani <parthvipulkamani@gmail.com> wrote:
> Hi Jani,
>
> I was looking through drivers/gpu/drm/i915/TODO.txt and noticed that there
> are still a number of outstanding items. One that caught my attention was *"for
> discrete memory manager, merge enough dg1 to be able to refactor it to ..."*.
> I also saw items such as *"Come up with a plan what to do with
> drm/scheduler and how to get there"* and *"Roll out dma_fence critical
> section annotations"*, so it looks like there are several areas that still
> need work.
>
> From the TODO, some of these items appear more involved than others, so
> before I dive in I wanted to check with you. Is the discrete memory manager
> item still something that would be appropriate to work on, or would you
> recommend a different task for someone making a first contribution to i915?
>
> My preference is to keep patches small enough to review comfortably,
> run checkpatch
> --strict, test against current mainline, and submit them via git send-email.
>
> I'm currently in my final year of B.Tech in Computer Engineering at K J
> Somaiya College of Engineering, Mumbai (graduating mid-2027), and I have a
> meaningful amount of time to contribute before graduation. I'd much rather
> spend that time contributing to a live upstream codebase than working only
> on coursework. If there's a better first task than the TODO item above, I'd
> really appreciate your recommendation and would be happy to work on that
> instead.

Thanks for your interest!

The TODO was added in commit 6ab61ad5c1d8 ("drm/i915: add gem/gt TODO")
and has barely been touched since. The primary reason is migrating to
the xe driver for new platforms. If you're looking to work on a "live
upstream codebase", seeking tasks in the xe driver, or the display
driver under i915/display, shared between the xe and i915 drivers, is
probably more rewarding.


HTH,
Jani.


-- 
Jani Nikula, Intel
