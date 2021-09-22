Return-Path: <SRS0=at8c=OM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3933C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 08:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF5561264
	for <intel-gfx@archiver.kernel.org>; Wed, 22 Sep 2021 08:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FF5561264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BB96EAC0;
	Wed, 22 Sep 2021 08:08:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1406EAC0;
 Wed, 22 Sep 2021 08:08:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="245981120"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="245981120"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 01:08:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="512874257"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151])
 ([10.213.200.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 01:08:28 -0700
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20210921142116.3807946-1-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f7f428ce-5b54-f8fc-1d93-968a94c57131@linux.intel.com>
Date: Wed, 22 Sep 2021 09:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921142116.3807946-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: exercise
 shmem_writeback with THP
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


On 21/09/2021 15:21, Matthew Auld wrote:
> In commit:
> 
> commit 1e6decf30af5c5c75445ed6ad4e65a26de578a03
> Author: Hugh Dickins <hughd@google.com>
> Date:   Thu Sep 2 14:54:43 2021 -0700
> 
>      shmem: shmem_writepage() split unlikely i915 THP
> 
> it looks THP + shmem_writeback was an unexpected combination, and ends up
> hitting some BUG_ON, but it also looks like that is now fixed.
> 
> While the IGTs did eventually hit this(although not during pre-merge it
> seems), it's likely worthwhile adding some explicit coverage for this
> scenario in the shrink_thp selftest.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/4166
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index 0827634c842c..8260a533d43f 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1589,7 +1589,8 @@ static int igt_shrink_thp(void *arg)
>   	i915_gem_shrink(NULL, i915, -1UL, NULL,
>   			I915_SHRINK_BOUND |
>   			I915_SHRINK_UNBOUND |
> -			I915_SHRINK_ACTIVE);
> +			I915_SHRINK_ACTIVE |
> +			I915_SHRINK_WRITEBACK);
>   	if (should_swap == i915_gem_object_has_pages(obj)) {
>   		pr_err("unexpected pages mismatch, should_swap=%s\n",
>   		       yesno(should_swap));
> 

Good idea I think.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
