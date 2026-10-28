Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917E3606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2026 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bz3+WK9v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DD210FAF2;
	Wed, 28 Oct 2026 09:50:26 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD82010FAF4
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2026 09:50:20 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c40e30c26a4so297337466b.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2026 02:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181019; cv=none;
 d=google.com; s=arc-20260327;
 b=YdG1iQ8Qt1SpwoamJSMzrzXb2yWPREOUjTbXAvQStIg+edgRqPZXa5aQakmM91u71H
 NXAQf/l9x82EcXBRWf10YNObyFQYX05qGaI4BIAQyXCbiW4HjMpH0+5MpJ5Dxdru/zaB
 X3/jJ+Zc2w2X/iSNzcRHQifZfzpoIFQirMVyjk7HCgvkW2RxW4v5ZhT+qGnneUvfLHeu
 zpS+4mXwgAo2o8X9RlsTNOTE2NsCtz1fOIWRWT7Gs4WHNR00IePjWj18v/15WkcsfAaD
 35Un03Y2VN0aUNbMJDe2HsQbXGXDUNbs5enVi/RhdYSNjetYRGauPZuvQQiNadRCqxBM
 PoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
 fh=h80xv4QQ/SE2lR/e5yDnBYwmCN3EHYy7f/DQTUK6GuE=;
 b=ramip2Mufx0CvLIE/bHbN1aPD79wPEpzJBgHSZrRzRU3B9d9CRcGr7mN31yoCdncvB
 jQ9Jzrf65GHGAoL7rzWKxe/ykUv1bDYiA2Ydsyx0doOfGW4a9ay4smlY8CKSwhGOdIu2
 s5g5y77T76omKaDUzHGgiU/MjC73CpPmrZP21GJupBjUkCeOFI/zYv0J/Zzk/JMnQV4W
 WgdDs7sps9PdeOjSJ2jdprFCHvah2G0+NvkgByXvwVTytLsB3MuSjLteQ3hBx67/LMkI
 QHqKeoeeU27HqXeeDeaold5L4lAsr+ttcScHMPyicTSVzHRuMvGnlgu3IevbLGJzpfCf
 ZBOw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793181019; x=1793785819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
 b=Bz3+WK9vyGesa2exLO8XAnKJYqg8SZ6CJqaz8X6SDlrZvknyX+EoJESBClkEru2QRC
 cd9exExnGWZrfCmoGeN6vTRLEQe7gCpimIiaNs8nw2965xqqgBIfIr+luxXR9pXwtV/w
 kR5bRqgIEBMZwOqvfS8oY1g+XDyKYq3diHi4QWifoU+dhiZjEGIGpaX1ra37qYWrCVhl
 SpxA61OOphs1MIvEu6a6K8a02bM0mQhC0iRGYyG9OvABuv4ZB/Y0CGcRdcR7peSvYOwQ
 CO5mjIDZOq/Adp7OBTFX3dhfCyh0SwXF3kBSiRDl21E5VlWywYZC75SakzozEmw6fbin
 BU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793181019; x=1793785819;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
 b=C4oAtSRfCl8F1Q68JiGhDDunS9YSKTeTZn6En+H2JaaHraPwhH96sOfyVvY94oxqtl
 HfB7UxYg9MqbjRyoUBBMNb1ziKfp482QmqwDfVBuIJUKrLulqM4qhwUX3RVlS1072nYM
 UVsEogoeKAzcf6XvmvlKwAC6fsrVnMboETtiPMbWf4fJrIHdJBs4GNITJIiHEuBp7zyR
 0VnvEQ4T23VcpP3jZR3ljVlToknjtEUwv/kpwxhovbvf7kdwvAJOGxmK8mksv7roN936
 3g+mrKPW2EnweWqAqB0sm9T3ojDZ3O+HwXAfXLUKxxRAWNazJKfBWqSPf0uCUjMDol9L
 qZFQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx7AEeCi8WmToQxWR6Vj2RRz4BVrCYGrlrs/bwUxwCBU1WafVZm+BtGBz7bf78/qSBCLcCXM+b3xPY=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLvRGcK+8j5S7DDYQAL2kW9LK73s8eNdiFPEMrZRivj63m77Ei6
 SgYlWLpFfa+aIVz8s7PSIu1AleGpk+jBIjXfMaGCg28Esd8OeEyC1+6KM04GijtWrfKhMQWqDmC
 3avjzwzNNDgw/fmFVafIEmdYWaNfwIQY=
X-Gm-Gg: AYBFou2NFeXIH/nT2iUaUYLkM/YgHho0lXjSBAVixFddRUOacw2BrmhKrDbANE0aACr
 F5XdFKI5/qyMPfyMBBKMrEOsI+lZzecsiXRUrps+FogcbeL90zXUy4MIL8TBPfAjVUvfTNNcA//
 ltuA6lU9FJ6SNywxyupY+E3mGWtcvxLkIyPQhK+2TlFDgLjw08eynWPvZfiCsSGhmTdBluBYhOp
 ZjkJ3lX//+JP8yipyhOa44qCn3Af8QmPYS2Cd/COQurbmfJfKseuAkLj2jS2RtmFStsc9O9Ckol
 IrLcBJRPsETe4Whf4r9/bciTKLlK/9Xs09iKN9X3m1t/Ko+0ODWsmZyaheUNOtqSab7hLebDlaK
 FJsT2NBhYyV3X2FuphHESYTm7dFa5hIKdkVVsXvPi7sHqEyvD8k58HO/p3d3Lq2jbFwVLzysFMk
 4lchXqrzNgG5bGvM8dGumYv1fbkelCmZn4JVhf55Ifawv8Vj46Ggn0CJTGVrkJZLV6JNatEyiid
 ya8mx/zUtkvVQsHqAa12y9G3dB0tSF3lNFeaBdv3TUvs+w=
X-Received: by 2002:a17:907:86a9:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49a739f8dfmr484567766b.14.1793181019107; Wed, 28 Oct 2026
 02:50:19 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com>
 <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
In-Reply-To: <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:43 +0200
X-Gm-Features: AclHuK92we6zl1A1tCfKfYVeuXltUG4Bsfa-fRzr4orRkDVhJuYkTUAxt0MOtcM
Message-ID: <CAHp75VfR2i_PPZwSG2UPaxShU5L=FsSdEAT+0iUMDKAfugbRsQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/i915: switch to __nonnull_args() macro
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
