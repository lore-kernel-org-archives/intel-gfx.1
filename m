Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3D4C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 14:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB79B64DFF
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB79B64DFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFA16ED98;
	Thu,  4 Feb 2021 14:45:39 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1296ED98
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 14:45:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23787741-1500050 for multiple; Thu, 04 Feb 2021 14:45:34 +0000
MIME-Version: 1.0
In-Reply-To: <d2c832f2-7891-4cc8-750d-dd50794e977c@linux.intel.com>
References: <20210201085715.27435-1-chris@chris-wilson.co.uk>
 <20210201085715.27435-25-chris@chris-wilson.co.uk>
 <d2c832f2-7891-4cc8-750d-dd50794e977c@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 04 Feb 2021 14:45:33 +0000
Message-ID: <161244993312.3075.4439502127069709098@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 25/57] drm/i915: Move submit_request to
 i915_sched_engine
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

Quoting Tvrtko Ursulin (2021-02-04 14:13:17)
> 
> On 01/02/2021 08:56, Chris Wilson wrote:
> > @@ -28,6 +28,15 @@ struct i915_sched {
> >   
> >       unsigned long mask; /* available scheduling channels */
> >   
> > +     /*
> > +      * Pass the request to the hardware queue (e.g. directly into
> 
> s/hardware queue/submission backend/ ?

Aye. One of the final steps is to remove this vfunc :)
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
