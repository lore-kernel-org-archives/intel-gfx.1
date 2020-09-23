Return-Path: <SRS0=ky/+=DA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4A8C2D0A8
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 13:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB774221EB
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 13:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB774221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291736E9A5;
	Wed, 23 Sep 2020 13:58:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD8D6E4FB;
 Wed, 23 Sep 2020 13:58:52 +0000 (UTC)
IronPort-SDR: yoff5pUUQpEFfDnx5QFTuUnadPUZgl6z2nQLqcsJq/5CDqySJImnY+B4xeh5McSJva3K09NG0H
 JRxtwJ7fDyPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="160172690"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="160172690"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:58:52 -0700
IronPort-SDR: DOZNQUTwNmS6CdTEWIoW9qi7Sh22K+ola1js+j+Vn7PmZQGNyFPiXcYUQXMNKslnCfCP8vR0bU
 ku9o4NuN7J+w==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="486449272"
Received: from yymichae-mobl.ger.corp.intel.com (HELO [10.214.208.219])
 ([10.214.208.219])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:58:46 -0700
To: Christoph Hellwig <hch@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-5-hch@lst.de>
 <9b5d40af-7378-9e68-ca51-73b2148287f3@linux.intel.com>
 <20200923134117.GB9893@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <1a421e7f-6255-c534-5403-715c2e809bd0@linux.intel.com>
Date: Wed, 23 Sep 2020 14:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923134117.GB9893@lst.de>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: use vmap in
 i915_gem_object_map
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 23/09/2020 14:41, Christoph Hellwig wrote:
> On Wed, Sep 23, 2020 at 10:52:33AM +0100, Tvrtko Ursulin wrote:
>>
>> On 18/09/2020 17:37, Christoph Hellwig wrote:
>>> i915_gem_object_map implements fairly low-level vmap functionality in
>>> a driver.  Split it into two helpers, one for remapping kernel memory
>>> which can use vmap, and one for I/O memory that uses vmap_pfn.
>>>
>>> The only practical difference is that alloc_vm_area prefeaults the
>>> vmalloc area PTEs, which doesn't seem to be required here for the
>>> kernel memory case (and could be added to vmap using a flag if actually
>>> required).
>>
>> Patch looks good to me.
>>
>> Series did not get a CI run from our side because of a different base so I
>> don't know if you would like to have a run there? If so you would need to
>> rebase against git://anongit.freedesktop.org/drm-tip drm-tip and you could
>> even send a series to intel-gfx-trybot@lists.freedesktop.org, suppressing
>> cc, to check it out without sending a copy to the real mailing list.
> 
> It doesn't seem like I can post to any freedesktop list, as I always
> get rejection messages.  But I'll happily prepare a branch if one
> of you an feed it into your CI.

That's fine, just ping me and I will forward it for testing, thanks!

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
