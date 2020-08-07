Return-Path: <SRS0=TzMs=BR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC66CC433DF
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 09:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68FA821744
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 09:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68FA821744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20006E98D;
	Fri,  7 Aug 2020 09:11:21 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39B36E98D;
 Fri,  7 Aug 2020 09:11:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22058318-1500050 for multiple; Fri, 07 Aug 2020 10:11:16 +0100
MIME-Version: 1.0
In-Reply-To: <25f28f97-1e1f-e11f-ee6a-c524e4f854b2@intel.com>
References: <20200807084506.473089-1-chris@chris-wilson.co.uk>
 <25f28f97-1e1f-e11f-ee6a-c524e4f854b2@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Fri, 07 Aug 2020 10:11:15 +0100
Message-ID: <159679147552.16647.11735803367843972389@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] i915/gem_exec_fence: Use
 default-context for syncobj-timeline-wait
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
Cc: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-08-07 10:00:14)
> On 07/08/2020 11:45, Chris Wilson wrote:
> > syncobj-timeline-wait is only exercising waits on the syncobj along a
> > single timeline, for which it can use the universally available default
> > context, and so not try and fail to create a HW context on very old
> > platforms.
> >
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2308
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> 
> 
> Hm... I thought maybe we didn't get all the engines on the default context.

A fresh context, either the default for a new fd or from
gem_context_create(), only gets the default set of engines. The context
created here has a clone of the engines from the default context, which
we hope has been reconfigured already to have the set of all available
engines.

__for_each_physical_engine() works by querying the kernel and
reconfiguring the default context to suite. Fortunately that is run in a
fixture early on in gem_exec_fence, so by the time we get to the syncobj
group, we have all engines available.

Looks like we're good to iterate over them all :)
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
