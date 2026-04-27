Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09185FF8867
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Apr 2026 21:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7645B892A1;
	Mon, 27 Apr 2026 21:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IYFMvRTb";
	dkim-atps=neutral
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111AB892A1
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 21:59:31 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-677f7c29af6so9399733a12.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1777327170; x=1777931970;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
 b=IYFMvRTbDflfUyB8N2QryVsrXRu5hg6JvQLE6eOv8WLX/g+0GkCwogeKBH66FBM8Cw
 4twCep8YvkUJXF1mDJz5i2ff0dqxYR8EeGz04IralWmBA7MncUJTSGV2sdiFF/mUhFTx
 JhSf6QSg0tLFW31Tbf/NtYP5h0zF5KYzHMgB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777327170; x=1777931970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
 b=qegoK+qjRwolzZ4SEHRp5K/JVhrFCy7asVM9UoTlknqAuL7AFgsM+rEOX+WeD6mGLz
 VhfF/+WjYPWVYjKot+Hs1s1IhytKPnmBOj/flHsIfbEZd7LjTJrSPNNuIgO99CJOvBwE
 qYYNOoYmpj6gz2u4jjc0PKt50dt2E9O9sjUhIeue781ZbjomMg9IwUlEMKswhsQWdJGZ
 Kkdk1cQXkmZ0NBMNmssB1FrQPfFDfHZVxY2FVNnjuq9k2+gm4oGgl1BAWSgxWSMv7fMx
 7yYLQsImzX/qPRkV7zBtsTynwZlza9IPkwwiILv61OVQvNVdaC2hmcWLEe1gJxRC5YlF
 EYng==
X-Forwarded-Encrypted: i=1;
 AFNElJ8RhAsn2CnZP8QU0RBbpea6kaxAHsQaQEg0NqSmYwB49ypyPtEecTtEVrOkN78MPbuiGAvRxJcPIkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBelQg2CPVZOklwZZ9MaKSM6B9pnQaXixcPG6mOYuaZi0V4yPb
 3R2kEiRJzrz8TUs1X7F2ORrqrL43kpyi7XgeUHEsqEB3YXxFbKX+Cw+B6nMyWc72iZJ1NB2T984
 pdBK9zQDlDg==
X-Gm-Gg: AeBDiesHF0+giGtrMmQTqpy9tgTzEovpLO4lXgSZhqCRCKttT2/J7ISymYCNdY1C5ah
 F/IhsXi6HfrOV4Zi7c3q3pb1thbrQMjNejzSHiiw2E0hhjWaA0YcIVgpKhohl60B2pBKX/c1DQ0
 /YrdNxMDIYvzf3KM0Hll4SsVjjnZ63bM+YrXpnFUD7GF2WIx93NLvSxWU+F2vR59CGcFrZd7/Ng
 Se3jhWKwjSbHuE/LDD2o2MXcsffav+tOdF6GLrpS1x8i2SFi+sVcEIxHJcvTRk3/QwukYMZOVOo
 rcjf+v2wo7nGyNPsk1gjusESkd6xGII3wMIhar9y0yKgXIsSayqQy11A62TGD6mdyeHpynDjO/U
 rFG1bMfj3QLU2n6FOgQ29RuSXHtYdkVkNZ09B4OSgqudXdDHELzJgq+ARS5kcjWzuGTEClSLKgr
 hgMWswZVrvWAt133L9pC+tGz2tYn+HcQ43QtcvsARm3iGHmq4n0B57/gZkwRE3Q+9F9trjwZPoV
 nnXlTReohg=
X-Received: by 2002:a17:907:6ea4:b0:ba5:1970:2bb6 with SMTP id
 a640c23a62f3a-bb803d65634mr29486166b.34.1777327170047; 
 Mon, 27 Apr 2026 14:59:30 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bb80b2aded9sm10217966b.41.2026.04.27.14.59.29
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 14:59:29 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-66e8cf72a93so13206569a12.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 14:59:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8Uv+qbemuWG4v5drf0IAIif9m4OXcKaKjw9FwA9smUEg11Dvcwqq+BPusaNlhPgBnJhaDLre9XW98=@lists.freedesktop.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org>
 <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org>
 <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Laight <david.laight.linux@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
 dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
 ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
 linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus
