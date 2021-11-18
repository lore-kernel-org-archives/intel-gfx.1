Return-Path: <SRS0=1k+4=QF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2260C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Nov 2021 15:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE5161353
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Nov 2021 15:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EE5161353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15786ED00;
	Thu, 18 Nov 2021 15:15:35 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C306E6ECED
 for <intel-gfx@lists.freedesktop.org>; Thu, 18 Nov 2021 15:15:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="234033543"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; d="scan'208";a="234033543"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 07:15:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; d="scan'208";a="473181285"
Received: from davidmor-mobl1.ger.corp.intel.com (HELO [10.252.9.238])
 ([10.252.9.238])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 07:15:33 -0800
Message-ID: <5bc9543f-b28e-bc57-ea02-8009ae64e436@intel.com>
Date: Thu, 18 Nov 2021 15:15:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211118150120.GA22452@kili>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211118150120.GA22452@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [bug report] drm/i915/ttm: add tt shmem backend
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 18/11/2021 15:01, Dan Carpenter wrote:
> Hello Matthew Auld,
> 
> The patch 7ae034590cea: "drm/i915/ttm: add tt shmem backend" from Oct
> 18, 2021, leads to the following Smatch static checker warning:
> 
> 	drivers/gpu/drm/i915/gem/i915_gem_ttm.c:335 i915_ttm_eviction_valuable()
> 	warn: signedness bug returning '(-16)'
> 
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>      324 static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
>                 ^^^^
> 
>      325                                        const struct ttm_place *place)
>      326 {
>      327         struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>      328
>      329         /*
>      330          * EXTERNAL objects should never be swapped out by TTM, instead we need
>      331          * to handle that ourselves. TTM will already skip such objects for us,
>      332          * but we would like to avoid grabbing locks for no good reason.
>      333          */
>      334         if (bo->ttm && bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
> --> 335                 return -EBUSY;
>                          ^^^^^^^^^^^^^^
> This should be return false probably.

Oh, indeed. Did you also want to send a patch for that? Thanks.

> 
>      336
>      337         /* Will do for now. Our pinned objects are still on TTM's LRU lists */
>      338         return i915_gem_object_evictable(obj);
>      339 }
> 
> regards,
> dan carpenter
> 
