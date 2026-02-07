Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1B9E81BDA
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Feb 2026 15:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBF610E419;
	Mon,  9 Feb 2026 15:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gB4FYpta";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8310E206
 for <intel-gfx@lists.freedesktop.org>; Sat,  7 Feb 2026 03:14:29 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b884cb1e717so90046566b.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 06 Feb 2026 19:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770434067; cv=none;
 d=google.com; s=arc-20240605;
 b=gqeFGnxAPperUepH6kJxs19idRJPG9RbTAeKzk4hVC66LiF2KnqzmYAxb+cMyiBmVB
 WVqaE9lmxQF+cq2bhhy2AcH2+iwaS51NQ3gsele0kogGo5JF0gXobH6PS3+SOSY2DgcG
 2INIV0frfijDReKBzozyho4BVyFdhVNu27WhyCL6lJsFP4dPPNzWD5mrtWCd1SS5J4by
 /kabDBCRpPcgZUyRqw9OygJ15C7PKaM836GAeHXIuAPQGEPmed7LbbrG/4OLkEUTQxVR
 6n01rBz6W7YO2m3rjtGLNc3xqIy9XAUi0jgKcg3RCrSWSeJIETyGAUqgI9/ybPETAXOw
 4MdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JwKIT6xwtwiVKcmFkakoNKJUwI1sPDl7YihmFR5USBM=;
 fh=czW7el4Z2XOdzLicHWCDOG6HWNQUynYMSP2ybsEugLY=;
 b=D2dt+mhgoMD4FRPNzTj/Xmmd99AR2wnbB81TmdmhBrjNFylP63LP+MxrTLxzSQU+0T
 77QFPbzUQ7epx5yJCu5X+75koHQjrC/+UlXddPJc2CHNO0Y+5II8W0tPRnj68XyzUj1C
 xZX2hA0UxxOnULGgvKZ355pRD8C+YHjK53gUrddRHY5O4cnxMDbmRZ1H8xiQJqcWDwz+
 BIqtu3mZH0DoAbN7xCdbYrYIBYNzAI0qBXHUMNBi9gOK/rp3KyeP+NNM6hh76znJZ6o7
 Y4KK/vdeqyJBWgXv7FzNRg45J8ejC8CCn36k49L9TMUuxG1TpfNjYpdyZRW1V+lUHBN4
 WtSw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770434067; x=1771038867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwKIT6xwtwiVKcmFkakoNKJUwI1sPDl7YihmFR5USBM=;
 b=gB4FYptaOUOiDqXYB6F0nOGS/POsXDDfZBlPByuAP/B7AvDiJM4CnM14HD+AHMhhcc
 fqKAVtSWnaLJontm6IZp2ClD4Dew+IhZb+At/stuaeLdfDStNyGUBVjGkEJyPxu+HGo6
 HRMqkO0liP5XKX8u+8K4CPtk6VC3V4hpgNgZTbF94yrj95LPwx7LcXX9dJgK8+GC+U76
 5woipISwoIiezN9x4PIA5dccu9daWO1+TTET+gaSe8d+XSS5yLK5v+HsD8hyUGpRT3ha
 eD3xWD2JAB5b/T3mxBFXAmeKqufzmtqy9skRkUgYEnf/ceNzXftFQwj8CboRXI68fUqi
 4tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770434067; x=1771038867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JwKIT6xwtwiVKcmFkakoNKJUwI1sPDl7YihmFR5USBM=;
 b=uHsM4YTPEwVogTr2sFQkBfPAVYsXyK6VxXEVVXR+K5cTYKbs3dtOLkWJjqR1YyzhKJ
 3nZMmZ0vzOuIla1RZDmHnXJgZOCgtRLctug2x/XtoKT9a0Eg0mFDX3AJJ5zrbKSwDg/O
 mSiJCJ2algVHRgxy+NIrfFSzhe2eX0JBMb+0Fu85XQVAZ22jtfRnXGWGOKSJoqvmTJNy
 tVsaNT9lMjv6i2Zw0W2Hd5zw4mv3U3gtXPTD/71BlwkKsnmwYz0ySqOYyKKRSpTl6p/6
 1ReMPK8nvWIvS2tgQEyXWQ3PiN+QLdp7hPszquM0tjIMNXlhpNVRNOddBr9n5K494K+R
 jf8Q==
