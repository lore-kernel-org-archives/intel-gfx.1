Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF823C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 15:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B42E22795
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 15:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B42E22795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5181F6E05F;
	Mon, 11 Jan 2021 15:31:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0DC6E05F;
 Mon, 11 Jan 2021 15:31:45 +0000 (UTC)
IronPort-SDR: IWfNZ7yopscPnRcVyxzVlAjCgqCED5GdmzY6x0nsW5XRdFRhoeVMO3fPcfgfVNYflQ0UTJZghy
 crTPwQBFYWZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="157061794"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="157061794"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 07:31:44 -0800
IronPort-SDR: mzhR87LQ/ofphbp4CytRntqvT2/ORg/3SCPgdZppthAsqr8l7swXb2WdW0MgZ1MpH4YXmUsj1l
 gbkMEGv2jzXQ==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="352639387"
Received: from mgabor-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.214.242.11])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 07:31:39 -0800
Date: Mon, 11 Jan 2021 17:31:35 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <X/xvV6IqusOkKGdD@intel.intel>
References: <161037060292.28181.5373987654669273170@build.alporthouse.com>
 <X/xeIMP16sDekYrh@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/xeIMP16sDekYrh@mwanda>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: selftest_lrc: Fix error code
 in live_preempt_user()
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dan,

On Mon, Jan 11, 2021 at 05:18:08PM +0300, Dan Carpenter wrote:
> This error path should return a negative error code instead of success.
> 
> Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
