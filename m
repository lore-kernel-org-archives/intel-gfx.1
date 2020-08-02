Return-Path: <SRS0=dOvl=BM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE54C433DF
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 11:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6169020738
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 11:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6169020738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43B989CAF;
	Sun,  2 Aug 2020 11:40:52 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDD189C96;
 Sun,  2 Aug 2020 11:40:51 +0000 (UTC)
IronPort-SDR: +vZxP5qq/ipmYYS9nCz4JlIndGS7vjJWP5cxKPu7WiVxYhMZNh3kzcoxhvNUBHPCro6jubjihP
 OK1+833IU7NQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9700"; a="153201992"
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="153201992"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 04:40:50 -0700
IronPort-SDR: zTmAvTqRF5Q/d8MAJQczFCPyOgqePoEIe4gpsyHTg45B1dHmF8LJdjZvJFUotZCyOJbim2Oxxp
 KUn8qpeVMTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="366035580"
Received: from cahanley-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.10.182])
 by orsmga001.jf.intel.com with ESMTP; 02 Aug 2020 04:40:45 -0700
Date: Sun, 2 Aug 2020 14:40:44 +0300
From: Andi Shyti <andi.shyti@intel.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <20200802114044.GD4705@intel.intel>
References: <20200802111534.5155-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802111534.5155-1-tianjia.zhang@linux.alibaba.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix wrong return value
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
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 chris@chris-wilson.co.uk, tianjia.zhang@alibaba.com, matthew.auld@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Tianjia,

> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index d960d0be5bd2..cc017e3cc9c5 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -758,7 +758,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
>  	intel_engine_mask_t tmp, mask = engine->mask;
>  	struct llist_node *first = NULL, *last = NULL;
>  	struct intel_gt *gt = engine->gt;
> -	int err;
> +	int err = 0;

you don't need the initialization here.

Thanks,
Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
