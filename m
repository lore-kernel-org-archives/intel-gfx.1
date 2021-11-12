Return-Path: <SRS0=wBbn=P7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94734C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 20:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5445F60F93
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Nov 2021 20:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5445F60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EEE6E1BC;
	Fri, 12 Nov 2021 20:10:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E054E6E155;
 Fri, 12 Nov 2021 20:10:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10166"; a="230662176"
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="230662176"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 12:09:59 -0800
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; d="scan'208";a="505018696"
Received: from rjlank1-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.91.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 12:09:58 -0800
Date: Fri, 12 Nov 2021 12:09:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20211112200957.qem4dyjnzjhls4v3@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
 <20211112190403.GK174703@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211112190403.GK174703@worktop.programming.kicks-ass.net>
Subject: Re: [Intel-gfx] [PATCH 0/2] Nuke PAGE_KERNEL_IO
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
Cc: linux-arch@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 08:04:03PM +0100, Peter Zijlstra wrote:
>On Thu, Oct 21, 2021 at 11:15:09AM -0700, Lucas De Marchi wrote:
>> Last user of PAGE_KERNEL_IO is the i915 driver. While removing it from
>> there as we seek to bring the driver to other architectures, Daniel
>> suggested that we could finish the cleanup and remove it altogether,
>> through the tip tree. So here I'm sending both commits needed for that.
>>
>> Lucas De Marchi (2):
>>   drm/i915/gem: stop using PAGE_KERNEL_IO
>>   x86/mm: nuke PAGE_KERNEL_IO
>>
>>  arch/x86/include/asm/fixmap.h             | 2 +-
>>  arch/x86/include/asm/pgtable_types.h      | 7 -------
>>  arch/x86/mm/ioremap.c                     | 2 +-
>>  arch/x86/xen/setup.c                      | 2 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
>>  include/asm-generic/fixmap.h              | 2 +-
>>  6 files changed, 6 insertions(+), 13 deletions(-)
>
>Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

thanks, Peter.

The intention was to merge this through the tip tree. Although now I'm
not sure. Options:

	1) take the first patch through the drm-intel tree and apply the
	   second patch later
	2) take everything through the drm tree
	3) take everything through the tip tree

What's your preference here?

Lucas De Marchi
