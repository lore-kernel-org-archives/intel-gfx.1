Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3B6CA5FF0
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 08:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623BF10E139;
	Mon,  5 Oct 2026 08:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="j5knjFn1";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FD710E139;
 Mon,  5 Oct 2026 08:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NuhGNh33RwpQYIAorkA2VvhjQZ6YMZLfJjskTBdQXyI=; b=j5knjFn1RaLQq9uuPmpU4+3fzU
 K1B4O6C+MlIn7MMaiUKEHpbjcCadAxow2q1BWjDX4yRIxpUtlNqI4G42kp5za1wmy/2Z11iuuSOqN
 aei2LDuZfL79O0HopoD6b0SjVBZSPRC6dZ79kH0ElBm+AoarvbwqDOXdhO8NYCxPJMWFeNlFVnP6v
 wdbSgiKumwwN7yyMAaoiaxUeC6XVVjIHwrhI2xPcq5+1HIpf/E9VbgqVEh7jj0UW7ds8+1i+8HLmm
 4xrg9h1+cLyqg4U9KKtPrkoYy+m4Yy64bzlA2vCYXstj9i1XD7/EWjPuczj8IWheuHY8PkmmLSXh+
 ZNGTf74A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1xDdtM-0000000Fra1-30eo;
 Mon, 05 Oct 2026 08:17:48 +0000
Date: Mon, 5 Oct 2026 01:17:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Andi Shyti <andi.shyti@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <brauner@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [PATCH v2] drm/i915: look up shmem folios by index for writeback
Message-ID: <asNdLJdbpkUVsQzU@infradead.org>
References: <20261004094827.174193-1-matthias.goergens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004094827.174193-1-matthias.goergens@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

As mentioned multiple times before, none of this code belongs into a
driver or anywhere outside of mm.  This has come up basically everytime
this got touched, and Matthew Brost said he was going to look into it.

This patch that adds even more mm magic in the driver really is a no-go
(as is ignoring the shmem and mm maintainers and lists).

Also if this was broken for a year and a half without anyone noticing,
I really wonder what the impact really is, but it really does not
sound like we should optimize for sketchy backports over the proper
fix.

