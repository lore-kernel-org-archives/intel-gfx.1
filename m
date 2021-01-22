Return-Path: <SRS0=EOwD=GZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC1CC433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 17:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3516523A6A
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 17:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3516523A6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA4C6EA1D;
	Fri, 22 Jan 2021 17:54:45 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D177B6EA1D
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Jan 2021 17:54:43 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id z6so4766311qtn.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Jan 2021 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u5aE87Tjlcx++8b9SOzZbp9/t3BC+7TsGKp4YS/UaAM=;
 b=TC6hgNiw5X8lZ2931ZIEVKa4r4Cxeq3Lyqukzsxhyr4QwlPA2ksuml3n2dykawL30O
 0eH/QIsu2N+XgabDEE36nmOd59et95+luhHDOIXMRPdhfuPxYClmGtlrAMpo2fjShbao
 h8X27o4ggOg+i+B9oVH0kZB7L+Fwe6wCkyK11Lm02A/oJHEBIfIskaXMOMq8Hz2jm76P
 9Iu/NdzqLXXWRndQGskJIIAJJe9agNYyMECgzJKygX3v6vlqOU2ljngfkPSD9jc/SkZy
 tNSdJzjGolvk+py4THdDnKjvPlpYVgkniwGRsFHdvfICJw2+Eu9dBJlZpGsuH2Ok/T6Q
 ofEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5aE87Tjlcx++8b9SOzZbp9/t3BC+7TsGKp4YS/UaAM=;
 b=j0UB7pnvxl/CVqauLmOzmMpaq2G5y6hst8aqMMilu2YDJ9f+5bWEe5IK8vObsE+xtB
 TBX6jRYSLXYHsDZTA+Exk6txJkbkASogJiojdHzUti95ZAYec0G9lyJ8bx3RO50nBWLE
 GiEmi1d/BoL0WJ9XePAGKbaPEdpQshcLH9mkkzOqkskfNeRlu753SdW1aOEcWihDwEIf
 b6p3lPCDjpzWVmp/wvnyRotB5VkZWH9Ql6PCztFEBCLYhrxteMnVeZ35vXLgO0+N9q08
 A7cc1FboSXO/Nxh05IOuk1ZMCE3qE9NVaUIFaTB3RUiW1iWmh6Jp4YNlLu+F0bp9XtBt
 UO6w==
X-Gm-Message-State: AOAM5328X1E1xbvsWFHDtNqWC6YpxVjLHHBMOqLEH8q2z01UF4boNbd8
 ESMYvhSFevyq6G5DhLE/XV4mCJCUotrEvttvAeIUNlIRwxw=
X-Google-Smtp-Source: ABdhPJy2VBN+TCKaUo2pOkVhdPDfik7cBhL/NhSmikpvqgkz7oO85n9i72vHGTT8DPTcACdwrHXFe/gKaHjFQGrMvy4=
X-Received: by 2002:ac8:76d5:: with SMTP id q21mr5288229qtr.341.1611338082901; 
 Fri, 22 Jan 2021 09:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20210122173546.531842-1-matthew.auld@intel.com>
 <20210122173546.531842-2-matthew.auld@intel.com>
 <161133740725.24506.13068861174088432415@build.alporthouse.com>
In-Reply-To: <161133740725.24506.13068861174088432415@build.alporthouse.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 22 Jan 2021 17:54:16 +0000
Message-ID: <CAM0jSHOQjzjCiBfgUEAnM2vcAgWo39BDUah1==JA2BDm5xPPEQ@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: consolidate 2big error
 checking for object sizes
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
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 22 Jan 2021 at 17:43, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Matthew Auld (2021-01-22 17:35:46)
> > Throw it into a simple helper, and throw a warning if we encounter an
> > object which has been initialised with an object size that exceeds our
> > limit of INT_MAX pages.
> >
> > Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c  |  9 +------
> >  drivers/gpu/drm/i915/gem/i915_gem_object.c  |  2 ++
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h  | 26 +++++++++++++++++++++
> >  drivers/gpu/drm/i915/gem/i915_gem_region.c  | 12 +---------
> >  drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 16 +------------
> >  5 files changed, 31 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > index dc11497f830b..5cc8a0b2387f 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > @@ -244,14 +244,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
> >                 }
> >         }
> >
> > -       /*
> > -        * XXX: There is a prevalence of the assumption that we fit the
> > -        * object's page count inside a 32bit _signed_ variable. Let's document
> > -        * this and catch if we ever need to fix it. In the meantime, if you do
> > -        * spot such a local variable, please consider fixing!
> > -        */
> > -
> > -       if (dma_buf->size >> PAGE_SHIFT > INT_MAX)
> > +       if (i915_gem_object_size_2big(dma_buf->size))
> >                 return ERR_PTR(-E2BIG);
> >
> >         /* need to attach */
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > index 70f798405f7f..d3702ea8c6aa 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > @@ -62,6 +62,8 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
> >                           const struct drm_i915_gem_object_ops *ops,
> >                           struct lock_class_key *key)
> >  {
> > +       GEM_CHECK_SIZE_OVERFLOW(obj->base.size);
> > +
> >         __mutex_init(&obj->mm.lock, ops->name ?: "obj->mm.lock", key);
> >
> >         spin_lock_init(&obj->vma.lock);
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > index d0ae834d787a..d9cef56533ca 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -16,6 +16,32 @@
> >  #include "i915_gem_gtt.h"
> >  #include "i915_vma_types.h"
> >
> > +/*
> > + * XXX: There is a prevalence of the assumption that we fit the
> > + * object's page count inside a 32bit _signed_ variable. Let's document
> > + * this and catch if we ever need to fix it. In the meantime, if you do
> > + * spot such a local variable, please consider fixing!
> > + *
> > + * Aside from our own locals (for which we have no excuse!):
> > + * - sg_table embeds unsigned int for num_pages
> > + * - get_user_pages*() mixed ints with longs
> > + */
> > +#define GEM_CHECK_SIZE_OVERFLOW(sz) \
> > +       GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX)
> > +
> > +static inline bool i915_gem_object_size_2big(u64 size)
> > +{
> > +       struct drm_i915_gem_object *obj;
> > +
> > +       if (size >> PAGE_SHIFT > INT_MAX)
> > +               return true;
>
> Macro here^
>
> Make it easy to grep, everybody gets a warning as a reminder to fix it.
> And a prize to whoever does manage to trigger the warning.

But this code is user triggable, like with igt("create-massive")? What
am I missing?


>
> > +
> > +       if (overflows_type(size, obj->base.size))
> > +               return true;
> > +
> > +       return false;
> > +}
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
