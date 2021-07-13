Return-Path: <SRS0=tFHw=MF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF17C07E95
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 20:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02616135A
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 20:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B02616135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E09A6E128;
	Tue, 13 Jul 2021 20:20:04 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEC36E123;
 Tue, 13 Jul 2021 20:20:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="207219353"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="207219353"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 13:20:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="493245515"
Received: from rmvillaz-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.212.91.132])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 13:20:00 -0700
Date: Tue, 13 Jul 2021 16:19:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YO31b16UqQtsjX1b@intel.com>
References: <20210630164413.25481-1-ville.syrjala@linux.intel.com>
 <2edf584b-3835-53ed-f6e3-76c7e8d581ed@linux.intel.com>
 <CAKMK7uFTYgK9rmXTNSczPdBWPTNaLBp-GitzBQb0-gX5wZWHNQ@mail.gmail.com>
 <CAKMK7uFjgu_TkPFYs0DTdAh9tdDbdpUc0S1n5XUfHJaq_0FHVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFjgu_TkPFYs0DTdAh9tdDbdpUc0S1n5XUfHJaq_0FHVw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Fix -EDEADLK handling
 regression
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
 stable <stable@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 09:59:18PM +0200, Daniel Vetter wrote:
> On Tue, Jul 13, 2021 at 9:58 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jul 1, 2021 at 9:07 AM Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com> wrote:
> > > Op 30-06-2021 om 18:44 schreef Ville Syrjala:
> > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > >
> > > > The conversion to ww mutexes failed to address the fence code which
> > > > already returns -EDEADLK when we run out of fences. Ww mutexes on
> > > > the other hand treat -EDEADLK as an internal errno value indicating
> > > > a need to restart the operation due to a deadlock. So now when the
> > > > fence code returns -EDEADLK the higher level code erroneously
> > > > restarts everything instead of returning the error to userspace
> > > > as is expected.
> > > >
> > > > To remedy this let's switch the fence code to use a different errno
> > > > value for this. -ENOBUFS seems like a semi-reasonable unique choice.
> > > > Apart from igt the only user of this I could find is sna, and even
> > > > there all we do is dump the current fence registers from debugfs
> > > > into the X server log. So no user visible functionality is affected.
> > > > If we really cared about preserving this we could of course convert
> > > > back to -EDEADLK higher up, but doesn't seem like that's worth
> > > > the hassle here.
> > > >
> > > > Not quite sure which commit specifically broke this, but I'll
> > > > just attribute it to the general gem ww mutex work.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > Testcase: igt/gem_pread/exhaustion
> > > > Testcase: igt/gem_pwrite/basic-exhaustion
> > > > Testcase: igt/gem_fenced_exec_thrash/too-many-fences
> > > > Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_=
ww_ctx locking, v2.")
> > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers=
/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > > > index cac7f3f44642..f8948de72036 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > > > @@ -348,7 +348,7 @@ static struct i915_fence_reg *fence_find(struct=
 i915_ggtt *ggtt)
> > > >       if (intel_has_pending_fb_unpin(ggtt->vm.i915))
> > > >               return ERR_PTR(-EAGAIN);
> > > >
> > > > -     return ERR_PTR(-EDEADLK);
> > > > +     return ERR_PTR(-ENOBUFS);
> > > >  }
> > > >
> > > >  int __i915_vma_pin_fence(struct i915_vma *vma)
> > >
> > > Makes sense..
> > >
> > > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >
> > > Is it a slightly more reent commit? Might probably be the part that c=
onverts execbuffer to use ww locks.
> >
> > - please cc: dri-devel on anything gem/gt related.
> > - this should probably be ENOSPC or something like that for at least a
> > seeming retention of errno consistentcy:
> >
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#recommended-ioct=
l-return-values
> =

> Other option would be to map that back to EDEADLK in the execbuf ioctl
> somewhere, so we retain a distinct errno code.

I'm about to push this patch to drm-intel-fixes... I'm assuming if there's =
any fix it will
be a follow-up patch and not a revert or force push, right?!

> -Daniel
> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
