Return-Path: <SRS0=LPwG=JE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157B3C433B4
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Apr 2021 13:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF6E61246
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Apr 2021 13:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF6E61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7A6E90C;
	Wed,  7 Apr 2021 13:40:16 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560006E90C
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Apr 2021 13:40:15 +0000 (UTC)
IronPort-SDR: rsiOVYzMbzgADE/RBDsB8tCRPQbc9vZzWKKSF4luNotylMZd4QqrFcroAdTCFC3c9YmmXPuoZO
 jrUxNlr2Y7oQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="193348993"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="193348993"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 06:40:14 -0700
IronPort-SDR: cqKZMTMNKr1TbWNHHXtC82JhOBU6bIl+cEeCw4koBHuh2zsbS7xzig4/CHKPPtIiM5LTGY23Ut
 ZKN2H7/ykjzQ==
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="379829570"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 06:40:13 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lU8Pi-0021Ol-5D; Wed, 07 Apr 2021 16:40:10 +0300
Date: Wed, 7 Apr 2021 16:40:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <YG22OhNg3iQ8DFXW@smile.fi.intel.com>
References: <20210407122337.77493-1-andriy.shevchenko@linux.intel.com>
 <87h7kijm8i.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7kijm8i.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Subject: Re: [Intel-gfx] [PATCH v1 1/1] drm/i915: Include only needed
 headers in ascii85.h
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 03:46:37PM +0300, Jani Nikula wrote:
> On Wed, 07 Apr 2021, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > The ascii85.h is user of exactly two headers, i.e. math.h and types.h.
> > There is no need to carry on entire kernel.h.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> That's hardly drm/i915 specific!

It was originated from i915!

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks!

> But who's going to pick it up and, hopefully, change the subject prefix
> to ascii85 or something?

It's drm specific. Should I leave drm and resend? Or what is the general rule
for drm misc changes?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
