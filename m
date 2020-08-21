Return-Path: <SRS0=3jck=B7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF407C433E3
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 10:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B895220732
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 10:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B895220732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBAA6EAC5;
	Fri, 21 Aug 2020 10:22:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B16F6EAC5
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2020 10:22:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07861B5E2;
 Fri, 21 Aug 2020 10:22:34 +0000 (UTC)
Date: Fri, 21 Aug 2020 12:22:04 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20200821102204.GH3354@suse.de>
References: <20200821085011.28878-1-chris@chris-wilson.co.uk>
 <20200821095129.GF3354@suse.de>
 <159800366215.29194.8455636122843151159@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159800366215.29194.8455636122843151159@build.alporthouse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH 1/4] mm: Export flush_vm_area() to sync the
 PTEs upon construction
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mm@kvack.org,
 David Vrabel <david.vrabel@citrix.com>, Pavel Machek <pavel@ucw.cz>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Aug 21, 2020 at 10:54:22AM +0100, Chris Wilson wrote:
> Ok. I thought it had to be after assigning the *ptep. If we apply the
> sync first, do not have to worry about PGTBL_PTE_MODIFIED from the
> *ptep?

Hmm, if I understand the code correctly, you are re-implementing some
generic ioremap/vmalloc mapping logic in the i915 driver. I don't know
the reason, but if it is valid you need to manually call
arch_sync_kernel_mappings() from your driver like this to be correct:

	if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PTE_MODIFIED)
		arch_sync_kernel_mappings();

In practice this is a no-op, because nobody sets PGTBL_PTE_MODIFIED in
ARCH_PAGE_TABLE_SYNC_MASK, so the above code would be optimized away.

But what you really care about is the tracking in apply_to_page_range(),
as that allocates the !pte levels of your page-table, which needs
synchronization on x86-32.

Btw, what are the reasons you can't use generic vmalloc/ioremap
interfaces to map the range?

Regards,

	Joerg
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
