Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72606E9B359
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Mar 2026 10:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDD910E056;
	Mon,  2 Mar 2026 10:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QgncP8+O";
	dkim-atps=neutral
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D681610E056
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Mar 2026 10:33:47 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4830e7c6131so45132885e9.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 02 Mar 2026 02:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772447626; x=1773052426;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EnMgJMcaQgCDj7i00Uawlj/G1rJtXPwe1sCLwvhoFHI=;
 b=QgncP8+OhRI+4ZO8rEr1hLMqQCNpyPYa913C2g4NZbsFSKiVn4mIJpp/iEnsHZeO1E
 lsaodZ2LnkwcyNbCyQl9x/WxSwEfl66kj3zpjL7cOqjts5WkhS9y2JjM71pRyXlkwsS8
 COQ/7JVp1OTD0YRFtLfJiKUOEHTNj9oWHJG5XQN+FsPBgK6zU559gnSx45TNjGnv7GOw
 nknTfDJVJ33lEAQooLqhMJHIozyy1xGkYf/XaG8yaBAu3om7YVvfkXeth/rDBAn/qxoG
 Mz9zsKFWJt0RDebkUB5Sh726qFrnvt5L744rYG6nPw8PogFWHzQojUmcJGixGN04fZ8x
 ZFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772447626; x=1773052426;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EnMgJMcaQgCDj7i00Uawlj/G1rJtXPwe1sCLwvhoFHI=;
 b=QlqxWcBE+kvNj9bfGmpTeyZinxXLS1RSBCpFWB3ekRZRghZ3yyp+rhZ0WEzINf35DY
 sTemgXHFX57Yg15h6VQbDQgsEHR/DF69dyPJ/AAoYTI1/WxO2jF8fhRdeWaYDeIxsGNw
 9SGd6oJwUZNgjAtzNL9Qb9H9A58YTXGVs2XzucAM7Fq0Iz4Nf/SvdzWNnTEAeei923hb
 3V1BEBYW7ySVqJNPe+TKQrX7HbsTqD0jIGC1RkgGqa099Mck9Y2RUxaEAsrqtPBB0ObL
 2s3EtuysCPcVrIVk9aMdbbc8znpQg+6xBVBM7sgRs+NNmjPXDkU82qDWfyScsnKPNB4E
 aOZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj4OYjgSFtduyQs3Pm71e+Tv/LH7KvQqeOvnKnkBItudHs25cG0VSYzuv10T33BLOA3+szSTkLcBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB2CIEAIdm5JuU99vavZ5p6IQXx5IyLrL4FBR60lOhQ7T2O4lg
 4Pl7ZpYq3a04Z56o1LiXogVLNqTJD6X7MXRB9q6cUs6A9SDEt7WO0WbtNIGj+WstgKU0bqlpOJJ
 RNTQiZqQRRFKtbTVSaA==
X-Received: from wmdd1.prod.google.com ([2002:a05:600c:a201:b0:480:3227:a124])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6383:b0:47d:3ead:7440 with SMTP id
 5b1f17b1804b1-483c9bdb683mr186031315e9.32.1772447625915; 
 Mon, 02 Mar 2026 02:33:45 -0800 (PST)
Date: Mon, 2 Mar 2026 10:33:45 +0000
In-Reply-To: <f2f3a8a1-3dbf-4ef9-a89a-a6ec20791d1c@kernel.org>
Mime-Version: 1.0
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-3-david@kernel.org>
 <aaLh2BxSgC9Jl5iS@google.com>
 <8a27e9ac-2025-4724-a46d-0a7c90894ba7@kernel.org>
 <aaVf5gv4XjV6Ddt-@google.com>
 <f2f3a8a1-3dbf-4ef9-a89a-a6ec20791d1c@kernel.org>
Message-ID: <aaVnifbdxKhBddQp@google.com>
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

On Mon, Mar 02, 2026 at 11:27:40AM +0100, David Hildenbrand (Arm) wrote:
> On 3/2/26 11:01, Alice Ryhl wrote:
> > On Mon, Mar 02, 2026 at 09:18:45AM +0100, David Hildenbrand (Arm) wrote:
> >> On 2/28/26 13:38, Alice Ryhl wrote:
> >>>
> >>>
> >>> Please run rustfmt on Rust changes. Here, rustfmt leads to this being
> >>> formatted on a single line:
> >>
> >> Having to run tooling I don't even have installed when removing a single
> >> function parameter; did not expect that :)
> > 
> > Well, rustfmt comes with the compiler, and it would be ideal to build
> > test changes before sending them :)
> 
> At least on Ubuntu on my notebook where I do most of the coding+patch
> submissions it's a separate package?
> 
> I do all my builds on a different (more powerful) machine where the
> whole rust machinery's in place. Further, build bots that run on my
> private branches did not report any issues.

There are some build bots that check for rustfmt, though not all of
them.

> > But no worries, I took care of testing it. Thanks for taking the time to
> > update the Rust code as well.
> 
> I just did an allyesconfig and it does not report any warnings.
> 
> So apparently, rustfmt problems not result in the compiler complaining?
> 
> Or something else is off here that rust/kernel/mm/virt.rs won't get
> compiled on my machine, even with allyesconfig. I can definitely see
> some RUSTC stuff happening in the logs, like
> 
> 	RUSTC L rust/kernel.o
> 
> Thanks for the review and for pointing out rustfmt!

Similar to kerneldoc and other similar targets, formatting isn't checked
in the normal build, but make can be invoked on the rustfmtcheck target
to check it.

Alice
