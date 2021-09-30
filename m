Return-Path: <SRS0=5W5W=OU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B07C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 05:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C23E6162E
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 05:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C23E6162E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA106E2DF;
	Thu, 30 Sep 2021 05:24:06 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D386E2DF;
 Thu, 30 Sep 2021 05:24:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 896FC67373; Thu, 30 Sep 2021 07:24:02 +0200 (CEST)
Date: Thu, 30 Sep 2021 07:24:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Message-ID: <20210930052402.GA21841@lst.de>
References: <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com> <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
 <20210826061219.GD9942@zhen-hp.sh.intel.com>
 <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
 <YVMgGKk1K4gO8ls6@bombadil.infradead.org>
 <af40291a-de36-b39f-9ded-aaf4ddba641f@intel.com>
 <20210928150507.GM964074@nvidia.com>
 <24c7bbec-b425-52fb-d3f9-539a0a391dfa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24c7bbec-b425-52fb-d3f9-539a0a391dfa@intel.com>
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

On Wed, Sep 29, 2021 at 06:27:16PM +0000, Wang, Zhi A wrote:
> Thanks for the idea. I am not sure i915 guys would take this idea since 
> that it's only for GVT-g, i915 doesn't use this at all. We need to take 
> a snapshot of both PCI configuration space and MMIO registers before 
> i915 driver starts to touch the HW.
> 
> One idea is we capture the registers in intel_gvt.c during the early 
> initialization and do everything else when i915.ko is fully loaded. But 
> how about dependence between i915.ko and kvmgt.ko? We cannot do 
> request_module("kvmgt") in i915.ko.
> 
> Maybe Christoph can give more input on this and how we can deal with 
> this? Before we figure out an solution, we have to pick that patch out 
> since it blocks our pull request schedule.
> 
> Also I was thinking if moving gvt into kvmgt.ko is the right direction. 
> It seems the module loading system in kernel is not designed for "module 
> A loading module B, which needs symbols from module A, in the 
> initialization path of module A".

I have a few idea on how to sort this "deadlock" out.  But I'm completely
swamped until the end of next week, so I won't get to anything before
that.
