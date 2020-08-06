Return-Path: <SRS0=UD61=BQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E8FC433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2020 15:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E171023137
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2020 15:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E171023137
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150146E8CA;
	Thu,  6 Aug 2020 15:27:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD946E8CA
 for <intel-gfx@lists.freedesktop.org>; Thu,  6 Aug 2020 15:27:48 +0000 (UTC)
IronPort-SDR: fIsATHuqaUjr2v/sYgev4x1xlv5BNyg52g9lEf0+RnMFGqsmSMtGfP32e902YOPgQd+hYM+Txj
 Y8WmjWThVmGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="150292651"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="150292651"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 08:27:42 -0700
IronPort-SDR: jNSETc0sUJJWo11URSZll1kXokju/UvXX0CwgIi6iSw/QoYU5zkQq6PlvCOqWONQghq0DMlD+0
 Dr9jKgFO11iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="325415490"
Received: from novakale-mobl1.ccr.corp.intel.com (HELO [10.252.63.2])
 ([10.252.63.2])
 by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2020 08:27:41 -0700
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200806143338.15864-1-chris@chris-wilson.co.uk>
 <20200806145728.16495-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <15f2d0b3-f6f0-a86b-2701-0b21900f3c97@intel.com>
Date: Thu, 6 Aug 2020 16:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806145728.16495-1-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Prevent selecting 0 for
 our random width/align
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

On 06/08/2020 15:57, Chris Wilson wrote:
> When igt_random_offset() is a given a range of [0, PAGE_SIZE], it is
> allowed to return 0. However, attempting to use a size of 0 for the
> igt_lmem_write_cpu() byte poking, leads to call igt_random_offset() with
> a range of [offset, offset + 0] and ask it to find a length of 4 within
> it. This triggers the bug on that the requested length should fit within
> the range!
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