X-Gm-Message-State: AOJu0YxGGgjW2Tbs5nnPZ+rx+z/SsofWuZ1akDIwR1Un1oed2pU9Zo8T
 WCqpsfcngepFku7rknOIIRJEZfL7/xp6p5TqVYQvSRN+WLT1szZkjmwq3VdVp0ocwrq7RWaypnT
 wlzId15e8fXuA/VCVydkos/oHI7ADbLqpbzS4Fco=
X-Gm-Gg: AZuq6aLS/12Gmso+DBVeZhrDdo7SYiMSfQbEJ4pK3XXPvZeAAOZRRAd5fvYcoriOrwt
 WgV90Uh9zfWgGWIGexdm6YLGWBtyM6RE1Mr8cSxzSpPh/l7upeTBV4+4P8J5tZTgmewHjw/Z23e
 oho7v7VmhzR2tSjithjXyK2fQutmufYMVh1cDi4UKDcv6pO4ylr6Ir3EkvAxbmQcsKGKbwKbnL5
 AqWw9e37vUENMuDqGwvTYSATduXkMCpgJ6T8RlcBHxtEQiHit1CVDYkuCm78OIeSiivwA==
X-Received: by 2002:a17:907:3c8c:b0:b79:ea1b:f13d with SMTP id
 a640c23a62f3a-b8edb7e3f69mr340931466b.2.1770434067254; Fri, 06 Feb 2026
 19:14:27 -0800 (PST)
MIME-Version: 1.0
References: <CADN_a6Ne4Vr6knCXdKtCnB8=et6OK7PEZ8F5bpyGamwyv1K9GA@mail.gmail.com>
In-Reply-To: <CADN_a6Ne4Vr6knCXdKtCnB8=et6OK7PEZ8F5bpyGamwyv1K9GA@mail.gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgVG9sbGV0?= <jerome.tollet@gmail.com>
Date: Sat, 7 Feb 2026 08:44:16 +0530
X-Gm-Features: AZwV_Qjx90jdmwsUl0cBJilDjFdhaDlBlzQmRDYcYkkgyhese-R3MirbvB3lwLQ
Message-ID: <CADN_a6O6-iL+BS+0gy_AisiJTYQ6NGqSKXv608MxxETCawD0jg@mail.gmail.com>
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
To: intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Feb 2026 15:22:05 +0000
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

Hi Ville, Ankit,

Gentle ping on this thread - it's been about 10 days since my last
message in the thread (Jan 28).

To recap, we have three potential approaches for this fix:
1. Generic SCDC polling after port enable (current patch) - aligns
with Windows behavior
2. Panel-specific quirk for affected displays (Cisco Desk Pro in my case)
3. Fixed delay after SCDC config (my v2 patch from Jan 14)

Testing showed the delay works at any placement in the modeset
sequence, suggesting this is a timing issue rather than
operation-specific.
I'm happy to implement whichever approach you prefer. Please let me
know which direction you'd like me to take this.

Thanks,
Jerome


Le mer. 28 janv. 2026 =C3=A0 15:42, J=C3=A9r=C3=B4me Tollet <jerome.tollet@=
gmail.com> a =C3=A9crit :
>
> Hi Ville,
> Following Ankit's response on January 21st where he suggested
> considering a panel-specific quirk instead of a generic solution, I
> wanted to get your input on the preferred approach.
> As a reminder, testing showed the delay works at any placement in the
> modeset sequence (all 4 test positions succeeded), suggesting this is
> a timing issue rather than being tied to a specific operation.
>
> Three approaches are available:
> 1. Generic SCDC polling after port enable - aligns with Windows
> behavior which also performs ~200ms SCDC poll post-enable
> 2. Panel-specific quirk for affected displays (Cisco Desk Pro in my case)
> 3. Fixed delay after SCDC config (my v2 patch from Jan 14)
>
> I'm happy with any approach that gets merged.
>
> Thanks
> Jerome
