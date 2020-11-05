Return-Path: <SRS0=eU4y=EL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B9DC4741F
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 16:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC0920786
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 16:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdbUoSJ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEC0920786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325126EB5B;
	Thu,  5 Nov 2020 16:03:07 +0000 (UTC)
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442B06EB5B
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Nov 2020 16:03:06 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id h26so649967uan.10
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Nov 2020 08:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iH3csmwHS1qbgABZNFjlBcAXNLBxhLKOXICvl5E/WGU=;
 b=CdbUoSJ4owDpQL64C30974C7uGAxvLnJYrR1TS8H3RER0vvt3W3nnOxdPfnX25tK3V
 iV9iSBrljdiJPtKqX3+q2JvEnxWNew9s8DT7iSK0ol4YG3sEDs2Pn1tjPrVy1mn0FW6q
 c4xMHvklvqdqgzs8Bkyfh10AwsOujcA2qk87kKse2w7aM+t6N01WaQqqhQBVURUDDNSK
 UQufonwvJPXoeLewyqelgd5Vbet47qS+9l4rijKLKwIrxe7767NX56TClWdN69CjKMcs
 KrhWWHa7A2mJeIJlVXEi+pVCzFWAMyqQ9mTeo5vk6TWwUGHoebqSulai8xBxQuqAius8
 EWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iH3csmwHS1qbgABZNFjlBcAXNLBxhLKOXICvl5E/WGU=;
 b=s4pIOv0aBdRoBe/R8NYeDKMBlTgWajU+zRt28OokajWIUBIdZcEyeiJs494KUQDyG3
 t65hsJL8gtPoBe1reFh4FSopzOuBvr7iyo1jhcXgE8E0MzhzpDePZD+yGNfFh4X7IWNw
 eej7j1bSYzFqP7R/8/H/Cwn1XPSd6xxIx22rBIeQ5LCE4IzivD3bafQdDaxRz0fnoDk/
 VkHfr68bh7OonDbsfpk88IF+pZgWOG2IL33fwUUzloc7aaLae6NcOK7BXkwklpGFyki7
 H+kBW2qwjpmth9YCHSd7/dJ8oTZ50XdKsdCuKGWJu4HaQclGy7h68XBlfHL7au/sbrxi
 hs1g==
X-Gm-Message-State: AOAM532ue4Aen1LN8CV4fISyIZ3v/yGOhmjUPTuk1xKuX5lwgzuxhMWY
 YHMzNaRnNoWSNMJsBRwvW1XecpRYFbMaTtBhUeY=
X-Google-Smtp-Source: ABdhPJylEfn4EW8Qd3kBvhCVjt8iyIRKY/HA/ziwanO+EMXdL8hTkaB147y6gbmZ3pUkymvnNubUYxx7/O8CMCV/yNE=
X-Received: by 2002:a9f:2f15:: with SMTP id x21mr1549304uaj.104.1604592185431; 
 Thu, 05 Nov 2020 08:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20201105101134.19716-1-chris@chris-wilson.co.uk>
 <20201105101134.19716-2-chris@chris-wilson.co.uk>
 <CAM0jSHOKQX3GU3UNf=LydCPYCXaL4BXecTC5M_7qSwj3hBVmEw@mail.gmail.com>
 <CAM0jSHPLnY4zoAPLav0W5-g18=dJi8XcUud6xww2O6-kE+BOfQ@mail.gmail.com>
 <160459112079.19889.15043622583499008479@build.alporthouse.com>
In-Reply-To: <160459112079.19889.15043622583499008479@build.alporthouse.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 5 Nov 2020 16:02:38 +0000
Message-ID: <CAM0jSHPOLeNPfuibTd52Sn=W++QYBCPAix543Dtj6Su7LB_Qxg@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 02/22] drm/i915/gem: Pull phys pread/pwrite
 implementations to the backend
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 5 Nov 2020 at 15:45, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Matthew Auld (2020-11-05 15:40:20)
> > On Thu, 5 Nov 2020 at 15:39, Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> > >
> > > On Thu, 5 Nov 2020 at 10:11, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > >
> > > > More the specialised interation with the physical GEM object from the
> > >
> > > Move                           interaction
> > >
> > > > pread/pwrite ioctl handler into the phys backend.
> > > >
> > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >
> > Does  this need  Fixes btw?
>
> I was thinking so long as we land before dg1 it would be fine. If we did
> a fake lmem with no aperture, we would have problems already. But there's
> no user exposure, so no pressing need for cc:stable.

I was thinking we could maybe be evil and achieve the same thing with
existing userspace, just requires the use of gtt_mmap to steal all of
the mappable aperture at the opportune time, such that
insert_mappable_node() still returns -ENOSPC? Or maybe I am
misunderstanding something.

> -Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
