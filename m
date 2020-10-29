Return-Path: <SRS0=ieU+=EE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8722FC2D0A3
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2020 18:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB8220732
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2020 18:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ItU1Zh6q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB8220732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806F06E8E6;
	Thu, 29 Oct 2020 18:29:21 +0000 (UTC)
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B3F6E5BD
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 18:29:19 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id z23so4048166oic.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2YEGmPn010/vYMzaj6qRl5Hb5QiGFxgfF70S5pCjqaY=;
 b=ItU1Zh6quO/xvOa9yeUVcquY8rNqFT4c8e16+gHeYtcTTXV9yrudTazA4XqcAfWN85
 YUWJwwfawV67EBgdMj4rDHcK96x40SW8efsBxtvZdf8+7keGbx0vtS21caLbhPQW1LZY
 SxyTr2MM/VCSHR0KPPEgcb2Dh9U6nuF9kye4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YEGmPn010/vYMzaj6qRl5Hb5QiGFxgfF70S5pCjqaY=;
 b=gOtqDiuwYCmALjXIztWxtyi+j2gidirKaLmmzbExUpsaiYxpvJXXD2rpFNKF4wla95
 Tk4jfZ/Jb6OZORWexKIwU1B8Qu0bYTGt7DR+ro5hLeggp814WRcv+gXGJa235UiWkyUW
 M1JV5q3i72WAFGpXYFlLTgv7+Rc+tsVRWRVSwBi/J4e+Je665bC9aAUp672HZ1p6TAC/
 v2kiP2txQWVmtk65opLmZxiUZfwGogqGJ4y7M7y4boahZ42X6Nuf/pPDcsvqVdwn0kVv
 a7KWH6JyWojrXsYJKDr3NkYD3ubkKg/0HWl5bZu4HWLHJGjpTI1Sz+Q2oDBJPPRSoLFM
 QZcQ==
X-Gm-Message-State: AOAM533oQhmr8rMvO3yO4NyfR4QWc+HlGPbyft4Db+CO8Udn4dtH+xBl
 L0ytBfavy4hoxpVRrwNnubTTDJ55b1ECqU7nX2Y9DA==
X-Google-Smtp-Source: ABdhPJwMiaK/OUQkOqAwQzOpjSCGtNHgDhNxU2kvsMq/i6XOi2Z1vePWduXqumwr62trT7Fxf0JQRzArR3ej7dhJukU=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr395026oia.14.1603996159293; 
 Thu, 29 Oct 2020 11:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-44733fccd781+13d-rm_scatterlist_max_jgg@nvidia.com>
 <20201028194911.GY401619@phenom.ffwll.local>
 <20201029182040.GB2620339@nvidia.com>
In-Reply-To: <20201029182040.GB2620339@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Oct 2020 19:29:07 +0100
Message-ID: <CAKMK7uESaX+ZrSpT2Yay_0OPGjpJpEm1vDMaQVVeczh7jaWECQ@mail.gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [Intel-gfx] [PATCH] drm: Remove SCATTERLIST_MAX_SEGMENT
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 Roland Scheidegger <sroland@vmware.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qian Cai <cai@lca.pw>,
 Christoph Hellwig <hch@lst.de>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 7:20 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Oct 28, 2020 at 08:49:11PM +0100, Daniel Vetter wrote:
> > On Wed, Oct 28, 2020 at 04:15:26PM -0300, Jason Gunthorpe wrote:
> > > Since commit 9a40401cfa13 ("lib/scatterlist: Do not limit max_segment to
> > > PAGE_ALIGNED values") the max_segment input to sg_alloc_table_from_pages()
> > > does not have to be any special value. The new algorithm will always
> > > create something less than what the user provides. Thus eliminate this
> > > confusing constant.
> > >
> > > - vmwgfx should use the HW capability, not mix in the OS page size for
> > >   calling dma_set_max_seg_size()
> > >
> > > - i915 uses i915_sg_segment_size() both for sg_alloc_table_from_pages
> > >   and for some open coded sgl construction. This doesn't change the value
> > >   since rounddown(size, UINT_MAX) == SCATTERLIST_MAX_SEGMENT
> > >
> > > - drm_prime_pages_to_sg uses it as a default if max_segment is zero,
> > >   UINT_MAX is fine to use directly.
> > >
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Thomas Hellstrom <thellstrom@vmware.com>
> > > Cc: Qian Cai <cai@lca.pw>
> > > Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
> > > Suggested-by: Christoph Hellwig <hch@lst.de>
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >
> > lgtm. Do you want to push this through some other queue, or should I put
> > this into drm trees? Prefer 5.10 or 5.11?
>
> I think DRM tree is best

Ok, I'll try to remember and apply this to -next after -rc2. -rc1 is
supremely busted for us, I want to wait with pulling the merge window
into the -next pile until that's settled. Please ping if your patch
isn't in linux-next within a week in case I forget.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
