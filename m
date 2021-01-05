Return-Path: <SRS0=Zd9y=GI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584BBC433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 01:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA592226A
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Jan 2021 01:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA592226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEEE89EA3;
	Tue,  5 Jan 2021 01:53:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5352689EA3
 for <intel-gfx@lists.freedesktop.org>; Tue,  5 Jan 2021 01:53:58 +0000 (UTC)
IronPort-SDR: ZuL0AGbVLBav5iO0rUpBnzPFe+pzCiFfIYS/UwLP1Y+WUZ/XhFQKZg+2Puafk8jFa57sa09+PS
 jsWvBBCRekig==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="174459046"
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; d="scan'208";a="174459046"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 17:53:57 -0800
IronPort-SDR: KCPVr3Q5tjwELEbRFNi4d3+hVou2dG6Dz1pvNo8c04Y9fSwax2d9LAPg3vuJ7OGB6GtNVqLBi3
 b4hTEyDTCTYQ==
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; d="scan'208";a="421586672"
Received: from wburton-desk1.ger.corp.intel.com (HELO intel.com)
 ([10.252.28.225])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 17:53:56 -0800
Date: Tue, 5 Jan 2021 03:53:52 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <X/PGsLFCuF7PDnOR@intel.intel>
References: <20210104115145.24460-1-chris@chris-wilson.co.uk>
 <20210104115145.24460-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210104115145.24460-2-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915: Set rawclk earlier during
 mmio probe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Chris,

On Mon, Jan 04, 2021 at 11:51:41AM +0000, Chris Wilson wrote:
> Fixes: f170523a7b8e ("drm/i915/gt: Consolidate the CS timestamp clocks")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
