Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4988DC43334
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jul 2022 09:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DAE92C9A;
	Fri, 22 Jul 2022 09:59:04 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D812D92C96;
 Fri, 22 Jul 2022 09:59:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8F04568AFE; Fri, 22 Jul 2022 11:58:59 +0200 (CEST)
Date: Fri, 22 Jul 2022 11:58:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20220722095859.GB14113@lst.de>
References: <20220721174307.1085741-1-bob.beckett@collabora.com>
 <a0a7a734-d3dd-960e-f130-39f86b04b24d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0a7a734-d3dd-960e-f130-39f86b04b24d@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH] drm/i915: stop using swiotlb
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 kernel@collabora.com, Christoph Hellwig <hch@lst.de>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 10:45:54AM +0100, Tvrtko Ursulin wrote:
>> -	unsigned int size = swiotlb_max_segment();
>> -
>> -	if (size == 0)
>> -		size = UINT_MAX;
>
> On a more detailed look, there was a CI failure which makes me think this 
> cap might need to stay. Because max sg segment is unsigned int. So I wonder 
> if sg contstruction overflows without it.
>
> If this quick analysis is right, you could leave i915_sg_segment_size 
> helper and cap the return from dma_max_mapping_size to UINT_MAX in it.

As dma_max_mapping_size retuns a size_t it would be good to make
all variables using it a size_t as well.  In places where that gets
lower to an unsigned int your probably want this cap.
