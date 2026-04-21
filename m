Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8006F327D9
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Apr 2026 17:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F6710E8C6;
	Tue, 21 Apr 2026 17:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lc3R4oKp";
	dkim-atps=neutral
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4582510E8E2
 for <intel-gfx@lists.freedesktop.org>; Tue, 21 Apr 2026 17:29:41 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2dec803f9f0so2636540eec.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 21 Apr 2026 10:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776792580; cv=none;
 d=google.com; s=arc-20240605;
 b=U/gEh8lZ267F5fIOtVKK55W3Ql8eq7aLmWRGi3eL9bRiw8fy5Fpu6wMPIwQEAbjOJV
 QH3lr+d2hSlltdGzuNVUYGmt28AA3BADQEF/MU6YfL+ER99xydFqpyBhs6tv9n8UWMw2
 XJT605gUWTvLrRMYlrgO/5oYJQeJ+ha8aA6pwkvUdUa/L9k8tdadcJ25Vq7WAkFqQohO
 ELipF8w0WZrPsJkSdcXMDnq7qxEr38q7/65lzUAtGQLqvE1q3eW2YiVS9YV/kkU6kqkK
 sykgpW1EpSWauV/pOWbPgOYRq6NYLjAIDEZDW7ayc8+S1WR9R/xiLCKrR2Oo6+hFSptk
 uhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=u4UIHqlsKIISI/2Sr907JUuCCB9VWG/Awe+QPWpe4tQ=;
 fh=y9FHM4aMwbBTL3Iel21XypcJWodtkMWSmbgq9qcAxt4=;
 b=Odt6XpYJDIps+bioOXq8ghu+nm/lQ3tNktRYXygrKu5wCIgFXy1CyYqzuUJL7JTzu7
 pT2/qE34JmK98WsYi9B3/oYUW5bYhWMBYzC/7x7+t4Z3iNW6SNKjU76g/Pshdbct1h8B
 /lnumDvqTvMIrcDSjRaG+ognA+Snav2Q9Zg6h60D/Yqkj8ppBi+bueklwxl/saTMSbOP
 RWpc2y9AMI6QXzOYlU6HKAmpISXxoCnCqBKKXD6o9awjpOOJVqVslRts+PYbL0p4jY5C
 E3HpakQrZ6VhRQB00vfG5b6MWQ9E2Fg3nxB8Z+rx7GE+UFnI5imwYn7NVCbFiveRKj9H
 JmqA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1776792580; x=1777397380;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4UIHqlsKIISI/2Sr907JUuCCB9VWG/Awe+QPWpe4tQ=;
 b=lc3R4oKpTwvyuSAGjXzzhk2sNU9BIDHSu5mrhUfM5PW0gD+vfDMy89ep2A6KEYhhlj
 TILJOAvhRVgOoQtoVDNhl8HNhqQCB9laIDVmQuln2K4LDXsGtP4FPfYIWUF6xUpmTxqR
 8IYTcAmyBF0UD9hRP48cmfa3yHKsIfyXacZTxUvy/mi1B1Sz85k/o6VrEMV/TK5YBDlX
 Tr2Tm2H6CT5y3vbK4ZslKP26+au14j2h8VtIOqkDozYK5M/ec835AMmFizEPTYU3OK+E
 OmHnv5sJWCo4Hm3HK5t4Ie1i47OorJvo4iw5X+wN2WRwOhiaD7jY7Ff86ymR5/lKEbOW
 8sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776792580; x=1777397380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u4UIHqlsKIISI/2Sr907JUuCCB9VWG/Awe+QPWpe4tQ=;
 b=Uv2ekrFebEXc5pBJPB4oUf4T5cEgRf3WL8FBta0Lj82THqEzYkxRYK0FTMMJWOoAyN
 Fq5ES8+xjvC2b5bjnv+h7GPj9dUuxldpeudHBeQeZqZnQkGu0+xWKUI+1CBkKDIS3UZL
 xUZLac0nheznWoECryS3W8OlbQBMEaoYmSEORr1jaUq9PNjeYH+F4UuI+F6/k6RuZ7Hr
 jmyfwOiOx9FouE+JNkL4nV2GLwDTmbYueCXlcLOgzrlGx5ihrKD5UsDnFw5HrHMDbAGH
 8dXskuSh+kbqxaeTBW0ym2I1Y63Li9neILTKxLcFaPs2tdGzZrcnGhhuQf77qLc9Ub1F
 g5EQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UUDALptnESb68gqcLyhvZdY0YB1RgI+emA7EGsah7nCrz8aTnaHJzkUceT3r3FhXcsU3WgmwYohY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4p8rT7q1V8T9ud47YM6eYcWDCEi+4/woynO5LSixS8qye01hO
 foJ5l14cKJHKqOLlk+HvSqanxI8e8VKBzHLpSkE2s3meBcP27p3JdEq8b2Su3dg6SsAk8q1pO7Y
 B3fCOYtoV53+9cO+qb7E3qN7HK+y8ztsQHn9ViTw=
