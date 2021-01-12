Return-Path: <SRS0=+Lzr=GP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE03C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 20:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C23B122DFA
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 20:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C23B122DFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0646789704;
	Tue, 12 Jan 2021 20:43:59 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B76D89704
 for <intel-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 20:43:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23578025-1500050 for multiple; Tue, 12 Jan 2021 20:43:55 +0000
MIME-Version: 1.0
In-Reply-To: <87pn2akrsu.fsf@gaia.fi.intel.com>
References: <20210112113716.8577-1-chris@chris-wilson.co.uk>
 <87pn2akrsu.fsf@gaia.fi.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 12 Jan 2021 20:43:52 +0000
Message-ID: <161048423285.9280.16741470438251455269@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Force a failed engine
 reset
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

Quoting Mika Kuoppala (2021-01-12 17:07:13)
> > +                     if (count & 1) {
> > +                             err = intel_engine_reset(engine, NULL);
> > +                             if (err) {
> > +                                     GEM_TRACE_ERR("intel_engine_reset(%s) failed, err:%d\n",
> > +                                                   engine->name, err);
> > +                                     GEM_TRACE_DUMP();
> > +                                     break;
> > +                             }
> > +                     } else {
> > +                             force_reset_timeout(engine);
> > +                             err = intel_engine_reset(engine, NULL);
> 
> We dont promote to global here if the engine one fails?
> 
> If not, what mechanism then guarantees the request completion.

We are testing that a failed engine reset (due to the request
preparation timing out) does not affect the status of inflight work.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
