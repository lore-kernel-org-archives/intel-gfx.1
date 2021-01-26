Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5ABC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 11:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408FA2076D
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 11:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 408FA2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FAF6E5A2;
	Wed, 27 Jan 2021 11:31:00 +0000 (UTC)
Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F89D6E086;
 Tue, 26 Jan 2021 18:40:54 +0000 (UTC)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-03.nifty.com
 with ESMTP id 10QIaY8c024560; Wed, 27 Jan 2021 03:36:34 +0900
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 10QIaGOI019338;
 Wed, 27 Jan 2021 03:36:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10QIaGOI019338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611686177;
 bh=jdWLcQFJpvkL7fnNbIXEjnV5zSV4ldy1W6fJJer0SS0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vZ/bW+lTZyrd1ERgU+miNz8+GOlqwTLVOxxzyQasaF86h98Ay6qOjXhWuULGJqKM5
 4z0X+NPL3o3SXxb8sugDW+V96GjyO8LJGIbkTltMuPaaexC7hTuXQymVd9kVXx3xIt
 M59p3RVAhxPGJIbLGtDIMcTEHzCk3AuPUHHNzVXWI4h8HM9cXZOXZD1KbO7F0Xuq+O
 IDejtgYMTP+WsY2imeqglLzgoFd263QtQdDQft8FNDcAwrztsHTgHzlDmNfWkXy7sZ
 gHs/PaHuMLLlXqWAx95l8qKaJof9ym1H10wBL2jg72B+onuMC65bDq1FCmdLPAfw3K
 ZwGcG9UUQ2o+g==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id my11so1677166pjb.1;
 Tue, 26 Jan 2021 10:36:17 -0800 (PST)
X-Gm-Message-State: AOAM530y/VNX0ulL2nSgXDwXaBKUQwmsiWlOliMGxCAeSjVMlV2HmWsD
 jhxonCPu4JP4g732c0tA3IasLOJqOvqy7mb4FIE=
X-Google-Smtp-Source: ABdhPJzm8VWDgbWt/Qh9yT3e9UPSeoJupJWOrfVdaMJGhEFCxF7zQGgkjL8RLxx7C1vvctvqdHBbnBzSIJslbdB9RU8=
X-Received: by 2002:a17:902:a5c5:b029:de:30b0:f1d with SMTP id
 t5-20020a170902a5c5b02900de30b00f1dmr7207458plq.1.1611686176307; Tue, 26 Jan
 2021 10:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20210120062351.3011786-1-masahiroy@kernel.org>
 <20210120213929.GA875847@robh.at.kernel.org>
In-Reply-To: <20210120213929.GA875847@robh.at.kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 27 Jan 2021 03:35:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQe9Vq4KEZJwqL=3etTedGVnieKA5vyVoXFr7-a03Nwgg@mail.gmail.com>
Message-ID: <CAK7LNAQe9Vq4KEZJwqL=3etTedGVnieKA5vyVoXFr7-a03Nwgg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Wed, 27 Jan 2021 11:30:59 +0000
Subject: Re: [Intel-gfx] [PATCH] kbuild: use always-y instead of extra-y
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
Cc: DTML <devicetree@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Jan Kiszka <jan.kiszka@siemens.com>,
 intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kbingham@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 6:39 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jan 20, 2021 at 03:23:51PM +0900, Masahiro Yamada wrote:
> > As commit d0e628cd817f ("kbuild: doc: clarify the difference between
> > extra-y and always-y") explained, extra-y should be used for listing
> > the prerequsites of vmlinux. always-y is a better fix here.
>
> prerequisites

Thanks.

I fixed it up, and applied to linux-kbuild.



> Glad to see this clarified. I think just tried both and picked one.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Documentation/devicetree/bindings/Makefile |  8 ++++----
> >  drivers/gpu/drm/i915/Makefile              |  2 +-
> >  scripts/Makefile.lib                       | 10 +++++-----
> >  scripts/gdb/linux/Makefile                 |  2 +-
> >  4 files changed, 11 insertions(+), 11 deletions(-)



-- 
Best Regards
Masahiro Yamada
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
