Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA4CC12002
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 16:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102A56023B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 16:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102A56023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A716E8DC;
	Wed, 21 Jul 2021 16:16:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669FE6E84C;
 Wed, 21 Jul 2021 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=dovBFK3QQdO0rOX8vuhPmoaedl
 ggoMRCo09tbcMv7DguiDQsLvJaZAEFeOCHY64YF8+XeisjCS0MfFmCbAjnK7WWbibGrXW5kNp95H9
 xfLXECgjN1DM2kXnXe+uYTmEesIzs/xr5310buPqfdvE2luvfrAXJ9lO2dIerZh9CflZMjlLSGo6X
 iEDYmRjNSHYEo7mbBb4GNyqpvq9tHohN9ymD28n8q5rlk9Uh38aNj279aOIfxDm1jPx60t4qH9JuL
 EbOcHo6L8tLo7zO2s7OAbUH+SIf31zd1YhyYcoJdEboEqWRBQe3wALgsHsqnUvN9tXm6+4NLCYrbx
 go//Vf2w==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6Et7-009NYa-0x; Wed, 21 Jul 2021 16:16:01 +0000
Date: Wed, 21 Jul 2021 17:16:01 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Leon Romanovsky <leon@kernel.org>
Message-ID: <YPhIQWvob3pTTUYA@infradead.org>
References: <cover.1626605893.git.leonro@nvidia.com>
 <009740c35873683e401da3f86d0e7a78b2f25601.1626605893.git.leonro@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <009740c35873683e401da3f86d0e7a78b2f25601.1626605893.git.leonro@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Intel-gfx] [PATCH rdma-next v2 2/2] RDMA: Use dma_map_sgtable
 for map umem pages
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
Cc: David Airlie <airlied@linux.ie>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jason Gunthorpe <jgg@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Maxime Ripard <mripard@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Maor Gottlieb <maorg@nvidia.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
