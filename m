Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C5606A31F
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2026 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Maw9n+Tc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D8010FAD7;
	Wed, 28 Oct 2026 09:49:49 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3AF10FAD7
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2026 09:49:42 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6afa651700eso1206420a12.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180981; cv=none;
 d=google.com; s=arc-20260327;
 b=nTKA+cI3+HjxWyzvYiMSWIXZ0ktgsP683fj9SnO28JiEr2ZwoAwfNcEowINAGXGD/u
 +EOu7+mH5BZr5yEBYa70AHljVgz9w40uXKNVxeM01j5yDkUQNbbZahV06KpROEDX7HR1
 rbIJDqgElXd4CwCioC9hsSyuiZBVCwYMxp0R0/g9VhyEw9KR+eAInbecnbpAYWWu+dQT
 JMRPK6aIXo47QqptFBRjdhj8eYcaTnLJ1PI1CDPq1OYRZnkheDXN+Yw6ZiJKecLnTbXU
 gDOq3H6swFS6Y+Ab2QEcf1jH0affRLGW+J09GWxjGns3eiNV3hl8VzZyc7mCAAgMfVGg
 70qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
 fh=Y74sgKQN952X/lLpY0n3aeOKgusc6J8LJtR91KTU8Iw=;
 b=V/90rsaT0oIKol/I/IBjtmdP/bNf4EvJSv3c3hj4fMoWC0WFRa18nBpO5x82borXFJ
 GKvqThz8HWCgVFst5uwCQjtTkuNclIRqD1Pag+2B3AUYHiXSq7hKsyiM50dSVuMSVOL6
 UNXbfsFlaVUfz1DgLg+i1wyJCWWWZiUVM2/C/DwTn06k4kFEU0i1jOYOZdRoYPoFyN04
 8XGUMpqKEJfeKI+lRUHqJOzvxj/A/F3C5mKnkXizc40VquRkp3xSD4Y26WRvJh3K9i/7
 rwJBdZyRJ1/Jln8qTwj8OzG9qKLENHonxNldHvrEqdMDR96YVLNAQwFtcNHVyjXnfPaA
 NQkw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793180981; x=1793785781; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
 b=Maw9n+TcH4EeZ+50zm4sza3sDbL9oGQlrvaSKk/UYKKaYdF+sdqqOo5Ba+SSTfh5+H
 yNsGSwQbLT9ze28aZp+DHmxrgvpcl5/6jG2/Kon28EiHgK+KK5YJV1FjRWgxlNdw4THc
 jXn2kh5Wqt2i4LmUXSsV/qV9F2GWFE8ivCeZZrkVK+8VOfPOSc+ZsYbDAVb5hPSgXzWk
 tTlGejzVX/A8SGO57xOR3nX7nUB1R+2Kt1568PjhjJ2VBa8uaunZs7M+7VwiMZuQz2mN
 akLfn29QZjysCK3NHRdE/mDKq4dlH53hquuZKQO2Dq8h29NWodRciIfT70BylAdMqX3P
 buIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793180981; x=1793785781;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
 b=ktZjh1mUtnfelM6phJXeGa8f04hVxOJKFVhGvs+vMe2/VZD0kbsYZ4DuilUE/n8WzE
 nBL8h6vGIZ/DghjMeJquv49OI5bvfC1UijlwSh2vkTjPBbuLZEoJrw74Za8PypD4KFCK
 NtJYfG7seio4HvJfyKcC23dArt++pUmkWytyzWwueQsVc3DHre6L+0J2NgUAFc39eV6H
 l5JH70iiFD1+HrZ/tcZgEN4AbxuM28w1RHkzv0CiBF2XxLz+U70aYKirXk18NAfuSzRT
 2efY3HXVj0TdR1hfUCMmRSXw13DUKHAcswH2iNv4mHWW3WNBHOTUkU/3b2qz8aEdLoMU
 CgGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzGQYfr2rhBk8baNaO1w6X7JfVX08jsTjl9MtNE/iT3jIw7X50fYsRRRgG0Jm5iwrDBBiJXeE64V3w=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYI7gXpjCjpcZAHXDw0266jZ0jsjxeGO+xGH7TNnikTxtBP4cfuJ
 8o8KVnCygabcBRUzaSV3B064JfTTcKFTCWroXReCqihsqOlbfwOAZszXXOiviBX3ZInheuGMFDd
 KheKoCkhkFsTyLn1qDIWgi5j463J9ykk=
X-Gm-Gg: AYBFou2rYxc0SOB/TqQW/AX38nlL60BKxq4VvuqubGTxPvSfGQhkbH9kMgHJ0Yad9mX
 6QxNleId9Ke17FcNoUcmBTjQTzd45AREN2wp/MQfmvM6+pp6EOYOS+cgmdsuYZEjF6VIjKi4Gb/
 p7kwXBPKcFbg0n394xLW4hSdR34OSLqDRqTs1dnnB05b6ql0RzptrH3fDEeI1qENlJGB2QzCDKY
 8FepnfmJMKupFBmsES7XsjtF/mefgH8I+OBulvj8kxMnzP+3JJ7v7cCCF8qQM6cbLyyTVkixsLC
 SM1KzjfWg71SCPiLplU7NcoNMvDO9hj/d2Ornntwy6+Fm/PYr+SVYVvuSIvWeHzB0/mrDaM/rZA
 D1AC5bvij6iCf1yKw5EncLdaK8+jZZQLWuneYglGMg3NiClcCA7BpgZdtsCD8r3cI5dseeAQcSv
 JpphOJPe7ncAFveT/ZXvdptPuPAO320xu3QdmLLFN7gzXopop7Y/GEBnUFOA6/z3pk7ejlqdz9Y
 YRYH9XV19BW45ZAnygqc2Vywpg=
X-Received: by 2002:a17:907:d48d:b0:c42:82ac:b6a9 with SMTP id
 a640c23a62f3a-c49bdf7de97mr167322666b.29.1793180980909; Wed, 28 Oct 2026
 02:49:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com>
 <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:04 +0200
X-Gm-Features: AclHuK-kwXGKz5n7QFXQ4iO49tQbUX582-rj9xJLuSYR3NDY9XFvg2hsu7UGHjc
Message-ID: <CAHp75Ve71BfcWr++PfQPiOc=OURNn1-cdJey=M1xBVCb0HhHQw@mail.gmail.com>
Subject: Re: [PATCH 08/10] leds: pwm: Switch to __nonnull_args() macro
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
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
