Return-Path: <SRS0=3jck=B7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85169C433E1
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 19:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526292075E
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2020 19:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SofWc/w6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 526292075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95E66E40F;
	Fri, 21 Aug 2020 19:19:02 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890CB6E40F
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2020 19:19:01 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id i10so3052091ljn.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2020 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLc84kj5PHVUSiFGEP5mfzNqVCypKwLtWPaDrgaberY=;
 b=SofWc/w6t4rEsc85RaLfw4+1oCNKhS2jGDmsKj708JnMxQaUL81Q5yOWX5EhAMzU+x
 Cb3KyXSNMzLbsgJPGamhAP2iMjt3UL8rroxFzqL7p6C5UBNeY6HNa3Jd1zJI2GavW46Q
 WhVw+1qcn3yzbaRWJ0lfgO2uTu43gklL+LpRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLc84kj5PHVUSiFGEP5mfzNqVCypKwLtWPaDrgaberY=;
 b=DjJFlLf938rEOKMr5eKmatuwGRERNm845vatTAu+dWjoP306n4hS7v5L1k5lobOUE4
 mpyOsT5JbnTMI+G/ZX2KVWbjowJR6ycz39Id97qIPlP3YVUMrFU0s/suFP0vdN6f4NRz
 FB2YA3oVqHsVOB6MM9bzmMMLmZgyXRu3iSx3y+Fwg+hDnjSKX/ORHAQohCo9aw7kjJKK
 N4LlOOWAWiGFZtJT+jU5ICarUcYG8OTMSg3pvRZ+MWilKVBYRmjz6FCZNbIWKf3gEgy7
 4MIcPmgTznJtfrwULVJNGaFWvPtsPHzXQYiAr/qLQKXDx03ASlhg1hHoWkR/9erma8ot
 3WUA==
X-Gm-Message-State: AOAM531dPoNAA3kS9VReDZK6jQHhOhqaOD+pZKFeJPMQNWD+SgYlS+Kd
 qXX8Z1Zi+JLXPF4BEty1AqRMTGKTKKnYIQ==
X-Google-Smtp-Source: ABdhPJx6NA7rU6lptjVV5qJxisbD53QeirQPPo+WM++tiYmE1GzfiLU6Sh0SJaw+Nlp/jTx8RJZRWw==
X-Received: by 2002:a05:651c:1105:: with SMTP id
 d5mr2329614ljo.267.1598037538787; 
 Fri, 21 Aug 2020 12:18:58 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id 10sm563516ljn.22.2020.08.21.12.18.57
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 12:18:57 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id s9so1450101lfs.4
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2020 12:18:57 -0700 (PDT)
X-Received: by 2002:a05:6512:3b7:: with SMTP id
 v23mr2073008lfp.10.1598037536954; 
 Fri, 21 Aug 2020 12:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200821123746.16904-1-joro@8bytes.org>
In-Reply-To: <20200821123746.16904-1-joro@8bytes.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Aug 2020 12:18:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNEsVwVMwQdHL4O1tDWQa-HcmOv-EmqLTQH+SoC2CkWA@mail.gmail.com>
Message-ID: <CAHk-=wgNEsVwVMwQdHL4O1tDWQa-HcmOv-EmqLTQH+SoC2CkWA@mail.gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [Intel-gfx] [PATCH v2] mm: Track page table modifications in
 __apply_to_page_range()
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
Cc: Joerg Roedel <jroedel@suse.de>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Linux-MM <linux-mm@kvack.org>, David Vrabel <david.vrabel@citrix.com>,
 Pavel Machek <pavel@ucw.cz>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Aug 21, 2020 at 5:38 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> The __apply_to_page_range() function is also used to change and/or
> allocate page-table pages in the vmalloc area of the address space.
> Make sure these changes get synchronized to other page-tables in the
> system by calling arch_sync_kernel_mappings() when necessary.

I get the strong feeling that these functions should be using a
"struct apply_details *" or something like that (the way the
zap_page_range() code has that "zap_details" thing).

Because adding more and more arguments gets pretty painful after a
while. But maybe the compiler inlining it all makes it a non-issue.

It also strikes me that I think the only architecture that uses the
whole arch_sync_kernel_mappings() thing is now just x86-32.

[ Well, x86-64 still has it, but that's because we undid the 64-bit
removal, but it's on the verge of going away and x86-64 shouldn't
actually _need_ it any more ]

So all of this seems to be purely for 32-bit x86. Which kind of makes
this all fail the smell test.

But the patch does seem to be the minimal fix for a real issue - I'm
just pointing out ugly details, not actual problems with the patch.

IOW, a somewhat reluctant Ack, hoping that this will be cleaned up
some day. Possibly/hopefully because arch_sync_kernel_mappings() just
goes away entirely.

                 Linus
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
