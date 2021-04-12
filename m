Return-Path: <SRS0=cAZQ=JJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7551EC433ED
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 08:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17527611C9
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 08:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17527611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8F06E222;
	Mon, 12 Apr 2021 08:26:45 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F6E6E222
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Apr 2021 08:26:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 62A7B68C65; Mon, 12 Apr 2021 10:26:40 +0200 (CEST)
Date: Mon, 12 Apr 2021 10:26:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210412082640.GB4372@lst.de>
References: <20210412080012.357146277@infradead.org>
 <20210412080611.635125063@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412080611.635125063@infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH 2/7] xen/gntdev,
 x86: Remove apply_to_page_range() use from module
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
Cc: jgross@suse.com, sstabellini@kernel.org, keescook@chromium.org,
 intel-gfx@lists.freedesktop.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 chris@chris-wilson.co.uk, linux-mm@kvack.org, boris.ostrovsky@oracle.com,
 hch@lst.de, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 10:00:14AM +0200, Peter Zijlstra wrote:
> Instead of relying on apply_to_page_range() being available to
> modules, move its use into core kernel code and export it's
> application.

This doesn't exactly look great, but at least it contains the damage..

> 
> NOTE: ideally we do: use_ptemod = !auto_translate_physmap &&
> gnttab_map_avail_bits and remove this hack.

Given how much pain the !auto_translate_physmap case causes all over
the kernel I wonder what a realistic timeline might be for dropping
support for this case might be..
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
