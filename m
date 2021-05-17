Return-Path: <SRS0=7o8F=KM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B46DC433B4
	for <intel-gfx@archiver.kernel.org>; Mon, 17 May 2021 21:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B9C6109E
	for <intel-gfx@archiver.kernel.org>; Mon, 17 May 2021 21:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1B9C6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D766E48E;
	Mon, 17 May 2021 21:46:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564576E48E;
 Mon, 17 May 2021 21:46:41 +0000 (UTC)
IronPort-SDR: jedau+5vNUxmyr3/Y75oc0/ZG6Dw3/FnGMdhhyBRwTYHvhl0I9M4473HbbE9XgnmwKPLxisbaD
 ZzOWi/OlCAbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198624735"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="198624735"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 14:46:40 -0700
IronPort-SDR: s5l9ImYLcSiB/VyGPVX9aB8wj3/TqQL2Gvtn9SvHg+KEAQri3lwvx4FhqH3+3zM3KjxvlykP5/
 YFPogSmBzmJA==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="393695671"
Received: from mkosciow-mobl.igk.intel.com (HELO [10.249.254.186])
 ([10.249.254.186])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 14:46:37 -0700
To: Christoph Hellwig <hch@lst.de>, Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de> <87pmxqiry6.fsf@depni.sinp.msu.ru>
 <20210517123716.GD15150@lst.de> <87lf8dik15.fsf@depni.sinp.msu.ru>
 <20210517131137.GA19451@lst.de>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <976fb38a-7780-6ca6-d602-a5f02c0938c9@linux.intel.com>
Date: Mon, 17 May 2021 23:46:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517131137.GA19451@lst.de>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the
 pgprot
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 5/17/21 3:11 PM, Christoph Hellwig wrote:
> On Mon, May 17, 2021 at 04:09:42PM +0300, Serge Belyshev wrote:
>> Christoph Hellwig <hch@lst.de> writes:
>>
>>> As an ad-hoc experiment:  can you replace the call to remap_pfn_range
>>> with remap_pfn_range_notrack (and export it if you build i915 modular)
>>> in remap_io_sg and see if that makes any difference?
>> That worked, thanks -- no artifacts seen.
> Looks like it is caused by the validation failure then.  Which means the
> existing code is doing something wrong in its choice of the page
> protection bit.  I really need help from the i915 maintainers here..

Hmm,

Apart from the caching aliasing Mattew brought up, doesn't the 
remap_pfn_range_xxx() family require the mmap_sem held in write mode 
since it modifies the vma structure? remap_io_sg() is called from the 
fault handler with the mmap_sem held in read mode only.

/Thomas

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
