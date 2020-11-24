Return-Path: <SRS0=tBxe=E6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE74C2D0E4
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 18:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 868BE204FD
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 18:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZWy/rWek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 868BE204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E92F6E506;
	Tue, 24 Nov 2020 18:59:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB7A89EB8
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M/iBLJL/EG5AgOHD7behYTBNDQkWYbGk8/XLqfCBQpc=; b=ZWy/rWekEoc/XtfyySU5aZH3J0
 Krzj7EjERitAmRkbozaSIaWZ9lY1bH8N/dvz6gSzYUo7HJUedIKRAM8RWGeJeX0UwZHPzTfx0AasE
 4QDj7Pg62EbANHgDbMrY/M9BbVARJzB6RTUWA0u5uuEVQv9/l4eOBqJ+iOx32TXZkXwz8mPNKODTy
 jR85yOpj4EBh+qFIL617dqd/PiV5S960MjELfXUnMimhT/JsAfYmiLmm5sqOb0uUAPZqF0CARUpY1
 NKx2Icsy9uqPXzF2qN8PJtUsWEYToJ5JOSio1aQeuHJUunm6jbKdxizTMdBX2U1ggAIFAON3vY4Iv
 tI+0ZbIg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1khUqr-0000SN-4t; Tue, 24 Nov 2020 09:43:09 +0000
Date: Tue, 24 Nov 2020 09:43:09 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20201124094309.GI31963@infradead.org>
References: <cover.1606153547.git.jani.nikula@intel.com>
 <7ff5ce0b735901eb4f10e13da2704f1d8c4a2507.1606153547.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ff5ce0b735901eb4f10e13da2704f1d8c4a2507.1606153547.git.jani.nikula@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 24 Nov 2020 18:59:06 +0000
Subject: Re: [Intel-gfx] [PATCH 9/9] blktrace: make relay callbacks const
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 07:59:29PM +0200, Jani Nikula wrote:
> Now that relay_open() accepts const callbacks, make relay callbacks
> const.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
