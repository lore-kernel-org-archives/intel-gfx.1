Return-Path: <SRS0=p/WI=DH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F103C4727E
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 14:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A082076B
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 14:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A082076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423FE89B12;
	Wed, 30 Sep 2020 14:48:46 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580989B12;
 Wed, 30 Sep 2020 14:48:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 873FE6736F; Wed, 30 Sep 2020 16:48:39 +0200 (CEST)
Date: Wed, 30 Sep 2020 16:48:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Message-ID: <20200930144839.GA897@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
 <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
 <20200926062959.GA3427@lst.de>
 <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com>
 <20200928123741.GA4999@lst.de>
 <160138340987.15771.13645983702040612672@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160138340987.15771.13645983702040612672@jlahtine-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] remove alloc_vm_area v2
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Matthew Auld <matthew.auld@intel.com>, xen-devel@lists.xenproject.org,
 Nitin Gupta <ngupta@vflare.org>, intel-gfx@lists.freedesktop.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 03:43:30PM +0300, Joonas Lahtinen wrote:
> Hmm, those are both committed after our last -next pull request, so they
> would normally only target next merge window. drm-next closes the merge
> window around -rc5 already.
> 
> But, in this specific case those are both Fixes: patches with Cc: stable,
> so they should be pulled into drm-intel-next-fixes PR.
> 
> Rodrigo, can you cherry-pick those patches to -next-fixes that you send
> to Dave?

They still haven't made it to linux-next.  I think for now I'll just
rebase without them again and then you can handle the conflicts for
5.11.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
