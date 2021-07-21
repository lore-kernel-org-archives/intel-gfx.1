Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16904C6377B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 20:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5136101B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 20:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5136101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5031A6E82D;
	Wed, 21 Jul 2021 20:41:01 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780D36E840;
 Wed, 21 Jul 2021 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EJgGjA01GZw3Yk9ZuhCaXi6YbsFe3EryWSZjq277foA=; b=h3JWY57SwxRcR5pkUIK2zmYtJJ
 7a+Z5F+3nByq1Otuzd3mX2goCAHcU52bqd+/GFpbQx7M89j0+L07jP447bmO54RI1+v9md0mtp3DQ
 yMmaAsofQIVKcsOTC2NqoNfke+7F4A1JwWe8vnkBHUScE4PcB0rGXtmEhSEo23HwX9QjjtedNiqTC
 qhdkvMt+h+FE8iX5jejQNRZOW/l7yf/nFaLuoxF44xI+hQOafljSfNOsv8RVDn/fhhsnk5hgYWoUC
 QfyiO/a5vDFO0oSX5iqE+NnezrrwagppGUuA6qywjrIHa6D1UyPqxlb9EysxUnuRNe1bYm+1wYoU6
 hx5eJenA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6J0d-009aFJ-Us; Wed, 21 Jul 2021 20:40:09 +0000
Date: Wed, 21 Jul 2021 21:40:03 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YPiGI9tzLzGZg47j@infradead.org>
References: <YPgAuSt6Ps7w4/AI@infradead.org> <YPgD/8Y3/te/Hsu3@intel.com>
 <YPhApJo1o6yBYUh2@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPhApJo1o6yBYUh2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Wed, Jul 21, 2021 at 04:43:44PM +0100, Christoph Hellwig wrote:
> > > I'm trying to test some changes for the gvt code, but even with a baseline
> > > 5.14-rc2 host and guest the 915 driver does not seem overly happy:
> > 
> > Is this a regression over -rc1 or over 5.13?
> > Bisect possible?
> 
> This was introduced somewhere between 5.12 and 5.13, still bisecting.
> Note that it only happens for "headless" setups.  Once a display is
> added on the qemu command line it goes away.

The culprit is:

commit f4eb6d4906669b4285c4f49c87814d4ce63c35bb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Mar 17 18:36:45 2021 +0200

    drm/i915/bios: limit default outputs to ports A through F
        
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
