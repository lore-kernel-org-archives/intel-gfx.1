Return-Path: <SRS0=9DaN=HE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F69AC433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 12:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DFC864DDA
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 12:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DFC864DDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AC66E1F6;
	Tue,  2 Feb 2021 12:18:31 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B2B6E128
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 12:18:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23771024-1500050 for multiple; Tue, 02 Feb 2021 12:18:24 +0000
MIME-Version: 1.0
In-Reply-To: <b0c69c35-dc28-87bd-feed-917a92a50299@linux.intel.com>
References: <20210201085715.27435-1-chris@chris-wilson.co.uk>
 <20210201085715.27435-8-chris@chris-wilson.co.uk>
 <b0c69c35-dc28-87bd-feed-917a92a50299@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 02 Feb 2021 12:18:24 +0000
Message-ID: <161226830492.1150.2039712629900482846@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 08/57] drm/i915/gt: Move submission_method
 into intel_gt
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

Quoting Tvrtko Ursulin (2021-02-02 12:03:02)
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > index 5d7fac383add..9304a35384aa 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > @@ -4715,7 +4715,7 @@ int intel_execlists_live_selftests(struct drm_i915_private *i915)
> >               SUBTEST(live_virtual_reset),
> >       };
> >   
> > -     if (!HAS_EXECLISTS(i915))
> > +     if (i915->gt.submission_method != INTEL_SUBMISSION_ELSP)
> >               return 0;
> >   
> >       if (intel_gt_is_wedged(&i915->gt))
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> > index 3350e7c995bc..6cd9f6bc240c 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> > @@ -291,7 +291,7 @@ int intel_ring_submission_live_selftests(struct drm_i915_private *i915)
> >               SUBTEST(live_ctx_switch_wa),
> >       };
> >   
> > -     if (HAS_EXECLISTS(i915))
> > +     if (i915->gt.submission_method > INTEL_SUBMISSION_RING)
> 
> Not sure the above two hunks in selftests are an improvement, not seeing 
> how using enum ordering is better than a feature check.

Wait 40 patches.

> Mechanics looks fine. I'd prefer the selftests to remain as is but not 
> mandatory.

The execlists tests are not suitable as-is for the guc. And they are in
the habit of breaking the test to hide impedance mismatches with the
guc.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
