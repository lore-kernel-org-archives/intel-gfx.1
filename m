Return-Path: <SRS0=edJA=EY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2CBC5519F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 11:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FFD7241A5
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 11:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FFD7241A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06606E405;
	Wed, 18 Nov 2020 11:56:08 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F8B6E409;
 Wed, 18 Nov 2020 11:56:07 +0000 (UTC)
IronPort-SDR: jm2T55IY+G6rUV6hXfj1xrYJZevTlLqluDr4ngP4ZgP8TYbgINdFp2IoVdC6qBXPdVNfUsjz0R
 tZBzv07eSQJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158876811"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="158876811"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 03:56:07 -0800
IronPort-SDR: qmc7S8M6AZf7g8prjKyIdysZ3NnELFdbjh8V0JzgQdNrw1rALkm6X1ja8EQIWVb5Igm3Y+6UG5
 NjbjvZ8mX/nA==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="544490702"
Received: from shaid-mobl.ger.corp.intel.com (HELO [10.255.202.56])
 ([10.255.202.56])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 03:56:05 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
References: <20201117114050.302583-1-tvrtko.ursulin@linux.intel.com>
 <20201117135918.354284-1-tvrtko.ursulin@linux.intel.com>
 <160562198607.22621.14513375230209122787@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <bad6ead7-30b6-fc26-dfbb-76d1ed913c6d@linux.intel.com>
Date: Wed, 18 Nov 2020 11:56:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160562198607.22621.14513375230209122787@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t v2] gem_wsim: Implement
 device selection
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 17/11/2020 14:06, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-17 13:59:18)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> -L and -D <device> on the command line.
>>
>> With no device specified tool tries to find i915 discrete or integrated in
>> that order.
>>
>> v2:
>>   * Fix error handling and support render devices.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Hmm, optarg should be a pointer into the argv, so is the copy necessary?

I don't remember if I tried, and I don't see that getopt(3) explains 
optarg from that angle, so probably safest to keep as is. Too lazy to 
try.. Or maybe presence of strdup suggests I did already try and that 
optarg is indeed temporary copy managed by getopt.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
