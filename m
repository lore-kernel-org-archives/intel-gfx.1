Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D24C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 24 Jan 2022 09:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17EA10E14B;
	Mon, 24 Jan 2022 09:46:00 +0000 (UTC)
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jan 2022 09:46:00 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B07910E14B;
 Mon, 24 Jan 2022 09:46:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EA27D68C4E; Mon, 24 Jan 2022 10:40:05 +0100 (CET)
Date: Mon, 24 Jan 2022 10:40:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Message-ID: <20220124094004.GA23537@lst.de>
References: <20211129123832.105196-1-zhi.a.wang@intel.com>
 <20211130164622.GA15150@lst.de>
 <e183b95f-89d1-3a2f-27e2-82aa2b10e8fc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e183b95f-89d1-3a2f-27e2-82aa2b10e8fc@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH v4 1/2] i915/gvt: Introduce the
 mmio_info_table.c to support VFIO new mdev API
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Xu,
 Terrence" <terrence.xu@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Dec 17, 2021 at 08:52:53AM +0000, Wang, Zhi A wrote:
> Sorry for the late reply as I am supporting the customers recently. I 
> will refresh this after the christmas.

Did you find some time to look into it?  Do you want some help?
