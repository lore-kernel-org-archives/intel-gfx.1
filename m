Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA41C41604
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 10:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B96206D4
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 10:41:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="V9XsMoIG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B96206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7266E455;
	Tue,  6 Oct 2020 10:41:28 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128B16E42E
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 10:41:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q5so1819972wmq.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 06 Oct 2020 03:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ppdxET2PA0gOKIN5kGGdI9KhczoNu7DgS5stoBevgQE=;
 b=V9XsMoIGLC/zsM/kB8TOxJcs8Wrjs8fplUDZpxD92KTCEB9eoX1HguQq42evSkJ7AV
 0KeRvG+PIbroLnhtt9D9K1B1lDy7QPScKp3kzisQomTGD6k1N6er6Davt9ehntA0gMIu
 DIViALks5h9F35p6DpaRdqeZ6gdNUqgwAoWT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ppdxET2PA0gOKIN5kGGdI9KhczoNu7DgS5stoBevgQE=;
 b=Uxh9GGf1B2rNrtcK32p8bYl3H0T9oJFBC2gPW/acb3+lu+37mThNhEpU/b3vK4xQKL
 AHXfoK/1FFljEnO3z87l7ik6ypRh3/hLTOh1ozarBnU2iT6CQyTPcbB6UN4DIcufomlT
 UxboQ+FWwnsNTgltXtmq6JkywxVeczXqjQXowdMNyNgi6qclTXggcSMJKwXMG6kE9nsi
 ujjE+NI3VxDf1BmrTExseJbS2e4Xwp3eE55Emf5kiy06T8+pmGlVTRzLxg/4O28wrGTd
 nQRldLBhoQIwQMJeopOpoLNRpL0806ol9RvfHQZel7BoqDoYCb81axSY0usRJFD4ZtWv
 QFCw==
X-Gm-Message-State: AOAM533UdUddMmk6hk/3/ADpLFmiLgTWBUzBdp61ROHf+KXJG2r841km
 FlQwHNEwi3duBQWFN4ggxdcZ4g==
X-Google-Smtp-Source: ABdhPJxmO06kzG4QQ1I3HEy61YhwUV447sv+LJYvQUMAmYEWxdffDW/wKWdF9BfEUBoKO6E7SGa0Tg==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr4261579wmb.142.1601980885754; 
 Tue, 06 Oct 2020 03:41:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g83sm3384495wmf.15.2020.10.06.03.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 03:41:24 -0700 (PDT)
Date: Tue, 6 Oct 2020 12:41:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <20201006104122.GA438822@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>,
 Doug Ledford <dledford@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Maor Gottlieb <maorg@nvidia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
References: <20201004154340.1080481-1-leon@kernel.org>
 <20201005235650.GA89159@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005235650.GA89159@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Intel-gfx] [PATCH rdma-next v5 0/4] Dynamicaly allocate SG
 table from the pages
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
Cc: Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@linux.ie>,
 Maor Gottlieb <maorg@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 08:56:50PM -0300, Jason Gunthorpe wrote:
> On Sun, Oct 04, 2020 at 06:43:36PM +0300, Leon Romanovsky wrote:
> > This series extends __sg_alloc_table_from_pages to allow chaining of
> > new pages to already initialized SG table.
> > 
> > This allows for the drivers to utilize the optimization of merging contiguous
> > pages without a need to pre allocate all the pages and hold them in
> > a very large temporary buffer prior to the call to SG table initialization.
> > 
> > The second patch changes the Infiniband driver to use the new API. It
> > removes duplicate functionality from the code and benefits the
> > optimization of allocating dynamic SG table from pages.
> > 
> > In huge pages system of 2MB page size, without this change, the SG table
> > would contain x512 SG entries.
> > E.g. for 100GB memory registration:
> > 
> >              Number of entries      Size
> >     Before        26214400          600.0MB
> >     After            51200            1.2MB
> > 
> > Thanks
> > 
> > Maor Gottlieb (2):
> >   lib/scatterlist: Add support in dynamic allocation of SG table from
> >     pages
> >   RDMA/umem: Move to allocate SG table from pages
> > 
> > Tvrtko Ursulin (2):
> >   tools/testing/scatterlist: Rejuvenate bit-rotten test
> >   tools/testing/scatterlist: Show errors in human readable form
> 
> This looks OK, I'm going to send it into linux-next on the hmm tree
> for awhile to see if anything gets broken. If there is more
> remarks/tags/etc please continue

An idea that just crossed my mind: A pin_user_pages_sgt might be useful
for both rdma and drm, since this would avoid the possible huge interim
struct pages array for thp pages. Or anything else that could be coalesced
down into a single sg entry.

Not sure it's worth it, but would at least give a slightly neater
interface I think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
