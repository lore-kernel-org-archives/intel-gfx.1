Return-Path: <SRS0=/K8T=C5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76B3C43465
	for <intel-gfx@archiver.kernel.org>; Sun, 20 Sep 2020 18:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC6F207EA
	for <intel-gfx@archiver.kernel.org>; Sun, 20 Sep 2020 18:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aTcZkpnk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC6F207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0608997C;
	Sun, 20 Sep 2020 18:06:35 +0000 (UTC)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB50F6E0D3
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2020 18:06:33 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b12so10637008edz.11
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2020 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10vFh59zX+qrXR+btNd9keaZllR85H50W0pZVqW9mvg=;
 b=aTcZkpnkgiAVVoqRXBCAnYw8B8YS7QD0nmh7mtbe8Dtb85AdAYIiPcbXVjdrb/fbX9
 3yTs920flMKnlnbAGz7q1CYoJs0994Dvfor1DakKOqSDUOemiqgeakXoqfK/+swxI5fB
 0DUfGVYXrHTR7XO61iz2Eybc+W0Ekg5v+dkh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10vFh59zX+qrXR+btNd9keaZllR85H50W0pZVqW9mvg=;
 b=c/+gjsUO4wms5uXFEaGDswm9uqoPNRC26P80rVV6sncJlE5kPpbBnqGeiJcMHDD9ib
 g673RPPTBqTzHSnQIMH6BaR2j+IdjNFs3+5gm463wjSWQ+0BvcnmknyPfa7IF7T5CHxn
 /0YPqrdKk0R84/Q2bWo2wkL8VlsNehIm8vmCaycqEnR21uZgg6YVXMPoz4d25gFDUVxO
 xZ+fCzqWwKYAcFmU324Tcx5EyDxaIE0RD0h1ZEWEEQLc6ak7e32NDg3ybJUpIa45fZNu
 HzEpu+PU3Ycq0LX4Ekc3iJuDLdT8qYN1Hy9IR+9rvAzG2ehmpzy787UoUGofz9t2K1bc
 wRcg==
X-Gm-Message-State: AOAM531drxxbp+qaAJWwDOUbCF/jb2NnMxyviDW4V1+SAu+voTPvmKqv
 /xjhHmI44sRlRORnaCNLSaFWWnSOTBZ7Ig==
X-Google-Smtp-Source: ABdhPJxSbkimm87ZJRMGOyYBLkQN+QuJeXruOzFl15iiOV1Y9SrNYO4M1uBZD39bDOr4uS+qBp8mCA==
X-Received: by 2002:a05:6402:346:: with SMTP id
 r6mr49943095edw.301.1600625192185; 
 Sun, 20 Sep 2020 11:06:32 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id l7sm7011185edn.32.2020.09.20.11.06.31
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 11:06:31 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id j2so10451563wrx.7
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2020 11:06:31 -0700 (PDT)
X-Received: by 2002:ac2:4ec7:: with SMTP id p7mr12591149lfr.352.1600624746105; 
 Sun, 20 Sep 2020 10:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Sep 2020 10:58:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_iVgA3H7CVvAzDoYC1gC1AKbLmv_mCeUnVxg79_9y8A@mail.gmail.com>
Message-ID: <CAHk-=wh_iVgA3H7CVvAzDoYC1gC1AKbLmv_mCeUnVxg79_9y8A@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [Intel-gfx] [patch RFC 00/15] mm/highmem: Provide a preemptible
 variant of kmap_atomic & friends
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, Sep 20, 2020 at 10:42 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yeah, that looks much easier to explain. Ack.

Btw, one thing that might be a good idea at least initially is to add
a check for p->kmap_ctrl.idx being zero at fork, exit and maybe
syscall return time (but that last one may be too cumbersome to really
worry about).

The kmap_atomic() interface basically has a lot of coverage for leaked
as part of all the "might_sleep()" checks sprinkled around,  The new
kmap_temporary/local/whatever wouldn't have that kind of incidental
debug checking, and any leaked kmap indexes would be rather hard to
debug (much) later when they cause index overflows or whatever.

                Linus
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
