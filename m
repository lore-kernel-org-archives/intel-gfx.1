Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49162C433DB
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 07:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95F464F48
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 07:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95F464F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DAC6ECE5;
	Thu,  4 Feb 2021 07:36:12 +0000 (UTC)
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Thu, 04 Feb 2021 07:36:10 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82226ECE5;
 Thu,  4 Feb 2021 07:36:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DD16068AFE; Thu,  4 Feb 2021 08:29:47 +0100 (CET)
Date: Thu, 4 Feb 2021 08:29:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <20210204072947.GA29812@lst.de>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-3-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203233709.19819-3-dongli.zhang@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH RFC v1 2/6] swiotlb: convert variables to
 arrays
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, benh@kernel.crashing.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bhelgaas@google.com, paulus@samba.org, hpa@zytor.com, hch@lst.de,
 m.szyprowski@samsung.com, sstabellini@kernel.org, adrian.hunter@intel.com,
 mpe@ellerman.id.au, x86@kernel.org, joe.jin@oracle.com, mingo@kernel.org,
 peterz@infradead.org, mingo@redhat.com, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com, konrad.wilk@oracle.com,
 intel-gfx@lists.freedesktop.org, bp@alien8.de, nouveau@lists.freedesktop.org,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 chris@chris-wilson.co.uk, jgross@suse.com, tsbogend@alpha.franken.de,
 robin.murphy@arm.com, linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, tglx@linutronix.de, bauerman@linux.ibm.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 03:37:05PM -0800, Dongli Zhang wrote:
> This patch converts several swiotlb related variables to arrays, in
> order to maintain stat/status for different swiotlb buffers. Here are
> variables involved:
> 
> - io_tlb_start and io_tlb_end
> - io_tlb_nslabs and io_tlb_used
> - io_tlb_list
> - io_tlb_index
> - max_segment
> - io_tlb_orig_addr
> - no_iotlb_memory
> 
> There is no functional change and this is to prepare to enable 64-bit
> swiotlb.

Claire Chang (on Cc) already posted a patch like this a month ago,
which looks much better because it actually uses a struct instead
of all the random variables. 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
