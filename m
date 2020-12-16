Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D11CC4361B
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 21:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22F02342C
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 21:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22F02342C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1938889A4E;
	Wed, 16 Dec 2020 21:35:30 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0084E89A4E
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Dec 2020 21:35:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23348875-1500050 for multiple; Wed, 16 Dec 2020 21:35:23 +0000
MIME-Version: 1.0
In-Reply-To: <a0e150fe3b9d4083934d0015e59457c8@intel.com>
References: <20201216205232.1365213-1-chris@chris-wilson.co.uk>
 <a0e150fe3b9d4083934d0015e59457c8@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Tang, CQ" <cq.tang@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 16 Dec 2020 21:35:24 +0000
Message-ID: <160815452487.9127.15995606031734879532@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_softpin: Check the last 32b
 page is excluded
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

Quoting Tang, CQ (2020-12-16 21:23:04)
> 
> 
> > -----Original Message-----
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> > Sent: Wednesday, December 16, 2020 12:53 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>; Tang, CQ <cq.tang@intel.com>
> > Subject: [PATCH i-g-t] i915/gem_softpin: Check the last 32b page is excluded
> > 
> > In order to prevent issues with 32b stateless address, the last page under 4G
> > is excluded for non-48b objects.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: CQ Tang <cq.tang@intel.com>
> > ---
> >  tests/i915/gem_softpin.c | 37
> > +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c index
> > a3e6dcac3..703beb77d 100644
> > --- a/tests/i915/gem_softpin.c
> > +++ b/tests/i915/gem_softpin.c
> > @@ -156,6 +156,39 @@ static void test_zero(int i915)
> >       gem_close(i915, object.handle);
> >  }
> > 
> > +static void test_32b_last_page(int i915) {
> > +     uint64_t sz, gtt = gem_aperture_size(i915);
> > +     struct drm_i915_gem_exec_object2 object = {
> > +             .flags = EXEC_OBJECT_PINNED,
> > +     };
> > +     struct drm_i915_gem_execbuffer2 execbuf = {
> > +             .buffers_ptr = to_user_pointer(&object),
> > +             .buffer_count = 1,
> > +     };
> > +
> > +     /*
> > +      * The last page under 32b is excluded for !48b objects in order to
> > +      * prevent issues with stateless addressing.
> > +      */
> > +
> > +     igt_require(gtt >= 1ull << 32);
> > +     object.handle = batch_create(i915, &sz),
> 
> Where is this batch_create() version?

In upstream. Just the regular batch_create() but returning the allocated
size.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
