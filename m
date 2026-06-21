Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA65ECD98F0
	for <intel-gfx@archiver.kernel.org>; Sun, 21 Jun 2026 12:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAC810E1A7;
	Sun, 21 Jun 2026 12:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kZQO3pZj";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53B710E277
 for <intel-gfx@lists.freedesktop.org>; Sun, 21 Jun 2026 12:55:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-46066e640easo2061348f8f.1
 for <intel-gfx@lists.freedesktop.org>; Sun, 21 Jun 2026 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782046534; x=1782651334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WU+6TPSMrQeQnOmPDKoUDmLIYSzXbxEWNqGQFFhaaZU=;
 b=kZQO3pZjHUp8spcWhDbCJ9BYpSWKqCUnfD1rIV9tOWhua6yUXEhEkr0ndtKu6hOkap
 LVSTj1o3FTeKg3x47rzcjekqXu0FEhWs0BSNPMrSqQMTk3C4xnFytgQvoKDMmlMmco+U
 W/QqKSiaNkNz2TJr5/+NHbJHeZXwNxbGvS1zs1DVZE07tMlOHE5b/VyoJwTjKRveVfwC
 3OwrZUnJe1Bw3ocdyz9Euhw5l+yP09uC+2ZYpna7ZeWq1W1d8mocVUhBpkKRrJyCXuQ2
 JnU7VXMIRTr66fmIDiUj1ksVCHDwwRxbv61/FYshpd6tfAB+w8kjEG92vM3A5uYdeoKo
 RShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782046534; x=1782651334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WU+6TPSMrQeQnOmPDKoUDmLIYSzXbxEWNqGQFFhaaZU=;
 b=TsuM7NychY58Eg8EfVCAiUYYik27TcQFveqDbo1mNJ4mFFd0QoDoEx30rtNdOY1YM/
 /ZZJbCQL0LAGFDIU2SZb/wzt64FSvLVbmkaOtFRGl313cRBiqD7gm69u6aXgcFmnsKtD
 lgYdakBCGRf3OqAuhrd+1k7DxcJsMAdZ5ZhRY3vHqXwzVn2MfEWCs92pWHNGW+zdChWP
 AgnwKLARwUORVkVcmC9IBJ1JJVeHLIqsJ/fUB/8CWnzPPwV9BD0nMDepvBEzzSDkUUBd
 d923b2Nks5ej7P1P6fUGr3HC4auV+v18pFXEPP6p+ESWAFk7S5ce27jecFUQvGgC8VjU
 cqXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8uy0GttM8++9uCDMZCb1dGHHccEr+KXmio9GxZfHnKtJMXLz+LZVfws7j/dbcX6ZzTthuLMNQgQu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk/UlK/df+A94hej50afUduAqlEabZZK/yn1g92Iww7s/V2N80
 e2FjKsfmLrJ4KmbLNp2ckkL1/8+l1BUr+1Jb9ZhQZOszlHeiXlZqrZcL
X-Gm-Gg: AfdE7clR71SDQGrDTtNVZJIX6EWaHICtEtWVizu7cxt85+trV58VNuV9GvKKVVIkxLZ
 llkR7ItCx7zrIYvOPnkMU0S21eOQu8A6J6hincHkjNWLZ+a9XfWc/QEbFiGEqHODfxU4PTBKk9e
 0zlKuVs7yniwUaSbN+z6kCAC7kv2XRIuz/UKyFPYEnf2AVrwn6j2aFrx+3WdUQ8wGoYsCtFf8Nh
 Z5+4rh8WyonruceTFsCx+vAMtN8MEOQjSJKX7KcsYqOuboNkkV96M+s72lmdpxbn6a3Ty5xYPBm
 FSvJc9o6WGHBxQUgVav/CYOt2qQytOk9xwndZqWZ1wP7ILyAZ/ZYOqH04860td9kfdRgYyNDCFl
 JqP6GZpi9OR5UL0t9OjUIcqeEj2eWz/FKjKo9doaC7A4eT8D6zeEex7hhV7Dm1sjOkqY5sLcLZf
 2CTi2ZOs9VRpCThInELhJ69bL+Xsv12rvNKvq8+bZOzORN5Z3hiA==
X-Received: by 2002:a05:600c:e547:20b0:48f:d5b8:5b07 with SMTP id
 5b1f17b1804b1-49240e81b22mr113459545e9.20.1782046534244; 
 Sun, 21 Jun 2026 05:55:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249238900sm129230375e9.4.2026.06.21.05.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 05:55:33 -0700 (PDT)
Date: Sun, 21 Jun 2026 13:55:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>, Yury
 Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
Message-ID: <20260621135531.243375d9@pumpkin>
In-Reply-To: <87ik7cmcb7.ffs@fw13>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org> <87ik7cmcb7.ffs@fw13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sun, 21 Jun 2026 12:13:00 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

> On Sun, Jun 21 2026 at 05:34, Steven Rostedt wrote:
> > Instead of having trace_printk.h included in kernel.h, create a config
> > TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> > Makefile to allow developers to add trace_printk() without the need to add
> > the include for it. Having it included in the Makefile keeps it from being
> > in the dependency chain and it will not waste extra CPU cycles for those
> > building the kernel without using trace_printk.  
> 
> IOW, you make it worse just because.
> 
> With the header being separate I add the three trace_printk()s and the
> include to the source file I'm investigating. The recompile will build
> exactly this source file.
> 
> Having to enable the config knob will result in a full kernel rebuild
> for no value.

Indeed...
Isn't trace_printk() just an extern?
Having it defined somewhere isn't going to make any difference to build times.

	David
 

> 
> Seriously?
> 
> Thanks,
> 
>         tglx
> 
> 
> 

