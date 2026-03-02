Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB4CE9B351
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Mar 2026 10:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127A710E476;
	Mon,  2 Mar 2026 10:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1TaJVSq4";
	dkim-atps=neutral
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DD910E477
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Mar 2026 10:01:13 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4837f288194so31086205e9.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 02 Mar 2026 02:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772445672; x=1773050472;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tjS8FX592qmj/rFkafjn+lojx6cnlsSGWxK3ppaLTGU=;
 b=1TaJVSq4GSD+UaS+PLtRDZGyf89EwQ1pSThHvhwHsfDDGk/mM1b+xq9KTo/kcuSXgh
 5nnSGoW3KYnvjOqabQ5Mm0CInVpn45kLYfc07nAM2unJDfQ7H7dyFNxl5YnW9knwlCfu
 +ZSs4+vTlNKr1AXf0US5PDoswNQScDqxQ04eAMKutWe61iz/UlRutrwltv4enwm3QH8Q
 QAfB1ijXjJNlfgKCHax95wMF6rLxuHovuB5o+mz8mCZ3LgT+J9lQBdOWye/Ro3MbVZNG
 yl8LEKSDR6El4cBHkeiVSh9w+oe20a2qJ4DbfvfiVYSe49KIEkF1RpM1Jm5KZmeEWhhD
 HeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772445672; x=1773050472;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tjS8FX592qmj/rFkafjn+lojx6cnlsSGWxK3ppaLTGU=;
 b=rGFQWTi3oNTWmp0Q1CHRfLctA7MfngxDKB66N8rL2vz5Ipxebdyc2Y/yXkk81VSlrV
 kgziOsod/4h+5s7/+s4+pa/sXg+Ejw9REMH4z/wHV/E1XYOXZ56lcge8C/9yrJH/9AQg
 WLaS5N0A7J690fG0QfVx+CQDyo62ju0Mw2rL0fEyIPHXjVA/AaZR/BJLlKlsCiK5NfDw
 o0BjkWg9VD0f5ROiCetpgJutztfd6HIQhFYbjmP5D2SeKhBBC63KJhKTQf3Dwn0pLUuP
 A99QgdABRfcJktM61FnyNraHZo6G51fTKnLH5i+r/PS+of1wu9hITADYEm2XdmhkKb8P
 56KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVplZ9R7RdPb66ou7CtEz8YrWw6sVQzjjxFq2PgkcZOcM2DxQqQl04m5P7mRZ4mL00GPt+LyDbuupA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwenZv650JLa79Sl2PHCyo1/rHTfWwyTxjUwrQoDxDtTwJGA3b7
 PQp/ZEvorsL5skekjNZ1uvM3zuD8jWsoDVfGWhj5tU93JATjTdYpRrqq22F+Vt87k1dr/clTCw3
 +oQeuajCvC2Tvhh76Cg==
X-Received: from wmbg9.prod.google.com ([2002:a05:600c:a409:b0:483:7827:ade4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3110:b0:480:2521:4d92 with SMTP id
 5b1f17b1804b1-483c9c23ffbmr196674855e9.24.1772445671732; 
 Mon, 02 Mar 2026 02:01:11 -0800 (PST)
Date: Mon, 2 Mar 2026 10:01:10 +0000
In-Reply-To: <8a27e9ac-2025-4724-a46d-0a7c90894ba7@kernel.org>
Mime-Version: 1.0
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-3-david@kernel.org>
 <aaLh2BxSgC9Jl5iS@google.com>
 <8a27e9ac-2025-4724-a46d-0a7c90894ba7@kernel.org>
Message-ID: <aaVf5gv4XjV6Ddt-@google.com>
Subject: Re: [PATCH v1 02/16] mm/memory: remove "zap_details" parameter from
 zap_page_range_single()
From: Alice Ryhl <aliceryhl@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, 
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, 
 Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Mon, Mar 02, 2026 at 09:18:45AM +0100, David Hildenbrand (Arm) wrote:
> On 2/28/26 13:38, Alice Ryhl wrote:
> > On Fri, Feb 27, 2026 at 09:08:33PM +0100, David Hildenbrand (Arm) wrote:
> >> Nobody except memory.c should really set that parameter to non-NULL. So
> >> let's just drop it and make unmap_mapping_range_vma() use
> >> zap_page_range_single_batched() instead.
> >>
> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> > 
> >> diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> >> index da21d65ccd20..b8e59e4420f3 100644
> >> --- a/rust/kernel/mm/virt.rs
> >> +++ b/rust/kernel/mm/virt.rs
> >> @@ -124,7 +124,7 @@ pub fn zap_page_range_single(&self, address: usize, size: usize) {
> >>          // sufficient for this method call. This method has no requirements on the vma flags. The
> >>          // address range is checked to be within the vma.
> >>          unsafe {
> >> -            bindings::zap_page_range_single(self.as_ptr(), address, size, core::ptr::null_mut())
> >> +            bindings::zap_page_range_single(self.as_ptr(), address, size)
> >>          };
> > 
> > Please run rustfmt on Rust changes. Here, rustfmt leads to this being
> > formatted on a single line:
> 
> Having to run tooling I don't even have installed when removing a single
> function parameter; did not expect that :)

Well, rustfmt comes with the compiler, and it would be ideal to build
test changes before sending them :)

But no worries, I took care of testing it. Thanks for taking the time to
update the Rust code as well.

Documentation/rust/quick-start.rst has details for most distros.

Alice
