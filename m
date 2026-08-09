Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411A7C5B56A
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2026 13:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7500510E857;
	Mon, 10 Aug 2026 13:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TYF7XLOV";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCCA10E05B
 for <intel-gfx@lists.freedesktop.org>; Sun,  9 Aug 2026 05:41:06 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2ceaf8a1265so13333705ad.2
 for <intel-gfx@lists.freedesktop.org>; Sat, 08 Aug 2026 22:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786254066; cv=none;
 d=google.com; s=arc-20260327;
 b=cXZTUOzcYIip2p9E+YgFYkPOlpQnC5+vRH8uHSdo2IG71kFB9VTFKMkvBxuUwbYl83
 FrimgzJPklLGmMSnBAtUeo+p4TLtCIw8k5T4RZ0D9xDhSbc1IkvkEXyOtUpox3BC5kQo
 X8Vwotd+ouiHiJJ7lVeZO0kqkbGR5qOXKgmYSbPe2GDenK3+GgDNY/V33Bmd/vc5edZq
 Wf+plaHoFIRJSPixX0ThTbNeIgXDggXS4IQNmv7Po+y3vDpB2MWH+EfJ4C2643c5n6dr
 FTGiiEvcZozfMRkflyhOB5DtkNl/0YXOFL/FDjTC1D9deVlMG68jVBU1QsX7ESeFweoO
 Z0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YOtZBpbFjKqfSL/VoaNjLpa2+LrYLcLN47KHABVV5R0=;
 fh=Xn9Y2wJd7L7PiMsgxvY4bInIyee34p+4B2qDuhl8LyE=;
 b=Z8YqD7+bd0wHMGDitnegs3m1COboPG+dwHwIiRzFnLU15M6IpPpHmevF61WbGlNqKw
 jA7+fgNU/H6dSRaou8IZH6t0B7mPDJpvP7t5BG69i0H6M7xBv/la1XFNNdsuvyy1TyWN
 OaNU7/C4HKV+XYmSx5gjU/uO/HW6PJ52Zl5TGzOPyThTNPKrF3I/nMB8damFC1IxSnso
 yn6l5sXbXSu3RujKcSP8Jk/8L4uZuFDo3Tdkb3qSo6DbFBvYEWFCpFRWbBAmv+PV3yIa
 6to4F72IwRq3KvM7K8YU4WPPQvVw8RDXNP3cYTqKE05umJCdpIU2PFZ+mJi1xngHs80J
 vZKA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786254066; x=1786858866; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YOtZBpbFjKqfSL/VoaNjLpa2+LrYLcLN47KHABVV5R0=;
 b=TYF7XLOVzATspGhOsn7eBdoXvQs3K1PkZN2vD/e6o4GMmzzJaXtvNW9/YXLRZiNSzY
 DnwvV8HbuhVHE5SdCulabWeb+n1/mMOl5e1dz10InFMwnDyzLPDfz3NKiBUyIgud5tDT
 YMHnba5f0LJhR/LuPVk4aUSll9eZRfqXHfwSPZyBXETa+wroYNOfdAwtffP3qv9yRpAW
 FvNmArDmh1F+JfAIzhnqEeLebmg0iG68OqfMi7dMGCcsmHCBEKbmkx6jqQQqaIzUl0CG
 WcaZnmvFZ6MyVBIbVhc435TTUubODsok2N71JVbKbXHCMPqtZR5ge8KWljNPpFqXijr1
 7LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786254066; x=1786858866;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YOtZBpbFjKqfSL/VoaNjLpa2+LrYLcLN47KHABVV5R0=;
 b=jXSLAWbAxbPmdEVJRJjV6lS/tVi+g5Lzn94St2RCWKrx8A5IheZp7BD/FgxAT7kHg7
 lnge4Gj6oZem88vgHoA4a/k4UeGcUOCEKE0Y88VaNxso1T20hhn65ryQyzPvSYV3Xjlo
 URF2IgZcqCnNDvRq4A85PKPnmuUINyD8PZle64AgZSn8SjWgskCKM4FAIRAGuVs3G9Yd
 qRJBZWnTa6Hha2LFJAaNkq5wCCOIXzzQwz38r65RrE8VSWdsqM6Nv1UWG4Pno7PfX/hx
 xrHNbfJS5s1iRelukmkPWPhM3H0iohRrD0ENcaur5XEcOjpgm+/b6pFHSI1z9nB4YFZm
 DPWw==
