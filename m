Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15AFC433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 10:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D621221F0
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 10:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D621221F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E69D6E06B;
	Thu, 21 Jan 2021 10:09:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3956E06B
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 10:09:17 +0000 (UTC)
IronPort-SDR: Gj6KHPH9ay6xfNpk2QPYiN8dpB7zcKJEEXSqxCIJlMQ7w70m/WSG/6DOdvT8HHKIAZ/vBXUqC3
 mgVhdpMIBMgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="179331620"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="179331620"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 02:09:12 -0800
IronPort-SDR: trg05fUx44tFYlknrtnoHUlYLYHDJLg5uEnLeCfcvYLyzF3X6+x4nwo2zzEKhD4rBeooEC6Hs1
 UoxFwG+s+A9w==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="385244216"
Received: from cohrs-mobl.ger.corp.intel.com (HELO localhost) ([10.252.51.23])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 02:09:08 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <161122078664.32666.16504061212673044761@build.alporthouse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YAkaBa22zvbXKd4E@mwanda> <87h7namz5w.fsf@intel.com>
 <161122078664.32666.16504061212673044761@build.alporthouse.com>
Date: Thu, 21 Jan 2021 12:09:05 +0200
Message-ID: <87eeiemwji.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 21 Jan 2021, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Jani Nikula (2021-01-21 09:12:27)
>> On Thu, 21 Jan 2021, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> > This was supposed to be | instead of ||.
>> >
>> > Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> 
>> Thanks, but we already have the fix [1] for this that I thought was
>> pushed by now [2].
>> 
>> Chris?
>
> 6b20b734bbf1 ("drm/i915/display: Bitwise or the conversion colour specifier together")
> in
>   remotes/drm-intel/drm-intel-next
>   remotes/drm-intel/for-linux-next
> should be visible.

Oh, it totally is. Where's my brown paper bag when I need it?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
