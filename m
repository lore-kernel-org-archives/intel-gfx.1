Return-Path: <SRS0=Eks7=LI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0C3C48BE8
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Jun 2021 08:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B1361370
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Jun 2021 08:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B1361370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD65D8985A;
	Mon, 14 Jun 2021 08:49:01 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4AF8985A
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Jun 2021 08:49:00 +0000 (UTC)
IronPort-SDR: hexnOISoQVsvvpQSJzlUOqMv/bOf7kCiLTwveLyWqguDHfzXYn7o2md8/nOzXeLn3+j6IEC3A+
 rv/EirA2PAQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="193089510"
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="193089510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 01:48:59 -0700
IronPort-SDR: X3XAoEhY/2rduZe2PjKa4rYYbknLK+0TLhcoixWYuwhDFr3Q7PP5Kza2epBnx/VldkdguE510S
 b9KIby5/Bzmg==
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="420719424"
Received: from crowley-mobl1.ger.corp.intel.com (HELO [10.213.235.99])
 ([10.213.235.99])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 01:48:58 -0700
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210611004627.1220031-1-matthew.d.roper@intel.com>
 <162338975335.29314.17248034788789989874@emeril.freedesktop.org>
 <20210611234219.GF951094@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <711bdb29-7662-2590-aa3d-84fa36729858@linux.intel.com>
Date: Mon, 14 Jun 2021 09:48:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611234219.GF951094@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] 
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZHJt?=
 =?utf-8?q?/i915=3A_Steer_MCR_reads_to_lowest_potential_slice/subslice?=
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


On 12/06/2021 00:42, Matt Roper wrote:
> On Fri, Jun 11, 2021 at 05:35:53AM +0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: drm/i915: Steer MCR reads to lowest potential slice/subslice
>> URL   : https://patchwork.freedesktop.org/series/91367/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from CI_DRM_10206_full -> Patchwork_20340_full
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with Patchwork_20340_full absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in Patchwork_20340_full, please notify your bug team to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in Patchwork_20340_full:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd:
>>      - shard-iclb:         NOTRUN -> [DMESG-WARN][1]
>>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20340/shard-iclb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html
>>
>>    * igt@i915_selftest@perf@engine_cs:
>>      - shard-iclb:         [PASS][2] -> [DMESG-WARN][3] +36 similar issues
>>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10206/shard-iclb8/igt@i915_selftest@perf@engine_cs.html
>>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20340/shard-iclb7/igt@i915_selftest@perf@engine_cs.html
> 
> Steering to the minconfig does seem to have successfully fixed the issue
> on EHL/JSL according to the BAT results.  However the code changes
> uncovered a similar issue on ICL.  From experimenting on ICL, it appears
> that if you don't steer to the minconfig, you can sometimes get random
> garbage (rather than 0's) when render power gating is enabled.  CI
> wasn't flagging a workaround warning on ICL all along only because we
> were reading back random garbage that just happened to have a '1' in the
> relevant bit.
> 
> So the problem now is that the fls() -> ffs() conversion didn't actually
> get us to the minconfig on this ICL system.  Since there are two types
> of multicast registers on gen11 (subslice multicast and l3bank
> multicast), we currently pick our subslice target by &'ing those two
> masks together.  Unfortunately the minconfig subslice may not also be a
> suitable l3bank, so even using ffs() instead of fls() on the
> intersection will give us a "bad" steering ID.
> 
> It looks like there will be cases where we can't just always use the
> same steering value for both the subslice multicast registers and the
> l3bank multicast registers; we'll probably want to steer to the
> minconfig subslice by default and then explicitly re-steer to a valid
> l3bank in cases where we can't find a suitable value for both.  I
> already have some patches that do something similar for steering on
> upcoming platforms, so I'll get those reorganized so that we can use
> them on these platforms as well.

Kudos for figuring this all out! This until now unexplained fls vs ffs 
issue has been annoying us for years.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
