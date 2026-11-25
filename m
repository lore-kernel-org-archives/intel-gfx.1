Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B7606A326
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 05:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hj+Mnvzl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DCA10E7F5;
	Wed, 25 Nov 2026 05:37:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5211E10E7F5;
 Wed, 25 Nov 2026 05:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6tY7qXPR+c8tZisw2M9xzYszGIvCapp/QNzy3udpL9k=; b=hj+Mnvzlg2D6efDaM7VGu2tcWZ
 Wt3E5/jwvZcLhiACnZqF6kDijNXXjHGGUL21yLs44x16ORA0BlXLnmydEzfg3EkMqUob+ijhFbXem
 FLsdSScnK67WKo0xPL82Ya36hOwF5RcKMCrrq+RPms0w/DyT6bKVB1ipAToYSYV7aosO5RBbou9/0
 wIaQT5ACkeEKOY9XI682VV5JiedWNwyq/d26EIG2bi9sfXMsSFDvJr2ptqTVvXtqvAsReugOqcwv/
 VZfkJCbkzlRtt+cstChUoowdChjU0T6Pl/CpUku3eHCgfq98v9J9mMa/GW/7sUbQ/k+bM0TAE23KP
 CP1ux0mw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.100.1 #2 (Red
 Hat Linux)) id 1xW5gQ-00000008TSS-3Fz1;
 Wed, 25 Nov 2026 05:36:42 +0000
Date: Tue, 24 Nov 2026 21:36:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] drm/i915/gem: Skip writeback of shmem folios with extra
 references
Message-ID: <awZz6sq_4cjIgUcq@infradead.org>
References: <20261119134243.3745282-1-kas@kernel.org>
 <av8n42vx3Q7zvQK8@zenone.zhora.eu> <awBIB3vjr_o-gfCn@shutemov.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awBIB3vjr_o-gfCn@shutemov.name>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 01:17:31PM +0000, Kiryl Shutsemau (Meta) wrote:
> > >  	while ((folio = writeback_iter(mapping, &wbc, folio, &error))) {
> > > -		if (folio_mapped(folio))
> > > +		if (folio_mapped(folio) ||
> > > +		    folio_ref_count(folio) != 1 + folio_nr_pages(folio))
> > 
> > I don't think we need this fix in the current tree. The i915
> > writeback iterator already skips the shmem folio in the case you
> > describe, so the new refcount check doesn't change the outcome.
> 
> Oh. It took me a while to see why.
> 
> __shmem_writeback() asks writeback_iter() for PAGECACHE_TAG_DIRTY
> folios, and shmem never sets that tag, its ->dirty_folio is
> noop_dirty_folio(). So the loop body never runs for any folio, and
> hasn't since 776a853a43c9 ("i915: Use writeback_iter()").

Heh.  I'm surprised no one noticed..

> That makes me question the whole writeback thing. What's going on
> there, and what's the plan?

I (and others) have been asking forever to get drm out of micro-managing
tmpfs.  I guess given that this code path hasn't worked for a year and
a half is a pretty good indicator that this instance should simply
go away.

