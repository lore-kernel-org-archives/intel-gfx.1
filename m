Return-Path: <SRS0=9rZY=GQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B64C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 20:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A4932313E
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 20:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A4932313E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C776EC60;
	Wed, 13 Jan 2021 20:50:24 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6006EC60
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 20:50:22 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 15so3593232oix.8
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 12:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqFgc2dzKme0zr+aU1JENA4xdAtd9mmh2guoOC2yjew=;
 b=MQQhT8WVByeSlgDj2m+Ianm+DeZbxWW0a6i6/UvKUWT/ZY2Aj6ipHsJ68EcJzntahX
 ba+ftlZmyowIXRFKfr4fb1svh06/VzwQK94Rd6u8ryCRX75PDJwi6duabIiS9/7tB0uY
 6pZYvzSKFeUmpwcrO2+fI7/fbNdSBgwzk46J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqFgc2dzKme0zr+aU1JENA4xdAtd9mmh2guoOC2yjew=;
 b=cadMVq+m9GAF5FJCqrMfbbFxsFQcbR435+vGKbmR3aWSqUoSGadwaRHRrmVCgoiYoL
 HXTemefYC9vL/niaXYamHP9uOyNF6RuBptIFLHRT21gDOsJupFqkCpLAYY+Z7QMNFNts
 ipekz6zUxNoNWpXxXXAcWUhXk1DjntMnEfBd6OKO6G6XnMKcw/PFr/ncVK3OZeYL8+g6
 53MkzTlcOYwkH7CAa0IwnO+CibsmqdoVurjJk/oHCFeSYH5Vd790HKH9pMnYJMKeVb2h
 rWLJgSsV+MuJow9qYM9jScmWOELNj8c2KsPO4pdh6A1Dc+sNo3JZXchuEgoCdyikTdKo
 Gvzg==
X-Gm-Message-State: AOAM532iKY+laGg115+WNwMrZnATNUOhEd7G+ejQwa/EudPBCE7rd8j9
 HHOGOmuZ5pFiTduNQRY66zWXk+QzSlTezou6IZyNiA==
X-Google-Smtp-Source: ABdhPJy67Q/SiF12KAy9W+l33TI2jHio6EqyjNUlwUVXtpcm2GTUEw2G9L6akaRObc+uz+7EkfYii6J6G5enil+o9lE=
X-Received: by 2002:aca:54d8:: with SMTP id i207mr651674oib.101.1610571022183; 
 Wed, 13 Jan 2021 12:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
In-Reply-To: <161055261490.6195.7986280621869334351@build.alporthouse.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 13 Jan 2021 21:50:11 +0100
Message-ID: <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Daniel Vetter (2021-01-13 14:06:04)
> > We have too many people abusing the struct page they can get at but
> > really shouldn't in importers. Aside from that the backing page might
> > simply not exist (for dynamic p2p mappings) looking at it and using it
> > e.g. for mmap can also wreak the page handling of the exporter
> > completely. Importers really must go through the proper interface like
> > dma_buf_mmap for everything.
>
> If the exporter doesn't want to expose the struct page, why are they
> setting it in the exported sg_table?

You need to store it somewhere, otherwise the dma-api doesn't work.
Essentially this achieves clearing/resetting the struct page pointer,
without additional allocations somewhere, or tons of driver changes
(since presumably the driver does keep track of the struct page
somewhere too).

Also as long as we have random importers looking at struct page we
can't just remove it, or crashes everywhere. So it has to be some
debug option you can disable.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
