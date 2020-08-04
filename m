Return-Path: <SRS0=l5Yo=BO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3867DC433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  4 Aug 2020 20:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F76D21744
	for <intel-gfx@archiver.kernel.org>; Tue,  4 Aug 2020 20:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F76D21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65376E08C;
	Tue,  4 Aug 2020 20:43:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CB16E08C
 for <intel-gfx@lists.freedesktop.org>; Tue,  4 Aug 2020 20:43:40 +0000 (UTC)
IronPort-SDR: QroxV5Lv32b4ftinsDiw+s4Qwd0CpEaqbGyYNBE1k4gd9e/DtCec7ZtY6lHeYv1ZRD7Sqq08OI
 +SKGzFcS1ZQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="140319874"
X-IronPort-AV: E=Sophos;i="5.75,435,1589266800"; d="scan'208";a="140319874"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 13:43:40 -0700
IronPort-SDR: laz5X6jBYgM2JmYukn0Zy9oXQjEFsJAtVBwkSzzUBKulad0LGUp3miunU88zOp/DOHnDpzSVrO
 6tXWA6YYZZhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,435,1589266800"; d="scan'208";a="492588376"
Received: from akrolak-mobl.ger.corp.intel.com (HELO [10.249.43.120])
 ([10.249.43.120])
 by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2020 13:43:38 -0700
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200804085954.350343-1-lionel.g.landwerlin@intel.com>
 <20200804085954.350343-3-lionel.g.landwerlin@intel.com>
 <159656655139.4193.15369815764606779771@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <4f7590c3-4ec9-fec1-32c6-d8245f3c38f3@intel.com>
Date: Tue, 4 Aug 2020 23:43:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159656655139.4193.15369815764606779771@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: add syncobj timeline support
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

On 04/08/2020 21:42, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-08-04 09:59:54)
>> Introduces a new parameters to execbuf so that we can specify syncobj
>> handles as well as timeline points.
>>
>> v2: Reuse i915_user_extension_fn
>>
>> v3: Check that the chained extension is only present once (Chris)
>>
>> v4: Check that dma_fence_chain_find_seqno returns a non NULL fence (Lionel)
>>
>> v5: Use BIT_ULL (Chris)
>>
>> v6: Fix issue with already signaled timeline points,
>>      dma_fence_chain_find_seqno() setting fence to NULL (Chris)
>>
>> v7: Report ENOENT with invalid syncobj handle (Lionel)
>>
>> v8: Check for out of order timeline point insertion (Chris)
>>
>> v9: After explanations on
>>      https://lists.freedesktop.org/archives/dri-devel/2019-August/229287.html
>>      drop the ordering check from v8 (Lionel)
>>
>> v10: Set first extension enum item to 1 (Jason)
>>
>> v11: Rebase
>>
>> v12: All multiple extension nodes of timeline syncobj (Chris)
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Co-authored-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v11)
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>
> One last detail Joonas will ask for is the Link: for the anv code.
> -Chris

I always forget the tag for it : 
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2901


-Lionel

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
