Return-Path: <SRS0=eb9m=BW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345CDC433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 12:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144712065C
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2020 12:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144712065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB31D6E0DD;
	Wed, 12 Aug 2020 12:50:09 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D846E0DA;
 Wed, 12 Aug 2020 12:50:08 +0000 (UTC)
IronPort-SDR: X/yqTdiGGTKu8rcnFu+wKqQiKuRQIF1bG9D7nndNfYOTzHbjsGBdUekdz+vWV919IERr128x+Q
 UvAjhFEpbXpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="141564917"
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="141564917"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 05:50:07 -0700
IronPort-SDR: 2WQa6/x/9zAcIShlqVdkSGhpTsDpiQ0556BmeX26Td5ngSnoN3k8xQBgzMERJQqg7kuesFeqE4
 E4V7L8v4d4/A==
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="469811508"
Received: from mcintra-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.49.240])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 05:50:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <CAPM=9tygv6dqg8sMgQ-fF4bAr+QY4zDVczbj6qV0jFcVX0-p3Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200730162652.GA90813@jlahtine-desk.ger.corp.intel.com>
 <CAPM=9tygv6dqg8sMgQ-fF4bAr+QY4zDVczbj6qV0jFcVX0-p3Q@mail.gmail.com>
Date: Wed, 12 Aug 2020 15:49:56 +0300
Message-ID: <87ft8shvuz.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PULL] drm-intel-next-fixes
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 10 Aug 2020, Dave Airlie <airlied@gmail.com> wrote:
> Like this stuff has been getting past me for years but I'm not happy
> about it anymore, I'm going to just be grumpy asshole going forward.
> If we introduced scheduler races in linux-next, I want to see reverts,
> and reverts only until we stopped introducing them.

I'll redo the fixes once we have dinq sorted out.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
