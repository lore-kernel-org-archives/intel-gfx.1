Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D36EDEBFF
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Mar 2026 02:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA2B10E930;
	Wed,  4 Mar 2026 02:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3r/wx9FS";
	dkim-atps=neutral
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D85910E931
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Mar 2026 02:49:39 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2ae66ee7354so7477005ad.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 03 Mar 2026 18:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772592578; x=1773197378;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wlfxAiLCYE9X+ss6Nds/jzCWOjzdQvgrRAY6r5Hx7j0=;
 b=3r/wx9FSARarks8w7Znu5v8G/BsZ4L/2OmdEY/pO/TRpjb6kPzBdpOCbJSSUJzRzuQ
 4JBoCndAMo26C667UEqzb/4tEtZx+dlMJijUTHQ5MozepYqEQ/eWh3x8YO+Myc3BVyLz
 8/Fda90Btj6fxtp+rH5vUR9YWYabqxaZtCKIC1A8lwEAldBrACCgBkz3O7eVyWYYr6uz
 2OTQye2t0yho1SvKdcZk3/m2Bp9NMtzkJaqEDzIAlup+6PyCz4LdiFOyGbaRFW3nTTfe
 Dl82cjJyXbr9NPobi+YT9x7HHsOaPgRg2A2b0PQdHjbiuvgSJNLo2NYgBEPW0p7hecgt
 nMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772592578; x=1773197378;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wlfxAiLCYE9X+ss6Nds/jzCWOjzdQvgrRAY6r5Hx7j0=;
 b=lRlos8MLM71I0kO1xIJy2TJpRin8eIttitKST0UxmwATy6/mTDhfudjzKmeu1a8alO
 Jw1UinL+5i+0dKJLoFZh2rfh2Om5SOrXUg3xnMrSURhJJvscwQDGqNAiz6KJEVuEAApS
 W8GYGCLetClUADsi4SxtsbP8HPLMZvIBHHwHvDeeSN7nZ9ha5SJQTAtrYsdb4DarYyWJ
 fjUQM3jJaQURWGMtQnTOiiIfHcgdAJhgF6Q9xwy0zQr9jGkA6lnzoqnkrady7+X47Eld
 92O0iHsqM9TLLiLzX5BbFtgcw3CC14bk5PsetUUxDVLTnxBKsY0aQWRhyMDppoAaM+Jv
 pniw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSSH0eu7Pu+M78t0vhqd+xxBAypd5nuGyKOga4YVDJIeqIjw/7eCwA3s/0n0g8dnhIQnR4sqbtrLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfI8RZYipcS7ZMq6XjqoSQF2SSOv+xz6xoeuo1rpIow36uGbzw
 NF/qZ5M94beb2sCYdpMTskwYFeVjWPBU6Z48nvLvzPIGj8WI0os5FSRxBlJvq1pkQTRU2uGIdt3
 2Qj+s7Q==
X-Received: from plzv9.prod.google.com ([2002:a17:902:b7c9:b0:2ae:6338:73ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2446:b0:2ae:483f:b239
 with SMTP id d9443c01a7336-2ae6aaf9469mr6114485ad.30.1772592577810; Tue, 03
 Mar 2026 18:49:37 -0800 (PST)
Date: Tue, 3 Mar 2026 18:49:36 -0800
In-Reply-To: <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Mime-Version: 1.0
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
 <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Message-ID: <aaedwFwXh9QXS3Ju@google.com>
Subject: Re: [PATCH 0/8] mm: globalize rest_of_page() macro
From: Sean Christopherson <seanjc@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "Theodore Ts'o" <tytso@mit.edu>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Duyck <alexanderduyck@fb.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandra Winter <wintera@linux.ibm.com>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Anna Schumaker <anna@kernel.org>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Carlos Maiolino <cem@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Chao Yu <chao@kernel.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Dominique Martinet <asmadeus@codewreck.org>, 
 Dongsheng Yang <dongsheng.yang@linux.dev>, Eric Dumazet <edumazet@google.com>, 
 Eric Van Hensbergen <ericvh@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>, 
 Linus Walleij <linusw@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Brown <broonie@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>, 
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, 
 Zheng Gu <cengku@gmail.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
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
Content-Type: text/plain; charset="us-ascii"
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

On Tue, Mar 03, 2026, Jens Axboe wrote:
> On 3/3/26 7:28 PM, Jakub Kicinski wrote:
> > On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
> >> The net/9p networking driver has a handy macro to calculate the
> >> amount of bytes from a given pointer to the end of page. Move it
> >> to core/mm, and apply tree-wide. No functional changes intended.
> >>
> >> This series was originally introduced as a single patch #07/12 in:
> >>
> >> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
> >>
> >> Split it for better granularity and submit separately.
> > 
> > I don't get what the motivation is here. Another helper developers
> > and readers of the code will need to know about just to replace 
> > obvious and easy to comprehend math.
> 
> I fully agree, I had the same thought reading this.

+1 from KVM-land.
