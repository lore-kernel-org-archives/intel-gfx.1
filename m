Return-Path: <SRS0=rjwL=M3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3875C4338F
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Aug 2021 06:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D1560EEA
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Aug 2021 06:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50D1560EEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB5D6E9CC;
	Wed,  4 Aug 2021 06:50:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D326F89EA9;
 Wed,  4 Aug 2021 06:50:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="211999351"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="211999351"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 23:50:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="521721511"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.191])
 ([10.249.254.191])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 23:50:05 -0700
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-5-jason@jlekstrand.net>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <7c9c608f-a00a-8890-d4fb-c4fe755e2073@linux.intel.com>
Date: Wed, 4 Aug 2021 08:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715223900.1840576-5-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/gem/ttm: Place new BOs in the
 requested region
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

Hi, Jason,

On 7/16/21 12:38 AM, Jason Ekstrand wrote:
> __i915_gem_ttm_object_init() was ignoring the placement requests coming
> from the client and always placing all BOs in SMEM upon creation.
> Instead, compute the requested placement set from the object and pass
> that into ttm_bo_init_reserved().

This is done on purpose. When objects are initially created in SMEM, 
they are created in "Limbo", meaning they have no pages and costly 
allocation and clearing is deferred to first get_pages().

So we shouldn't be doing this.

/Thomas


