Return-Path: <SRS0=gTf0=HS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E166C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Feb 2021 17:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B4F64DCF
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Feb 2021 17:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B4F64DCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27B06E45E;
	Tue, 16 Feb 2021 17:15:08 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE716E456;
 Tue, 16 Feb 2021 17:15:06 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23883620-1500050 for multiple; Tue, 16 Feb 2021 17:14:55 +0000
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNkN+XTzeUuWPLj0g=rGRdBU9sxECeVbeaYgGZ+Lg2jkg@mail.gmail.com>
References: <20210216143220.98382-1-chris@chris-wilson.co.uk>
 <CAM0jSHNkN+XTzeUuWPLj0g=rGRdBU9sxECeVbeaYgGZ+Lg2jkg@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 16 Feb 2021 17:14:53 +0000
Message-ID: <161349569361.8311.10448637823546925278@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] i915/gem_exec_reloc: Verify
 relocations with pinned scanout framebuffers
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2021-02-16 16:49:28)
> On Tue, 16 Feb 2021 at 14:32, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > In light of the VT-d workarounds, we may introduce padding around the
> > scanout vma. This should not affect relocations referencing the scanout
> > on !full-ppgtt where we leak the GGTT address of scanout to users.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  tests/i915/gem_exec_reloc.c | 102 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >
> > diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> > index cc9b8cd6d..98960bb84 100644
> > --- a/tests/i915/gem_exec_reloc.c
> > +++ b/tests/i915/gem_exec_reloc.c
> > @@ -26,7 +26,9 @@
> >
> >  #include "i915/gem.h"
> >  #include "igt.h"
> > +#include "igt_device.h"
> >  #include "igt_dummyload.h"
> > +#include "igt_kms.h"
> >  #include "sw_sync.h"
> >
> >  IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl relocations.");
> > @@ -1286,6 +1288,83 @@ static void concurrent(int i915, int num_common)
> >         igt_assert_eq(result, 0);
> >  }
> >
> > +static uint32_t
> > +pin_scanout(igt_display_t *dpy, igt_output_t *output, struct igt_fb *fb)
> > +{
> > +       drmModeModeInfoPtr mode;
> > +       igt_plane_t *primary;
> > +
> > +       mode = igt_output_get_mode(output);
> > +
> > +       igt_create_pattern_fb(dpy->drm_fd, mode->hdisplay, mode->vdisplay,
> > +                             DRM_FORMAT_XRGB8888,
> > +                             LOCAL_I915_FORMAT_MOD_X_TILED, fb);
> > +
> > +       primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > +       igt_plane_set_fb(primary, fb);
> > +
> > +       igt_display_commit2(dpy, COMMIT_LEGACY);
> > +
> > +       return fb->gem_handle;
> > +}
> > +
> > +static void scanout(int i915,
> > +                   igt_display_t *dpy,
> > +                   const struct intel_execution_engine2 *e)
> 
> Missing feeding the engine into the execbuf?

Oops. Pretty pointless in making it loop over the engines without
selecting one!
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
