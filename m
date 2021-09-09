Return-Path: <SRS0=8Ejf=N7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F4CC433EF
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Sep 2021 09:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69AD9611BD
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Sep 2021 09:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69AD9611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564226E4AE;
	Thu,  9 Sep 2021 09:30:32 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05076E4AD
 for <intel-gfx@lists.freedesktop.org>; Thu,  9 Sep 2021 09:30:30 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso1705733otp.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 09 Sep 2021 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HyTvdEtvMHCy3i+iJsuNK6e4KCvehexihd3e0SyvZrA=;
 b=CuNeXUaurxTS911YZW4ZLpnSDAfHIcrr+Z5U+fqAJYLB3LfSU2D0ghllHs0yZ67PO4
 c/5Av40Rtq8TD9WXUWi38k3orOpEtqSIXJvShoy0izKbCynrCaT3sCwx5l0gag/QSx6l
 OeG4J4rtweLrnp48AxyLyH8cjWjGogljwtm58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HyTvdEtvMHCy3i+iJsuNK6e4KCvehexihd3e0SyvZrA=;
 b=GTuVpe5ZIYhE8oZ5CnccRQ0SChhacwWnCMjWzwHl4A3EaUTrA+TruV6fzyj0Yi4BZO
 LdndQq6qQU2+cSUp/GRlEuCL33F7qCBqMMDlPxEpvMSc8LoLBIqV8wX2GFSWh72yaiFt
 fNFqpMR41x+Hk0GoWru7NlgDNoUCkCZ3IdIuvBz/bdFtaTwuIECOgRMmrIpWjB/cm0Gj
 KhH3W2PTg/RZ3dsfkUsFO+9/fUep74EwseXu/ddaX6GvUmsO950us4Hih3aqJgzbr/H7
 2ZslW4y7MAUp//hUe60Bh1oVqSJaEje/np1M/yEHtNiN3Dm71nMCtGfhREYyb237MDbM
 vMLQ==
X-Gm-Message-State: AOAM532TwSe0EJ+mVCL1l1QxbOfbNI+p2A6Qqti6mnuu4cO/UYrm2rtZ
 tsz2sv6dXiLVbQ+gRqGeKI59jranvqoiU7rufV//qA==
X-Google-Smtp-Source: ABdhPJx8OirD7VgZmCvxgYPcCHfvaqud10yIrW+nrCdyA8OyLaI1U+5LkucAIjOg+is0i9alsRMeCPWibvuHMYNxsxw=
X-Received: by 2002:a9d:724a:: with SMTP id a10mr1552762otk.323.1631179829620; 
 Thu, 09 Sep 2021 02:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <YTj2Y0MKu51CZdbW@linux-uq9g.fritz.box>
 <CAPM=9twpHCGLh3nYeTF69woSFWpuWUT+Zk48YyOX3zzNLFLw+g@mail.gmail.com>
In-Reply-To: <CAPM=9twpHCGLh3nYeTF69woSFWpuWUT+Zk48YyOX3zzNLFLw+g@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 9 Sep 2021 11:30:18 +0200
Message-ID: <CAKMK7uEZv_YztMn5j0TWsakrRNdXk_ST3SUJRc_SVy08-THHSQ@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PULL] drm-misc-fixes
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

On Thu, Sep 9, 2021 at 5:35 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 9 Sept 2021 at 03:44, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi Dave and Daniel,
> >
> > here's this week's PR for drm-misc-fixes. One patch is a potential deadlock
> > in TTM, the other enables an additional plane in kmb. I'm slightly unhappy
> > that the latter one ended up in -fixes as it's not a bugfix AFAICT.
>
> To avoid messy merge window, I'm not pulling this until after rc1
> unless there is some major reason?

Christian misplaced a ttm fix, so we really want this. Maybe
cherry-pick to drm-next and then drm-misc-fixes gets rebased instead.

And yeah I dunno what do with our conflicts around merge window, maybe
we're letting trees diverge a bit too much.
-Daniel

>
> the current drm-next doesn't have v5.14 in it, and the merge is rather
> ugly right now.
>
> (maybe I should always pull it in before sending to Linus to avoid
> this in future).
>
> Dave.



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
