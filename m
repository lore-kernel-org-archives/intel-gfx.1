Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851DF606A31A
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 21:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BfAVtqaq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BD710E284;
	Tue, 20 Oct 2026 21:10:39 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1985910E284
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 21:10:32 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c37b612635bso502867166b.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 14:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1792530631; x=1793135431;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8u8VU+962WndPKMDAHe6mqFpSZn6rgF+uoU28f5/v/U=;
 b=BfAVtqaqyAZRpKPsBUQmAEzpaqLIpcVtCS6husHUmnqUjuQLrcj+x+SUn8MY3oZ9mc
 m1wjPRHpTOczpYQGLueewwFaYb/wj1ogh4cai2nUy4XPZdLz7mKuNx+qtCzJcez6VRVD
 42NLlK2KSnjUIOk4kRKybsZdQl6rPSVZOFTq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792530631; x=1793135431;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8u8VU+962WndPKMDAHe6mqFpSZn6rgF+uoU28f5/v/U=;
 b=yozHGCoe8Qxtff/szJ2LCGwxTbgg2YkufFLjp6kBFfikp+jqxC3URDOBjGSNZ8ghWP
 XTRR27N0BGm14byB6HG+UrVBMYA9NidQZ7wi52zm60Z03JaDSJMbvNvlNoJvGqp2WUWD
 2wXttfMGlo7osLmcRWGYiAntWn8xt7rg8G21e2BK4xlO2eSuhstArwFuVWzjUDNMr9qD
 G+J4la1/gkeF+gKzCOlNgdelQ9ao0BddDRgj12rurdh9oX7pEowLNl/88HoaG32B1J6b
 9JUjAdxgLci1JHCLQuDZIRr3F87HSt6pMIMp6ZkvgDJW7yD27x78Rssb6waBreu1GafR
 fC7Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2Inpunvbx+vWHoJWLcsGlfKgnnMGDZwlWICECJPgrqlXkIpLEFYl4I3VvT5brtlsG3B6QgiM4rrM=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJH9uh975tZ2o13wEbdrZmOuWsxLTHn6XdZIaj92g8g8lnNSF5o
 tbftSUt2Q9cOC1VnfktTCpu/0NahQ3M705WfYy1I9d7KQhNFhkBGH6ht7X6vxh94PHjO3DRZIDh
 xD7AhfeIiag==
X-Gm-Gg: AYBFou3FC8u/xt2wYK2Lc/hX9DwYEQzrki8dOR1mJ8ONUsxBWdTq6evtI6j46qdtZKi
 76vaepw0t++BcenEtqz6HbEhASmBS7JAp8cP4tPVmKrC6NUj1gOSfWLKB4CxH8EuuzPflB8uI6b
 C444yhpSofiW6/ezVOF4JgSIFf5WJnlOhBi39uhFQBR+TKGmWO25+jguKtQSrcbc238Tu+6f7CV
 XcXyvOxeTqp7pzMcpPmjwZot8hMWG+0Td3NFYJc6/SDJBDbnUSitn7pVvGLs/4d2uUThRoYQPnL
 krJFLIS14+WGuC1MOXrc50QaLFu1PRYuIb01orbSle1yMlmVnITmMDpJmcMXUewqduRa3a9Jfpv
 oWVEA5gI+s564btj5pm+OZX0AecZMKMI5eEncI9ESJdYOKfEf/QwZNBiCMOhv7sSB9N3vu5EAPH
 M+hKnX42F+ymhtqncE4ELm4jHP33os5MIOnqDxlS3Pu/VAyywdobS7MSgjppXSapYVSubIrVRPF
 VSsrINiLAQUmsB5VaFT7SE1COq1DPxfgEr7PM95dtqVLS0=
