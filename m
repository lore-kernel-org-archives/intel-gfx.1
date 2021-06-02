Return-Path: <SRS0=VOyE=K4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08879C47083
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 04:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A09E561075
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Jun 2021 04:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A09E561075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F496EB5A;
	Wed,  2 Jun 2021 04:30:28 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBA66EA8D;
 Wed,  2 Jun 2021 04:30:27 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id dj8so1266408edb.6;
 Tue, 01 Jun 2021 21:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rDgbnII0J7gO9tnOuLMgPFZW1dZJ4Js1Fyu0nkizAZs=;
 b=kOza2yUMbdTnkMaoNxQ9zT6DZfFI610gHbMElXI+9oTTvP8zz0XhKrD2o6zhGguIEj
 fc2LTr0Z8qdHKfZsCfpC+RnVe2bqHS4nWSRor/kQ/YLqgBxpKI3LgBF8steOQgdJlMml
 59fn7w9FNBx872J8nZ+T/7JtZP8zu9Q7No99sABX8uLMEAtpTIi3HHBckvjRsy/HT9Bz
 aqiqSglTz+7AEPAV48KwAFETGQa8I41Cax9aRv2v3B5GrmfgHH40TqzHcBq7tft6ywI5
 8ziaSdBNqCO4hoo3EWMc4qdmxXPY+IIt9F7HcjULk5Q4ifWv8oeDfzk3o1ybRR0s5uDD
 fzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rDgbnII0J7gO9tnOuLMgPFZW1dZJ4Js1Fyu0nkizAZs=;
 b=HBxcTKVyepvdLvhvwmOa2yr/5m//dFbHdlcKv1TcLApXthuwuxuRiAw/f72odAVl5M
 HoG6mRy0V4dbBpbA+sfV5Bh9R8pyOcDS6z6noSytF8IYMT0bxe9nSRQFsyzNQPMNpoxb
 R/T4JbsBnchpm8K5qxgcDgqwaF1t3gXKbou4Oisj3qEaznPckrz1/hPDa1uxpr2zwJgT
 DFNZqlKeOrcS5tuBf0Ih4qy0MNxHck5ER7OTFIJvHYFBKC1gyl5ZPsT5bv8dolFEKVn9
 GA2wtrL0RnFO3HuxaVtT100DCvMK+gkBdBfCEY+KeME3m8TzvO2SOp5ndYESUJK8zcQ3
 CNEw==
X-Gm-Message-State: AOAM5312f1dV8E2zP8d3i0+g7QLJVVAAm5aEV3RloVmhqDdLVrX4V/43
 xBAfMUiz24dNc+gv1gRa5p35Lqf2N2uV6EQ9V6w=
X-Google-Smtp-Source: ABdhPJz0sUNsqiGAt2+H8cIT/QxMAZvx+Gbq3eO90RRbU8SMLhmUs506Cn1jeyCHiGVC8yqClzx/N7wLT7j7DfFiFX4=
X-Received: by 2002:aa7:c545:: with SMTP id s5mr23095567edr.113.1622608225894; 
 Tue, 01 Jun 2021 21:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <YLCbBR22BsQ/dpJB@jlahtine-mobl.ger.corp.intel.com>
 <162218682866.9100.50543809230103499@jlahtine-mobl.ger.corp.intel.com>
 <CAPM=9twwritR-5-iN-D4AvMMnng9PkCfZmsU3zhZZBFkGGx9Ww@mail.gmail.com>
 <CAPM=9tyb-PffapqXE4c1Ow0wVeT2a-r88VkEurUox5AFsQrfbA@mail.gmail.com>
In-Reply-To: <CAPM=9tyb-PffapqXE4c1Ow0wVeT2a-r88VkEurUox5AFsQrfbA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 2 Jun 2021 14:30:14 +1000
Message-ID: <CAPM=9tzAO4yoinKoUbFsWcQyLY_naqY-T-meLwc09Pkn+ZroFA@mail.gmail.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-gt-next
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 2 Jun 2021 at 14:17, Dave Airlie <airlied@gmail.com> wrote:
>
> On Wed, 2 Jun 2021 at 10:28, Dave Airlie <airlied@gmail.com> wrote:
> >
> > This has these two patches applied, and it doesn't build.
> >
> >   drm/i915: drop the __i915_active_call pointer packing
> >   drm/i915: Fix crash in auto_retire
> >
> > The latter patch shouldn't be necessary after the former, please fix
> > that up and resend and please build test trees before I get them in
> > future.
>
> Oh maybe this is an unresolved conflict, not sure why drm-tip doesn't
> catch this though, or is this next tree not in next?

Oh looks like tip did catch it, I just didn't see it was done with a fixup.

Dave.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
