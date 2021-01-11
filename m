Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0F6C433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 21:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D86AC207B6
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 21:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D86AC207B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6188589E2B;
	Mon, 11 Jan 2021 21:11:05 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6B989E2B
 for <intel-gfx@lists.freedesktop.org>; Mon, 11 Jan 2021 21:11:03 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23564508-1500050 for multiple; Mon, 11 Jan 2021 21:11:02 +0000
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB379949C26EB75C832D559822A9AB0@BYAPR11MB3799.namprd11.prod.outlook.com>
References: <20210110150404.19535-1-chris@chris-wilson.co.uk>
 <20210110150404.19535-3-chris@chris-wilson.co.uk>
 <BYAPR11MB379949C26EB75C832D559822A9AB0@BYAPR11MB3799.namprd11.prod.outlook.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Abodunrin, Akeem G" <akeem.g.abodunrin@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Mon, 11 Jan 2021 21:10:59 +0000
Message-ID: <161039945998.28181.6651626457900840592@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 03/11] drm/i915: Allow the sysadmin to
 override security mitigations
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Abodunrin, Akeem G (2021-01-11 20:58:42)
> 
> 
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Chris
> > Wilson
> > Sent: Sunday, January 10, 2021 7:04 AM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: stable@vger.kernel.org; Chris Wilson <chris@chris-wilson.co.uk>
> > Subject: [Intel-gfx] [PATCH 03/11] drm/i915: Allow the sysadmin to override
> > security mitigations
> > 
> > The clear-residuals mitigation is a relatively heavy hammer and under some
> > circumstances the user may wish to forgo the context isolation in order to
> > meet some performance requirement. Introduce a generic module parameter
> > to allow selectively enabling/disabling different mitigations.

> Although this seems like ideal solution - giving users option to choose *potential* performance over security or vice-versa -  However, I would have expected that this patch adds a DRM warning to inform users of the consequences of their action, whenever module parameter is used to disable any kind of mitigations. Well, that is my own perspective, not as a legal expert.

It's marked as unsafe; setting this parameter will issue a notice and
taint the kernel. That should be enough to warn of the consequences of
their actions, without going into the gruesome details.

I very briefly considered a few pr_warn_once() for each disabled
mitigation, but I am not sure what we should say to the user.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
