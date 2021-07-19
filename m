Return-Path: <SRS0=F6ds=ML=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8711BC12002
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 08:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E05360240
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 08:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E05360240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F786E0BE;
	Mon, 19 Jul 2021 08:13:26 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEE96E0A5;
 Mon, 19 Jul 2021 08:13:25 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id z9so15939392qkg.5;
 Mon, 19 Jul 2021 01:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3vqAe3KxjzT7cwWvnRTQ366qLe+IapQtvR9/glMcwkk=;
 b=tVVgGwalsRjRWsDOvdQlGwbcEBJ1JDqyXiyXJyhhopRUVoyZ3z7y4N8rKB7VO3Jb0y
 uhycFNVOo+i89dQU9TwXgT0wNIxJ56wM27uDiVBtoGh/NIHBmFeLy694uvOLdDMzE5fL
 OFzCY+IbFpemnPCk8QTbkdUtqtPN+CTvgDb7quBaKe8Pf6sX78k+ITNPh5VjO8k22a3A
 eMQOms7ZzFEf9IgWPqjQ2cjvGWcbPYUOCfeDaYDxRQzK8V/H9Dwf8ucOx7i8aUsMxyGV
 gon425Vg9DRoZjTMK2lgKH663VSXFXi2pbSLu9FoeUGT+kqIO5gvKSca0qlGVAuXFSMY
 Os3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3vqAe3KxjzT7cwWvnRTQ366qLe+IapQtvR9/glMcwkk=;
 b=cJzYUhKTRT4yRRphNPkj24+uMeUX7d+9X2O6WtV12JHpqfifsIH6VkWtIP0bahnLxy
 ZzyVaCGslHLXaNdGT8FhBIwZopxfxptxJs/5Gwn+Uae/24MfKbH0F1pTNred3weoZK37
 Xc+PheWKyOpYHrkiPupcd7Y0kgseZpAqdPX3fa7L7gmzBbsLYWVB39x9F5gZTY2lETjy
 XXWXpK5uAhHDI5tPG5MgDGpeEb9Q4XvqYF53y04QcsZ/T4k7/kF1YzuFDy9x4sssgB1x
 Dd4OIVbs8ei3VpeLS9XKZachmgAeBmm7/vFl+YSb1rKY1xZ0N8BToXiw3MFlMqAakbuX
 jDDg==
X-Gm-Message-State: AOAM531IgkR04aPVbgMmheRGFnzKf7LbaHwW1YJqNHvlNLPKoD1kGxK4
 oAcLv1MQZGFQKglwsngfUxEfhSHA5EhbZRxYP8w=
X-Google-Smtp-Source: ABdhPJwWDNZKkfdzXyHGX/CRxUkzWSLZLu0fh+yDRLP6Gt5sIrwGEPGM8K/ee6b10ipBNCBaPCIuEOr+aCfOkq8usKQ=
X-Received: by 2002:a05:620a:1581:: with SMTP id
 d1mr21944415qkk.327.1626682404425; 
 Mon, 19 Jul 2021 01:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-5-jason@jlekstrand.net>
 <CAM0jSHNjG9ozYM1w3-G2LQgajrGCMnFXTjOPhAeDbLRhO4ejZw@mail.gmail.com>
In-Reply-To: <CAM0jSHNjG9ozYM1w3-G2LQgajrGCMnFXTjOPhAeDbLRhO4ejZw@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 19 Jul 2021 09:12:58 +0100
Message-ID: <CAM0jSHMX0+VkybtE3PKOXqMYg9R4FO6WcpmxK+-W0gkS9SFYBg@mail.gmail.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/gem: Unify user object
 creation (v2)
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 20:21, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > Instead of hand-rolling the same three calls in each function, pull them
> > into an i915_gem_object_create_user helper.  Apart from re-ordering of
> > the placements array ENOMEM check, there should be no functional change.
> >
> > v2 (Matthew Auld):
> >  - Add the call to i915_gem_flush_free_objects() from
> >    i915_gem_dumb_create() in a separate patch
> >  - Move i915_gem_object_alloc() below the simple error checks
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Matthew Auld <matthew.auld@intel.com>
>
> If CI is happy,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Might be good to also update the mman selftests to use this new helper.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
