Return-Path: <SRS0=Nr63=CR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E850C433E2
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2020 14:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE74F22527
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2020 14:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tcd-ie.20150623.gappssmtp.com header.i=@tcd-ie.20150623.gappssmtp.com header.b="GgswrjSO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE74F22527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tcd.ie
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8636E843;
	Tue,  8 Sep 2020 14:23:56 +0000 (UTC)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A3C89C54
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2020 20:19:01 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id m17so14885929ioo.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 07 Sep 2020 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V6SpnhZsf85q4UgRCG3Vo1DStgFyYS4tfVeyEumkN/w=;
 b=GgswrjSOmPdUZ/BwDCdcWalN4y5WoQPbMec/SdCWEVJcYKNu64D9s8oHItvqe5USmk
 9DzBKzjfZOYqkrFvd6uDgVBqFvLBcAp47ZAw2Gj9EBRXq4IYQ8JUK1GLjOo/E7oSVx/O
 VKNWeMREdjMFPxlkxzHpkQGznhdwAw2yq006+gGaYPeW7M8JmCFrH1Ja3sTOnkVYMYMl
 oJJ5Hxuz82AiRLoFxOJuRTyoERq0vzrpvKHe4mhB/oAwd4qJyrGo/Ie4XZrMjCFsb+Gz
 +YX46uxsLhKyjMfnYvlZ7dlL4eBmh2LnQCxNxzzQSAZANFCzqDmoNh71XxL/lx44mEYD
 XfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6SpnhZsf85q4UgRCG3Vo1DStgFyYS4tfVeyEumkN/w=;
 b=n0AZhneUuf2Ez9Ry5BMh4iccZaVFPpciB1N3+un80dyp82PZDbH0RyQbz3uk/meP1M
 61NgbD/hWdalI9yQt5yWh7enFQ0mR+o6gXRzikdLNVjcYcorhHgSz6Ujl7rMwAeNDSPY
 bz5lx34FuVSpmcvDAZTUmsWkXhGPrgWSTsNUK5UIPGOqNOj8hr3T0wLkluKkkoiQj92i
 ZqRqTIldubtRbwCTZOX+MmQwSZH+M7z2ZUuFbNljuL0Sr99W4+r7ycENqcTpoRn85ynA
 XXLYj6YwJVYUfDdN66u1f60rpLLNjoWOkq5ozqv1B/3TUnFFCYlpmi+dW69/QGhefmhV
 5lqQ==
X-Gm-Message-State: AOAM533HIp2k81Ti3ZKwfD6/0VKf4fJuhKhwr7bh/9NyObUO9jTxU+O4
 ThHOly58LKuAREcMG7jiFJgGw7/ls1wnYyWH08J/Og==
X-Google-Smtp-Source: ABdhPJzwhdIL/3axB52LwFoeoHQzxXf0VSwxulEuEKbcmU9BKXPq4QXupZG6DlbYmrUcNskmfspcKM2Ls6KufI/R4cc=
X-Received: by 2002:a02:4b07:: with SMTP id q7mr6204438jaa.84.1599509940899;
 Mon, 07 Sep 2020 13:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-6-murphyt7@tcd.ie>
 <20200907070035.GA25114@infradead.org>
In-Reply-To: <20200907070035.GA25114@infradead.org>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Mon, 7 Sep 2020 21:18:50 +0100
Message-ID: <CALQxJute8_y=JsW4UV1awSccOjxT_1OyPdymq=R_PurVQzENeQ@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Approved-At: Tue, 08 Sep 2020 14:23:54 +0000
Subject: Re: [Intel-gfx] [PATCH V2 5/5] DO NOT MERGE: iommu: disable list
 appending in dma-iommu
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
Cc: intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 7 Sep 2020 at 08:00, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Sep 03, 2020 at 09:18:37PM +0100, Tom Murphy wrote:
> > Disable combining sg segments in the dma-iommu api.
> > Combining the sg segments exposes a bug in the intel i915 driver which
> > causes visual artifacts and the screen to freeze. This is most likely
> > because of how the i915 handles the returned list. It probably doesn't
> > respect the returned value specifying the number of elements in the list
> > and instead depends on the previous behaviour of the intel iommu driver
> > which would return the same number of elements in the output list as in
> > the input list.
>
> So what is the state of addressing this properly in i915?  IF we can't

I think this is the latest on addressing this issue:
https://patchwork.kernel.org/cover/11306999/

tl;dr: some people seem to be looking at it but I'm not sure if it's
being actively worked on

> get it done ASAP I wonder if we need a runtime quirk to disable
> merging instead of blocking this conversion..

Yeah we talked about passing an attr to map_sg to disable merging at
the following microconfernce:
https://linuxplumbersconf.org/event/7/contributions/846/
As far as I can remember everyone seemed happy with that solution. I
won't be working on this though as I don't have any more time to
dedicate to this. It seems Lu Baolu will take over this.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
