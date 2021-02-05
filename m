Return-Path: <SRS0=PZs0=HH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67397C433DB
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 18:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F62A64EE8
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 18:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F62A64EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7666F4A7;
	Fri,  5 Feb 2021 18:48:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB23B6F4A9
 for <intel-gfx@lists.freedesktop.org>; Fri,  5 Feb 2021 18:48:57 +0000 (UTC)
IronPort-SDR: WP+d6LhbTLXDxVidiJuYm4CnkLYcBVZ9A/XrPjfahGk5NIleCYhve2jFkt+p8YQMPFARyexgAc
 h2E9i3buKHwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="245544313"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="245544313"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 10:48:57 -0800
IronPort-SDR: NFK7rlYAMXxGjeZ54kGkXEOVvUjHhwBgwbgNZfVD/h4CEdrng0mOaUtME21DMaen19ZCtn/bx0
 spkEBJhz52dQ==
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="373483190"
Received: from gragha1x-mobl1.amr.corp.intel.com (HELO
 sghuge-mobl1.amr.corp.intel.com) ([10.213.186.155])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 10:48:56 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210205003310.282664-1-sagar.ghuge@intel.com>
 <161253202745.17965.9984860116785355664@build.alporthouse.com>
From: Sagar Ghuge <sagar.ghuge@intel.com>
Message-ID: <73c0eb51-a40f-e4c7-d693-175e139c83c0@intel.com>
Date: Fri, 5 Feb 2021 10:48:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161253202745.17965.9984860116785355664@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/icl,
 tgl: whitelist COMMON_SLICE_CHICKEN3 register
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 2/5/21 5:33 AM, Chris Wilson wrote:
> Quoting Sagar Ghuge (2021-02-05 00:33:10)
>> Adding this register to whitelist will allow UMD to toggle State Cache
>> Perf fix disable chicken bit.
>>
>>    "If this bit is enabled, RCC uses BTP+BTI as address tag in its state
>>    cache instead of BTI only"
>>
>> which will lead to dropping unnecessary render target flushes and stall
>> on scoreboard.
> 
> The rest of the register looks safe to expose, and it passes our sanity
> checks that the register is local to the context and should not affect
> others.
> 
>> Bspec: 11333
>> Bspec: 45829
>>
>> Signed-off-by: Sagar Ghuge <sagar.ghuge@intel.com>
> 
> Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
Thank you!

> The only missing piece of the puzzle that Joonas will require is a
> Link: to a reviewed userspace patch/MR to confirm the uABI.
Link to MR:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/8766
> -Chris
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
