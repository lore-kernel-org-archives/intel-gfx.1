Return-Path: <SRS0=5tEz=EK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3738C2D0A3
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 10:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B3E221F9
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 10:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B3E221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4306E983;
	Wed,  4 Nov 2020 10:05:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD4A6E983
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2020 10:05:37 +0000 (UTC)
IronPort-SDR: +1VuetpBVOrWa7j1xC8WaaVbuvsOGYUja221soa4mLvxYv3nJI3Nj/8Ihbi+72wtAOK6Stjx60
 31+2trsIqZUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156970004"
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="156970004"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 02:05:36 -0800
IronPort-SDR: 2hdsdp6s/YNeYtDp/lfh1tm94TSdSWXftmihKiCrlZz0y5jxZ+BJ3RXX8cbFSVRqFcg+PlXdWR
 rwmp56AeiKLg==
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="471156663"
Received: from alexlewi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.89.129])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 02:05:35 -0800
MIME-Version: 1.0
In-Reply-To: <20191222144046.1674865-3-chris@chris-wilson.co.uk>
References: <20191222144046.1674865-1-chris@chris-wilson.co.uk>
 <20191222144046.1674865-3-chris@chris-wilson.co.uk>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160448433228.9474.10886564107965448562@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 04 Nov 2020 12:05:32 +0200
Subject: Re: [Intel-gfx] [CI 3/3] drm/i915/gt: Move pm debug files into a gt
 aware debugfs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Chris Wilson (2019-12-22 16:40:46)
> From: Andi Shyti <andi.shyti@intel.com>
> 
> The GT system is becoming more and more a stand-alone system in
> i915 and it's fair to assign it its own debugfs directory.
> 
> rc6, rps and llc debugfs files are gt related, move them into the
> gt debugfs directory.
> 
> Signed-off-by: Andi Shyti <andi.shyti@intel.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  drivers/gpu/drm/i915/Makefile             |   3 +
>  drivers/gpu/drm/i915/gt/debugfs_engines.c |  36 ++
>  drivers/gpu/drm/i915/gt/debugfs_engines.h |  15 +
>  drivers/gpu/drm/i915/gt/debugfs_gt.c      |  42 ++
>  drivers/gpu/drm/i915/gt/debugfs_gt.h      |  39 ++
>  drivers/gpu/drm/i915/gt/debugfs_gt_pm.c   | 601 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/debugfs_gt_pm.h   |  14 +
>  drivers/gpu/drm/i915/gt/intel_gt.c        |   3 +
>  8 files changed, 753 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_engines.c
>  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_engines.h
>  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt.c
>  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt.h
>  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
>  create mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h

This patch seems to actually copy the code, forgetting to remove the old
code. Let's have a follow-up patch that eliminates the duplication.

Regards, Joonas
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
