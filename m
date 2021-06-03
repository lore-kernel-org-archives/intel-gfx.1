Return-Path: <SRS0=IdPq=K5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC522C47096
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 07:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C81613D6
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 07:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C81613D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C70D6F417;
	Thu,  3 Jun 2021 07:48:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CC8A6F415;
 Thu,  3 Jun 2021 07:48:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B27D11FB;
 Thu,  3 Jun 2021 00:48:08 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F32B3F774;
 Thu,  3 Jun 2021 00:48:06 -0700 (PDT)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-3-daniel.vetter@ffwll.ch>
 <2054fee7-dcd2-a4fa-5d50-7fe6f1b474be@arm.com>
 <YLfTGbb52KtbPk7q@phenom.ffwll.local>
From: Steven Price <steven.price@arm.com>
Message-ID: <e9081dec-0225-a24d-261c-3ab750b29614@arm.com>
Date: Thu, 3 Jun 2021 08:48:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLfTGbb52KtbPk7q@phenom.ffwll.local>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [PATCH 03/11] drm/panfrost: Use xarray and helpers
 for depedency tracking
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
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 02/06/2021 19:51, Daniel Vetter wrote:
> On Wed, Jun 02, 2021 at 03:06:50PM +0100, Steven Price wrote:
>> On 21/05/2021 10:09, Daniel Vetter wrote:
[...]
>>> +	if (!xa_empty(&job->deps))
>>> +		return xa_erase(&job->deps, job->last_dep++);
>>
>> Rather than tracking last_dep separately this could be written using
>> xa_find():
>>
>>     if (xa_find(&job->deps, &i, ULONG_MAX, XA_PRESENT))
>> 	return xa_erase(&job->deps, &i);
> 
> I copypasted this from other drivers, imo consistency is better than
> looking pretty. I think eventually we should stuff this as optional
> helpers into drm/scheduler.
> 
> Also yours walks the xa twice.

Agreed this isn't as efficient (I was somewhat disappointed xarray
doesn't expose a "get and remove the first element" API). Moving this
into drm/scheduler seems like the right long term solution - so matching
other drivers first is a good move.

Thanks,

Steve
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
