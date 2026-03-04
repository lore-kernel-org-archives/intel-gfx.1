Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFA7EDEC01
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Mar 2026 03:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D97310E942;
	Wed,  4 Mar 2026 03:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="nvWFf65B";
	dkim-atps=neutral
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AFB10E942
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Mar 2026 03:35:07 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7d4be7c4ebeso3198654a34.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 03 Mar 2026 19:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772595307; x=1773200107;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NrE0zI+7ilR1NedBJHHio8t27882PDymrHrpls6UPoo=;
 b=nvWFf65BE/T93AHTd2UMUuktkwbY3/+fvDNLsMCEkX0TdgQ8Cdhtbhr/t4IM4GZM+8
 H0deP80oHFIXdIEzWhmQQpNe/U5asluUiWaRtwatESa7FhSauZT2BipV+buXdQ9J1c7K
 jc5Y8FWdwczuvMnW3bSrf6jzafBcqLd43uYjBZIhvQDyd+u+87u3nErgp43RY2Crf9RZ
 GLoO43/tFLF5y56U/Zyrm1XoG7eeaoFuQuHTpzuKb2aYwYF89/fTrWNJOiB7uCUBTwiS
 tBHWvUSYu+ScGlp/R3TzV+XJKX0hAPv5wFJ4BMGoacXN/GwzTiDo9Kgg5wOYrcSKDDhI
 190w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772595307; x=1773200107;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NrE0zI+7ilR1NedBJHHio8t27882PDymrHrpls6UPoo=;
 b=Xm5GQMOO/bXixNKA3varS9LcmpqXli+XjesyT/EnnJDIfOcZGLQGt5/8mJZM0Nf+jB
 ojzWduQgppRV6iqgMeGHVc52MOff/wjuXA4pAqIakkOTcT1hiIlsOboblVA8HYgwZ4Jx
 GPnhvmJTszhH0GKKDTMC2WrfZ8EM4v8dfIyMLX5nujWz3XqbVIaOUiyIyn6T+BPYJ6kx
 4FB8QrxR5qT0Lwh9UkVAn8/GRjBlJCg47aqd46jAvuPgvmogHCqMUAN22tJc29HllCRz
 1DxUz3dRECx5zABmD2sD8px5I1mLtvs4DJ/vSxYkfJejMU1JuWa06NRPrMZEkZnCIAeT
 XlYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa0l/Y6AnkV8hmI/+cT2Hf79XB5hzCcLKqKYlaAM9FX1cHViwmuIeZzwn0dePSXIxzhsH2iIr53t8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAVh6QPKbgDNv57DC3AkCmbk1WKZoP2p9ni7EGnb36idq++bVN
 6q1tQQ7/AY4I4BzL4xmATyhMx2w8T9b0WATwCH1eEx9xDPRpLRiMdDl0P8/E5OIvuIM=
X-Gm-Gg: ATEYQzxsjrSVcdN2DfT0oHY9iH2HpjxVRFGesAWh44hPAtpxrnA081MtNCd32NtCauE
 ZJPfMhLTpN0+7GKD7/qi9+nGPfD54wFT2NcdwFDo0m9gTVYpW8s4vM1qha6ktYbuYAvkjXFRYIH
 L+Zw01GZuyz7ETVCsuzZpNOMm+A1rXlk/PSwFA08l5M9Y9xojnw6bipFQWwFdVICzH++RvhvGYS
 RyFgAUG0sH75PPiGJohskXO3/5MiyOOd4W2sgBEnHY/+lyo4lxF6XAqS6bk90HEG53cimC987r9
 rs6zKz7Fmyd2h8nZAoImvH9hvrMYi4Za+fpE+6Sl7GkKG3GQqYVY2Pe3qHsvap4A8ipge+ZekB6
 sbzydqCdc8jZPXfOXsJgi8sIbDy2NENOIGLP9YMgBz1PV3IeTFnMpVUKqa9RFc17SxcOcVKMag1
 H9jhlsXqnlNSEyhVFa7OwRqVc52NWoq3ByelBvkjKNdcYSGj4tClbom5FNyI8pM5/EY4I/17nPn
 bnlH4v32w==
X-Received: by 2002:a05:6830:6185:b0:7c7:6977:17cb with SMTP id
 46e09a7af769-7d6d139f788mr450044a34.21.1772595307034; 
 Tue, 03 Mar 2026 19:35:07 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d586653f6asm15202012a34.19.2026.03.03.19.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 19:35:06 -0800 (PST)
Message-ID: <e96e851a-9050-4d8c-b1e5-bc3b5d91a84c@kernel.dk>
Date: Tue, 3 Mar 2026 20:35:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] mm: globalize rest_of_page() macro
To: Yury Norov <ynorov@nvidia.com>, Sean Christopherson <seanjc@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexanderduyck@fb.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Anna Schumaker <anna@kernel.org>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Carlos Maiolino <cem@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Chao Yu <chao@kernel.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Eric Dumazet
 <edumazet@google.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>, Linus Walleij <linusw@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>,
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Zheng Gu <cengku@gmail.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dm-devel@lists.linux.dev, netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-crypto@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, v9fs@lists.linux.dev,
 virtualization@lists.linux.dev, linux-sound@vger.kernel.org
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
 <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
 <aaedwFwXh9QXS3Ju@google.com> <aaen2pGs0UeiJqz1@yury>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aaen2pGs0UeiJqz1@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3/3/26 8:32 PM, Yury Norov wrote:
> My motivation is that it helps to simplify constructions like this:
> 
> -               loff_t cmp_len = min(PAGE_SIZE - offset_in_page(srcoff),
> -                                    PAGE_SIZE - offset_in_page(dstoff));
> +               loff_t cmp_len = min(rest_of_page(srcoff), rest_of_page(dstoff));
> 
> Or this:
> 
> -               if (folio_test_highmem(dst_folio) &&
> -                   chunk > PAGE_SIZE - offset_in_page(dst_off))
> -                       chunk = PAGE_SIZE - offset_in_page(dst_off);
> -               if (folio_test_highmem(src_folio) &&
> -                   chunk > PAGE_SIZE - offset_in_page(src_off))
> -                       chunk = PAGE_SIZE - offset_in_page(src_off);
> +               if (folio_test_highmem(dst_folio) && chunk > rest_of_page(dst_off))
> +                       chunk = rest_of_page(dst_off);
> +               if (folio_test_highmem(src_folio) && chunk > rest_of_page(src_off))
> +                       chunk = rest_of_page(src_off);
> 
> To a point where I don't have to use my brains to decode them. I agree
> it's an easy math. It's just too bulky to my (and 9p guys too) taste.

The thing is, now I have to go lookup what on earth rest_of_page() does,
whereas PAGE_SIZE - offset_in_page(page) is immediately obvious. It's a
classic case of "oh let's add this helper to simplify things" which
really just makes it worse, because now you have to jump to the
definition of rest_of_page().

IOW, just no.

-- 
Jens Axboe
