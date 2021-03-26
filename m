Return-Path: <SRS0=K65z=IY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09D9C433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 14:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 147B8619A3
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 14:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 147B8619A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699976F3E4;
	Fri, 26 Mar 2021 14:13:48 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1E96F3EB
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 14:13:47 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id a8so5794883oic.11
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9rvIar3XG3Cwro/2o/WuA1e6XVFuhifCTuMigmHCAM=;
 b=XLR7muxMvapDl3GkTtIxvva7j0aMYUVtTRarXwH0csCuYCKTdmmhlPWN5mrWnK0qs8
 zGbndCKb8OVZhZaKNeBBE5/jlqugcO3HpdINuGDkf+4Q66wf98lp81X23ureKThrBYe0
 U4lYiqaD3MrQsvdTZWRDI9kHYWCzylvAuK7NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9rvIar3XG3Cwro/2o/WuA1e6XVFuhifCTuMigmHCAM=;
 b=SOR5sSlPpZf7FGgqqrctTEpoRIiZpjubQGRU5VnGw1gp0i4MMQxHI+pWVzqDtivSeg
 HZGmUTG1YeREtaCgyuWCKHrpeKGckaJl/GrEdQL/jw8Sgjmw3A6WMq4r6aAhjgBBTrz8
 5PTKtey6DvoiXUWfmUg1XrGCTKrp+iv2bc0FA5LfNEbqlqsiPddPOKalpRVy+jWzFVyP
 mMHskmAzIkeFOB7qxeTXEFGbDC/HanzELCg4v8opjydBu7zulAZ+J1RHTIT12nKWofcv
 OlMpAvs87F+N683QZemEqDLVEQp/mQrNnCWdrDgyRsCfQFICeMFUU6S/BUN9Sg/k8YEd
 3dLA==
X-Gm-Message-State: AOAM532fjOdvw3ixCRQGCLKd+8TYEj3UghI8HAzS2MEtT6aznX3nVXLL
 q6VgR8PtZjB3IXKAQFUm0/RLSJVBstVngHuVBzBuvg==
X-Google-Smtp-Source: ABdhPJxbqveX0o/R/vt/zoskbt7wYBXF30iz5dTxxFvXaxOn89gn0FNWbXoElEwLaeTx2wQlH7IzCyyMnljB667Af84=
X-Received: by 2002:aca:170a:: with SMTP id j10mr9977535oii.128.1616768026242; 
 Fri, 26 Mar 2021 07:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <YF24MHoOSjpKFEXA@phenom.ffwll.local> <874kgy2g9m.fsf@intel.com>
In-Reply-To: <874kgy2g9m.fsf@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 26 Mar 2021 15:13:35 +0100
Message-ID: <CAKMK7uHG9XYbv5N2CnA6BbGOOFaR4mgpo7HvaTdUGLv5GJ_a5A@mail.gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] topic/i915-gem-next
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 2:31 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 26 Mar 2021, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > The rough plan we discussed somewhat ad-hoc with Jani&Rodrigo (Joonas was
> > out this week, but back next) is that they send out a pull with what's
> > there right now. Then once both this branch here and the -gt-next pull are
> > in drm-next they will backmerge, and the -gt-next tree is open for
> > business again.
>
> I guess worth noting is that drm-intel-gt-next is now rebased on top of
> current drm-next. Since the topic branch is part of drm-tip, I presume
> the conflicts are manageable.

Ah yes the only conflict between i915-gem-next and drm-intel-gt-next
is in a header where 2 function prototypes got changed next to each
another. Otherwise I didn't hit anything, and CI seems to approve of
both drm-tip and dign. So probably about as good as it will get with a
big shuffle like this one here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
