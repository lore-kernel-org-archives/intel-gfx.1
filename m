Return-Path: <SRS0=YfZL=DI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF34C4727C
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 13:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0912087D
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 13:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0912087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061D189BFD;
	Thu,  1 Oct 2020 13:53:57 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2D689BFD;
 Thu,  1 Oct 2020 13:53:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B1DB068B02; Thu,  1 Oct 2020 15:53:50 +0200 (CEST)
Date: Thu, 1 Oct 2020 15:53:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <20201001135350.GA14869@lst.de>
References: <20201001203917.43d46a3d@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001203917.43d46a3d@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] linux-next: manual merge of the akpm tree with the
 drm-intel tree
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c
> 
> between commit:
> 
>   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
>   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")
> 
> from the drm-intel tree and patch:
> 
>   "drm/i915: use vmap in i915_gem_object_map"
> 
> from the akpm tree.
> 
> I fixed it up (I just dropped the changes in the former commits) and

Sigh.  The solution is a bit more complicated, but I just redid my
patches to not depend on the above ones.  I can revert back to the old
version, though.  Andrew, let me know what works for you.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