X-Gm-Message-State: AOJu0YzvMPrtKZARqzcdozasdD/lzeFKHjJI3hQgzFVyeexkjLcL7Q+v
 wFaB3Lww5BaAbH0VKTAq+e3AMTtkR/CD1MHqLr5s8XiyjZ6ssM+CxfxyGmI0R+PMMY8iZ1G0c4y
 rp/ePR2V7AyvYXU4/+ia7Xb/6XzZFDtc=
X-Gm-Gg: AR+sD13LOjppre2uxaMQizQH8bEXPfJVyFqVbSCv0ZGh3EF4RnxM2NFHoVME6bs2KKT
 RhWgUbTqu9MWExzCT6klKfhFSEcXjMzwTV07m4A1jYnQyKSZzrolHojR4dz/x3hlgMdj8vwpGxD
 Wnj5DE5rSAiEXW8dCJgGdnc6y2oOb0OTlAXrjpHtt2Idxt4G6d/3KURRkbGL+sbJ93FWwDV7myH
 MnzRodnfitLQjy7LJtCCL5i1ioy6d+RQMOAmSxuyA7ER8tdQQ06HU2csB6wyZNDm1SLjkwcAgXZ
 z4LKpRdIJjyvizF77VI/BJbtZ+bLcxdt64r5lFmd+Qe+Kd33UNYQr6OoMTnlEAqqnKXDw3D6It4
 8AFQZK0e2z4pbOepm1tC1McenStWVeVLtgXlwO34AXNjPn+WO0oRk0a18CF4=
X-Received: by 2002:a05:6a21:6013:b0:3c3:7ac4:dac0 with SMTP id
 adf61e73a8af0-3cb85df2790mr43711134637.13.1786254065833; Sat, 08 Aug 2026
 22:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACa-pC1wVczshOD0xE0oLMDa7q25Q2ibJzCOKyDs4vW6Ga2cCA@mail.gmail.com>
 <anKXIBhDWkYZs6dZ@intel.com>
In-Reply-To: <anKXIBhDWkYZs6dZ@intel.com>
From: Parth Kamani <parthvipulkamani@gmail.com>
Date: Sun, 9 Aug 2026 11:10:54 +0530
X-Gm-Features: AUfX_my0mQ6mIazoUse3sTmrYbM8xe5OhKZoyWyLiPEwh_Krm7pxXWHMXrW7c7M
Message-ID: <CACa-pC1UK+6BGpcBBwqmhZ-tC660ZCEcfmfHo3xVJgTJKo0aGQ@mail.gmail.com>
Subject: Re: Offering to take a TODO item in i915
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000129aa3065896af24"
X-Mailman-Approved-At: Mon, 10 Aug 2026 13:14:57 +0000
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

--000000000000129aa3065896af24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rodrigo,

Thank you for getting back to me and for the guidance.

That makes sense regarding the i915 TODO being outdated. I agree that
removing the TODO file would be a good first patch, and I'm happy to start
with that while following the workflow you suggested=E2=80=94keeping the pa=
tch
small, running checkpatch --strict, testing against current mainline, and
submitting it via git send-email.

I'm currently using a Dell Inspiron 15 with an Intel Core i7 processor and
integrated Intel graphics, so I'll also look through the open xe work items
and see if there's something suitable that I can test locally.

I'm very interested in contributing consistently to upstream driver
development. If there are any internship with the team in the future, I'd
also be very interested in exploring them. I'd be happy to demonstrate my
commitment through upstream contributions first.

Thanks again for your guidance. I'm looking forward to getting started!

Best regards,
Parth Kamani
Final-year B.Tech, Computer Engineering
K J Somaiya College of Engineering, Mumbai

On Wed, 5 Aug, 2026, 7:22=E2=80=AFam Rodrigo Vivi, <rodrigo.vivi@intel.com>=
 wrote:

