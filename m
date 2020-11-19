Return-Path: <SRS0=vAY1=EZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9B3C2D0E4
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2020 13:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83B5F22255
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2020 13:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83B5F22255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7904389B06;
	Thu, 19 Nov 2020 13:28:44 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF8889B06
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2020 13:28:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23042138-1500050 for multiple; Thu, 19 Nov 2020 13:28:40 +0000
MIME-Version: 1.0
In-Reply-To: <cf169b86-94dc-0bf6-8502-7b6b98604517@linux.intel.com>
References: <20201119111831.1236-1-chris@chris-wilson.co.uk>
 <20201119122406.32255-1-chris@chris-wilson.co.uk>
 <cf169b86-94dc-0bf6-8502-7b6b98604517@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 19 Nov 2020 13:28:38 +0000
Message-ID: <160579251890.30679.13230010270333551702@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/gt: Update request status flags
 for debug pretty-printer
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

Quoting Tvrtko Ursulin (2020-11-19 13:18:10)
> 
> On 19/11/2020 12:24, Chris Wilson wrote:
> > We plan to expand upon the number of available statuses for when we
> > pretty-print the requests along the timelines, and so need a new set of
> > flags. We have settled upon:
> > 
> >       Unready [U]
> >         - initial status after being submitted, the request is not
> >           ready for execution as it is waiting for external fences
> > 
> >       Ready [R]
> >         - all fences the request was waiting on have been signaled,
> >              and the request is now ready for execution and will be
> >           in a backend queue
> > 
> >         - a ready request may still need to wait on semaphores
> >           [internal fences]
> > 
> >       Ready/virtual [V]
> >         - same as ready, but queued over multiple backends
> > 
> 
> You do not like my idea of R/Rv? I think it would be more intuitive, but 
> anyway patch looks good.

Started with Rv, but then thought restricting it to a single character
and constant width was more important for the vertical alignment. That
may not be that much of an issue in practice. ~o~
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
