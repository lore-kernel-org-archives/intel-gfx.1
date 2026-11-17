Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD27606A331
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLA/p/Ut
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFC010FC25;
	Wed, 18 Nov 2026 13:04:06 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA49310F664
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2026 11:48:02 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-1b3a05f8b5bso5682124c88.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2026 03:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794916082; cv=none;
 d=google.com; s=arc-20260327;
 b=Xsf3BAk2kixrpPnngHZskgzwleowAdXSNhy9wuJJRjfRl3xecWd/+LdYNtLnpkp0Z0
 gvLo2J0CUsNT4WbNE/2jha6WVJxiCL7FZcb82uS8kQb2qoQFr8J8vPfwCKmg807VCzHy
 i6lAm2lzg86VoFEIQAUsbHVE6pP3Wh2Q9FjswoGo7pRV13PfFbOj/hI4g+r3/1SpBzrD
 UouPx/+h88N3K2wWA1T2vXQBOacO64hIrrWiQEH4ZtTPCDWY0KqEYD5Vze0h8qt1pmww
 X2a1YgUT/s9tYBWgMMnpnV7t9QyhwMQe9C6f4topv2d5OLLDUPru7uWQm1/qaeuXNkZZ
 Hvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZoBhnBiIyTXzTlmuhruzg+59oAFd+etNNJs/77R43ik=;
 fh=G8aqxtJgFSCE3kEgixPOc3ZaqERYJHjymUW3GW+1pb0=;
 b=owPxQBzg9TWVHHa281/96Iteww7jHj8ywzLqHszh3D9BS1ggvbPtpTU5LkWEX+SE9K
 d0hNXQ9LzmsrPxvc9u1rYtEZoaRepee6hVCf0T2K6O/RfnvfgW9N/NQPX037GH9cfkgW
 CIhIdDJB/UL24L2036ENIv+8Xehi5ojCz/fcPqAWOfHGE2AgPLxdMJpvYu0553EiKdAp
 b57135SYwT67B959tVYagNHksYe6USWR8Ic5kp21Z7dc5F/d8SaVn0vB18DCSbJ0qSel
 XScj9HNPrWXuFVdYjhXf4qkvpgZbMzT1fQGfaHGaWBFeZ+4PxbUThmrgT2XUXuCdkfAE
 VnXg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794916082; x=1795520882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZoBhnBiIyTXzTlmuhruzg+59oAFd+etNNJs/77R43ik=;
 b=gLA/p/Utl5f/+XkePtHociGIihn2vWgBlaN03wVz437jkiA/DBCHFi87Y7Yr/4vF42
 b5ZGgUyxETmjJbOgJK34+GmnOszZD2d86TxjSToqjhqsTQaMqFGTmCM/OY+btAhxxa16
 YUIWgIejhUR4ecj7ME8qcnCzrE8a/XOM/79OXgqc/oDeomuGl/9Zclm/ENPuts0arRez
 fpNTQjQYW3NoMZOgvm4yqFYIvNzFzNnL9OtL6PSyb3hCrIGlAhA5uwnXmW7qXUOzHzpw
 EohSN7c0jpmYprDQBsAbHCf1gLiF8inPKzJdBrAag9kme4i7OiK7plRu+vgBRv5jKhuo
 sChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794916082; x=1795520882;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZoBhnBiIyTXzTlmuhruzg+59oAFd+etNNJs/77R43ik=;
 b=1Y8JiO9QltQFaHU1iFLVPMo0fTTqjtsMBzERwZjcFImbOcLkuNs/Z4jIDkf+7fl+ig
 wzBkf8hCYv6xmhgd9mIoO2u1nBXBc5IOEZvxtcIze/amHcTU7IMY85Yd/IfaajVle9DN
 o58tvnkckHmHOAi8NyF71Li/41DvjNRUWv4sf0kkZwRFS4I7gwWaWK/FZduHOmtgeJ5i
 lYrZ11kCSKQYjp7ZzCPo20SYV153ge9mdJvjdy+m0ZeM8BCp3vY5k7weoZ6lI+OHILmG
 1BWWgNNNTZZcTlZZ/61fJshSPmnxfCBwTQNVPz4+TrimTLq/mKKN9AWT5FFYbcQvbUWH
 y+Hg==
X-Forwarded-Encrypted: i=1;
 AL+hErGFDaZjfHp277GjoIsQyA6uDuqg4tDpCOTKhcsBgUN9IuzGEbdFxzbHG+T6ohiCxJfPxoKLgG9ma4s=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+A2lHMeEdSss9QCW0d374MkGJOwPa7Dffjyw4zjWaJ8P2BZkwz
 KwX0GWnzTNyzaxZ1b9TVVAaucXC4P82C8TgnmCFOkjPHPbZlEkIGUwCKKreyNEr+QA51rpgwCg2
 aXZ2dn7cddY5l+KUxtY190DKzaX1dv7k=
