Return-Path: <SRS0=3jck=B7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038D8C433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 23:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5502072D
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 23:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5502072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182046EC1F;
	Fri, 21 Aug 2020 23:39:39 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9C46EC1F
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2020 23:39:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22203819-1500050 for multiple; Sat, 22 Aug 2020 00:39:11 +0100
MIME-Version: 1.0
In-Reply-To: <20200821153412.5902e4ed0699615d8de4a595@linux-foundation.org>
References: <20200821123746.16904-1-joro@8bytes.org>
 <20200821153412.5902e4ed0699615d8de4a595@linux-foundation.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <joro@8bytes.org>
Date: Sat, 22 Aug 2020 00:39:09 +0100
Message-ID: <159805314945.32652.6355592202796435703@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v2] mm: Track page table modifications in
 __apply_to_page_range()
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
Cc: Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mm@kvack.org,
 David Vrabel <david.vrabel@citrix.com>, Pavel Machek <pavel@ucw.cz>,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Andrew Morton (2020-08-21 23:34:12)
> On Fri, 21 Aug 2020 14:37:46 +0200 Joerg Roedel <joro@8bytes.org> wrote:
> 
> > The __apply_to_page_range() function is also used to change and/or
> > allocate page-table pages in the vmalloc area of the address space.
> > Make sure these changes get synchronized to other page-tables in the
> > system by calling arch_sync_kernel_mappings() when necessary.
> > 
> > Tested-by: Chris Wilson <chris@chris-wilson.co.uk> #x86-32
> > Cc: <stable@vger.kernel.org> # v5.8+
> 
> I'm trying to figure out how you figured out that this is 5.8+.  Has a
> particular misbehaving commit been identified?

The two commits of relevance, in my eyes, were

  2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")
  86cf69f1d893 ("x86/mm/32: implement arch_sync_kernel_mappings()")

I can reproduce the failure on v5.8, but not on v5.7. A bisect would
seem to be plausible.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
