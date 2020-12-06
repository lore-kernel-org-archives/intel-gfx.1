Return-Path: <SRS0=af43=FK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F58C4361B
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Dec 2020 17:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 798602311B
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Dec 2020 17:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 798602311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EA389FF6;
	Sun,  6 Dec 2020 17:54:47 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B951889FF6;
 Sun,  6 Dec 2020 17:54:46 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607277285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07War4FnpacwFh1YaF/5joszhDH3pMW7WlC56is9w4I=;
 b=q1LwrbiDzWFlcihybyILl6urNUUlW3xoBHDW2gCbvkfnkEPMrsJZsZxh/u3wITbzLbrzsP
 muFiLKraQSlM6tmzlPpbkAra17ztgm20WOUD8w3h4bcn5gRFbnzKyPIjnEPubhplt2u4fx
 9Q+sEZJLg4KDNIj8Dwm+rrY7hUHRnJEu8dHN0lJLxPoLarEd6FJ3y0rzv7EllFhJCToaJU
 te848un/yV8u6K3ZeXL94SlrBnMb4v53QoV3v0yVtOJ2XNMOIo17w+IjymH+AeTP7kjaWJ
 9lO2rzwwoGDJAkNSoSmcP98uT/dNDppnGFTEHkThFMH5lzXPtOdoIT5Asm8Cjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607277285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07War4FnpacwFh1YaF/5joszhDH3pMW7WlC56is9w4I=;
 b=yKxLEMiFuaSYO1WtTlFlvn2N71he2D9R3O/UuYqLb68HVEC9MGqjskvFkXhbXCAC/YUhO3
 Ya9c1fGGjdMVKDCA==
To: Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20201205014340.148235-2-jsnitsel@redhat.com>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-2-jsnitsel@redhat.com>
Date: Sun, 06 Dec 2020 18:54:44 +0100
Message-ID: <87y2ia7rbv.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v3 1/4] irq: export kstat_irqs
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Jerry,

On Fri, Dec 04 2020 at 18:43, Jerry Snitselaar wrote:

The proper prefix is 'genirq:' git log kernel/irq/irqdesc.c would have
told you. 

> To try and detect potential interrupt storms that
> have been occurring with tpm_tis devices it was suggested
> to use kstat_irqs() to get the number of interrupts.
> Since tpm_tis can be built as a module it needs kstat_irqs
> exported.

I'm not really enthused about exporting this without making it at least
safe. Using it from an interrupt handler is obviously safe vs. concurrent
removal, but the next driver writer who thinks this is cool is going to
get it wrong for sure.

Though I still have to figure out what the advantage of invoking a
function which needs to do a radix tree lookup over a device local
counter is just to keep track of this.

I'll reply on the TPM part of this as well.

Thanks,

        tglx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