> Hi Parth,
>
> Sorry for the delay, response inline below:
>
> On Mon, Aug 03, 2026 at 02:16:48AM +0530, Parth Kamani wrote:
> >    Hi Rodrigo,
>
> >
>
> >    I was looking through drivers/gpu/drm/i915/TODO.txt and noticed that
> there
> >    are still a number of outstanding items. One that caught my attentio=
n
> was
> >    "for discrete memory manager, merge enough dg1 to be able to refacto=
r
> it
> >    to ...". I also saw items such as "Come up with a plan what to do
> with
> >    drm/scheduler and how to get there" and "Roll out dma_fence critical
>
> >    section annotations", so it looks like there are several areas that
> still
> >    need work.
>
>
> Oh, I believe this TODO list is so outdated.
>
> I'd say that the core part of i915 is pretty much under maintenance mode.
> We are focusing on adding new features on xe driver that supports the new
> platforms.
>
> >
>
> >    From the TODO, some of these items appear more involved than others,
> so
> >    before I dive in I wanted to check with you. Is the discrete memory
>
> >    manager item still something that would be appropriate to work on,
> or
> >    would you recommend a different task for someone making a first
>
> >    contribution to i915?
>
>
> Honestly, one of the big reasons that we started the new driver was the
> difficulty of this task :)
>
> >
>
> >    My preference is to keep patches small enough to review comfortably,
> run
> >    checkpatch --strict, test against current mainline, and submit them
> via
> >    git send-email.
>
>
> That is mandatory! :)
> Please always do this no matter what patch you are sending.
>
> Perhaps a good and very easy initial patch is to remove this TODO file
> hehe :)
> At least this might trigger a public discussion in our mailing list if we
> have anything valid there or if we should kill it entirely.
>
> >
>
> >    I'm currently in my final year of B.Tech in Computer Engineering at =
K
> J
> >    Somaiya College of Engineering, Mumbai (graduating mid-2027), and I
> have a
> >    meaningful amount of time to contribute before graduation. I'd much
> rather
> >    spend that time contributing to a live upstream codebase than workin=
g
> only
> >    on coursework. If there's a better first task than the TODO item
> above,
> >    I'd really appreciate your recommendation and would be happy to work
> on
> >    that instead.
>
>
> That is very exciting! I'm so glad to see students volunteering to take t=
he
> next steps and contributing to open source drivers. It is so refreshing t=
o
> see!
>
> Keep up with this great spirit!
>
> What machine do you have? what is your integrated intel gpu? Something
> local
> is always better.
>
> If it is a not very old intel hardware perhaps it already has support
> from our new driver and you could see if there's any issue that you could
> take:
>
>
> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/?sort=3Dcreated=
_date&state=3Dopened&first_page_size=3D20
>
> or perhaps even i915 driver:
>
>
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items?sort=3Dcreate=
d_date&state=3Dopened&first_page_size=3D20
>
> >
>
> >    Thank you for your time, and I look forward to hearing from you.
>
>
> I'm sorry for the delay and welcome to the community!
>
> >
>
> >    Best regards,
>
> >
>
> >    Parth Kamani
>
> >    Final-year B.Tech Computer Engineering
>
> >    K J Somaiya College of Engineering, Mumbai
>
> >    Email: [1]parthvipulkamani@gmail.com
>
> >    Phone: +91 9820081318
>
> >
> > References
> >
> >    Visible links
> >    1. mailto:parthvipulkamani@gmail.com
>

--000000000000129aa3065896af24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Rodrigo,<div dir=3D"auto"><br><div dir=3D"auto">Thank =
you for getting back to me and for the guidance.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">That makes sense regarding the i915 TODO being out=
dated. I agree that removing the TODO file would be a good first patch, and=
 I&#39;m happy to start with that while following the workflow you suggeste=
