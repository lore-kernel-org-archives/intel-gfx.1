Return-Path: <SRS0=9rZY=GQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF781C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 14:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288D4233FB
	for <intel-gfx@archiver.kernel.org>; Wed, 13 Jan 2021 14:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 288D4233FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FB56E9C7;
	Wed, 13 Jan 2021 14:20:32 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAEC6E9C7
 for <intel-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 14:20:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23585403-1500050 for multiple; Wed, 13 Jan 2021 14:20:27 +0000
MIME-Version: 1.0
In-Reply-To: <87czy8lyai.fsf@gaia.fi.intel.com>
References: <20210113125155.1029-1-chris@chris-wilson.co.uk>
 <20210113125939.10205-1-chris@chris-wilson.co.uk>
 <87czy8lyai.fsf@gaia.fi.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 13 Jan 2021 14:20:26 +0000
Message-ID: <161054762695.6195.15727662489681827393@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Bump the scheduling
 threshold for fast heartbeats
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

Quoting Mika Kuoppala (2021-01-13 14:13:57)
> Chris Wilson <chris@chris-wilson.co.uk> writes:
> 
> > Since we are system_highpri_wq, we expected the heartbeat to be
> > scheduled promptly. However, we see delays of over 10ms upsetting our
> > assertions. Accept this as inevitable and bump the error threshold to
> > 20ms (from 6ms).
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> > index b88aa35ad75b..e88a01390dc5 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> > @@ -197,6 +197,7 @@ static int cmp_u32(const void *_a, const void *_b)
> >  
> >  static int __live_heartbeat_fast(struct intel_engine_cs *engine)
> >  {
> > +     const int error_threshold = max(20000, jffies_to_usecs(6));
> 
> s/jffies/jiffies
> 
> Also for the commit message, 6 jiffies are not 6ms so it needs
> some mending.

Ok, might as well pull the failure messages from CI as well for a bit
more information.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
