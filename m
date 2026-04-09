Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6565F31E31
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Apr 2026 15:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790AD10E826;
	Thu,  9 Apr 2026 15:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gYF+qnzq";
	dkim-atps=neutral
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3036E10E826
 for <intel-gfx@lists.freedesktop.org>; Thu,  9 Apr 2026 15:45:42 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b9b1ffbb9f5so155776366b.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 09 Apr 2026 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1775749541; x=1776354341;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R+6cGCdQyZO2M90X0WmOIFALLvNYFjuN/wiy5vwF0EQ=;
 b=gYF+qnzqDNYL5HO1riHvnsBjZIv3+EQX4IQisonzwlvRamg/Nppkk0tA2CMiBFItLB
 iNpY2j85hcYS4/gBCbJMjLQH3ftkIibL53RvKFihSYhTqGz0uz944x8XPd6jwwvV1eRs
 ZyE8iEdRvYCN1tJJ5AwA233+pzMzrH5fGo62g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775749541; x=1776354341;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+6cGCdQyZO2M90X0WmOIFALLvNYFjuN/wiy5vwF0EQ=;
 b=EyGxbKXIgET83GAZhWZjqHW+7MwSqBQFXn0JYpU2TMF0utxPTHtBcRhsoTRhMDZbHd
 9tnYuZeWxbXmapLKm3GXBS5+H8Sw5CCruIfmuURvC9ObgILW6muiWG0YpFt+FPyTlJmN
 nPkF/jFxCXvCDHTZFXinJ678Frgw5t4T2MrNXWxJFPzaBvc1dwgzZTMkUB/x1jin2EHf
 zJwFS7cu6IcpWlOLTsmJO+RV9SqhY46cNyc4Gra3yG9TjkKxF0JObzA71RIIOuutPkUm
 Rao/Ah4a7iScaxECSbkExz7Gb32VTspB2Vg5pYNbvuONdJN6fZ76MQlkizcxB5ZUlj3e
 mxeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCL2X15+uJUW97MUQes5YteTcd/owJn4tBND3F43GTBfmCw4cwTOkQfHWi36c7UQDRSErq+VFYq2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1NHFxlSLs6GzAMxDPa5C90gXMYIPR4XRqjmIe0KJy61IxX2Py
 ouzSpCwYAeM4EbGSs2HQk8pa/ynXYq7+UuhGkmCK0rDmz+WKM5J5U2LOR3JIBgrsHTWSKL8I0AJ
 eoPj7Q6fvrw==
X-Gm-Gg: AeBDiesahoGlccCfip6j65B0EHO1N/1nEuwSv8Du7o0Qgz49HcJNw02PLE2MOMcbmMJ
 mG3l4Qs/8zZnJaQ6EJS9sA6woOe2Hnx7KVirwyXtgYsu+iEaBxSwVc6CX43Cygll4gnHl9/NOTz
 wOW/hZ6zxPWTZgpfFwxz/W5S1CLB94zZ3MWgqMTPnr4uthZsXqro7+m6UfWdfeLGNh014zDL8bx
 Oov/hePTE6+Di/CXMd2/jcL37BJW2uZT93xzuNpdzRxD7h6Xv8Hkg17KfVysFQ2VbfHkUqB/CoE
 r5n1ZhIH9oIIuevRdWR5aOyhTCaDxw6VTpKqcLrFVexKynwNe91py/lhWrTpUZs2QBImm4by7CG
 R1C6dTZLsFa6AmsfblEUNmfbBZPHbcT5bqJMd9ZowQ8R/LptLnBGHQ/VAfDnc+q83FiXzQptIRb
 NfRxXEkhpUJPjhXsXE3Vflu3eS3n4CJs4u+WHw6QYLYbfl6EjhSIjfIGyNxMOXR/px+Sww92g=
X-Received: by 2002:a17:907:c011:b0:b98:8365:be with SMTP id
 a640c23a62f3a-b9c6795190cmr1205709766b.25.1775749541031; 
 Thu, 09 Apr 2026 08:45:41 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66e034b976dsm5953137a12.23.2026.04.09.08.45.39
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:45:40 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-66bb7e098b1so1097241a12.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 09 Apr 2026 08:45:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHBs6/CqjrMqHX6HiUjrgM5GPhmeiBYIahplvADr1yjV1QxVRZ98W2HGyXucpQf/57DzA5RL2wjuE=@lists.freedesktop.org
X-Received: by 2002:a05:6402:2804:b0:66e:aca0:8c4c with SMTP id
 4fb4d7f45d1cf-66eaca08ce2mr8750492a12.4.1775749539662; Thu, 09 Apr 2026
 08:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260324151741.29338-1-sosohero200@gmail.com>
 <acUnQkniqECI0QVY@intel.com>
 <CAHk-=wj=h9z-Qp+xm1oSURRGHO3wexzG7MyLqU8gSQbastwgdw@mail.gmail.com>
 <177557988645.129480.6094289548721099346@jlahtine-mobl>
 <CAHk-=wjcSt1gGnQZoyNvodky_6WEDxC=1+gQHywiOvOjw1+GUA@mail.gmail.com>
 <177564692857.84154.3119637094332266143@jlahtine-mobl>
 <CAHk-=wgbhJ6TzSwswdM5hKAS_RKF1SLXp2u6JAS35P3i2mW2OQ@mail.gmail.com>
 <177566544117.120471.8020434521083493183@jlahtine-mobl>
In-Reply-To: <177566544117.120471.8020434521083493183@jlahtine-mobl>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 9 Apr 2026 08:45:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfUM8y3PoFfT21+guKWK-mJmAE=8uLzOT+7HGv5NtqSw@mail.gmail.com>
X-Gm-Features: AQROBzCI66xdXbU3LvQlS55X4n99D9jOuO9AJJxfnftcdU3PLS0-ZAH3Rs8z5xY
Message-ID: <CAHk-=whfUM8y3PoFfT21+guKWK-mJmAE=8uLzOT+7HGv5NtqSw@mail.gmail.com>
Subject: Re: [PATCH v2] [PATCH v2] drm/i915/gem: Fix UAF race in
 eb_relocate_vma
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Yassine Mounir <sosohero200@gmail.com>, g@web.codeaurora.org,
 gregkh@linuxfoundation.org, 
 intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com, security@kernel.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
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

On Wed, 8 Apr 2026 at 09:24, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
>
> Yes, there was clearly a bug introduced at the time of adding the
> vma->vm == vm check where zeroing vma was missed if only that part of
> check failed. However the vma->vm == vm part can't have failed since
> d4433c7600f7.

Yes, I'm perfectly fine with the change to just remove that chgeck
entirely (and then obviously the "set vma to NULL' addition goes
away).

I'm just saying that we don't just remove the new "set vma to NULL",
because that pattern of checking for something - and then doing the
wrong thing - is fundamentally wrong and misleading.

               Linus
