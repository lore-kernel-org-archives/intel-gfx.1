Return-Path: <SRS0=c2Tb=MM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68DCC07E9B
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 15:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A80610FB
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 15:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A80610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ABC6E419;
	Tue, 20 Jul 2021 15:30:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F34989836;
 Tue, 20 Jul 2021 15:30:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="190844568"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="190844568"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 08:30:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="657577088"
Received: from ekearns1-mobl.amr.corp.intel.com (HELO [10.213.195.253])
 ([10.213.195.253])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 08:30:10 -0700
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210719183047.2624569-1-jason@jlekstrand.net>
 <20210719183047.2624569-4-jason@jlekstrand.net>
 <6ecf6891-67c2-94ac-32ce-28c1a1a7db0b@linux.intel.com>
 <CAOFGe96CemtS4hBoOR8g+V-6synP_WNdHj3ed0MgRaNasV24Xw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <bb07da62-2c6b-e7a3-3563-72ca24ebee9f@linux.intel.com>
Date: Tue, 20 Jul 2021 16:30:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe96CemtS4hBoOR8g+V-6synP_WNdHj3ed0MgRaNasV24Xw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: Always call
 i915_globals_exit() from i915_exit()
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


Now you confused me with two replies I forgot to reply to all... :))

On 20/07/2021 15:53, Jason Ekstrand wrote:
> On Tue, Jul 20, 2021 at 3:25 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:

[snip]

>>> +
>>>    static int __init i915_init(void)
>>>    {
>>>        bool use_kms = true;
>>>        int err;
>>>
>>> +     i915_fully_loaded = false;
>>
>> Ditto.
> 
> So, this is something I'm unclear on.  I know that static memory gets
> auto-initialized to zero but what happens if you unload and reload a
> module?  Is it re-initialized to zero?  If it is then we can drop
> this.

Well it's not in memory after it is unloaded so clearly it has to get 
initialised by the module loader every time it loads it.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
