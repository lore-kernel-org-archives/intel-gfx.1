Return-Path: <SRS0=edJA=EY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9CFC5519F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 15:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C1F247A7
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 15:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9C1F247A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2235589DB7;
	Wed, 18 Nov 2020 15:51:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2C989DB7
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2020 15:51:46 +0000 (UTC)
IronPort-SDR: ZxcDSTKG587qe6gtqrnza0JidPDvZBGcYpHpkU8ru6tiMqmcbacDQDN6Yaw0UMsxRTf8mV0hZB
 Wje7FPRhA3EA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158908369"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="158908369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 07:51:45 -0800
IronPort-SDR: G2pl0wdoDxafCNaMgtEMfXANse8gzfOKxlqZHIIfoM6F3fAqxbTJmzPeTiPwU8nLezF5tn1aMC
 C9oxtZWvBsGw==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="544585321"
Received: from shaid-mobl.ger.corp.intel.com (HELO [10.255.202.56])
 ([10.255.202.56])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 07:51:44 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201117113103.21480-1-chris@chris-wilson.co.uk>
 <20201117113103.21480-8-chris@chris-wilson.co.uk>
 <5672a04a-bc05-1d32-e051-b9a5a0fcc82d@linux.intel.com>
 <160561952917.22621.15356472644492375343@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2cf26dcf-7774-1f19-729f-98404607ee77@linux.intel.com>
Date: Wed, 18 Nov 2020 15:51:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160561952917.22621.15356472644492375343@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 08/28] drm/i915/gt: Show all active
 timelines for debugging
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


On 17/11/2020 13:25, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-17 12:59:44)
>>
>> On 17/11/2020 11:30, Chris Wilson wrote:
>>> +             if (show_request) {
>>> +                     list_for_each_entry_safe(rq, rn, &tl->requests, link)
>>> +                             show_request(m, rq,
>>> +                                          i915_request_is_active(rq) ? "  E" :
>>> +                                          i915_request_is_ready(rq) ? "  Q" :
>>> +                                          "  U");
>>
>> Can we get some consistency between the category counts and flags.
>>
>> s/count/queued/ -> Q
> 
> Hmm, if you are sure. Q would then not match with the engine info.

Sure? Not really. What do we have there? You mean "!/*/+/-" flags? Or 
"E/Q/V" from intel_execlists_show_requests? Right, 'Q' there means 
runnable and it doesn't show queued at all. Yes, why not change everything.

> Still favouring count over queued; I think count indicates more clearly
> that it is the superset, but queued may imply it excludes ready and
> definitely sounds like it should not include inflight.

I am okay with that.

>> ready -> R (also matches with term runnable)
>> active -> E ? hmmm E is consistent with the engine info dump.
>>
>> Not ideal but perhaps every bit of more consistency is good.
> 
> Not sold yet, but not happy with the current flags either.
> 
> If we go with 'R' for ready, we should also update engine info.

Okay we seem to have plenty of options.

U or Q - queued/unready
R or Q - ready/queued (to backend) (Rv/Qv for virtual?)
E or R, or I - executing/running/in-flight

Q -> R -> E
U -> R -> E
U -> Q -> E/R/I
U -> R -> E/I

I don't know.. either one as long as all places use the same.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
