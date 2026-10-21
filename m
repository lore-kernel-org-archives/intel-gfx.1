Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1731B606A31A
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2026 03:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=E0BCTeY4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19DF10F8B1;
	Wed, 21 Oct 2026 03:01:11 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3194310F8B2
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2026 03:01:06 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c45551fa84eso23494266b.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 20:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1792551664; x=1793156464;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6vPeyJTMHdyRvdIHSAi9aE4sr1TloBvZFIlu5+rPWzU=;
 b=E0BCTeY4enWCnvEgvrdocP60YqywCNIoH5f4z3sfJR5f3wvlRf+pGxNYqg1DDToyUx
 go3HljoDtD5sLyE6TmqXSTljDpQavLRaLNulnnstPSieyvsTm0z0f8ioxyarDQOpsfBD
 gWmns6MLI3YqIVJSQWDh5rv4HCPK6go7RsUjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792551664; x=1793156464;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6vPeyJTMHdyRvdIHSAi9aE4sr1TloBvZFIlu5+rPWzU=;
 b=VH2PukApnLsu/c/wWbq2ZC5IFYkhWLEKm8USRqMumgFg5/yDoLhAduODyVQUu7pEKa
 o9PSO1H+/mloi6/8tO+zpI8SkPlyKODE6ha0t01uSdIJfgPNANx+OIga5ko4MlCp1HzH
 KQ08oUJVPDgSNnWjd4pb7Hz/tOOJ6KhcFLYyplqNyumNcekBwIYXmNgrKHQzqDFiPKam
 q70eB45XLpt7kSukJvcH2/kYwNKmGMRS1DMfRcbTY3owczCwm5Mc7iJH1sErfim5PY3M
 MvH+IXLoiFBQFBfoQsj8xmDyHel22bD/fecLntWy/wNt2AA6MBkAsema2hnE2htVbhhL
 f3nQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxZdMiU0YyMOyFdNmGpCJ7qoJ7Pbc8BzUwQa+w7nFfkkC4h6uJSI+VbW8XujZtPc8ZHbMuUcczO+uI=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYI5Hgb8UMZILluQaWhTo5O2mf+RG9wtIF1hfRCH4JU1JOD+zMql
 LnDT+b4C7cLYVGteR9767AHkYzoVxDGeG9h8PGBDi/OxVyirYsk55Wf7QRps+agtBl944Aa1TJ0
 6VqG+Y6uwRA==
X-Gm-Gg: AYBFou04aZxEqc0pc1qA9eKbPpVYWr2IJ7+7HkCdUedAP9P5zM+GciMfCKpHWvgbITz
 dlSCze2ISO7Z6YSQRSLRgqXRizMFHrhEQb6Vs6spslnTL/CL26yaPRLKDuIBGq08zla55J72Nfz
 5MjOVoETtwiFz6SK/ZuOlyYbSXX10wv45NcFdlJXvSEA1IWfrnWxe0neR3DF10obNGIjIfJ/x94
 vfmXTMBk3t7Ivi0SvkRSzRAYbyt/wtUZgNI5JWVAbXDu+NGHYvqAbJvDIxXlDQqwms7gfebmjaf
 2lAIQL5g7pW7XZlmecAnVPFNC1D3S+1+Mo4hsRat7lxkbuexvCXuLIBgU06bWDx0Wdo12mR+B4F
 GgaM32iRYHDjg8w+FE+caYOSlI7MpLXBPBo0nAhhwC40uL3eNyyuEWJtR5NQDbL4NE3tuk4rd/y
 ka+vCkmWo3tsssBVXAiYmHVCyObYkMYVYeuEsyniDSROJOr85wcYnXApl773o6RJigQIqppJDHr
 J8vTLlvtmAT3p6MyOvoIlr7eLCzynGNmnPvAVYZsv5jpPJk7pmrzKZIF9SzgkdA23kWvrMutWGp
 h6MrcUQjP1dup8lYmB0J3MeAEHfS
X-Received: by 2002:a17:906:794f:b0:c40:6ed9:b962 with SMTP id
 a640c23a62f3a-c46795ec704mr56465666b.26.1792551663981; 
 Tue, 20 Oct 2026 20:01:03 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4679037543sm31008966b.85.2026.10.20.20.01.02
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 20:01:03 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c45551fa84eso23491266b.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 20:01:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzcCn7FdiAiLShMgddIiH1CJPlvf/CLi0pARP0SZOY/AxAeo4v7irbrNRtZbH0Swe6w3CRjnzyqaUs=@lists.freedesktop.org
X-Received: by 2002:a17:907:3e96:b0:c41:6de7:7dde with SMTP id
 a640c23a62f3a-c46791027bcmr73264866b.4.1792551662590; Tue, 20 Oct 2026
 20:01:02 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiUn9EbV4TJ4J7OPY0fVc3UC+xb-pp=+rg3hRc4jQqihg@mail.gmail.com>
 <20261018174250-mutt-send-email-mst@kernel.org>
 <376ef9d0-b03f-4f85-aee5-46cf20eb00ae@gmail.com>
 <20261020021924-mutt-send-email-mst@kernel.org>
 <CAHk-=wjxtzD1TXZr5iWu0p1+Hu0YZP7jbNSwFkp7AJYmhzhVCA@mail.gmail.com>
 <CAHk-=wipGHx_1Uztmu773yuTM2ka1fq996UmNoJpvKS0gqEdMg@mail.gmail.com>
 <atdqUYdIOqmiqqTt@gmail.com>
 <CAHk-=whrUi2M+whqwS8yfqZ=W9ts6NPOzxzGfBOwOfCC3ooeMA@mail.gmail.com>
 <CAHk-=wjFBSH9M2GYKRnd-jrMGaa-gPBoGhuscJAu4n1hGsuX7g@mail.gmail.com>
 <CAHk-=wj51-syPoqMBLnxMeLnsbCMDMXfKzKZCtOHhwWEk5DeRw@mail.gmail.com>
 <20261021025403.GAatgpS1rcSTOTs8sS@fat_crate.local>
In-Reply-To: <20261021025403.GAatgpS1rcSTOTs8sS@fat_crate.local>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 20 Oct 2026 17:00:46 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgDm1nHurWJLESiLeYr0_0yv_F7W8YbvrmMEfbhxM1e_g@mail.gmail.com>
X-Gm-Features: AclHuK9HmsJiPNq2pQeGfp6RqCtErZ0oevbHZB1cNI1n3cwuB4Oa9aipnTwjAUU
Message-ID: <CAHk-=wgDm1nHurWJLESiLeYr0_0yv_F7W8YbvrmMEfbhxM1e_g@mail.gmail.com>
Subject: Re: Removing __get_user / __put_user for good
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tom Lendacky <thomas.lendacky@amd.com>, 
 Joerg Roedel <joerg.roedel@amd.com>, "Nikunj A. Dadhania" <nikunj@amd.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 at 16:54, Borislav Petkov <bp@alien8.de> wrote:
>
> My SEV-SNP guest boots with it and we'll run more extensive tests soon to make
> sure nothing falls out.

I don't know that code at all, but from my reading it will only
trigger in fairly unusual cases ("rep movs/ins/outs" that need
emulation).

But the replacement code *should* do what __get_user/__put_user did
before, just with a local helper, so unlike the i915 case it shouldn't
actually change any semantics.

Famous last words... It's the largest of the patches (well, I'm
ignoring the ones that just do multiple accesses to the same signal
frame - they may be more lines, but it's just the same thing repeated
over and over again).

             Linus
