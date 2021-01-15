Return-Path: <SRS0=bvk2=GS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9F9C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 08:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11BD722597
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Jan 2021 08:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11BD722597
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC186E1BD;
	Fri, 15 Jan 2021 08:26:37 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789506E1BD;
 Fri, 15 Jan 2021 08:26:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23602727-1500050 for multiple; Fri, 15 Jan 2021 08:25:47 +0000
MIME-Version: 1.0
In-Reply-To: <YAATPMc+1jmhxnsF@phenom.ffwll.local>
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
 <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
 <161057213487.6195.581396740566956696@build.alporthouse.com>
 <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
 <161061619887.19482.10606780107376365239@build.alporthouse.com>
 <CAKMK7uE58dJabnaTNgePTyio_JY3=kvFZtu1RT1eFeGDK76ZeA@mail.gmail.com>
 <161061753732.19482.13146900597152116822@build.alporthouse.com>
 <YAATPMc+1jmhxnsF@phenom.ffwll.local>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 15 Jan 2021 08:25:46 +0000
Message-ID: <161069914606.19482.1823329746575120144@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 John Stultz <john.stultz@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 DMA BUFFER SHARING FRAMEWORK <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-01-14 09:47:40)
> On Thu, Jan 14, 2021 at 09:45:37AM +0000, Chris Wilson wrote:
> > Quoting Daniel Vetter (2021-01-14 09:30:32)
> > > On Thu, Jan 14, 2021 at 10:23 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > > The only other problem I see with the implementation is that there's
> > > > nothing that says that each dmabuf->ops->map_dma_buf() returns a new
> > > > sg_table, so we may end up undoing the xor. Or should each dma-buf
> > > > return a fresh dma-mapping for iommu isolation?
> > > 
> > > Maybe I screwed it up, but that's why I extracted the little helpers:
> > > We scramble when we get the sgtable from exporter, and unscramble
> > > before we pass it back. dma-buf.c does some caching and will hand back
> > > the same sgtable, but for that case we don't re-scramble.
> > 
> > The attachment is only mapped once, but there can be more than one
> > attachment, and the backend could return the same sg_table for each
> > mapping. Conceivably, it could return its own private sg_table where it
> > wants to maintain the struct page. Seems like just adding a sentence to
> > @map_dma_buf to clarify that each call should return a new sg_table will
> > suffice.
> 
> Ah yes good point, will augment (once CI stops being angry at me).

Fwiw, with a quick explanation of "don't do this" in the docs,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