X-Gm-Gg: AYBFou25xrRKtkMW9EqYNHCi4kHLvdyJ9XYxbXSm6oLpPdJ420Ihe+B1CwnEImydxc3
 5P/g7BCvhI4Bmky1ALtMfWLK+SGictT3467qUTa4ysKDz7PFAVct9rz8bibt3bfZBumWZGg415T
 vjnf0AsvKonX+ZxTJdADrDupD6+x6+wllgiLaCD3PQSpxhkDzXxNGZJmQw9FOy2qDMkIGkBGkpw
 PtyGVkMX2wgJJSwgXTuO/9olg1APdKc54ZfB2v6Zma+4D6yCPCRWxk3DDGwVVLhs35gwSZGMseo
 cJ9vnaCypeYfV3yWSAdIJmY1CblwxMnxCfUtzO5CXAgIjz36r6c8SnNZv2CIyIBVXnDbzjZWz9W
 1sucjb0aGtCoQeLzaIkzi/It1ktVB5+ni7ZrTYqxIqsCBxkQTamo/Lqc=
X-Received: by 2002:a05:7022:5f07:b0:1b2:558a:d781 with SMTP id
 a92af1059eb24-1b50302f22bmr13388536c88.5.1794916081803; Tue, 17 Nov 2026
 03:48:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112155822.1336713-1-islituo@gmail.com>
 <avunXOrG8wfAI2cR@dell-wzy>
In-Reply-To: <avunXOrG8wfAI2cR@dell-wzy>
From: Tuo Li <islituo@gmail.com>
Date: Tue, 17 Nov 2026 19:47:45 +0800
X-Gm-Features: AclHuK8I452A33r3exp9zhLHF3StFZ_XwPZhDpycWCYlYlcLh7BzXZoh5rdTs10
Message-ID: <CADm8Tem-kCYD5XO_fznRoM8oNcv8EkxizEYDpBDb4X9Z20vw1g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix NULL pointer dereference in slot switch
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: zhi.wang.linux@gmail.com, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net, 
 airlied@gmail.com, simona@ffwll.ch, ankit.k.nautiyal@intel.com, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 18 Nov 2026 13:04:06 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 9:01=E2=80=AFAM Zhenyu Wang <zhenyuw.linux@gmail.co=
m> wrote:
>
> On Thu, Nov 12, 2026 at 11:58:22PM +0800, Tuo Li wrote:
> > The running slot is updated to the pending slot before updating the run=
ning
> > context. However, the condition checks the old running context instead =
of
> > the newly assigned running slot.
> >
> > When no pending slot exists, running_slot becomes NULL. If the previous
> > running_context is non-NULL, the code attempts to access
> > running_slot->ctx[0], resulting in a NULL pointer dereference.
> >
> > To fix this possible NULL pointer dereference, check running_slot inste=
ad
> > to ensure that running_context is updated only when a valid slot is
> > available.
>
> Well, just AI generated static check but without any runtime analysis,
> again...and can't even show kernel oops of this, as it simply can't happe=
n..
>
> >
> > Fixes: 8453d674ae7e ("drm/i915/gvt: vGPU execlist virtualization")
> > Signed-off-by: Tuo Li <islituo@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/execlist.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915=
/gvt/execlist.c
> > index 29147a9f162e..763c310f2aaf 100644
> > --- a/drivers/gpu/drm/i915/gvt/execlist.c
> > +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> > @@ -73,7 +73,7 @@ static void switch_virtual_execlist_slot(struct intel=
_vgpu_execlist *execlist)
> >
> >       execlist->running_slot =3D execlist->pending_slot;
> >       execlist->pending_slot =3D NULL;
> > -     execlist->running_context =3D execlist->running_context ?
> > +     execlist->running_context =3D execlist->running_slot ?
> >               &execlist->running_slot->ctx[0] : NULL;
> >
>
> Current code calls this switch in case whenever running_slot is
> available, so it won't have null ptr reference. But code looks a
> little weird, as current code tried to assign running_context in other
> place e.g when new request happened, or even it might seem to miss
> when enter execlist idle state...but it is still valid in switch
> call. So I think this is just harmless. If you'd like for further
> cleanup, that needs testing result for sure.

Thanks for the clarification. I will drop this patch. Sorry for the noise.

Sincerely,
Tuo Li
