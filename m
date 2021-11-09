Return-Path: <SRS0=SCM9=P4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF54C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 07:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C2CE61215
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 07:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C2CE61215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2B789FFD;
	Tue,  9 Nov 2021 07:56:29 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A78E89F2D;
 Tue,  9 Nov 2021 07:56:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5E36168AA6; Tue,  9 Nov 2021 08:56:26 +0100 (CET)
Date: Tue, 9 Nov 2021 08:56:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <20211109075626.GB27339@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-3-hch@lst.de>
 <163602902009.4807.3745093259631583283@jlahtine-mobl.ger.corp.intel.com>
 <20211104123225.GV2744544@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104123225.GV2744544@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH 02/29] drm/i915/gvt: integrate into the main
 Makefile
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
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 09:32:25AM -0300, Jason Gunthorpe wrote:
> On Thu, Nov 04, 2021 at 02:30:20PM +0200, Joonas Lahtinen wrote:
> > Quoting Christoph Hellwig (2021-11-02 09:05:34)
> > > Remove the separately included Makefile and just use the relative
> > > reference from the main i915 Makefile as for source files in other
> > > subdirectories.
> > 
> > The thinking behind the split is to avoid any merge conflicts as the
> > gvt/ subdirectory is handled through separate pull request flow and
> > are note part of drm-tip.
> 
> Oh? In that case can we eventually move the VFIO mdev driver to
> drivers/vfio/mdev/intel_gvt/ please?

It pull in a lot from the general i915 driver..
