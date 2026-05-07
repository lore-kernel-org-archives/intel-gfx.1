Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D996CD3427
	for <intel-gfx@archiver.kernel.org>; Thu,  7 May 2026 12:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BB710F0A2;
	Thu,  7 May 2026 12:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ilKC27ot";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240DB10F0A8
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 May 2026 12:15:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so7710845e9.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 07 May 2026 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778156141; x=1778760941; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c0hToDKSMnxbi/5ufvYd8KJ5BjxBoSfijUk4UFSKZpU=;
 b=ilKC27ot4EEvI21VKPUYtgZzCjaUSSEhXqvfKyBnio1jEnhBTYo9GwfbAAkkNUgG26
 76Pe44gC4KbhLuwwCGbiYTsxGJyW5QULuYFammpThnPg61yGCPgbGTk8xCvJzZuBu+5j
 Vv3ZEXXDZIuSTPVTcwfIlfiOQbSJLoxgCftuDz9Z/JE9KG0xpfMDz2NoMZg4gca+pNns
 0pb+S+ii8vn8POlVpGv/F83tCvIo1rbouJFfhjdIeIbnsw+qs35aiGL09sGresQUnbtj
 2jCCqN6+T2mUlESn0DtF1IRbyxi7s4Q/DtguAmjqgKjolKlhx9nqCJMyOsbnk+1cIjm1
 SQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778156141; x=1778760941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0hToDKSMnxbi/5ufvYd8KJ5BjxBoSfijUk4UFSKZpU=;
 b=K+IHSD7cGJQ4fHmBy3UnQman/S1gOWxzrcfaOZ9bGxn08II6YqkCaAUuwxfuZ8IDRa
 TMt5m8V5bOONV54CDo5WXhCsZd7jCffAhMMLdekQVktpLFcqrQpn9plop00RexW5hrj3
 ZpmiAJ4pvqLj4f4GZCQ/lv3+IOFP6wYTnxdnJ7+SlQQyQ1geCgP3H6+sZSmCXiUsjc2Y
 BjtqRWB+ejMK/wKJ3o2RVvI8bwcRXOyzk63Uz5KiuXFzj87A147imvxH9Ib21XFv4Nf+
 Sm0jXosvT+oBMKuMtQk/icAVSmTbBpALvwY6cfpA9u9qi05Q96PzqFssu7om9Mxbm2wN
 6wOw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/1ppqIsmBZcildvRmqX1LeiZ45Db8DGvWSc21ufi61oOWLKB89x0TdlaYET/lsZHgAmFtnBe0DXXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYj5JArgTn6lpp0EY53J4D3Pzl5KN9Sa004YiO8onYApeoQ/Vp
 kLUhec0nuTFaNCgqaSGnO9+qiNSm6XLqQVWs8N6KrIAgnaXf7IdHubTH
X-Gm-Gg: AeBDievLAQPryKYmzHpfKsumwahFMKTUWMDXDzK91Q+GgTYiHLmwNfa2+Jlex0RYKbs
 w+Lx7CQSQ8bKiLdjgQ6ghLiopHzcGqrOakQ8jL8qzcwkRTXoyC0xqNh/bqPRH5Wezz09w5bYL0Q
 Jxwph5o9WRCJ7pxhBCjz0qXdZXJTF8+m5hWKCqaQHuy2VMjLlxSDMtSKAXN70RpFPMfjDpUmWQ6
 Q7zWhZn42UOSALrEbrmwp+gfXNz7Wo4q+Ewo0HyoqPmfZKSmzLWtnWXhgM547RVg8VbFSSoyqJ9
 AFWQDQj7XH+AwCm9emkMt4KxY5omteGJosGAl4Vskest/gW5q9WYov05uJrmqi9CxMzGYw2R2ds
 mOLQdI84Gu/uZ4wueeAJ6ur++83dh4W3iAcLL+0eZCNYJZRGZZVpG6JJqXVR1Sx/2pg5Ypbi6+d
 r1q83YcIUYo5+99vjxf1gw5fTh+Tm+eRm9umORpGvUyavIx3V0imPCK+rU7/0nbej01Vz4xvwU/
 tC4jIhkseB0UCzvkCfAceEX
X-Received: by 2002:a05:600c:871b:b0:48a:592c:e655 with SMTP id
 5b1f17b1804b1-48e51f45eddmr121794395e9.17.1778156140136; 
 Thu, 07 May 2026 05:15:40 -0700 (PDT)
Received: from orome (p200300e41f1c9800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:9800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e530b212esm52203795e9.1.2026.05.07.05.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 05:15:38 -0700 (PDT)
Date: Thu, 7 May 2026 14:15:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl-intel tree
Message-ID: <afyCC_FE9QL5VBBm@orome>
References: <3b729608ad4bc3bb161c3779a9768b12@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zxepztxp53sv2ewk"
Content-Disposition: inline
In-Reply-To: <3b729608ad4bc3bb161c3779a9768b12@kernel.org>
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


--zxepztxp53sv2ewk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the pinctrl-intel tree
MIME-Version: 1.0

On Thu, May 07, 2026 at 12:47:48PM +0200, Thierry Reding wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Sorry about the misleading subject. This was indeed introduced after
merging the drm-misc tree, not pinctrl-intel. I need to look closer at
the templates that are generated.

Thierry

--zxepztxp53sv2ewk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn8gmUACgkQ3SOs138+
s6HcUA//TIusmk3FnAe7we2CgaOJ+sqg8vpo8WhTR3tp61urf1xbiecKbG0xC7ou
QJykdzlYPfSJYlEnJrSEakUAfpohy/38qKYtmguUVBfCH2YA3tuCFVy+9ElidkpF
QWbUwHQ5NjJnr5rMIVnZDzcOM52NWfozCF+nXS4JRwA9krPK7FQI+yftv/ystF+c
o8ur3EofGq6BQg885XNFd2FRGlsJsYBA9v6OWwKx4M83tKvlA2u65+vUPsNbo9So
X+7fBWqK3P9jf/r0gBxImInqgkPcNwggNMG++u+Ngj9dxaNa5UDRAC+DgqJPAMef
8C/2nofhRjWRSHxlWSgoWc2wmjUOFv85G3rQDr5cipG0b9Ws2b0dJFPCJf3wIaUU
bYRGl3OoEMI6TP5vdNnST0P/Z/9NFxRWpBEA5tVogpEbVw29mfTeLzlQzNorjppq
ldulosvdNBuRNUhMelHYX6DQ47WmDSdCJBfLtsSvXiiEhtYGHmgg1Z0GtusVAE9j
yEWdNbQi6hJnj69wraT96UeW5YjTQkRqWlAcAYiIkQ/eUWlv85ComEu/IQZNsS4r
qYw4RSmVUbhAcPT1LBNPjYqQDc2kEESrZRnYWFXv4EwXvcDFgSpXIQO3YhHRXASd
GTByz1YcHtIBEjIRkVUGiICQb8ox/Fq3/wdK/F9NTLKnA5wzHcE=
=NXs4
-----END PGP SIGNATURE-----

--zxepztxp53sv2ewk--
