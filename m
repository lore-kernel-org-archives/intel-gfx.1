Return-Path: <SRS0=SCM9=P4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CA2C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 07:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AFB461175
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Nov 2021 07:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AFB461175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F756E527;
	Tue,  9 Nov 2021 07:51:07 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8A6E5B6;
 Tue,  9 Nov 2021 07:51:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7B51568AFE; Tue,  9 Nov 2021 08:51:01 +0100 (CET)
Date: Tue, 9 Nov 2021 08:51:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20211109075100.GA27284@lst.de>
References: <20211108212718.10576-1-zhi.a.wang@intel.com>
 <875yt17qzs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yt17qzs.fsf@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH 1/3] i915/gvt: seperate tracked MMIO table
 from handlers.c
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 intel-gvt-dev@lists.freedesktop.org, hch@lst.de
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 09:00:39AM +0200, Jani Nikula wrote:
> On Mon, 08 Nov 2021, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> > From: Zhi Wang <zhi.wang.linux@gmail.com>
> >
> > To support the new mdev interfaces and the re-factor patches from
> > Christoph, which moves the GVT-g code into a dedicated module, the GVT-g
> > MMIO snapshot still needs to be saved in i915 so that the inital clean HW
> > state can be used for the further vGPU. Seperate the tracked MMIO table
> > from GVT-g, so that GVT-g and i915 can both use it.
> 
> Do you really have to both put code in a header and then include that in
> multiple places?
> 
> I think you may need to rethink the whole approach, maybe make them
> actual tables instead of code.

Without understanding this code too well: an approach that makes in
actual table and uses an accessor seems more useful to me as well.
