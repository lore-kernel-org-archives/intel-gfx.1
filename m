Return-Path: <SRS0=RAJW=CE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C392C433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 20:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E312078D
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 20:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeJGB+bN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E312078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96546EADF;
	Wed, 26 Aug 2020 20:47:50 +0000 (UTC)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0175F6EADF
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2020 20:47:48 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v8so2974354edl.7
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2020 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJF2r4IwmIZq99VWTXXWIszVLGDt1t4aH8Ksrukp3Co=;
 b=EeJGB+bNo+1YrRyoEXBzcdjN2ZxgpSGWFvAbLtBCq5WtZW3J8zvyYPAzmZh/RXTxif
 Uv3VY2qn8+UNkLd7X7F6GKARcIseUp5rr9YjbdLSiY91xIOTc0Hbi4edChbdrU0b2lJ9
 eHtA2XxVcTv92iCehank84Kkg1b+xtNFYZozTxbHyETLu5DyinT4hM+z8ZNcW5BYDZrC
 7HqAdUZsLOADX/pY4ex7UE1SfDObV1LDrgk6XdXukBHVtQRpwC6frws7d+3B920chJBx
 f74kXDRrlQPRmD9GNZ+7SEJWwZPPJ0daNmK1QTaZLU4n6V8o0dkcK15XvHfaRSeryPk/
 8uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJF2r4IwmIZq99VWTXXWIszVLGDt1t4aH8Ksrukp3Co=;
 b=oXzS0IlN/Op0lLFCaI5pMaGS+6k9RsO8mZZBdLxVGxgJzJPmDAcgv3VfOVdcHkzYA1
 w5IKo8jWx+NIawOSZLClNfn4nDTQrKd1qKSUsGyisEREG+vrfjZ+UOLLA1rMBcMW6a7R
 F730GJWJNrcjnTEjdvmdiA9KBqgQXRT+HSNbvtqr27kYrwCMrdsApLnWa6ECfj7cq9xa
 DkVUpxsHuCzrFlWYU/F8DYs/0VBITDY/vfWxa8R8nK47QLKWGh4edOKzEWo1Ff6llKow
 HKm7hmaLSsSF+whRen99dXNbSXlVcGh33G8qlMKAz5Xq9Yj+i6D6fU+ecMfUjunhXVPw
 SvAw==
X-Gm-Message-State: AOAM530q1ZOV2fWTq3TzXRMciM+E6O1ZdmoimVrt/yJOAXXZsYWxPtJw
 tUFT4Dx6P7XTNOBHTp27dLm56itA13mPSZAZXlI=
X-Google-Smtp-Source: ABdhPJytNY4HIDQTfjuIQjCyQCbpo8gj+Z9E8W5g4rNc8e+pOKq/H91bL6NDsdOkCUIGCKMYd/uG0mWsxx9BnrUq2TU=
X-Received: by 2002:aa7:dbd9:: with SMTP id v25mr11539936edt.78.1598474867612; 
 Wed, 26 Aug 2020 13:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200817161132.GA4711@amd>
 <CAHk-=wh6_eWwvpL=AhOeY0btf_dkpu+0joNzPZWfbBWgAeAhMA@mail.gmail.com>
 <CAPM=9tw8LVWsuA6m_nkUDgm00iz2txYRNZY0b0WWZbyiUVzLEw@mail.gmail.com>
 <CAHk-=wg34bw1ude07nC_XCPOJHZ21-v6117p4574d5S7iP4gxw@mail.gmail.com>
 <20200820092349.GA3792@amd>
 <CAHk-=wjX=ck_u8uvp=PjGCQ3M9igE-yqyRPsJ54th1gQWpwMnA@mail.gmail.com>
 <20200821091900.hzbivycs5ky5d3iw@duo.ucw.cz> <87tuwr59te.fsf@intel.com>
 <7efa547d-b7a4-b873-f1aa-4f19eb849fa3@skogtun.org>
 <CAHk-=wj3WskPCtHncCWLdaP6xVecLp8bDBTT57vyiU-0=Ld6QQ@mail.gmail.com>
 <d4db4a52-3001-cb02-4888-a9dfd55cdd7c@skogtun.org>
 <656b8f9f-d696-c75d-aef6-2b8b5170f2f6@skogtun.org>
 <CAHk-=wiAK=AiqTD47o-BFFZciQXpEC0SiiDnXLWJUcQtCo-Pig@mail.gmail.com>
 <101bff45-0ebd-8fb6-7c99-963aa4fcc588@skogtun.org>
In-Reply-To: <101bff45-0ebd-8fb6-7c99-963aa4fcc588@skogtun.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 27 Aug 2020 06:47:35 +1000
Message-ID: <CAPM=9twLvHu_XLJ89GVXpNo=PHPZLJuRpHggkfzvvuVf+xrwoA@mail.gmail.com>
To: Harald Arnesen <harald@skogtun.org>
Subject: Re: [Intel-gfx] 5.9-rc1: graphics regression moved from -next to
 mainline
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Pavel Machek <pavel@ucw.cz>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 27 Aug 2020 at 06:44, Harald Arnesen <harald@skogtun.org> wrote:
>
> Linus Torvalds [26.08.2020 20:04]:
>
> > On Wed, Aug 26, 2020 at 2:30 AM Harald Arnesen <harald@skogtun.org> wrote:
> >> Somehow related to lightdm or xfce4? However, it is a regression, since
> >> kernel 5.8 works.
> > Yeah, apparently there's something else wrong with the relocation changes too.
> >
> > That said, does that patch at
> >
> >   https://lore.kernel.org/intel-gfx/20200821123746.16904-1-joro@8bytes.org/
> >
> > change things at all? If there are two independent bugs, maybe
> > applying that patch might at least give you an oops that gets saved in
> > the logs?
> >
> > (it might be worth waiting a bit after the machine locks up in case
> > the machine is alive enough so sync logs after a bit.. If ssh works,
> > that's obviously better yet)
>
> No, doesn't help. And I was wrong, ssh does not work at all when the
> display locks up.

Did you say what hw you had? is it the same hw as Pavel or different?

Dave.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
