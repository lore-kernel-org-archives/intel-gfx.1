Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CB9C433DF
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 22:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5C020776
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 22:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5C020776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC706E1E9;
	Thu, 15 Oct 2020 22:25:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3076E1E9
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 22:25:30 +0000 (UTC)
IronPort-SDR: JDQb2HYma4lgwQwdhsKXlhDMrExiNQ0+4Rq6a3xWMPLB9HtrkkW/qXlrUDkB47QZKqWRL///OP
 /I6iJ1YTKgUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="163003926"
X-IronPort-AV: E=Sophos;i="5.77,380,1596524400"; d="scan'208";a="163003926"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 15:25:30 -0700
IronPort-SDR: n7474nTOxw5SgsKEzGtGNPTxpDnHX16kilRVrJGRfGmgcwwZ07dhEZbPq7VVi/TqYirqTJZ9LA
 yMo5sT03Yiqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,380,1596524400"; d="scan'208";a="522010390"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 15 Oct 2020 15:25:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 15 Oct 2020 15:25:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 15 Oct 2020 15:25:29 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.1713.004;
 Thu, 15 Oct 2020 15:25:29 -0700
From: "Tang, CQ" <cq.tang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Make the GEM reclaim workqueue
 high priority
Thread-Index: AQHWoUw7vknVeKpXoUG0dRnaVPrLvamVsYWggAB79wD//4wCsIAAbQPggAMV3QD//91WoIAAfbMA//+drVA=
Date: Thu, 15 Oct 2020 22:25:29 +0000
Message-ID: <53f05ef73ee64121a17d20c9d4971ab0@intel.com>
References: <20201013103256.31446-1-chris@chris-wilson.co.uk>
 <8c41461201764a0d8a05caba47d1589a@intel.com>
 <160260628825.2946.16678261690978530238@build.alporthouse.com>
 <daa1a1f388a94b07ad95ce5d12132925@intel.com>
 <917a40e55bb64ff1a9692563eb459611@intel.com>
 <160277441055.32312.12137014703246379267@build.alporthouse.com>
 <8440cc7f281a49509efc25987b349438@intel.com>
 <160279396077.3047.5670029514653870704@build.alporthouse.com>
In-Reply-To: <160279396077.3047.5670029514653870704@build.alporthouse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Make the GEM reclaim workqueue
 high priority
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



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Thursday, October 15, 2020 1:33 PM
> To: Tang, CQ <cq.tang@intel.com>; intel-gfx@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH] drm/i915: Make the GEM reclaim workqueue
> high priority
> > > We can also prune the free_list immediately, if we know we are
> > > outside of any critical section. (We do this before create ioctls,
> > > and I thought upon close(device), but I see that's just contexts.)
> > >
> > > > The worker launching time is delayed a lot, we call queue_work()
> > > > when we
> > > add the first object onto the empty 'free_list', but when the worker
> > > is launched, the 'free_list' has sometimes accumulated 1M objects.
> > > Maybe it is because of waiting currently running worker to finish?
> > >
> > > 1M is a lot more than is comfortable, and that's even with a
> > > high-priority worker.  The problem with objects being freed from any
> > > context is that we can't simply put a flush_work around there. (Not
> > > without ridding ourselves of a few mutexes at least.) We could try
> > > more than worker, but it's no more more effort to starve 2 cpus than it is
> to starve 1.
> > >
> > > No, with that much pressure the only option is to apply the
> > > backpressure at the point of allocation ala create_ioctl. i.e. find
> > > the hog, and look to see if there's a convenient spot before/after
> > > to call i915_gem_flush_free_objects(). Since you highlight the
> > > vma-stash as the likely culprit, and the free_pt_stash is unlikely
> > > to be inside any critical section, might as well try flushing from there for
> starters.
> >
> > I have not yet tested, but I guess calling i915_gem_flush_free_objects()
> inside free_pt_stash() will solve the problem that gem_exec_gttfill has,
> because it will give some back pressure on the system traffic.
> 
> Still I'm slightly concerned that so many PD objects are being created; it's not
> something that shows up in the smem ppgtt tests (or at least it's been
> dwarfed by other bottlenecks), and the set of vma (and so the
> PD) are meant to reach a steady state. You would need to be using a
> constant set of objects and recycling the vma, not to hit the create_ioctl flush.
> However, it points back to the pressure point being around the vma bind.
> 
> > But this is only for the page table 4K lmem objects allocated/freed by vma-
> stash. We might encounter the same situation with user space allocated
> objects.
> 
> See gem_exec_create, it's mission is to cause memory starvation by creating
> as many new objects as it can and releasing them after a nop batch. That's
> why we have the freelist flush from create_ioctl.
> 
> Now I need to add a pass that tries to create as many vma from a few objects
> as is possible.
> 
> (And similarly why we try to free requests as they are created.)
> 
> One problem is that they will catch the client after the hog, not necessarily
> the hog themselves.
> 
> I'm optimistic we can make freeing the object atomic, even if that means
> pushing the pages onto some reclaim list. (Which is currently a really nasty
> drawback of the free worker, a trick lost with the removal of
> struct_mutex.)

On a DG1 system with 4GB lmem, and 7.7GB system memory, I can easily catch system OOM when running "gem_exec_gttfill --r all".

When I call i915_gem_flush_free_objects() inside i915_vm_free_pt_stash(), the test code passes without any problem.

With simple test 'gem_exec_gttfill --r all", I also concerned that why driver create/free so many vma-stash objects, when the system OOM happened, there are total 1.5M stash objects freed.

--CQ

> -Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
