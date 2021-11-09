Return-Path: <SRS0=SCM9=P4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A94C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 08:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D233A610FF
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 08:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D233A610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A946E527;
	Tue,  9 Nov 2021 08:00:01 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E2A6E4BA;
 Tue,  9 Nov 2021 07:59:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5D03968AA6; Tue,  9 Nov 2021 08:59:57 +0100 (CET)
Date: Tue, 9 Nov 2021 08:59:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Message-ID: <20211109075957.GC27339@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163603075885.4807.880888219859400958@jlahtine-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] refactor the i915 GVT support and move to the
 modern mdev API v2
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 02:59:18PM +0200, Joonas Lahtinen wrote:
> The minimal we should do is to eliminate the double underscore
> prefixed functions. But I would prefer to have the symbol exports by
> default so that we can enable the functionality just by loading the
> module.

I'm fine with exporting by default, but just loading won't really work
even with that:

 - there are a bunch of IS_ENABLED conditionals in the i915 (although
   they look like minor optimizations to me).
 - the enable_gvt needs to be set, although after this refactor this
   option is completely pointless and should probably be enabled
 - the enable_guc option needs to be disable for gvt to work.
