Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA89A606A323
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2026 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJJ/10li
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6935910E600;
	Wed, 28 Oct 2026 09:48:09 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317DE10E59D
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2026 09:48:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c46bd7a7345so131530266b.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2026 02:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180881; cv=none;
 d=google.com; s=arc-20260327;
 b=fxTqNqVLpnhKfDE6gwVkBmH/zf623Qq9kqaJ1bS2otGf3kIhOy8iIdc5CariNufm9E
 pKwSqsBPxFwlwNPeTNKxvTKYZB+sfnDFZ5E65taweAL1Q4756XdQCfFhcLmvgmbLW3Hg
 nf9XSnP/FK8a7O+zdCy/o0EN6Y20+PGZz7U3o2/cFRMOrbVBuFolHUNk3kqv1G4LsmQp
 kcJw3ZBK8EvOtykn3/1U3zxxi5LRTX03g9/j+I3fkzybsD8oe7xyh82r2UQlGhCH+YBe
 rl8C+aksr15fRjj2rddl09CGnhKpOzcrjk6xkB53ABDJHnxXZ/qnx1+dq93zwgqKNmoP
 Hgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
 fh=G68/U1Hjs8JkcEZggjXfBzKlYgZHl/1LatT2tlO3wi0=;
 b=jV6nK6gkK6p9eOXx7DlX/2SnosCXBRWbzGAST0y9Q5+7oz7PXvP2mniEtFc3fCUDGr
 c1BYRw/etyKSDrSFr6DpbVilgjlmWHdCICBaZzhWSDb4b0hWno1xiOtNtzLs4+tuPbwb
 Nqaob9OwBioK2NPzVWNOqUowyjTZl5CQ3H9+M6hHkLyWaMgk7Hr+KLg6KLEA/qd8owVP
 UKbvo+oIZM21ljltntP6m8RnnoF9u6T4QcXORShwA3GFbrnnhyHcryfmHwrKOjp++T5P
 yaOt+XRpXrb95EkHdCjsGm8j+tIWsOmKy0Zat8Xgyi+h3mZC2Gi0A968h9bpD+crKHOw
 d/OA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793180881; x=1793785681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
 b=TJJ/10liITcaeE8H9+Yv1GLk575lJThMYiulDUHGJlXnyhb2D1SNbVi5EnDB2Kt0tO
 EfHCFnMg4CWPv/CSpnMP61xnFPNYLiKYFGSgiI6p5o5M498TLPHwk/J8PQ0kULTql5ku
 Dz4+2zQxO9KguHfrYnNyBRIkIKGbi6poqqpNQEO7Y853JHiJ+ZV01P55yz5cHuJaw2BA
 Q5zMiS1b3MqgRzMQRTENFLE6+qhvBwzYRH09oArAKSo+4DiFXr445pIjRep3ZgCDS2tA
 2gGjkl3iIaKlbfa3ue4yJKiwvAnglqe0SKvcGejaTMQJZSQDyu2x+cPIOzRhzPfKeZBt
 pfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793180881; x=1793785681;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
 b=oaoz9jfNyqjt00KddMHcrX6T5OZ534M2/b1D/3Un5200Rg0EbaSM5PICfQqslzsXPg
 j5nrqZ5pWl2DjaREaW81Odt1Ewdlx6/xcYixKeKBmzfP4IB8e6s7R0g+b4p2WznXe098
 qahr4huUXRszzIVrBVeJU79fsEIIT5s1F0gW5ijg1Z+XDhEmjXXUfSQQYmyfy+MuJQml
 9lyP0vqwcuS9i8CDVoTNykJEPWnk9BgvuQ9ino1j36/+zBlMP5zQR4d9+GiViipVgW13
 L56Pwy9+VeDgZbTeji0TRN9wiu95iauJpN3psrcgIFdpyjnfbSk2I1IkfNtj+0BnM7JJ
 5IVw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxw7howlShgAySyFYeo6GigftcivL4WwX4/VlpVLuGQ4zY5SA30YOBjH7QkhdJg77tvN7+72sfWuSY=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLM/GZGtVoDmP4HQOaKLQ9nsY7eOqBJ74K27CqGgp8qnsICmTWN
 pWQPr1XkpRTMcy4s9jpkKShl66evbuV4fjXnrZpvIIFB1b7Y0K4l2iuY0jboBUiIy71Mop6xXJv
 LH/vv/HCGtj4LV/50Kf66T/cpi9gGKIY=
X-Gm-Gg: AYBFou1zzX2rm0HwqQQEoCzH6eSWTQWf1VJIIsiK98gP28AYnWY3/Q9B8UUO4fxdnBf
 yfvZGSqCmU2QDsCHjb8l9TFDOVO6hf7Wf2+wnSwVNfPjQ2XNiIBfwI9q5BDEFp4JsKvHv/02993
 lu+mb/3sGmJeWgoEKX6YuUuEQPWpMh8SfpoLYHwv0YEThfvcUYwCqe0cra1g5/arLahlneBeeHk
 aC66OtTPnwN21AQA3y3O8HOnv+4T2mS+vnYlifD7zeebnIY6B3bQAazpTRsOjUN1E2WoLNNN66y
 kW2RhNiFAiEiZ4KsH0p4wHa9L2FE1uYH1uuc6DNY9pkcQmziIP2iGcYjo/KWSnSZ8esp4/iwe4B
 +rM45w0aqmHnfcTlbWFh6biGqrdiZC7WZtLVEDOzmoIXqzPL+Bi+1N6IHs8Wj4Z+w3IsdrckjXv
 NCrl8q283t+RSlu2HIkOz8YontoP6W4tDduaxlgAEiBdhf5vlWntEyiw+KFnaRES5qttk4Tb1Gu
 EBrTy1U3eiVUaKRKCQGj0mJgw==
X-Received: by 2002:a17:907:86a5:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c49c6357d34mr69949566b.18.1793180881026; Wed, 28 Oct 2026
 02:48:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com>
 <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:47:24 +0200
X-Gm-Features: AclHuK-8N84O0Y9k-BLOPVpeywTja7886uZe3ugxN4eM-96m__IvC7bzZgS0MkU
Message-ID: <CAHp75Vedr5J1WJMrAkBjRSLKA_zf1kt3GD6UhjzLcy9vowxnaA@mail.gmail.com>
Subject: Re: [PATCH 03/10] lib/list_sort: Switch to __nonnull_args() macro
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
>
> Add spaces after the commas in the __nonnull_args() argument list to
> follow the usual coding style (according to checkpatch).

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