X-Received: by 2002:a17:906:f583:b0:c2b:f3d5:2090 with SMTP id
 a640c23a62f3a-c467975f2e9mr24290466b.27.1792530631253; 
 Tue, 20 Oct 2026 14:10:31 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4678e5b763sm13523866b.2.2026.10.20.14.10.29
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 14:10:30 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c37b612635bso502862566b.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 14:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzzMnngsUXXnTu7cid1Gx5lR39tAKfGpveKVEaP+TODOPkGU/vmJ6S0+I4cPhIi2Eak7IFHn+jrMzk=@lists.freedesktop.org
X-Received: by 2002:a17:907:a089:b0:c3f:7270:1093 with SMTP id
 a640c23a62f3a-c467975217fmr26146266b.26.1792530629511; Tue, 20 Oct 2026
 14:10:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com>
 <20261018152358-mutt-send-email-mst@kernel.org>
 <CAHk-=wiUn9EbV4TJ4J7OPY0fVc3UC+xb-pp=+rg3hRc4jQqihg@mail.gmail.com>
 <20261018174250-mutt-send-email-mst@kernel.org>
 <376ef9d0-b03f-4f85-aee5-46cf20eb00ae@gmail.com>
 <20261020021924-mutt-send-email-mst@kernel.org>
 <CAHk-=wjxtzD1TXZr5iWu0p1+Hu0YZP7jbNSwFkp7AJYmhzhVCA@mail.gmail.com>
 <CAHk-=wipGHx_1Uztmu773yuTM2ka1fq996UmNoJpvKS0gqEdMg@mail.gmail.com>
 <atdqUYdIOqmiqqTt@gmail.com>
 <CAHk-=whrUi2M+whqwS8yfqZ=W9ts6NPOzxzGfBOwOfCC3ooeMA@mail.gmail.com>
In-Reply-To: <CAHk-=whrUi2M+whqwS8yfqZ=W9ts6NPOzxzGfBOwOfCC3ooeMA@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 20 Oct 2026 11:10:10 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjFBSH9M2GYKRnd-jrMGaa-gPBoGhuscJAu4n1hGsuX7g@mail.gmail.com>
X-Gm-Features: AclHuK_6KLe4MdJBM16CPxiFHqLhafyIe7uBjQxeCZuvD1ajy5NbBw09RuGahAk
Message-ID: <CAHk-=wjFBSH9M2GYKRnd-jrMGaa-gPBoGhuscJAu4n1hGsuX7g@mail.gmail.com>
Subject: Re: Removing __get_user / __put_user for good
To: Ingo Molnar <mingo@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Borislav Petkov <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, 
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

On Tue, 20 Oct 2026 at 08:14, Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Tue, 20 Oct 2026 at 03:19, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > ( BTW., there's a new dependency introduced by this series,
> >   if an architecture gets rid of __get_user(), then it must
> >   define arch_get_kernel_nofault(), otherwise it will gain
> >   new uses of __get_user()/__put_user() via the generic implementations
> >   of __get_kernel_nofault() and __put_kernel_nofault(). No big deal
> >   I suppose. )
>
> Yeah. It didn't actually look too bad to just remove __get_user and
> __put_user in general, but I ran out of motivation.

Bah. I'm using claude as a fancy coccinelle script, and ended up doing
the ObviouslyCorrect(tm) safe cases.

And it all really does look obviously correct, but ...

Anyway, the branch has been partially rebased to add the acked-by from
Michael, and now has a number of those "obvious" patches for alpha,
hexagon, 32-bit arm and powerpc.

I think I have - once again - run out of motivation to go further.
There are still various __get_user and __put_user calls around, but
they are starting to get rare, and I've run out of cases that look
obvious.

For example, I looked at the sparc32 signal cases, and decided
somebody else needs to do that part. It just looks too messy, and I
can't find it in myself to care. Same goes for m68k, loongarch, parisc
and mips. I just ran out of steam.

But I think this *did* get rid of the bulk of the noise elsewhere, so
now it's hopefully a case of "a motivated architecture maintainer has
a few cases to look at".

                 Linus
