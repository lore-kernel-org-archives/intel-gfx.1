Return-Path: <SRS0=HSM9=GJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E577CC433DB
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 19:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3252D22B4B
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 19:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3252D22B4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6876E08E;
	Wed,  6 Jan 2021 19:43:13 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97076E08E
 for <intel-gfx@lists.freedesktop.org>; Wed,  6 Jan 2021 19:43:11 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23522064-1500050 for multiple; Wed, 06 Jan 2021 19:43:08 +0000
MIME-Version: 1.0
In-Reply-To: <f2b54e5a-fc97-ef33-0c6c-6fe6833d3b73@intel.com>
References: <20210105231947.31235-1-daniele.ceraolospurio@intel.com>
 <20210105231947.31235-3-daniele.ceraolospurio@intel.com>
 <160989470089.14894.2097316461568983303@build.alporthouse.com>
 <a38fc4e1-8847-2bc4-763f-673c2597a06f@intel.com>
 <160990175565.22606.17511156121476669794@build.alporthouse.com>
 <f2b54e5a-fc97-ef33-0c6c-6fe6833d3b73@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 06 Jan 2021 19:43:06 +0000
Message-ID: <160996218684.14894.17445852133665540846@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915/guc: do not dump execlists
 state with GuC submission
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

Quoting Daniele Ceraolo Spurio (2021-01-06 17:21:16)
> 
> 
> On 1/5/2021 6:55 PM, Chris Wilson wrote:
> > Quoting Daniele Ceraolo Spurio (2021-01-06 02:32:28)
> >>
> >> On 1/5/2021 4:58 PM, Chris Wilson wrote:
> >>> Quoting Daniele Ceraolo Spurio (2021-01-05 23:19:44)
> >>>> GuC owns the execlists state and the context IDs used for submission, so
> >>>> the status of the ports and the CSB entries are not something we control
> >>>> or can decode from the i915 side, therefore we can avoid dumping it. A
> >>>> follow-up patch will also stop setting the csb pointers when using GuC
> >>>> submission.
> >>>>
> >>>> GuC dumps all the required events in the GuC logs when verbosity is set
> >>>> high enough.
> >>> Would not be worth including, or is it not very helpful for debugging
> >>> curious engine stalls?
> >> GuC is going to reset the engine if it stalls, so we should get the GuC
> >> logs and the engine state included in the error state.
> > Here we would be focusing on "why hasn't a request been submitted/executed".
> > A bad request is usually self-evident, but a missing one is tricky.
> 
> Agreed, but I still don't think we could use the CSB info even if we 
> dumped it. We currently can't map CSB events in GuC submission mode to 
> specific contexts, because the ctx IDs used by the GuC do not map to the 
> ones used by i915. We've asked the GuC team to expose a way to do such a 
> mapping, but that's still under discussion. In the meantime we plan to 
> add a few traces to make sure the requests reach the GuC and use the GuC 
> logs for what goes on inside the FW (GuC logs include the context IDs it 
> uses for submission and all CSB events on high verbosity).

I was more reflecting on what could be here instead. Details of the ctb?
It would be great to have a snapshot of some relevant guc state, merely
wonder if we could extract anything from the log automatically. As well
as the usual what have we submitted to the guc.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
