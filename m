Return-Path: <SRS0=D79Q=PW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9526C433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Nov 2021 06:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB7B61058
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Nov 2021 06:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BB7B61058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F53772D30;
	Wed,  3 Nov 2021 06:41:00 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626FE72D1A;
 Wed,  3 Nov 2021 06:40:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 66A3C68AA6; Wed,  3 Nov 2021 07:40:56 +0100 (CET)
Date: Wed, 3 Nov 2021 07:40:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <20211103064056.GA30216@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-29-hch@lst.de> <20211102164136.GI2744544@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102164136.GI2744544@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH 28/29] drm/i915/gvt: convert to use
 vfio_register_group_dev()
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

On Tue, Nov 02, 2021 at 01:41:36PM -0300, Jason Gunthorpe wrote:
> On Tue, Nov 02, 2021 at 08:06:00AM +0100, Christoph Hellwig wrote:
> > This is straightforward conversion, the intel_vgpu already has a pointer
> > to the vfio_dev, which can be replaced with the embedded structure and
> > we can replace all the mdev_get_drvdata() with a simple container_of().
> 
> This should be using vfio_register_emulated_iommu_dev(), right?

Yes, once rebased to 5.16-rc where this function appears.
