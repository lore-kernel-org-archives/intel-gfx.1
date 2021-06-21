Return-Path: <SRS0=oyEe=LP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EFBC48BE5
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Jun 2021 08:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8720B60FF4
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Jun 2021 08:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8720B60FF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2345789D7F;
	Mon, 21 Jun 2021 08:30:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F4489D7F;
 Mon, 21 Jun 2021 08:30:42 +0000 (UTC)
IronPort-SDR: 8Ha9C5XsDlR03YRWiosUAZhaKYSqEDQYhzJZRbuGsvj9zKnHBCBwuTaRM8855o5SvNi8mjsq4o
 B5QMxL+kq2AQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="206748295"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="206748295"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 01:30:40 -0700
IronPort-SDR: ubkVb9vNHYMxMHH5xFqDId2E0TQ5vB2zQ+KfAVZiyJCm5iiYEQryBCfIR88TAikqu7zQjlmHx3
 xhU8QSCu23iQ==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="489802096"
Received: from acoard-mobl.ger.corp.intel.com (HELO [10.213.248.125])
 ([10.213.248.125])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 01:30:38 -0700
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210618150036.2507653-1-tvrtko.ursulin@linux.intel.com>
 <CAKMK7uFPXPwWuL=3dR1gnCX-yGUPLOjK5Q1Vo=KHLzENm8oPFg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9b592ab5-23c2-ea74-cc06-d0ec5d557dc8@linux.intel.com>
Date: Mon, 21 Jun 2021 09:30:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFPXPwWuL=3dR1gnCX-yGUPLOjK5Q1Vo=KHLzENm8oPFg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915: Document the Virtual Engine
 uAPI
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
Cc: intel-gfx <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 18/06/2021 21:46, Daniel Vetter wrote:
> On Fri, Jun 18, 2021 at 5:00 PM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> A little bit of documentation covering the topics of engine discovery,
>> context engine maps and virtual engines. It is not very detailed but
>> supposed to be a starting point of giving a brief high level overview of
>> general principles and intended use cases.
>>
>> v2:
>>   * Have the text in uapi header and link from there.
>>
>> v4:
>>   * Link from driver-uapi.rst.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> Apologies for the confusion :-/
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Imo just push, it's good stuff at the right place, and it's much
> easier to polish&integrate docs better once something is there. I've
> read through it and it looks all nice.

Okay pushed, thanks.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
