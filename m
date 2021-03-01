Return-Path: <SRS0=Mptj=H7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D0EC433E6
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Mar 2021 08:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D02EB64E04
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Mar 2021 08:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D02EB64E04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677356E512;
	Mon,  1 Mar 2021 08:46:04 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4A6E512;
 Mon,  1 Mar 2021 08:46:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E262D68BEB; Mon,  1 Mar 2021 09:45:59 +0100 (CET)
Date: Mon, 1 Mar 2021 09:45:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Message-ID: <20210301084559.GA29133@lst.de>
References: <20210301083320.943079-1-hch@lst.de>
 <YDypXb3M1uVBxcyH@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDypXb3M1uVBxcyH@phenom.ffwll.local>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] add remap_pfn_range_notrack instead of reinventing
 it in i915
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 09:44:13AM +0100, Daniel Vetter wrote:
> On Mon, Mar 01, 2021 at 09:33:18AM +0100, Christoph Hellwig wrote:
> > Hi all,
> > 
> > i915 has some reason to want to avoid the track_pfn_remap overhead in
> > remap_pfn_range.  Add a function to the core VM to do just that rather
> > than reinventing the functionality poorly in the driver.
> 
> It's not _notrack it's "rely on the tracking established by the struct
> io_mapping". Exporting a _notrack version to drivers sounds like not
> something we want to ever do. So I think you want a helper which takes the
> io_mapping, and not something that encourages drivers to go full stupid.

As far as I can tell there is no struct io_mapping anywhere near
remap_io_sg.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
