Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8C7C4361B
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 09:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C0423109
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 09:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C0423109
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12C689930;
	Wed, 16 Dec 2020 09:36:20 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4144189930;
 Wed, 16 Dec 2020 09:36:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23340900-1500050 for multiple; Wed, 16 Dec 2020 09:36:13 +0000
MIME-Version: 1.0
In-Reply-To: <CAM0jSHOhCKfoFNqZUnHqbsNC-hWXzKQjK8jzH4FB+B4hnSinHA@mail.gmail.com>
References: <20201215210658.1188718-1-chris@chris-wilson.co.uk>
 <20201215210658.1188718-2-chris@chris-wilson.co.uk>
 <CAM0jSHOhCKfoFNqZUnHqbsNC-hWXzKQjK8jzH4FB+B4hnSinHA@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 16 Dec 2020 09:36:14 +0000
Message-ID: <160811137407.1420.12667858510374604278@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/2] i915/gem_softpin: Check
 full placement control under full-ppgtt
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
Cc: igt-dev@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-12-16 09:31:41)
> On Tue, 15 Dec 2020 at 21:07, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > With full-ppgtt, userspacew has complete control over their GTT. Verify
> > that we can place an object at the very beginning and the very end of
> > our GTT.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  tests/i915/gem_softpin.c | 45 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> > index fcaf8ef30..a530e89d3 100644
> > --- a/tests/i915/gem_softpin.c
> > +++ b/tests/i915/gem_softpin.c
> > @@ -97,6 +97,47 @@ static void test_invalid(int fd)
> >         }
> >  }
> >
> > +static uint32_t batch_create(int i915, uint64_t *sz)
> > +{
> > +       const uint32_t bbe = MI_BATCH_BUFFER_END;
> > +       struct drm_i915_gem_create create = {
> > +               .size = sizeof(bbe),
> > +       };
> > +
> > +       if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CREATE, &create)) {
> > +               igt_assert_eq(errno, 0);
> > +               return 0;
> > +       }
> > +
> > +       gem_write(i915, create.handle, 0, &bbe, sizeof(bbe));
> > +
> > +       *sz = create.size;
> > +       return create.handle;
> > +}
> > +
> > +static void test_zero(int i915)
> > +{
> > +       uint64_t sz;
> > +       struct drm_i915_gem_exec_object2 object = {
> > +               .handle = batch_create(i915, &sz),
> > +               .flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS,
> > +       };
> > +       struct drm_i915_gem_execbuffer2 execbuf = {
> > +               .buffers_ptr = to_user_pointer(&object),
> > +               .buffer_count = 1,
> > +       };
> > +
> > +       /* Under full-ppgtt, we have complete control of the GTT */
> > +
> > +       object.offset = 0;
> > +       gem_execbuf(i915, &execbuf);
> > +
> > +       object.offset = gem_aperture_size(i915) - sz;
> > +       gem_close(i915, object.handle);
> > +
> > +       gem_close(i915, object.handle);
> > +}
> > +
> >  static void test_softpin(int fd)
> >  {
> >         const uint32_t size = 1024 * 1024;
> > @@ -559,6 +600,10 @@ igt_main
> >
> >         igt_subtest("invalid")
> >                 test_invalid(fd);
> > +       igt_subtest("zero") {
> > +               igt_require(gem_uses_full_ppgtt(fd));
> > +               test_zero(fd);
> > +       }
> 
> Worth adding igt_subtest("full") somewhere, which tries to occupy the
> entire 48b ppGTT? Maybe using pad_to_size?

No. I'll let you work out why :)
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
