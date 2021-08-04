Return-Path: <SRS0=rjwL=M3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC093C4338F
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Aug 2021 05:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F2496056C
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Aug 2021 05:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F2496056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182666E9C7;
	Wed,  4 Aug 2021 05:40:51 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6386E9C2;
 Wed,  4 Aug 2021 05:40:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E550367373; Wed,  4 Aug 2021 07:40:06 +0200 (CEST)
Date: Wed, 4 Aug 2021 07:40:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Message-ID: <20210804054006.GA5769@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com> <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803143058.GA1721383@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] refactor the i915 GVT support
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Aug 03, 2021 at 11:30:58AM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 03, 2021 at 05:43:15PM +0800, Zhenyu Wang wrote:
> > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > 
> > Thanks a lot for this effort!
> 
> Great, do we have a submission plan for this? how much does it clash
> with my open_device/etc patch? ie does the whole thing have to go
> through the vfio tree?

The two series merge cleanly and build fine.  So if we don't need
the actual conversion of the i915 gvt code to the new mdev registration
scheme this merge window there is no need to synchronize.
