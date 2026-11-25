Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F35606A31E
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c2q6pUxF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45B10E0BE;
	Wed, 25 Nov 2026 14:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7C010E0BE;
 Wed, 25 Nov 2026 14:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+nE1qPVp4biQfgnZmZtxnKZHxMtTmWM+XoomPfXzvfY=; b=c2q6pUxFggMB89suK8IDdsrUdZ
 jCXUTOcTfjjP2XBTsLd/yj5QK2auCU/GBO5+ClH1686zBnQ2JUb+5sqF68UB8Zs36s9rZx23QT1ea
 JfZD91iGWqAcXnlOZAbPUiv161xP40bU/irhHG6UIgMODsh/ORUwsJlwTH07E+56mRQqI1gWBJZY0
 d8M+jtoVUh+R+Cd3WUo4NAB7jT6GKt4a9/uuu0Jv4N5XruPfzuYRzWXFXSll6GU66xQr9Tn0nEr3G
 MC2oLadAp455auSpszEib1fSqggUNyZp2aw7tgClSQO7v2Mx6WX7pKI/ou7ercp0anUCWLIdYYP8g
 ON0PNFGg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.100.1 #2 (Red
 Hat Linux)) id 1xWDzO-0000000AAC3-28Eg;
 Wed, 25 Nov 2026 14:28:50 +0000
Date: Wed, 25 Nov 2026 06:28:50 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, willy@infradead.org,
 brauner@kernel.org, torvalds@linux-foundation.org,
 Andi Shyti <andi.shyti@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gem: Skip writeback of shmem folios with extra
 references
Message-ID: <awbwonrVnwB9yD5Q@infradead.org>
References: <20261119134243.3745282-1-kas@kernel.org>
 <av8n42vx3Q7zvQK8@zenone.zhora.eu> <awBIB3vjr_o-gfCn@shutemov.name>
 <awZz6sq_4cjIgUcq@infradead.org>
 <179559949792.43928.13638993010156007645@jlahtine-mobl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179559949792.43928.13638993010156007645@jlahtine-mobl>
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

On Wed, Nov 25, 2026 at 11:38:17AM +0200, Joonas Lahtinen wrote:
> > Heh.  I'm surprised no one noticed..
> 
> Not so funny to me, you folks are pushing regressions without ever
> Cc'ing a single maintainer in the original patches.

It's not funny, but sad.  Especially your reaction.

> I was under impression that Linux development had some rules about
> not introducing regressions and also some rules about not pushing
> stuff silently to other subsystems. Maybe it's just me not able to
> keep up with the vibes of these times.

Nothing here was silent.  All the relevant lists were on Cc, but as
so often with core fixes the drm and i915 folks completely ignored it.

> It's also more likely on the hardware from the era the fix was developed
> on, and the owners of those older machines are not exactly jumping to the
> latest mainline but rather more likely to run Debian oldstable.
> 
> So which one of you will be writing up a revert or fix for the offending
> patch or do you expect us to clean up the mess you've created?

Of course no one is going to revert this.  The change was part of an
important and invasive core change that is not going to get reverted
for something that hasn't seen any single bug report.

In genral everyone on the mm/writeback/pagecache/shmem side is happy
to work on a solution, but a little bit less of an attitude helps to
get things done.

