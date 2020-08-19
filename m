Return-Path: <SRS0=XCjr=B5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43952C433E1
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 13:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CEE9206FA
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2020 13:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CEE9206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA766E3EF;
	Wed, 19 Aug 2020 13:49:55 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B106E3F0;
 Wed, 19 Aug 2020 13:49:54 +0000 (UTC)
IronPort-SDR: +S25vxUpYrJ6TDLDNfnMDQAVODH+QzeTCN9TlJDlx6RQ3hwYuH+r39LkHqn5yt1XFpxESYuaBA
 UvUjPu5WYm7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="135175492"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="135175492"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 06:49:54 -0700
IronPort-SDR: EQhxDIqXc4pRtB715GwacIoIwzSCJG1jZ7qoM0O/+MMz/0kEKZWE60L0IttRR7xl6GyQqu2YFT
 CQ4m+v1BsHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="327093717"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2020 06:49:52 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k8OTO-009szE-G9; Wed, 19 Aug 2020 16:49:50 +0300
Date: Wed, 19 Aug 2020 16:49:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20200819134950.GO1891694@smile.fi.intel.com>
References: <20200819115353.59592-1-andriy.shevchenko@linux.intel.com>
 <159783838601.667.13987031157680370712@build.alporthouse.com>
 <87h7sy7r1a.fsf@intel.com>
 <159784117463.667.14083963249056080662@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159784117463.667.14083963249056080662@build.alporthouse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Subject: Re: [Intel-gfx] [PATCH v1] drm/i915/gt: convert tasklets to use new
 tasklet_setup() API
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 01:46:14PM +0100, Chris Wilson wrote:
> Quoting Jani Nikula (2020-08-19 13:34:41)
> > On Wed, 19 Aug 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > Quoting Andy Shevchenko (2020-08-19 12:53:53)
> > >> In preparation for unconditionally passing the struct tasklet_struct
> > >> pointer to all tasklet callbacks, switch to using the new tasklet_setup()
> > >> and from_tasklet() to pass the tasklet pointer explicitly.
> > >> 
> > >> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

I sent too early, I will send v2 and thanks for review.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
