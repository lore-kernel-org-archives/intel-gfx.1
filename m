Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3A9C98328
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 19:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93F110E1FE;
	Fri, 25 Sep 2026 19:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S0Zaxd9h";
	dkim-atps=neutral
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com
 [74.125.229.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F68810E1FA
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2026 19:57:30 +0000 (UTC)
Received: by mail-dl2-f12.google.com with SMTP id
 a92af1059eb24-141a5d476abso22790c88.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2026 12:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790366249; cv=none;
 d=google.com; s=arc-20260327;
 b=PoadcvtaOMrgraSdxr8UlhTgUk6W4hy4AiEl41Dm826mASUbhIWaGuR9hUWrYtil0w
 Gd4/jsm66fBlMgyuwNzhOTeMzq05NSdPyoM/dy7E8cV3p4sDE6Op+S9XmRN4A6AetL8H
 iCQ8W2Ucf02drmk8XM6V34qg+ji46p288gCPzvPaeG1h5AKs7K4QeoSt9RWFrP4UpKpg
 vSgmdU8npo2KJvA1ctVrPZd6BOgZfgxeTD6q635WkP7yCaRpOAgaCWS37hrnWuuDNdkT
 pBwXnGI2w3Kxn3It6aqQuIznjvuKHfWEGvunLVKQj/cPfd63nHNypBd0Y4H67JLXGW59
 f/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
 fh=0d2Y8jpiERjMe28oCzh8HbwQ6moJUeQz1WXL9d41wwU=;
 b=OZFa9fNjT+Oh9Z55RxT+GtCqSNHYB+sFfcul2UNJB56XfDL3QltrxGbqGtRyytznWp
 SsqnOGtkaa99rOyQZ6X5RHHGy8TUd/ZvsD0PC1gf1y5wvLmvnEPJo2IFpIWuHrjChrsu
 6ZPQ6EbOl+pHle34DBYDgbwzbFh76sucaYbG8sS8dgpC0Uk3lKXP+phiEO4rNiSn1LWM
 qvsR4wsOdpGHC+QOc9XMnJdBK5VauLJeGtLS1366mMxkxw9OYNo/iLXbwferygxcWJrN
 krCw1W52El6/c+qQLs/c8pAhA2G2PJDwIA77Y88eMWKlT88jEEK8IQrKVqnZefqVvQdJ
 SDUg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790366249; x=1790971049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
 b=S0Zaxd9hzHyGleBG5WCaixa3XCjz0OvRadY5Dis5K1ny8RJzfPvDXFMH1S1h/mWobU
 TpFOU7avlgXuNsy0isV40VJ37L5ieQszDcAzSiwn9Cardi61+EBh0e2LUTdtae7IMCKE
 mm/UwLoQXXMhsc+l5qeHQYjnJdMHGmDgmjbdZq/ZYsPCgrapV6kCXQd9herR7Co8z18N
 znLI+b8EgFb527RI5e/y8s4wCa7MJHY8qph8lS8r+UBR2K+XwrZTDtCJk6u6yAX+Q6NC
 Hhab+0Z2FgpQAfGGjD2esgkarvbdZbQxBE51QkuCZsvxy8QAen/dA7eCeE8V9CqPsPRF
 EuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790366249; x=1790971049;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
 b=zdyrJ29Cr/bsrnM3VvgbfusfMC8+28b7dLDXS50YCoKEmcqxeHjO/lkRgweiV8Z8WP
 Eyl5NWDmwhq8dYuSdTb3yTgAuYtdOE+o9Y9/SQC5lxeZRV+bGCpN5hTIIGxnMILpgqsA
 U2K3UTccV7WkDvougWoYoHBSxVEG+Zt4oAuyoecx07i/iWsUDKscius/nhlVneNTj/FV
 DoVyDqSwBWtfANTdBDwrfAEYZ/i3YBj0hFgu0fZTbk1aRICf1wSvH9fgW/9DdjTVNYi1
 h7uJ0FTlVAA2SuqniTxJ6xFLoIaodNFZlpmznUXcuqUvFUsHFn2YCYDsOo9Gzb7UgvC7
 l8HA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwYL4KD4TwcfCvEuj+v3BfRZLFjUNMcuQND7sDgIc4qAOYcrmuMj6USJ6aRUOWabdv8W3w/fXTs9h4=@lists.freedesktop.org
X-Gm-Message-State: AFuF++l6AgSrMJF6eFKiFXuctBZjlLHj8XjRJzwdKitY4dYH9v6dMg1z
 OWjCJ+xghiqe5i2tnViqz7Dw+JeHse/1P1WOslnKcvb+Zb7IsrW3h8L+5qFeYyD0Zw4NwR8FfLA
 MM6WPeqRdWBuQBwKkUpq164/R6OBosCs=
X-Gm-Gg: AYBFou21DLGdD6ruyUf2I2KFDx8I2zKkQvZr+iS3Bbbapcw/vdXdKByciTsjgzn0Si4
 TTF9jz0utsFxgRzbp9dNZlbCjbP66VY7hYr/YN7ezwZm2lp7DCMrcR+Lycs6CuPvMxuctGZc+Pd
 BYD+BZs2sLjA2IuL40gMSOgwv6Sg1nONdnZyZWLHGbrALxg/0yinNZrIQbqBfddrZLcwl+1QWaQ
 XH5LzFpfUOGQpb/KqnzY2KJsOSTiyEvMgdwR5/sOFtinKKH8MBjtHJKL8H8SzaUA50vHE2zn8qC
 FEP6Q/rf/STIZGir8mRg5HD+pHB77rkBm5K6jdKVO9PXhvoO1nkpza/FGxS5K6u85DiG7A35MrE
 x3cYpUTK+ivi6D0t1ZKd0x1vtBRCWaZ5fj8TBC9mldA==
X-Received: by 2002:a05:7022:3c0f:b0:13e:5a51:148c with SMTP id
 a92af1059eb24-146cb31161fmr1265733c88.0.1790366249147; Fri, 25 Sep 2026
 12:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
 <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
 <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
 <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
 <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk>
 <CADnq5_M0uB6uRvQh3jEZGVEFqmU0wp_w=wmsipXqz=Nq5QZwhg@mail.gmail.com>
 <47218081-0338-4a3d-bca3-8b0b5a3bda14@sirena.org.uk>
In-Reply-To: <47218081-0338-4a3d-bca3-8b0b5a3bda14@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2026 15:57:17 -0400
X-Gm-Features: AclHuK-Cq9d27p6uURRwzJuINctgLf65y86LjQs4-Pqe-rCewP5XBlqi-cNgrkE
Message-ID: <CADnq5_MFMriR-b3eX0mTZShPDgUBgwoObgumEjJ9cJqdmDM6xQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 25, 2026 at 3:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 03:21:43PM -0400, Alex Deucher wrote:
> > On Fri, Sep 25, 2026 at 1:03=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > It seems everything built fine today, I'll try dropping the workaroun=
d
> > > commits for Monday.  The drm and drm-misc trees are still failing due=
 to
> > > the original issue.  Thanks for getting things sorted.
>
> > Thanks.  I've sent Dave and Simona a PR with the fixes so as soon as
> > that gets merged into drm-next, this should be resolved.
>
> Great.  Someone will still need to prod the drm-misc people once the
> merge is taken I guess?

Right.  It will be resolved when drm-next is subsequently merged into
drm-misc-next.

Alex
