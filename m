Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FDE104951B
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Mar 2026 09:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3318810E3C4;
	Wed, 11 Mar 2026 09:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="L6VZ56S6";
	dkim-atps=neutral
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB6110E876
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 09:38:50 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b9410af72c3so686236366b.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1773221929; x=1773826729;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=RQubQpcCCRw5LR5oprIFTZzoSHmrBMbhMG4Ewb+bDNM=;
 b=L6VZ56S60rzSO70Z+sYMByoGJBZYTC5xl6kG6pxD84kN8TBw8i0bE5yHHAsqNv7I0T
 9x5s+qTBMVTL2bUlYy2IgDi9muq9NjQiNXyDqNcc0uuz0vAAV9RUv4wN6b27E5wQQCFb
 E5kitlEynn9x937Hhl2r3HXSOTWuGqFizW5Fc+L4BRm9+oVsSIVNQRnnwJKDvUvSTIJL
 VqSD7cOgZqBxp/Wt9JAVFH3GRpyOlwr7cMwI3Z6r90EfZFQ6lsu8h5A1hOklqicgGFIC
 +DsHMQjk8Vrigs+VLN3DRh+rAVqDEirmeuOeHU20Ys7GPR2c41DP4zWq2fwZeB6p7TvN
 vT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773221929; x=1773826729;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQubQpcCCRw5LR5oprIFTZzoSHmrBMbhMG4Ewb+bDNM=;
 b=h0LvSlIV/tjlqaKknm6tZdqLh0sxpQgc/A1b9HmKKojD0kMIepxDAAStHoz4lHuWZx
 44ASdbil503rg47esWpdDOQilbDf/sJ9Rrdf7qHmAFqs0QWO0X0qzOKmPr+xZh0a6+p4
 pao0DXSnsha0GOVbTz9tKPeF0LzLRG3bLAqUVJDSIaifMaPuebq8uuvRov08sHisNxxz
 3nHNn+GChlEwgvfoIT+6AEJU0OzzuYUS3+DIl/tzBEPNojvpeG712NNheKR6RJFeyEiL
 pxvnjscE7HZbTbvIN5WL45RajClLV5jlxUgqdRNBQF2pFd/GJI480Sn8MJY6DJ54HvT6
 DJ8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV75zwj8YGX3kryCR9T9STiypIk04Cl/2CPmwihFebp3idVQfksA6wZqnhwy1AUqCt439RvUdSR08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaAletgYFt8XAfze++Y7i4ekMnZCWYz85hhPoZiDgXetueNwjV
 QPYRpHs8fL1Rr0VqXheySw4MLSQetMyRxMz0J8i4O2n64nSBfElrVjCxMYGQxuFFXdp9DXmtpTc
 m9lv6PvKwKAg22Ag8VQ==
X-Received: from ejja22.prod.google.com ([2002:a17:906:3e96:b0:b8e:ad99:be59])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:f592:b0:b87:2abc:4a32 with SMTP id
 a640c23a62f3a-b972e1d254cmr101140266b.18.1773221928398; 
 Wed, 11 Mar 2026 02:38:48 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:38:45 +0000
In-Reply-To: <61df6369-333c-430a-bd18-c5b1acae68ea@kernel.org>
Mime-Version: 1.0
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-17-david@kernel.org>
 <20260309142954.GM1687929@ziepe.ca>
 <61df6369-333c-430a-bd18-c5b1acae68ea@kernel.org>
Message-ID: <abE4JYo223OxWCBQ@google.com>
Subject: Re: [PATCH v1 16/16] mm/memory: support VM_MIXEDMAP in
 zap_special_vma_range()
From: Alice Ryhl <aliceryhl@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
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
 Simona Vetter <simona@ffwll.ch>, Leon Romanovsky <leon@kernel.org>, 
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

On Wed, Mar 11, 2026 at 10:15:12AM +0100, David Hildenbrand (Arm) wrote:
> On 3/9/26 15:29, Jason Gunthorpe wrote:
> > On Fri, Feb 27, 2026 at 09:08:47PM +0100, David Hildenbrand (Arm) wrote:
> >> There is demand for also zapping page table entries by drivers in
> >> VM_MIXEDMAP VMAs[1].
> >>
> >> Nothing really speaks against supporting VM_MIXEDMAP for driver use. We
> >> just don't want arbitrary drivers to zap in ordinary (non-special) VMAs.
> >>
> >> [1] https://lore.kernel.org/r/aYSKyr7StGpGKNqW@google.com
> > 
> > Are we sure about this?
> 
> Yes, I don't think relaxing this for drivers to use it on VM_MIXEDMAP is
> a problem.
> 
> > 
> > This whole function seems like a hack to support drivers that are not
> > using an address_space.
> 
> I assume, then using
> unmap_mapping_folio()/unmap_mapping_pages()/unmap_mapping_range() instead.
> 
> > 
> > I say that as one of the five driver authors who have made this
> > mistake.
> > 
> > The locking to safely use this function is really hard to do properly,
> > IDK if binder can shift to use address_space ??
> I cannot really tell.
> 
> Skimming over the code, it looks like it really always handles "single
> VMA" stuff ("Since a binder_alloc can only be mapped once, we ensure the
> vma corresponds to this mapping by checking whether the binder_alloc is
> still mapped"), which makes the locking rather trivial.
> 
> It does seem to mostly allocate/free pages in a single VMA, where I
> think the existing usage of zap_vma_range() makes sense.
> 
> So I'm not sure if using address_space would really be an improvement there.
> 
> Having that said, maybe binder folks can be motivated to look into that.
> But I would consider that future work.

It doesn't really make sense to have multiple binder VMAs. What happens
with Rust Binder is that process A is receiving transactions and has the
VMA mapped once.

* Process B sends a transaction to process A, and the ioctl (running in
  process B) will memcpy the message to A directly into the pages of A's
  VMA.
* Then, B wakes up A, which causes A to return from the receive ioctl.
* The return value of the receive ioctl is a pointer, which points
  somewhere inside A's VMA to the location containing the message from
  B.
* Process A will deref the pointer to read the message from B.
* Once Process A is done handling the transaction, it invokes another
  ioctl to tell the kernel that it is done with this transaction, that
  is, it is not safe for the kernel to reuse that subset of the VMA for
  new incoming transactions.

When Binder returns from its ioctl and gives you a pointer, it needs to
know where the VMA is mapped, because otherwise it can't really give you
a pointer into the VMA.

It's generally not safe for userspace to touch its Binder VMA unless it
has been told that there is a message there. Pages that do not contain
any messages may be entirely missing, and trying to read them leads to
segfault. (Though such pages may also be present if there was previously
a message in the page. The unused pages are kept around to reuse them
for future messages, unless there is memory pressure.)

Alice
