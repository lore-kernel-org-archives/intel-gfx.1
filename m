Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FC8C636C9
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 15:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9201661242
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 15:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9201661242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F36F6E819;
	Wed, 21 Jul 2021 15:48:41 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E1B6E819;
 Wed, 21 Jul 2021 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xGDQCg8K3gMLPJfNe3HDAYa4LlCFJK24tPvQoRpr7cQ=; b=ZlIZY+ZqXctBhXKiS5UTCH335I
 5ZhAmhVx4Ek9Z78ML0Dez5TM5NYxtgH348auvop1wOQ9GQNH5urD6Zk/Po0b1MoE9cvkEZBryUfoT
 QcqrFZ60hhh2fFSEFKp1Cu6imRGPmGLZ86JdNBlrs8ZzZloFMseDyuicn1rBHxGDoRYZaiRcYHNd+
 mRGv8ReujMZdh01Py72I9S6Oib5L5O0LipiarWxhBZjL+LnstnbWVDN7QH62aS1H5N3l4PN0egdJ2
 LrIUTIw5Oxs9NvVyiEK2KWfqmPwVgfX4mYdtKcX4J3+X9WQQ/Vbj9Yqk55imlU0QVE1iiDb3rF5JK
 jSDGtgwA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6ENg-009LhK-67; Wed, 21 Jul 2021 15:43:36 +0000
Date: Wed, 21 Jul 2021 16:43:32 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YPhApJo1o6yBYUh2@infradead.org>
References: <YPgAuSt6Ps7w4/AI@infradead.org>
 <YPgD/8Y3/te/Hsu3@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPgD/8Y3/te/Hsu3@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 21 Jul 2021 15:48:40 +0000
Subject: Re: [Intel-gfx] 5.14-rc2 warnings with kvmgvt
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
Cc: Christoph Hellwig <hch@infradead.org>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 07:24:47AM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 21, 2021 at 01:10:49PM +0200, Christoph Hellwig wrote:
> > Hi all,
> > 
> > I'm trying to test some changes for the gvt code, but even with a baseline
> > 5.14-rc2 host and guest the 915 driver does not seem overly happy:
> 
> Is this a regression over -rc1 or over 5.13?
> Bisect possible?

This was introduced somewhere between 5.12 and 5.13, still bisecting.
Note that it only happens for "headless" setups.  Once a display is
added on the qemu command line it goes away.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
