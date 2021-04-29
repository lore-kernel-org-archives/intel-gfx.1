Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D539BC433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 12:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6893C61420
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 12:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6893C61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B244A6E255;
	Thu, 29 Apr 2021 12:54:46 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEEC6E255;
 Thu, 29 Apr 2021 12:54:46 +0000 (UTC)
IronPort-SDR: iJE09bmyG8nxc1fToYBQDPlUvVKBY6l1JQdHxqc76BHDGbcLZUhBbDFUK567ycpww5jZ9x9ICP
 GN+sQCR5zbWg==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="184128190"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="184128190"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 05:54:38 -0700
IronPort-SDR: H8VErtrxWpCR3FZijUnXMoEvuHOllsZe1nhsA+PBBa9FeP8n1TwKFDmKjIO6QW1u+Gobagde28
 J3RSUb765EdQ==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="458747327"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO [10.213.208.64])
 ([10.213.208.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 05:54:37 -0700
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <5d32114c-ff06-7ad3-3deb-b843ede7c89d@linux.intel.com>
 <YIqllu5RxC1di+yq@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9681e7cc-b56e-f894-6384-85a23f47b4aa@linux.intel.com>
Date: Thu, 29 Apr 2021 13:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIqllu5RxC1di+yq@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 08/21] drm/i915/gem: Disallow bonding of
 virtual engines
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 29/04/2021 13:24, Daniel Vetter wrote:
> On Wed, Apr 28, 2021 at 04:51:19PM +0100, Tvrtko Ursulin wrote:
>>
>> On 23/04/2021 23:31, Jason Ekstrand wrote:
>>> This adds a bunch of complexity which the media driver has never
>>> actually used.  The media driver does technically bond a balanced engine
>>> to another engine but the balanced engine only has one engine in the
>>> sibling set.  This doesn't actually result in a virtual engine.
>>
>> For historical reference, this is not because uapi was over-engineered but
>> because certain SKUs never materialized.
> 
> Jason said that for SKU with lots of media engines media-driver sets up a
> set of ctx in userspace with all the pairings (and I guess then load
> balances in userspace or something like that). Tony Ye also seems to have
> confirmed that. So I'm not clear on which SKU this is?

Not sure if I should disclose it here. But anyway, platform which is 
currently in upstream and was supposed to be the first to use this uapi 
was supposed to have at least 4 vcs engines initially, or even 8 vcs + 4 
vecs at some point. That was the requirement uapi was designed for. For 
that kind of platform there were supposed to be two virtual engines 
created, with bonding, for instance parent = [vcs0, vcs2], child = 
[vcs1, vcs3]; bonds = [vcs0 - vcs1, vcs2 - vcs3]. With more engines the 
merrier.

Userspace load balancing, from memory, came into the picture only as a 
consequence of balancing between two types of media pipelines which was 
either working around the rcs contention or lack of sfc, or both. Along 
the lines of - one stage of a media pipeline can be done either as GPGPU 
work, or on the media engine, and so userspace was deciding to spawn "a 
bit of these and a bit of those" to utilise all the GPU blocks. Not 
really about frame split virtual engines and bonding, but completely 
different load balancing, between gpgpu and fixed pipeline.

> Or maybe the real deal is only future platforms, and there we have GuC
> scheduler backend.

Yes, because SKUs never materialised.

> Not against adding a bit more context to the commit message, but we need
> to make sure what we put there is actually correct. Maybe best to ask
> Tony/Carl as part of getting an ack from them.

I think there is no need - fact uapi was designed for way more engines 
than we got to have is straight forward enough.

Only unasked for flexibility in the uapi was the fact bonding can 
express any dependency and not only N consecutive engines as media fixed 
function needed at the time. I say "at the time" because in fact the 
"consecutive" engines requirement also got more complicated / broken in 
a following gen (via fusing and logical instance remapping), proving the 
point having the uapi disassociated from the hw limitations of the _day_ 
was a good call.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
