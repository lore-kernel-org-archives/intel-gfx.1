Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05907FF5125
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Apr 2026 16:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7496210E4B1;
	Tue,  7 Apr 2026 16:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SWcnCjLn";
	dkim-atps=neutral
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB42B10E496
 for <intel-gfx@lists.freedesktop.org>; Tue,  7 Apr 2026 16:47:01 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-66bd3d05e03so5592302a12.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 07 Apr 2026 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1775580420; x=1776185220;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dx/m4qvSSemNJKesVaE8vEc61BC9N90amh0wlcspPAg=;
 b=SWcnCjLnEzWTtsv+BLSqdfwEjYj6XzDnRA2rd+HDEqC0JDY8P6dvliNAJyVpjqF2QF
 9+sf/eRwqKV3HD/s8c5pH9HgP5xMGgbr2bUU7HshgUt0CUcoAwNtAE4cGVDngkn9P24b
 gj1jFFkvQTZdfbx5GnV5lEeGJINo9ZoF8DkeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775580420; x=1776185220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dx/m4qvSSemNJKesVaE8vEc61BC9N90amh0wlcspPAg=;
 b=DKUIg4O38ZsY+ns8ESIStcazUiUmIRLh3UmhfxU6yxvZsvuIz0bdSMFtHULIRBFznX
 p/OayDSC5uzY3W/u/AmSvOq8pdSF8LUfOHDcYIc8QNaJYr2HbwTqItzE83begNxrf4X0
 yzksvYr5SKD0hD+HPRRv21On7VHvGZrB35w80k2N+D4DVNr90rd/rTJIUNwJyyCyQVI6
 Z1/Q0wIcuEbQ8RbXvDH0J7+5vT/a1iwoNwXbLSbqyKKLI+l6Fj4zJ+ZLT1WIMQeTTNvr
 0PUVmyP7B/q1srSU505gutjZNd2VMBYBaHjdGcpj2nTHw4COJQy2XvkzKbqoVBKs4zLS
 vKNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa+cmF7vJXYk/h6Ee/AW3JjvJ8rX09OR6w2Eho4AYKqveStY3pVRO3f3eHMoYgB+GuepPX+rd67/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5MW88XiYK1+rtQSHNkx8lyBhgYoj/2u4tMdRvFemcw08R2h/x
 66JbJtCGm4zIdcnm8EYLoXuyVSGbxeHjwlxCMio1EmNeEZCbGq/lYHfqKc3zCdkZorWFKX3FZAY
 XR+DQNjU=
X-Gm-Gg: AeBDieuNu7njOKXALKoEFn7urPzJ+ynmpTsJEVlcyRuO0ynHps/TMSL+AqBJqdXzjMO
 KvL4mJxfaQCwaxZW3qacOp7wvtJbeReFWOu58gBdSFJfpiMkvkDaFnhHIu1qbXUlO+ESMT4BFyN
 ln6Gh8gV6Qv0EgFcREjr7L22OIi6hXrljFcCEr7gPlBx3b1zxHdpQsjmWb9r8MIiBixoX7uq9/6
 5NFBZ7c3jwC3UPWQUbea7S4eFbV1ZIxlHWxeRX+NX/W+Sjyi7SNpdJZNcyoThKwQZOwYbcljtxd
 OuFv/Zf1pNK5gneSwr5gMlJsTBbh0zfPPwIQ4cEcvkhT5HeOuvQ36WWwxtGXJdmUnP1UmpjJHAJ
 6+vGXroLWcHFX97Z2zzApJFvkE914M3NJIxU7zcwH1BGkCF3QADs47Yd3eXKxTMbmaRVq3gprTL
 BTGOTFe8O4tfpDolVSGz1pD+4aGnEVQr/CZ+Bioqy53pDbGhsThkXeYlZmDBOKTjuFOfWjiEU=
X-Received: by 2002:a17:906:7950:b0:b9c:b069:8ac0 with SMTP id
 a640c23a62f3a-b9cb069bc09mr568478066b.19.1775580419716; 
 Tue, 07 Apr 2026 09:46:59 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3c99ec5dsm587458766b.15.2026.04.07.09.46.58
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 09:46:58 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-66bd3d05e03so5592267a12.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 07 Apr 2026 09:46:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUeOr6Qb6rg47nVb1LUHoimpv+mARIK1fKxVueIvmiOuJuUk55Pjd8Mc9hW5PyUHgWeNH/RZCwHYPM=@lists.freedesktop.org
X-Received: by 2002:a05:6402:1295:b0:66e:4499:79cc with SMTP id
 4fb4d7f45d1cf-66e449983efmr5494821a12.24.1775580418566; Tue, 07 Apr 2026
 09:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260324151741.29338-1-sosohero200@gmail.com>
 <acUnQkniqECI0QVY@intel.com>
 <CAHk-=wj=h9z-Qp+xm1oSURRGHO3wexzG7MyLqU8gSQbastwgdw@mail.gmail.com>
 <177557988645.129480.6094289548721099346@jlahtine-mobl>
In-Reply-To: <177557988645.129480.6094289548721099346@jlahtine-mobl>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 7 Apr 2026 09:46:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcSt1gGnQZoyNvodky_6WEDxC=1+gQHywiOvOjw1+GUA@mail.gmail.com>
X-Gm-Features: AQROBzCTMCSnvZ3XUR1zPAGvIUVHjr9BnjVc6WwcuXi2bM5JsQCNUmAdECRQUuk
Message-ID: <CAHk-=wjcSt1gGnQZoyNvodky_6WEDxC=1+gQHywiOvOjw1+GUA@mail.gmail.com>
Subject: Re: [PATCH v2] [PATCH v2] drm/i915/gem: Fix UAF race in
 eb_relocate_vma
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Yassine Mounir <sosohero200@gmail.com>, g@web.codeaurora.org,
 gregkh@linuxfoundation.org, 
 intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 7 Apr 2026 at 09:38, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
>
> The big question is, what stance to take on a value of AI generated low
> quality reproducer code which was accompanied by wall of AI slop which
> caused hours of time get wasted on debunking the hallucinations?

I don't th8nk there are any good rules.

Some of the AI reports we get are great, with no slop in sight and
finding really subtle and real bugs.

And others are very much not.

In general, I don't think that's all that different from bug reports
from actual humans ;^/

So I'd suggest just fixing the bugs that are noticed, and giving
credit appropriate to how good the report was.

           Linus
