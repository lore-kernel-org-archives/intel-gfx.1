Return-Path: <SRS0=cAZQ=JJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DE5C433B4
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 16:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106E361287
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Apr 2021 16:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 106E361287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BF789CC1;
	Mon, 12 Apr 2021 16:08:51 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E364389BFB;
 Mon, 12 Apr 2021 16:08:49 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id 1so10344611qtb.0;
 Mon, 12 Apr 2021 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JbYNMRS+ktzm75pxYqWoH7wWCySLqascnjXSwrvkK90=;
 b=otrTypzl/TAd5wxF+NHFsNOgXn8xXQsSOWRAcNc4OIqLJ1TS49tKJ0sHNsSdKPJs03
 NM+y0n5rOAu6FuN3mJc+0ywPoYjfHOI60f75nEgN/ONjzflr6cYpb8hWfQq5rBbHsJgP
 JVPziOd+/gOE96Yck09WyV4gGy4KOcBgDfP2matHoveaRNJMs5PsedBEwkogr1/nEbj9
 cppxvvn3SeZFBU8lCKtbbM8Sc2Gc932ZSjAAfhxgWtS9smwYS9PuKdG41dcWOX9+DRze
 UZQKhlKJ2AbJfI9XyOPiCLqHhENuPZhCp/Ts0voeSBQgi7nzhBG4jjaIjgHTCdqF+Wqj
 uJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JbYNMRS+ktzm75pxYqWoH7wWCySLqascnjXSwrvkK90=;
 b=r6yjsmOvbe1E20HwyCVxW5pyFEF12IZH9nkcAweGPDwKHVvR+b79l1QXFZ4DGQEWwH
 TvH4um3570Df+eHWMaThA0U6OfH1QhPBsfzfj12RWbt3uGmM77QgBu1r5O+7B5n3FFNY
 FAwM/mQeuwFsxY/k3hAuwX30aedhQhii/rcq1i+OWYMGrte5LfJ+ok5DCoth++IF9xxi
 5hCkyhB7crw+ab3loX2IUCX/Q5NlOKBIYxxHtDuLqx6n/qLoi/FwSt+hGIzGV2KUxpLd
 ONzQZ0GU4+uRu6uA3LXwD3q5OADpJD/T6/O3ImqewIhvJ9i3os4v4HGdz2X5xSm6YqlY
 Cxzw==
X-Gm-Message-State: AOAM533EpW1ZZDm86qId+M+HHNiQzT3ZSq2mVjBdkK2Rwov3FJBTmnKi
 09/9IC4pNapi02OyucI43PtoJIam8G017GSEnlrO4Qkzl2w=
X-Google-Smtp-Source: ABdhPJy8iqOPHdLHl8HLjHO1DZUhJkX0DJiNI4iXHMxaMnZWjdJCGLpJTkoWAm3BuIGcuoT2WlT0Y6BTX2PxkTRHoAU=
X-Received: by 2002:a05:622a:c:: with SMTP id
 x12mr14768997qtw.95.1618243728956; 
 Mon, 12 Apr 2021 09:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-19-matthew.auld@intel.com>
 <YHRkixaDBaf5cgkJ@phenom.ffwll.local>
In-Reply-To: <YHRkixaDBaf5cgkJ@phenom.ffwll.local>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 12 Apr 2021 17:08:22 +0100
Message-ID: <CAM0jSHM_1V6OSZhuuaaAMmHi4BTiZ7Hbo99i2b=RzFFBMuYJ_A@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 18/19] drm/i915/gtt: map the PD up front
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021 at 16:17, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Apr 12, 2021 at 10:05:25AM +0100, Matthew Auld wrote:
> > We need to general our accessor for the page directories and tables from
> > using the simple kmap_atomic to support local memory, and this setup
> > must be done on acquisition of the backing storage prior to entering
> > fence execution contexts. Here we replace the kmap with the object
> > maping code that for simple single page shmemfs object will return a
> > plain kmap, that is then kept for the lifetime of the page directory.
> >
> > v2: (Thomas) Rebase on dma_resv and obj->mm.lock removal.
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>
> So I wanted to understand what px stands for as an abbreviation, and dug
> all the way down to this:
>
> commit 567047be2a7ede082d29f45524c287b87bd75e53
> Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Date:   Thu Jun 25 18:35:12 2015 +0300
>
>     drm/i915/gtt: Use macros to access dma mapped pages
>
> I still have no idea what it means, I guess px = page. But I also
> committed this, so I guess can blame myself :-)
>
> But while digging I've stumbled over this here
>
> commit 6eebfe8a10a62139d681e2f1af1386252742278b
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Fri Jul 12 08:58:18 2019 +0100
>
>     drm/i915/gtt: Use shallow dma pages for scratch
>
>
> And that's some serious wtf. Yes we've done some compile-time type
> casting automagic between i915_priv and dev in the past, and I think even
> that was bad taste. But it was justified with that we have these
> everywhere (especially in the mmio macros), and it would be a terrible
> flag day.
>
> But I'm not seeing any need for auto-casting for these pages here, and I'm
> not aware that we're doing this anywhere else in kernel code. There is
> some macro-trickery in lockdep annotations, but that relies on the lockdep
> map having the same struct member name in all lock types, and is not
> exposed to drivers at all.
>
> Am I missing something, or why do we have this compile-time type casting
> stuff going on in i915 page accessors?

I think 'x' in the px family of macros/functions is meant in the
variable/polymorphic sense, so it can potentially be a pt, pd, etc
underneath. If you look at px_base() for example all it does is fish
out the base GEM object from the structure, using the
known-at-compile-time-type, which then lets us get at the dma address,
vaddr etc.

It does seem pretty magical, but seems ok to me, if it means less typing?
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
