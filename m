Return-Path: <SRS0=YfZL=DI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FF6C4727C
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 14:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D1420B1F
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2020 14:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="HOsJWxDx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D1420B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E356E15A;
	Thu,  1 Oct 2020 14:13:54 +0000 (UTC)
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C307A6E15A
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Oct 2020 14:13:53 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id k13so1503447oor.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 01 Oct 2020 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=us8thQANzunB8liJvtH1u9KjYvMWBCN/6ee+Pda/bWA=;
 b=HOsJWxDxB4xVjDfa1aZ5JJBMlRAfvVPFyyu2Rh+RQ2NPZaSZofBx1uadVQmfF+1xHE
 01o0lELbi++17LNc25VmGKUpiJmoJKu0Q67QKXYMG3vp5iZ34cn9XKsV4Vpfa3wk0h8a
 XkCxyWk1iGK/n7KrvdNWIv3phDHesCb4MRubs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=us8thQANzunB8liJvtH1u9KjYvMWBCN/6ee+Pda/bWA=;
 b=AEDGZ5wMXqn7OFSpE75PLPgula1IgoP/vM9NiaQHJFqMfdu7jEWk0xUEf9m+s9SDPn
 LXolQxqM1FRAzYLWZwZMDudInGS13MhIPPT6wIpM+VQNeRds1rOzfCPtvjH30wUzBxwU
 GupHPS3v/JtLO0c7CSL5CVR8bRnlLzlXoEovr+RNWFHcxHxuxFhOEOFufdxKR7AvZxzW
 CB0r4hFK7E8fcSqMtzH7PZiXRVhK+nHbjLX6Wg2+K2gWIMEbr7KrfchgytnzShqt4Fa9
 0FjaTXdnjBUPdWXgRCYpw7MnHXdN6xagXQdgd7HnJQ8hFLyQhExuhEMvZRx5Blu3aBlB
 ypCw==
X-Gm-Message-State: AOAM530fNFAUIhXBv6i8fSUHTGpwCZa71VU4wKT/sgDH/Ow+303rYxtb
 ZAGEVzy14RD5ZFQiE014masLhXGSblvdrKXoKW+tZ0I6SHfGNQ==
X-Google-Smtp-Source: ABdhPJy+Qa1QnyOeGpgz2tEALV5zV/r+Mw/i+fe/ScEgQVuLKXLkdkccDTrTDmW6x67TiI0MqOdlBgeDXl3v04GVz3k=
X-Received: by 2002:a4a:344b:: with SMTP id n11mr5774966oof.89.1601561633049; 
 Thu, 01 Oct 2020 07:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201001203917.43d46a3d@canb.auug.org.au>
 <20201001135350.GA14869@lst.de>
In-Reply-To: <20201001135350.GA14869@lst.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 1 Oct 2020 16:13:42 +0200
Message-ID: <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [Intel-gfx] linux-next: manual merge of the akpm tree with the
 drm-intel tree
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 3:53 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the akpm tree got a conflict in:
> >
> >   drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >
> > between commit:
> >
> >   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
> >   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")

Uh these patches shouldn't be in linux-next because they're for 5.11,
not the 5.10 merge window that will open soon. Joonas?

> > from the drm-intel tree and patch:
> >
> >   "drm/i915: use vmap in i915_gem_object_map"
> >
> > from the akpm tree.
> >
> > I fixed it up (I just dropped the changes in the former commits) and
>
> Sigh.  The solution is a bit more complicated, but I just redid my
> patches to not depend on the above ones.  I can revert back to the old
> version, though.  Andrew, let me know what works for you.

Imo ignore, rebasing onto linux-next without those intel patches was
the right thing for the 5.10 merge window.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