X-Gm-Gg: AeBDieuAm2noTEKQjF+PFykQjWy/nhi6QP/ql01Ce1kLVJ7ypF1KKeIp7j7Pz//dvuK
 x7d0K7eyk4x1l6qIZBrroe7Dx9viaYN4DnU58GUPM4D6qXppR3yxGKtCzgDjHsfZMNtAtJ9QvFo
 JjeCGx9OfnMTIKo5JBVHKqueMyVcIJymv2PCDL3L0LpOetQinnFeh87b2tuFV2YY0xi5c/IeT3f
 v4Bwx4Mdk39QUZNHNJMo1FjwC8gL/9p8gY07qjiv8ZIdL2Lcx+orMpnGp6pBDhxoRhxq/A9M6se
 mEFopI1aT1WodONh561D25FMxsOCge9+2jlYFKxdO7NdQin/nWRQI1ci7fzKXzXkTvfFQcD2fk+
 ATkkL7H38iAuOIXhh8T/pIICAk/eG9EPIYUGWVnbC3jUujRb4q0O6XOFw
X-Received: by 2002:a05:7022:622:b0:119:e569:f873 with SMTP id
 a92af1059eb24-12c73b467abmr6841787c88.16.1776792579788; Tue, 21 Apr 2026
 10:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <af005996-05e9-4336-8450-d14ca652ba5d@intel.com>
 <20260327163100.GL3738010@noisy.programming.kicks-ass.net>
 <20260327164353.GM3739106@noisy.programming.kicks-ass.net>
 <df391df3-3a3b-4a65-b3c7-ffe3ab50ee83@intel.com>
 <20260330195037.GW2872@noisy.programming.kicks-ass.net>
 <20260420130318.GD3102924@noisy.programming.kicks-ass.net>
 <CANDhNCq=oizzud3hH3oqGzTrcjB8OwGeineJ3mwZuGdDWG8fRQ@mail.gmail.com>
 <20260421101521.GO3102624@noisy.programming.kicks-ass.net>
 <95651a71-1adf-45ba-83eb-5744bc6d4a52@amd.com>
 <20260421143752.GD1064669@noisy.programming.kicks-ass.net>
 <bc5e8c5c-fc9c-4efc-b1a9-98c43c6a8762@amd.com>
In-Reply-To: <bc5e8c5c-fc9c-4efc-b1a9-98c43c6a8762@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 21 Apr 2026 10:29:28 -0700
X-Gm-Features: AQROBzCAYmmbnxRUS746VNsMzaWktlGpl4hEP9WvBOtUviyQ1j0PFBQSA2g3iik
Message-ID: <CANDhNCr-+x8pTLhXZW=ATHaKTYEmXMPukz4+t8P-FeJ11Jrz9Q@mail.gmail.com>
Subject: Re: Regression on linux-next (next-20260324 )
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, willy@infradead.org,
 linux-kernel@vger.kernel.org, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, ravitejax.veesam@intel.com
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

On Tue, Apr 21, 2026 at 8:48=E2=80=AFAM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
> On 4/21/2026 8:07 PM, Peter Zijlstra wrote:
> >> First hunk orders the first_waiter if we are attaching to the
> >> tail of current first_waiter which would have previously ended
> >> up next to list_head.
> >
> > This is the case in __ww_mutex_add_waiter() where pos =3D=3D first, rig=
ht?
> >
> > Argh, I see... yes. Perhaps something like the below though?
>
> Neat! Thank you for cleaning it up. Those, along with the changes in
> ww_mutex.h fix the issue of ww-mutex_test hanging in my case. Feel free
> to include:
>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

Same. With Peter's change and K Prateek's ww_mutex.h change it looks
like it's working for me.

Thank you both!
Tested-by: John Stultz <jstultz@google.com>

thanks
-john
