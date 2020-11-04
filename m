Return-Path: <SRS0=5tEz=EK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91983C2D0A3
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 13:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159162071A
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 13:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 159162071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751756ECFC;
	Wed,  4 Nov 2020 13:06:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03996ECFC
 for <Intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2020 13:06:46 +0000 (UTC)
IronPort-SDR: sjDWAJDQTEnqLmtZSSKTOJ66HUFAxA/QZ3gBLMPlySjGxhJuvrVCFp49DdnhBZBwUVB3HWXdK0
 d0IIBeTjN90w==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156986647"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="156986647"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 05:06:45 -0800
IronPort-SDR: IaIqN+ANWimogwAMMZhY1o+7wvf1Q/cvzQgaLlzdLgKgb2e4n9Mti+uh1YAEsMNW5cJ8pRQQWF
 mMnH1/ep2O8w==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="538914907"
Received: from marak-mobl1.ger.corp.intel.com (HELO [10.249.42.32])
 ([10.249.42.32])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 05:06:44 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, Intel-gfx@lists.freedesktop.org
References: <20201104122043.876567-1-tvrtko.ursulin@linux.intel.com>
 <20201104122043.876567-2-tvrtko.ursulin@linux.intel.com>
 <160449323247.15691.17140244371195703868@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <0651e52b-6840-b481-d3bc-3d36db1c8834@linux.intel.com>
Date: Wed, 4 Nov 2020 13:06:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160449323247.15691.17140244371195703868@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [RFC 2/2] drm/i915: Use user engine names in error
 state ecode
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 04/11/2020 12:33, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-04 12:20:43)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Instead of printing out the internal engine mask, which can change between
>> kernel versions making it difficult to map to actual engines, list user
>> friendly engine names in the ecode string. For example:
> 
> Nah. It's a nonsense number, just exists for quick and futile discrimination.
> Trying to interpret it is pointless.
> 
> There's very little value to be gained from it, it should just serve as a
> tale-tell that we have captured an error state. The action and impact of
> the reset should be separately recorded.

My problem with the nonsense number is that we have it, but that is is 
unstable and people are interpreting it.

How about a bitmask of uabi classes instead? As you can see I really 
want something from the ABI-land, or not at all. Classes might be just 
the thing for the purpose of a signature.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
