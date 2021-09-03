Return-Path: <SRS0=fLoR=NZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ABAC433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 09:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C32E60F91
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 09:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C32E60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E7E6E098;
	Fri,  3 Sep 2021 09:33:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3AD6E098
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Sep 2021 09:33:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="217518894"
X-IronPort-AV: E=Sophos;i="5.85,264,1624345200"; d="scan'208";a="217518894"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 02:33:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,264,1624345200"; d="scan'208";a="543432619"
Received: from schuethe-mobl1.ger.corp.intel.com (HELO [10.252.60.46])
 ([10.252.60.46])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 02:33:05 -0700
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210830121006.2978297-1-maarten.lankhorst@linux.intel.com>
 <20210830121006.2978297-15-maarten.lankhorst@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <7a912166-487f-101e-61f5-c0eecb43d7fc@linux.intel.com>
Date: Fri, 3 Sep 2021 11:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830121006.2978297-15-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 14/19] drm/i915: Add
 i915_vma_unbind_unlocked, and take obj lock for i915_vma_unbind
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

Op 30-08-2021 om 14:10 schreef Maarten Lankhorst:
> We want to remove more members of i915_vma, which requires the locking to be
> held more often.
>
> Start requiring gem object lock for i915_vma_unbind, as it's one of the
> callers that may unpin pages.
>
> Some special care is needed when evicting, because the last reference to the
> object may be held by the VMA, so after __i915_vma_unbind, vma may be garbage,
> and we need to cache vma->obj before unlocking.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 14 +++-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  4 +-
>  .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
>  .../drm/i915/gem/selftests/i915_gem_mman.c    |  6 ++
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 46 ++++++++++--
>  drivers/gpu/drm/i915/i915_drv.h               |  7 +-
>  drivers/gpu/drm/i915/i915_gem.c               | 29 +++++++-
>  drivers/gpu/drm/i915/i915_gem_evict.c         | 74 +++++++++++++++++--
>  drivers/gpu/drm/i915/i915_vma.c               | 27 ++++++-
>  drivers/gpu/drm/i915/i915_vma.h               |  1 +
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 22 +++---
>  drivers/gpu/drm/i915/selftests/i915_vma.c     |  2 +-
>  13 files changed, 195 insertions(+), 41 deletions(-)

This patch breaks the selftests because lockdep doesn't like nested trylocks, and eviction needed some love.

I've split it out, and will resubmit this part, rest can still be reviewed as it doesn't affect that.

