Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A180C4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Oct 2022 14:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6805710E8D1;
	Tue, 18 Oct 2022 14:56:00 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C047F10E8AF;
 Tue, 18 Oct 2022 14:55:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BD2FD68C4E; Tue, 18 Oct 2022 16:55:50 +0200 (CEST)
Date: Tue, 18 Oct 2022 16:55:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20221018145550.GA21066@lst.de>
References: <20221018082413.GA25785@lst.de>
 <a5966644-72d7-4b25-83d1-9765d0593e44@suse.com>
 <20221018110243.GA4655@lst.de>
 <d67ceabb-b31a-59e6-fc77-8d6c48b277f2@suse.com>
 <20221018143320.GA19106@lst.de>
 <e0448dac-a35e-cfd0-c087-411558512b5e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0448dac-a35e-cfd0-c087-411558512b5e@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] i915 "GPU HANG",
 bisected to a2daa27c0c61 "swiotlb: simplify swiotlb_max_segment"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 intel-gfx@lists.freedesktop.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, iommu@lists.linux.dev,
 Matthew Auld <matthew.auld@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 04:53:50PM +0200, Juergen Gross wrote:
>> If we don't need the IS_ENABLED is not needed I'm all for dropping it.
>> But unless I misread the code, on arm/arm64 even PV guests are 1:1
>> mapped so that all Linux physically contigous memory also is Xen
>> contigous, so we don't need the hack.
>
> There are no PV guests on arm/arm64.

Ok, that's the part I was missing.  In that case we should be fine
without the IS_ENABLED indeed.
