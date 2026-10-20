Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2969C606A31B
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Cjr6e+Nj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43BF10E42F;
	Tue, 20 Oct 2026 18:22:15 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1CE10E42F
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 18:22:08 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5bcf21cfbdaso3108311e87.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 11:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1792520527; x=1793125327;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AI3sBbenOq3VZh+TQ8EVyC3GkeDOeDtX825lHVuYChI=;
 b=Cjr6e+NjhjI1+i0JjJ1gHMUxntm67d0k+3E77Byoq7u7CnCJQkkqjASpaJXWJeTyig
 r39jt68pe6fOpiKHIxZUuvyspV+8kx2AqCzsVqY9pNkNMRHR1s7uzRUkvADYkT8ZMkvb
 LZyv9jIIUJyTfwrX7mojbwmdxUiR4fRpjRbAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792520527; x=1793125327;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=AI3sBbenOq3VZh+TQ8EVyC3GkeDOeDtX825lHVuYChI=;
 b=BkhIicWbcobrmV7Lwo4stiLlE0heDHm76GhTT2SJgWBjLWQTd5CB3XQB+YKZ1MVEXh
 5y/6vsvfoYgaS/V9m002SyzDWgI3ctI9Jph84/ct3OV5q7i/Ty2x3XQx/ZWpBE7XR+Sr
 bPP1sU2TqpJp7XVgII2WOvcvXa92RQBWq+rl3yZsOzPy420Eub5/1d/GuEj90zU+d0mp
 bfVXUbLGscD1aCNWSZ146N6hzZp8nrePFxv9d3wuDGTDIrfQr9R1F18v7RTfyWgKFIVw
 hgl6omvuw1Sc2upObvXUg8+kkmSEYk8U8WbqgZ9kNYyW3ykxmP8cT9+UpdhnS7p2yzRK
 JR3g==
X-Forwarded-Encrypted: i=1;
 AKwUvBx8kIV6I4pcHmrGegZ/MvXtR1RelBn0WwB41SwL88oOw5fZ7ruwYkCmq4xJkjxBo0NPM/Btts1zGtE=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIM5UZ+l/IU64sd6R0oWG7dQoQWwXcGguNe1wyX/gf2SLAM4tno
 vgRF/q88l7HGbIFol4E0+zajcxaMCYLHjOR9ofeSzXTKWbObmm/khs/EwAxhZMtBS59aUC2k72V
 702qPCHwt5w==
X-Gm-Gg: AYBFou0ydORJImCCiIxvmRmun/NFuANIFl/LDEp4HOsuQB6umtJsEDr+Ce8o16PjxdX
 dgMgfSDFVWKaKhuePTENabz5XmETfujn2XqFwT8EEqJceAldwAc7/iv9XRjiU468aDNcG+ozopT
 O7uTKau+8AFd3lyk0cnRAFuwAlykJ+lPVEp44pwCprXS1ONCgrI/azzm0KS2oayol7AGjwfCvUh
 pRh2FksRMK3WZftcjssa1Ku58rcLqMZqAU6whRPtl1ZFqmCO2D3wZ5M/jJOoHcxEEQ69bPKc+P2
 8G0aC6ETlgQ5qr3f6/zSu8iCG5GtzkDbg1YMwwqyG0VySZBh/4LVsSPJq+5EnWbeufsHcFgMcLk
 J8Bcno2flUQ8TYVsZvVk7fXLjeoCOeqAkjLDSH2DskB6zy2UsN9e4MHAoRkMXRKq5dOWoJBU/+0
 FYvbG9YA8dHzIydA4ffDv+z/DoD97hdcuFIHkRYgIt7cnwejlMZz2fJ7QHkXuLecV0ZZzpGB17J
 CpCIsiTtZIZXNLkiP4e1W2Rm+T7yPp4coUJJPL63QG3arE=
X-Received: by 2002:a05:6512:3a94:b0:5b8:f955:ae36 with SMTP id
 2adb3069b0e04-5be50a67b86mr3862496e87.18.1792520526783; 
 Tue, 20 Oct 2026 11:22:06 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bfa1205eacsm29872e87.42.2026.10.20.11.22.06
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 11:22:06 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5bcf21cfbdaso3108298e87.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 11:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByfUpZznTypKxZ8vbcJAHo5kec1LIMVpmTsiVv9Ht2fTQwGNjhtP6n6N6gCxr7aO6ZcPKvSz70bpy4=@lists.freedesktop.org
X-Received: by 2002:a17:907:9711:b0:c2e:350b:7220 with SMTP id
 a640c23a62f3a-c467960c21dmr1978466b.9.1792520069782; Tue, 20 Oct 2026
 11:14:29 -0700 (PDT)
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
In-Reply-To: <atdqUYdIOqmiqqTt@gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 20 Oct 2026 08:14:13 -1000
X-Gmail-Original-Message-ID: <CAHk-=whrUi2M+whqwS8yfqZ=W9ts6NPOzxzGfBOwOfCC3ooeMA@mail.gmail.com>
X-Gm-Features: AclHuK-HJYHxkUsyBkGy3Njf6A4fOgxIA6b9mjsApIllpv7mDCRHR9A0DndLsLU
Message-ID: <CAHk-=whrUi2M+whqwS8yfqZ=W9ts6NPOzxzGfBOwOfCC3ooeMA@mail.gmail.com>
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

On Tue, 20 Oct 2026 at 03:19, Ingo Molnar <mingo@kernel.org> wrote:
>
> ( BTW., there's a new dependency introduced by this series,
>   if an architecture gets rid of __get_user(), then it must
>   define arch_get_kernel_nofault(), otherwise it will gain
>   new uses of __get_user()/__put_user() via the generic implementations
>   of __get_kernel_nofault() and __put_kernel_nofault(). No big deal
>   I suppose. )

Yeah. It didn't actually look too bad to just remove __get_user and
__put_user in general, but I ran out of motivation.

On arm64, it's a non-issue: __get/put_user is the same thing as
get/put_user, and they both do the full checks.

And the bulk of the remaining cases were on architectures that I
didn't feel were a big issue: alpha/mips/sparc.

I *think* they are all trivial - the bulk of them are just the
historical signal stack stuff and should be a direct conversion to
unsafe_get/put_user() wrapped with scoped_user_read/write_access().

So I think 90% of the remaining noise is truly trivial - not like some
of the cases that actually had *semantic* reasons to use
__get/put_user (often very _bad_ semantic reasons, but still).

Not a huge deal, I might get around to it while waiting for test
builds. Or I might not.

                 Linus