On Sun, Oct 04, 2026 at 05:48:27PM +0800, Matthias Goergens wrote:
> Since commit 776a853a43c9 ("i915: Use writeback_iter()"),
> __shmem_writeback() starts writeback on no folios at all.  In
> WB_SYNC_NONE mode writeback_iter() only returns folios tagged
> PAGECACHE_TAG_DIRTY, and shmem never sets that tag: it dirties folios
> with noop_dirty_folio(), because shmem relies on LRU-based swap writeout
> rather than on the dirty tag (see the comment in __folio_mark_dirty() in
> mm/page-writeback.c).  The loop before that commit looked pages up by
> index and tested the page dirty flag, so it did write.
> 
> This affects the shrinker's I915_SHRINK_WRITEBACK pass and the i915 TTM
> backend, which both call __shmem_writeback().  The pages stay dirty and
> on the LRU, so reclaim still swaps them out later; what is lost is the
> early writeback.
> 
> Go back to looking up the folios of the object by index, in batches
> with filemap_get_folios(), and reschedule between batches, as
> writeback_iter() does.  Mapped folios are still skipped.  Unlike the old
> loop, do not wait for a folio lock, since this also runs from the OOM
> notifier; a locked folio is left to reclaim.  shmem_write_folio()
> returns with the folio unlocked except for AOP_WRITEPAGE_ACTIVATE, so
> unlock it only in that case.  It may also split a large folio and leave
> the rest of it dirty, so look the rest up again.
> 
> I came across this while measuring an earlier patch of mine to this
> loop, which changed nothing because the loop never visits a folio.
> This patch was measured without Intel hardware, with a test-only mock
> selftest in a QEMU guest with swap.  Dirty, unpinned objects of 1 to
> 256 MiB, with and without THP, went through i915_gem_shrink() with
> I915_SHRINK_WRITEBACK.  Before this patch, no page was written in any
> case; with it, every page that was not mmapped was, also when swap-out
> split the large folios.  The contents read back intact after swap-in,
> and the mock selftests give the same results as before.  This has not
> been tested on hardware.
> 
> Fixes: 776a853a43c9 ("i915: Use writeback_iter()")
> Cc: stable@vger.kernel.org # v6.16+
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> v1: https://lore.kernel.org/all/20261002073107.2209644-1-matthias.goergens@gmail.com/
> 
> Changes in v2:
> - Look the folios up in batches with filemap_get_folios() and call
>   cond_resched() between batches, instead of one __filemap_get_folio()
>   call per index with no rescheduling, which Sashiko pointed out:
>   https://lore.kernel.org/all/20261002091439.59C611F00899@smtp.kernel.org/
>   Measured with the same test-only harness in the same guest, v1 against
>   v2: on a fully populated 1 GiB object, the longest time the walk ran
>   without reaching cond_resched() went from about 85 ms to under 0.1 ms;
>   on a 3 GiB object (786432 pages) with 1% of its pages present and the
>   rest holes or swapped out, one call made 255 filemap_get_folios()
>   calls instead of 786432 __filemap_get_folio() calls.  A run of swap
>   entries is still stepped over inside a single filemap_get_folios()
>   call: about 2 ms for a fully swapped-out 3 GiB object.  I did not split
>   the range further, since every page of the object was in memory until
>   just before this runs, so holes and swap entries are the exception.
> - A batch is looked up ahead of the writes, so if writing splits a
>   large folio, look the rest of it up again (v1 got this by reading the
>   folio size after the write).
> 
> This replaces my two earlier patches to this loop, which can be dropped:
> the loop they change never visits a folio.
> 
> https://lore.kernel.org/all/20260915062924.2410550-1-matthias.goergens@gmail.com/
> https://lore.kernel.org/all/20260914105606.3997649-1-matthias.goergens@gmail.com/
> 
> In 6.18.y and 7.2.y, the maintained stable trees that have
> 776a853a43c9, the call is shmem_writeout(folio, NULL, NULL) instead of
> shmem_write_folio(folio), with the same return convention.
> 
> In review of 776a853a43c9, Christoph asked for this loop to move behind
> a shmem API instead of living in drivers, and Matthew agreed:
> 
> https://lore.kernel.org/all/Z--XtaM7Z3zbjzAu@infradead.org/
> https://lore.kernel.org/all/Z-_hQwNeiOnNYJVp@casper.infradead.org/
> 
> I kept this fix inside i915 so that it is one patch for stable.
> 
> The test harness is not part of the patch; I can post it if that helps.
> Testing on Intel hardware under memory pressure would be very welcome.
> 
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 70 ++++++++++++++++++-----
>  1 file changed, 57 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index ef9440166295..d2077b823b1b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -304,28 +304,72 @@ shmem_truncate(struct drm_i915_gem_object *obj)
>  	return 0;
>  }
>  
> +/* Start writing a locked folio to swap.  It is unlocked on return. */
> +static void shmem_writeback_folio(struct folio *folio)
> +{
> +	int ret;
> +
> +	folio_set_reclaim(folio);
> +	ret = shmem_write_folio(folio);
> +	if (!folio_test_writeback(folio))
> +		folio_clear_reclaim(folio);
> +
> +	/* shmem_write_folio() unlocks the folio unless it returns this. */
> +	if (ret == AOP_WRITEPAGE_ACTIVATE)
> +		folio_unlock(folio);
> +}
> +
>  void __shmem_writeback(size_t size, struct address_space *mapping)
>  {
> -	struct writeback_control wbc = {
> -		.sync_mode = WB_SYNC_NONE,
> -		.nr_to_write = SWAP_CLUSTER_MAX,
> -		.range_start = 0,
> -		.range_end = LLONG_MAX,
> -	};
> -	struct folio *folio = NULL;
> -	int error = 0;
> +	pgoff_t last = (size >> PAGE_SHIFT) - 1;	/* last page, inclusive */
> +	struct folio_batch fbatch;
> +	pgoff_t index = 0;
> +	unsigned int i;
>  
>  	/*
> +	 * shmem marks folios dirty with noop_dirty_folio(), which does not
> +	 * set PAGECACHE_TAG_DIRTY, so writeback_iter() would find none of
> +	 * them.  Look up the folios of the object in batches and write out
> +	 * the dirty ones.
> +	 *
>  	 * Leave mmapings intact (GTT will have been revoked on unbinding,
>  	 * leaving only CPU mmapings around) and add those folios to the LRU
>  	 * instead of invoking writeback so they are aged and paged out
>  	 * as normal.
>  	 */
> -	while ((folio = writeback_iter(mapping, &wbc, folio, &error))) {
> -		if (folio_mapped(folio))
> -			folio_redirty_for_writepage(&wbc, folio);
> -		else
> -			error = shmem_write_folio(folio);
> +	folio_batch_init(&fbatch);
> +	while (filemap_get_folios(mapping, &index, last, &fbatch)) {
> +		for (i = 0; i < folio_batch_count(&fbatch); i++) {
> +			struct folio *folio = fbatch.folios[i];
> +			long nr_pages = folio_nr_pages(folio);
> +
> +			/*
> +			 * Leave locked folios to reclaim: this runs from the
> +			 * shrinker and the OOM notifier, so do not wait for a
> +			 * lock.
> +			 */
> +			if (!folio_trylock(folio))
> +				continue;
> +
> +			if (folio->mapping != mapping || folio_mapped(folio) ||
> +			    !folio_clear_dirty_for_io(folio)) {
> +				folio_unlock(folio);
> +				continue;
> +			}
> +
> +			shmem_writeback_folio(folio);
> +
> +			/*
> +			 * Writing may have split the folio and left the rest
> +			 * of it dirty; look the rest up again.
> +			 */
> +			if (folio_nr_pages(folio) != nr_pages) {
> +				index = folio_next_index(folio);
> +				break;
> +			}
> +		}
> +		folio_batch_release(&fbatch);
> +		cond_resched();
>  	}
>  }
>  
> 
> base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
> -- 
> 2.56.0
> 
---end quoted text---
