Return-Path: <SRS0=uD7q=BN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED599C433DF
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Aug 2020 14:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE6EC206DA
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Aug 2020 14:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE6EC206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7926588310;
	Mon,  3 Aug 2020 14:11:44 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425CB88310
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 Aug 2020 14:11:43 +0000 (UTC)
IronPort-SDR: +bh65fknXOdTByBqA2emkQ6UU5RCDX9LLsT0rAUV48MjBjs8AOJkwt53R9AmYQSkH0NTF+L9si
 +DhGJeNv93FA==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="139686111"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="139686111"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 07:11:42 -0700
IronPort-SDR: AU4SSrG2r98h1vgwYuuJCaPQWYOmIPgYrogOZMydclIIyS6G+M9m6GresTQQaOzbkhN0C6pAq7
 glH2akez1ETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="330059424"
Received: from unknown (HELO [10.252.62.231]) ([10.252.62.231])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2020 07:11:40 -0700
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200803140147.316523-1-lionel.g.landwerlin@intel.com>
 <20200803140147.316523-4-lionel.g.landwerlin@intel.com>
 <159646372073.571.1645434502827672775@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <9e37537f-3208-58db-1f64-f0ad0a967029@intel.com>
Date: Mon, 3 Aug 2020 17:11:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159646372073.571.1645434502827672775@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: peel dma-fence-chains wait
 fences
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 03/08/2020 17:08, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-08-03 15:01:47)
>> To allow faster engine to engine synchronization, peel the layer of
>> dma-fence-chain to expose potential i915 fences so that the
>> i915-request code can emit HW semaphore wait/signal operations in the
>> ring which is faster than waking up the host to submit unblocked
>> workloads after interrupt notification.
>>
>> v2: Also deal with chains where the last node is not a dma-fence-chain
> This is already done by i915_request_await_dma_fence.
> -Chris
Cool, we can drop this then.

-Lionel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
