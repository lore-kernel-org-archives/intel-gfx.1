Return-Path: <SRS0=3jck=B7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293FFC433E3
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 12:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0746420724
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 12:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0746420724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8EC6E115;
	Fri, 21 Aug 2020 12:18:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F0C6E115
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2020 12:18:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DA22ACCF;
 Fri, 21 Aug 2020 12:18:47 +0000 (UTC)
Date: Fri, 21 Aug 2020 14:18:16 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20200821121816.GJ3354@suse.de>
References: <20200821085011.28878-1-chris@chris-wilson.co.uk>
 <20200821100902.GG3354@suse.de>
 <159800481672.29194.17217138842959831589@build.alporthouse.com>
 <20200821102343.GI3354@suse.de>
 <159800635942.29194.13489565974587679781@build.alporthouse.com>
 <159800988352.29194.8498025838223804532@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159800988352.29194.8498025838223804532@build.alporthouse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH] mm: Track page table modifications in
 __apply_to_page_range() construction
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

On Fri, Aug 21, 2020 at 12:38:03PM +0100, Chris Wilson wrote:
> In the version I tested, I also had
> 
> @@ -2216,7 +2216,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
> 
>         if (create) {
>                 pte = (mm == &init_mm) ?
> -                       pte_alloc_kernel(pmd, addr) :
> +                       pte_alloc_kernel_track(pmd, addr, mask) :
>                         pte_alloc_map_lock(mm, pmd, addr, &ptl);
>                 if (!pte)
>                         return -ENOMEM;
> 
> And that PGTBL_PMD_MODIFIED makes a difference.

Right, thanks. Added that too.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
