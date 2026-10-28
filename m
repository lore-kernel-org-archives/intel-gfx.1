Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FEC606A31A
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2026 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TwLlIdaq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A881510FAED;
	Wed, 28 Oct 2026 09:49:01 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDBC10E59D
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2026 09:48:54 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c450ab1483cso108225266b.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2026 02:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180933; cv=none;
 d=google.com; s=arc-20260327;
 b=DskJrvGUv2LUWDtySWemYyu5WvsxU5/Hhv+X98+vz4Ag6RJXJ/QRa/WM41Gx/cdGff
 DKRxb22FNL/YpA2V8CkL8U34LxR8T+HIO3bm8fXJD+yTAmf0+oPqrst1dL0McP4vG2qn
 znq6fBPK0pd0sREJi8aOe/r82Nn7aQR2skNSoFT+d4+S7wRt30Y1FDnmdHUyuNBje2d7
 CCU2MvngxIXpLuW8+2A+cKxJ4E9roYeMNTgTmIfupPtgojdH53Z8SWk2nHtbTYcomS/5
 5ld6+1POFKmPLTIi5bXHmoQYVZVAzq74fIx7kUg82ftwvaOYA6nGDZFWJKAywM7ORuaO
 ErDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
 fh=0oSnXJLVrKQzXAcpsrO4SAMnXom2hGvY4GlxiQpdy8w=;
 b=Z/mXv8AI+dMbWA2Dc7pD5WsrwvnoV6azdlLP42a9lIvQFLZepw7PpmE+F9hrDy6BR1
 8IcuVCK4b8YyDOJpKc4CVaEJIjNd4EMp+1U87C23/ofNPKwhSniFW5XVcdDLRbpQDaJn
 Rld3UaR/0kDQcA/3jjGWkdqh5UYndISgWTv+/ocMNW2h1SP5NMldha8MJUm+91qNzgok
 rfhUXEu0j+k1J7LchZxcDkVwM+xDMId96pOPePrQu9ImOT2eQ8kdzjldZn7pyzzBXUmr
 EZaUu1a2j2hGSwVgu5a60u22RlOn2KTAuqV0fdoXVuqLPi8q6tpc+vays873/aiHYOmN
 +4+w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793180933; x=1793785733; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
 b=TwLlIdaqR2De+/frgxJauvxcud7Nw7bMfWzjPWwN7zpYItK6byIN3C6v0N7kkY/3Ox
 iQSKLaSbUhxy5UvLmw2lwMJBCSE+708ktUpJAg1+ctefJtujtLKnvUGYNdGhxoZxO62B
 irFNhk9yVBjq8rdqUOSiDIkOH6L+ZCX9phI0H4Xoa0ifr1jUwZ+QaCYqTGZ9V4v/8BNy
 MEo3BKm21keztiOilWg6UlQELwMIk21KD5xqPWqIAxe1sROoXE4I937Yze2aysVrAxqJ
 MtifkNbQFSIX/cH03pYvqhZrrl/5VN5C+quumaDa+lPeyP+Xk+dO3Sizf26reCc1QIsp
 O8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793180933; x=1793785733;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
 b=rizmowR21kagguU2f4TFuTlHtpVRbwcHD8qkZ/8amFhvPCASTE8K6+/SRkSVVsgc+a
 VnMta7qJ7uVQPtxwbwpfXOwk8LD9Qb2QKuWXSI+BUenHTVLZHK7ZSbnXlZtoTWwbKof7
 vVKV7UOab+jjs8cE+WIMyj9SXmSUT0wjJ80/jm8fRti7BKwChYEfzUNZXg2JRDM2xYP5
 RNKi4KTbruoRseK5hNJH2NuW11gnlQSDZOUAN0IN9N+JcPfh+9u3C/vckTV95v4mFiRz
 cGd1+oOUm3kdjJ9C/v4JA9PPDFs8kS/qOkL9Ewvp2+WcFN0KqYz0MuxVE2OHhGzUnDXa
 7JIQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxMnztibG1R1/LYK7Ekg5fhxQYP+g3C+xPlZwI+mR1jjhLqCpln3Kynm/cJJNgxCQ5HtFB+VNPLMVY=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJIej1zK3EqsXPxtivi+sYSnFSohqnRqQj80eF5+VWsEOsjRfkj
 Ci6FNzrfun5U87DnumR902UEwLJuk9S5JhLNXDHHJ5LU57c0upAIJWkk2/CgMI+yeEZWVpn15MF
 yFrI9mbohk8QjggOB7MFoXYYvtYkmjW8=
X-Gm-Gg: AYBFou2D1Xk9fLYbc0doceEHP8FPfFuddvPfFY51alDa8CtSoEwFnxmKab2V+WuZARA
 mjePn8zOKsMkB3fH+oJAXMZRPy2Um3a5qZDy0ogpc4DkvlXTu/jAQ2XfF7uEOY0a6BZ5i50A3Au
 aZSexYFwfCMowXllbxk45LORwhMC5divwDn6zulOm2Yb7nojtvrbTOU4QELVIzwvNr32+ozEWXd
 EakJ3YU+W8y4eBBA9c+JeHzTjdkXrSkspCOZYCdErW91QDoWTgixQtfH9qONFmWQFsBfMnG/UG4
 PYy3fWPW6EvsbkFcTiu7jt5Wwuc+Ur1d9R8xNvzPlUQYklrme2fWHHhL1YkACC8X/wSCz+XF5y2
 4Amr3xowJnOnvB27Y9IjzQ5A9tuDLl3g+c4dwx7HAn/mzHSGOtWJvbUjfXQjsbYjWfG8U2Aw6Q9
 fuc+xsWtIz+3IH2B31rJ7kkSq1FZ//2+eOqkUGMAozR9HD+3BWEgMMKxRdMudTA8mvrXDWp2PgR
 Wpcg/kCMJMpreh3v4opadkMDA==
X-Received: by 2002:a17:907:a893:b0:c46:8b51:c17c with SMTP id
 a640c23a62f3a-c49bdf394e6mr156034066b.17.1793180933042; Wed, 28 Oct 2026
 02:48:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com>
 <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
In-Reply-To: <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:48:16 +0200
X-Gm-Features: AclHuK9bqVSr5ebQZT2ja4gGk1wmv0GUJ0T7y7aJfJNVsg1OI_1bv2lVUKDS3Hk
Message-ID: <CAHp75VfJ-L5ELAttN+Fz_Co2E1KHumwLZAEMXFMhRubzgVLqug@mail.gmail.com>
Subject: Re: [PATCH 02/10] string: Switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to
> standardize nonnull attribute usage across the tree and keep the
> attribute's quirks in one place rather than open-coded at every call
> site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