d=E2=80=94keeping the patch small, running checkpatch --strict, testing aga=
inst current mainline, and submitting it via git send-email.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I&#39;m currently using a Dell Inspir=
on 15 with an Intel Core i7 processor and integrated Intel graphics, so I&#=
39;ll also look through the open xe work items and see if there&#39;s somet=
hing suitable that I can test locally.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I&#39;m very interested in contributing consistently to upst=
ream driver development. If there are any internship with the team in the f=
uture, I&#39;d also be very interested in exploring them. I&#39;d be happy =
to demonstrate my commitment through upstream contributions first.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks again for your guidance. =
I&#39;m looking forward to getting started!</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Parth Kamani</div>=
<div dir=3D"auto">Final-year B.Tech, Computer Engineering</div><div dir=3D"=
auto">K J Somaiya College of Engineering, Mumbai</div></div></div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 Aug, 2026, 7:22=E2=80=AFam Rodrigo Vivi, &lt;<a href=3D"ma=
ilto:rodrigo.vivi@intel.com">rodrigo.vivi@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Hi Parth,<br>
<br>
Sorry for the delay, response inline below:<br>
<br>
On Mon, Aug 03, 2026 at 02:16:48AM +0530, Parth Kamani wrote:<br>
&gt;=C2=A0 =C2=A0 Hi Rodrigo,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 I was looking through drivers/gpu/drm/i915/TODO.txt and n=
oticed that there=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 are still a number of outstanding items. One that caught =
my attention was=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 &quot;for discrete memory manager, merge enough dg1 to be=
 able to refactor it=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 to ...&quot;. I also saw items such as &quot;Come up with=
 a plan what to do with=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 drm/scheduler and how to get there&quot; and &quot;Roll o=
ut dma_fence critical=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 section annotations&quot;, so it looks like there are sev=
eral areas that still=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 need work.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
<br>
Oh, I believe this TODO list is so outdated.<br>
<br>
I&#39;d say that the core part of i915 is pretty much under maintenance mod=
e.<br>
We are focusing on adding new features on xe driver that supports the new<b=
r>
platforms.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 From the TODO, some of these items appear more involved t=
han others, so=C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 before I dive in I wanted to check with you. Is the discr=
ete memory=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 manager item still something that would be appropriate to=
 work on, or=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 would you recommend a different task for someone making a=
 first=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 contribution to i915?=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>
<br>
Honestly, one of the big reasons that we started the new driver was the<br>
difficulty of this task :)<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 My preference is to keep patches small enough to review c=
omfortably, run=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 checkpatch --strict, test against current mainline, and s=
ubmit them via=C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 git send-email.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
<br>
That is mandatory! :)<br>
Please always do this no matter what patch you are sending.<br>
<br>
Perhaps a good and very easy initial patch is to remove this TODO file hehe=
 :)<br>
At least this might trigger a public discussion in our mailing list if we<b=
r>
have anything valid there or if we should kill it entirely.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 I&#39;m currently in my final year of B.Tech in Computer =
Engineering at K J=C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 Somaiya College of Engineering, Mumbai (graduating mid-20=
27), and I have a=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 meaningful amount of time to contribute before graduation=
. I&#39;d much rather=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 spend that time contributing to a live upstream codebase =
than working only=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 on coursework. If there&#39;s a better first task than th=
e TODO item above,=C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 I&#39;d really appreciate your recommendation and would b=
e happy to work on=C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 that instead.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
<br>
That is very exciting! I&#39;m so glad to see students volunteering to take=
 the<br>
next steps and contributing to open source drivers. It is so refreshing to =
see!<br>
<br>
Keep up with this great spirit!<br>
<br>
What machine do you have? what is your integrated intel gpu? Something loca=
l<br>
is always better.<br>
<br>
If it is a not very old intel hardware perhaps it already has support<br>
from our new driver and you could see if there&#39;s any issue that you cou=
ld take:<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/?sort=
=3Dcreated_date&amp;state=3Dopened&amp;first_page_size=3D20" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/xe/ker=
nel/-/work_items/?sort=3Dcreated_date&amp;state=3Dopened&amp;first_page_siz=
e=3D20</a><br>
<br>
or perhaps even i915 driver:<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items?sort=
=3Dcreated_date&amp;state=3Dopened&amp;first_page_size=3D20" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/work_items?sort=3Dcreated_date&amp;state=3Dopened&amp;first_page_si=
ze=3D20</a><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 Thank you for your time, and I look forward to hearing fr=
om you.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
<br>
I&#39;m sorry for the delay and welcome to the community!<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 Best regards,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 Parth Kamani=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 Final-year B.Tech Computer Engineering=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 K J Somaiya College of Engineering, Mumbai=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 Email: [1]<a href=3D"mailto:parthvipulkamani@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">parthvipulkamani@gmail.com</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 Phone: +91 9820081318=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>
&gt; <br>
&gt; References<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Visible links<br>
&gt;=C2=A0 =C2=A0 1. mailto:<a href=3D"mailto:parthvipulkamani@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">parthvipulkamani@gmail.com</a><br>
</blockquote></div>

--000000000000129aa3065896af24--
