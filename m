Return-Path: <SRS0=r3jS=N6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABE3C433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 07:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCB0610A3
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 07:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CCB0610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149756E155;
	Wed,  8 Sep 2021 07:58:45 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2B96E155;
 Wed,  8 Sep 2021 07:58:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220443578"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220443578"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 00:58:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="648388614"
Received: from smirnov2-mobl.ccr.corp.intel.com (HELO [10.249.254.177])
 ([10.249.254.177])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 00:58:41 -0700
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210906165515.450541-1-thomas.hellstrom@linux.intel.com>
 <20210906165515.450541-4-thomas.hellstrom@linux.intel.com>
 <51111df6-bf0c-ba09-4a9a-5bd59bec5fa9@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <0c78f895-1e71-c10d-0e90-fa09bf555c5b@linux.intel.com>
Date: Wed, 8 Sep 2021 09:58:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <51111df6-bf0c-ba09-4a9a-5bd59bec5fa9@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2 3/6] drm/i915 Implement LMEM backup and
 restore for suspend / resume
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi, Matt,

Thanks for reviewing.

On 9/7/21 7:37 PM, Matthew Auld wrote:
>
>> +    i915_gem_ww_unlock_single(backup);
>> +    i915_gem_object_put(backup);
>
> I assume we need to set ttm.backup = NULL somewhere here on the 
> failure path, or don't drop the ref? Or at least it looks like 
> potential uaf later?

Yes, I think on failure, we just don't drop the ref here in case 
something at some point decides to retry.

I'll fix up this and other comments.

/Thomas


>
>> +
>> +    return err;
>> +}
>> +
