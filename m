Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDB7C4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 21:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D0B423DE3
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 21:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D0B423DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB2C6EB6C;
	Thu, 10 Dec 2020 21:57:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DF26EB6C
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 21:57:20 +0000 (UTC)
IronPort-SDR: MzY7roNxZpFJcvTncLCcWJGISiFVMkh1/AwmLwmcB/C4g1a8NMGEeCO7XmKIjxDVqtiAZne6Uk
 XtRfZWHH2lFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174453981"
X-IronPort-AV: E=Sophos;i="5.78,409,1599548400"; d="scan'208";a="174453981"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 13:57:19 -0800
IronPort-SDR: CHw6SLzRgbv6saUWep//BQLjmolkAcleW+DMebygiPlW5mnUxIGpvggY+yL/BSspJonBXzG7wS
 YUhy6CcRwsuA==
X-IronPort-AV: E=Sophos;i="5.78,409,1599548400"; d="scan'208";a="378328886"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 13:57:19 -0800
Date: Thu, 10 Dec 2020 13:51:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20201210215133.GB25383@sdutt-i7>
References: <20201210080240.24529-1-chris@chris-wilson.co.uk>
 <20201210080240.24529-19-chris@chris-wilson.co.uk>
 <20201210191644.GA6255@sdutt-i7>
 <160763434489.21588.6583586596864510610@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160763434489.21588.6583586596864510610@build.alporthouse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 19/21] drm/i915/gt: Use indices for writing
 into relative timelines
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

On Thu, Dec 10, 2020 at 09:05:44PM +0000, Chris Wilson wrote:
> Quoting Matthew Brost (2020-12-10 19:16:44)
> > On Thu, Dec 10, 2020 at 08:02:38AM +0000, Chris Wilson wrote:
> > > Relative timelines are relative to either the global or per-process
> > > HWSP, and so we can replace the absolute addressing with store-index
> > > variants for position invariance.
> > > 
> > 
> > Can you explain the benifit of relative addressing? Why can't we also
> > use absolute? If we can always use absolute, I don't see the point
> > complicating the breadcrumb code.
> 
> It basically allows a third party to move the contexts between hosts
> with far less patching of global state. They want us to avoid all fixed
> GGTT addressing.
> 
> The breadcrumbs themselves do not notice at all, it's just the timeline
> setup and decision to take advantage of the relative commands. The
> breadcrumb patches in this series are some outstanding fixes from ~6
> months ago.

By breadcrumbs, I meant the emit code. Relative addressing for GVT makes
sense.

With that, for this patch:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> -Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
