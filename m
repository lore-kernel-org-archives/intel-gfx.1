Return-Path: <SRS0=4MRd=OT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7DEC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 08:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C48D661407
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 08:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C48D661407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8846E9E0;
	Wed, 29 Sep 2021 08:41:19 +0000 (UTC)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB1C6E9E0
 for <intel-gfx@lists.freedesktop.org>; Wed, 29 Sep 2021 08:41:18 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id cv2so1026426qvb.5
 for <intel-gfx@lists.freedesktop.org>; Wed, 29 Sep 2021 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9WnzaOq9/zkqgMhPdsvxfypibXxufy6o2CegxB/kxLQ=;
 b=MPAFtV6qSf3n3+SRsC4xjE4PusQk1/Dv9iDoJCUwwwxt4HaEyoFwoOXizcp54F7G0e
 7Miyz8Oi5qqMjbO/NCkT8CerL9mV6XF+JtxqeCCH08y46xV8DwrikU4Q9HffWK6Y1L56
 7yg++Qf87avVrt+CBSk4qH8waEsM96aSxBFPeN41fMJwMRJNzR0tBQOJWappplKqzW9P
 1giZzQn2bLESYHoHCYKAPpM9Y4Fa5jmEaMhr3l4V1LLzKw+BZHpZtyjzG/kSHflH/wI1
 89yWGBjLHbV9Z8ZIKOv9Wv38taBtwjFyLNDuA/R40Cbx1VJalhTswPFBvq2oZGgyBYU4
 dEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9WnzaOq9/zkqgMhPdsvxfypibXxufy6o2CegxB/kxLQ=;
 b=5bslGW/asNDW+GgePBrvFxKpyyHfgRRn7M0ZWzb3TOjWg/2QSYFlPKUA5PubdBkhFo
 EKEfHeUoq5Fc9qDEInXnHZqOxiwwjrFAmcEnARnJNmGoonj0glNLQlR0i7RQHlu1C0EV
 r/ftzNw5RUlVW+1RlyllNxQbhRloI9imu7bMcpuOuFarI/bpYULmyXjOIyA4k+wYa/yY
 G0fS6wLg6ENaxJrYFlXfAVBa8zEVfC+oJlb0vGgFTpD9vb3K4VSLAbP//kZEFZmj7lGt
 bmxXA1sEg64rpK93tUkcki+CqC+9g8NM3OUn++t/VRSwnrUdjqyOT4X8vBK1j2lUD+GO
 2m5A==
X-Gm-Message-State: AOAM533oHjYwPwFAP1tUY0YktgsFChtPVsHwCBmRobLM/LcdRMvJ4KE3
 UAe3XWAG0MpEc6iHXt7Z1xiMMZPIgwYpLdmXYE8=
X-Google-Smtp-Source: ABdhPJzCxKG++WzJFB+VtwUhp3DYmGc5AbFkNzS/6av7PHNvUrXng97AAgOirBZAxNzmyaVtVYY3rLwkEcBClsXeluQ=
X-Received: by 2002:a0c:cb10:: with SMTP id o16mr10128330qvk.57.1632904877600; 
 Wed, 29 Sep 2021 01:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210830121006.2978297-1-maarten.lankhorst@linux.intel.com>
 <20210830121006.2978297-9-maarten.lankhorst@linux.intel.com>
 <CAM0jSHP7GtkRoDV+avUKyOe6SOce0ZO_2Tzg9p8O7KR9nWk_VQ@mail.gmail.com>
In-Reply-To: <CAM0jSHP7GtkRoDV+avUKyOe6SOce0ZO_2Tzg9p8O7KR9nWk_VQ@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 29 Sep 2021 09:40:49 +0100
Message-ID: <CAM0jSHNQURsnc6yXvZsdJrK_QKDPXEemBps4QgLgMTD1dJupCQ@mail.gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH 08/19] drm/i915: Fix runtime pm handling in
 i915_gem_shrink
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 29 Sept 2021 at 09:37, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Mon, 30 Aug 2021 at 13:10, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
> >
> > We forgot to call intel_runtime_pm_put on error, fix it!
> >
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Fixes: cf41a8f1dc1e ("drm/i915: Finally remove obj->mm.lock.")
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: <stable@vger.kernel.org> # v5.13+
>
> How does the err handling work? gem_shrink is meant to return the
> number of pages reclaimed which is an unsigned long, and yet we are
> also just returning the err here? Fortunately it looks like nothing is
> calling gem_shrinker with an actual ww context, so nothing will hit
> this yet? I think the interface needs to be reworked or something.

Can we just remove the ww context argument, or is that needed for
something in the future?

>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu=
/drm/i915/gem/i915_gem_shrinker.c
> > index e382b7f2353b..5ab136ffdeb2 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> > @@ -118,7 +118,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
> >         intel_wakeref_t wakeref =3D 0;
> >         unsigned long count =3D 0;
> >         unsigned long scanned =3D 0;
> > -       int err;
> > +       int err =3D 0;
> >
> >         /* CHV + VTD workaround use stop_machine(); need to trylock vm-=
>mutex */
> >         bool trylock_vm =3D !ww && intel_vm_no_concurrent_access_wa(i91=
5);
> > @@ -242,12 +242,15 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
> >                 list_splice_tail(&still_in_list, phase->list);
> >                 spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
> >                 if (err)
> > -                       return err;
> > +                       break;
> >         }
> >
> >         if (shrink & I915_SHRINK_BOUND)
> >                 intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> >
> > +       if (err)
> > +               return err;
> > +
> >         if (nr_scanned)
> >                 *nr_scanned +=3D scanned;
> >         return count;
> > --
> > 2.32.0
> >
