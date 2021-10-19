Return-Path: <SRS0=c+lk=PH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4E3C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Oct 2021 09:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5763F6138F
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Oct 2021 09:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5763F6138F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100426E138;
	Tue, 19 Oct 2021 09:26:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFE86E138;
 Tue, 19 Oct 2021 09:26:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="209263213"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="209263213"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 02:26:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="574104083"
Received: from cdonoghx-mobl1.ger.corp.intel.com (HELO [10.213.194.99])
 ([10.213.194.99])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 02:26:39 -0700
To: cgel.zte@gmail.com, jani.nikula@linux.intel.com
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@linux.ie, daniel@ffwll.ch, thomas.hellstrom@linux.intel.com,
 chris@chris-wilson.co.uk, maarten.lankhorst@linux.intel.com,
 ran.jianping@zte.com.cn, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
References: <20211019090205.1003458-1-ran.jianping@zte.com.cn>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <130dcbfd-ee6d-0d9a-602f-1aaca1229099@intel.com>
Date: Tue, 19 Oct 2021 10:26:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211019090205.1003458-1-ran.jianping@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH] remove duplicate include in mock_region.c
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

On 19/10/2021 10:02, cgel.zte@gmail.com wrote:
> From: Ran Jianping <ran.jianping@zte.com.cn>
> 
> 'drm/ttm/ttm_placement.h' included in
> 'drivers/gpu/drm/i915/selftests/mock_region.c' is duplicated.
> It is also included on the 9 line.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>

Commit tile should ideally be prefixed with 'drm/i915:'.

Can fix up when pushing though. Thanks,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/selftests/mock_region.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
> index efa86dffe3c6..75793008c4ef 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_region.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_region.c
> @@ -6,8 +6,6 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <linux/scatterlist.h>
>   
> -#include <drm/ttm/ttm_placement.h>
> -
>   #include "gem/i915_gem_region.h"
>   #include "intel_memory_region.h"
>   #include "intel_region_ttm.h"
> 
