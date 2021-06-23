Return-Path: <SRS0=EMYW=LR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71925C4743C
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 15:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0560611CB
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 15:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0560611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4CB6E0E7;
	Wed, 23 Jun 2021 15:39:09 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38796E0A5;
 Wed, 23 Jun 2021 15:39:07 +0000 (UTC)
IronPort-SDR: km5PMpkPjFNcktH3IYm3UNDNrkdU1BrKgmbRj1zHXupyXuJOm1hv0+Pl3oYQhtuaMjHzkFx0vt
 oYjUBg9jaidQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207227061"
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; d="scan'208";a="207227061"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 08:37:50 -0700
IronPort-SDR: uQATegq+LaGq+FStDklOV0A9pVBG3AJqenodJVVVhVaD3viVZGAF2GScLYIAtAw+j1PfLQmxQ/
 IGPs3e2cGhTw==
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; d="scan'208";a="639493343"
Received: from bkuncer-mobl1.ger.corp.intel.com (HELO [10.249.254.243])
 ([10.249.254.243])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 08:37:49 -0700
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210621193644.105627-1-thomas.hellstrom@linux.intel.com>
 <20210621193644.105627-2-thomas.hellstrom@linux.intel.com>
 <YNNOoqnFOWw1Xgrf@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <0415be07-452e-d7de-ecfa-9c0f80ad5fee@linux.intel.com>
Date: Wed, 23 Jun 2021 17:37:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNNOoqnFOWw1Xgrf@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v6 1/3] drm/i915: Update object placement
 flags to be mutable
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thanks for reviewing, Daniel.

On 6/23/21 5:09 PM, Daniel Vetter wrote:
>
>>   
>> +	unsigned int mem_flags:2;
> Is the entire bitfield array all protected by dma_resv_lock? If not I'd
> just go with a full field, avoids headaches and all that.
>
> Also kerneldoc for this would be really sweet. Means some work to get it
> going,

Yeah, late documentation review comments after v9 ought to be forbidden ;)

> but somewhere we need to stop hacking together undocumented ad-hoc
> locking schemes :-/

Hmm, this was intended to replace the change of and access of object ops 
*without* the lock held and with proper asserts added in the accessors, 
so it was not really intended to be an ad-hoc locking scheme, It's 
simply placement related things are updated under the lock.

I'll update the code and resend.

/Thomas


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
