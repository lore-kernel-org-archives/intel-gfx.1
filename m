Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEDEC43458
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Jul 2026 05:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB6410E008;
	Tue, 14 Jul 2026 05:12:50 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C73D10E008;
 Tue, 14 Jul 2026 05:12:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F228D68BFE; Tue, 14 Jul 2026 07:12:43 +0200 (CEST)
Date: Tue, 14 Jul 2026 07:12:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, baoquan.he@linux.dev, chrisl@kernel.org,
 usama.arif@linux.dev, kasong@tencent.com, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, youngjun.park@lge.com,
 linux-mm@kvack.org, Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: better block swap batching and a different take on swap_ops v5
Message-ID: <20260714051243.GB31523@lst.de>
References: <20260713093350.2154226-1-hch@lst.de>
 <20260713131305.3efec91d077d224a3a8d1aad@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713131305.3efec91d077d224a3a8d1aad@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Mon, Jul 13, 2026 at 01:13:05PM -0700, Andrew Morton wrote:
> On Mon, 13 Jul 2026 11:33:37 +0200 Christoph Hellwig <hch@lst.de> wrote:
> 
> > this series makes use of the swap_iocb for block as well so that it
> > doesn't do inefficient single-bio I/O, and then rebases the swap_ops from
> > Baoquan on top of the now very different method structure.
> > 
> > When running doing kernels builds, which is a workload that doesn't
> > really do much THP anonymous memory it still gets 2x clustering for
> > writeout and 1.2x for reading back swap in.  The overall times do
> > not actually change, though.
> 
> Thanks.  Sashiko review might have found a couple of deadly issues in 
> 
> 	drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> 	drivers/gpu/drm/ttm/ttm_backup.c
> 
> so let me add a zillions cc's.

Well, I mentioned this before, as did you.  But it is all existing
issues.  The proper fix would of course be to not give users such
low-level access to shmem writeback..

On the other Sashiko comment: the bi_vcnt doesn't make any sense,
bi_vcnt is only for the submitters convenience.

