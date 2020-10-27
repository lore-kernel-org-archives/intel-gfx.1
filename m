Return-Path: <SRS0=9UyP=EC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117FDC55178
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 19:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C0221527
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 19:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ITgfknbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63C0221527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C488D6EC28;
	Tue, 27 Oct 2020 19:01:28 +0000 (UTC)
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FADE6EC20
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Oct 2020 19:01:27 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id m128so2380711oig.7
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Oct 2020 12:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/ppSbcOSIkyb0WLxSLtuLH+l8WQbDgVdPBCEGLhzkg=;
 b=ITgfknbVMZfp35lpmLI31j4Nz1iCLqIjRADmmwWUK5/lEwTGJCtZuIg7KxFWy7ItTQ
 hfI9rUKmuyCzK+NN6zramPdeJQr3T/y85wtC502Wh1aA+EVeb5zEhSA9pSEyllBQ0ubV
 93+c6QQRkdWNThoyRK6g0NvSsnUYPyNsOg5A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/ppSbcOSIkyb0WLxSLtuLH+l8WQbDgVdPBCEGLhzkg=;
 b=NU8ynzewYo4T3D4GBV1g6LvXHTg+nCONiQywDZbc1kSjEYqiF6RmSDYoyS1xRy9meY
 E3YhXek8spsJeWpR+aA4PMtf1qycTurk2KHiwkX7Cdh/ISoeQmkuOVeDCYbnEr288teZ
 7rpPRPulGtYiOQaHH1JKhE1z5yS0mSpn/jgrrAZKGGmvelMRnw3qfhx2T3sVjq0IUzpR
 0i2Iyi7UeESPKPbfqNRLWhYe9W8jpXyCRM6v9Yh4yY3A45d83q3LxMmwqPAlbuHxisyn
 uk18JlrPHPylKLKlHbmr+29cFPHc5/JHJKvw5q7vIrRgdYJUVJ0l9WQ+LZ3hFZuHBMGU
 wi+Q==
X-Gm-Message-State: AOAM5338y+4SlhBSi3i8YnsFZ5JzmZTSd7ilOjv3SNPHRcyRvkaGVeSO
 cozqvrZ/qe9tAo5/lMxBRyZSvTBFZAbrR25hibo0tw==
X-Google-Smtp-Source: ABdhPJwHcWbTJCbJ7AAyjVib0AGCCVAs4xDrwxrSwOfpPtT8albuTTgqSli8X5JVplvyhTsqPY2DxlaYLA/ZcsBiLvA=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr2530848oia.14.1603825286633; 
 Tue, 27 Oct 2020 12:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-3-daniel.vetter@ffwll.ch>
 <20201027185100.GD12824@infradead.org>
In-Reply-To: <20201027185100.GD12824@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 27 Oct 2020 20:01:15 +0100
Message-ID: <CAKMK7uERSRmJ+E03SWsXcjVEbg24pzbVcXf7dpCvcR1JvnTcnA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [Intel-gfx] [PATCH 03/65] mm: Track mmu notifiers in
 fs_reclaim_acquire/release
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Chinner <david@fromorbit.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian K??nig <christian.koenig@amd.com>, linux-xfs@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Qian Cai <cai@lca.pw>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 7:51 PM Christoph Hellwig <hch@infradead.org> wrote:
> Is there a list that has the cover letter and the whole series?
> I've only found fragments (and mostly the same fragments) while
> wading through my backlog in various list folders..

Typoed git send-email command that I only caught half-way through. I
tried to reply with apologies in a few spots, I guess I didn't cover
all the lists this spams :-/

The patch itself is still somewhere on my todo to respin, I want to
pep it up with some testcases since previous version was kinda badly
broken. Just didn't get around to that yet.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
