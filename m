Return-Path: <SRS0=af43=FK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB455C433FE
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Dec 2020 19:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E5F222D08
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Dec 2020 19:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E5F222D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEFF6E462;
	Sun,  6 Dec 2020 19:29:03 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917826E462;
 Sun,  6 Dec 2020 19:29:02 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607282941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ZQJBUKdSm7qhXiIkkwFWbNpcU0Xq1O8cNhq+2evmiE=;
 b=IbGHUp/1hMNV93l5vjljjSUWY75j8BVopqgHCyrUaU185k7KWM2oqvogUhsKQlq6ctYwVy
 Zpzir1n+Pcrh6Xlj13FVXn8OHQ+UDR3AUkVXD3DuqqpWqsspTyizJFyZSwx1eWPDXLq49i
 xwKLOSZLwYK+NOVJuCL4GLJCGozpo+KjTuuO1m/jExShNJM9SwXmHz7wGR8mPXxu9sgFV8
 16A2O2rB+s+zLHPz77paylJX5nGRPdiOWIt38YJ7hc2aODTCguBd6cZ/aBE8uiU/w5P7CA
 0LFQ0Xf4sfqfJrZpelzGVF2aJ3P+Q6G6gKWM/123hl6I6tcK6pHeM25OMNUTrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607282941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ZQJBUKdSm7qhXiIkkwFWbNpcU0Xq1O8cNhq+2evmiE=;
 b=AegeveRBXMBfxnkThNlcHmQFhlF4eBAmdAOQ8DJt7ZQI2Nnpi8XL+HHu0QV/JPYt9gegON
 TUMDS1B6Vtwr7bCw==
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jerry Snitselaar <jsnitsel@redhat.com>
In-Reply-To: <7fe2d70b5daca57d9cd50d3877376e420658ed71.camel@HansenPartnership.com>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-2-jsnitsel@redhat.com>
 <20201205103954.GA17088@kernel.org> <87360i99ck.fsf@nanos.tec.linutronix.de>
 <7fe2d70b5daca57d9cd50d3877376e420658ed71.camel@HansenPartnership.com>
Date: Sun, 06 Dec 2020 20:29:00 +0100
Message-ID: <87r1o27myr.fsf@nanos.tec.linutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, Jiri Kosina <jkosina@suse.cz>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Yunfeng Ye <yeyunfeng@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, Dec 06 2020 at 09:40, James Bottomley wrote:
> On Sun, 2020-12-06 at 17:40 +0100, Thomas Gleixner wrote:
>> On Sat, Dec 05 2020 at 12:39, Jarkko Sakkinen wrote:
>> > On Fri, Dec 04, 2020 at 06:43:37PM -0700, Jerry Snitselaar wrote:
>> > > To try and detect potential interrupt storms that
>> > > have been occurring with tpm_tis devices it was suggested
>> > > to use kstat_irqs() to get the number of interrupts.
>> > > Since tpm_tis can be built as a module it needs kstat_irqs
>> > > exported.
>> > 
>> > I think you should also have a paragraph explicitly stating that
>> > i915_pmu.c contains a duplicate of kstat_irqs() because it is not
>> > exported as of today. It adds a lot more weight to this given that
>> > there is already existing mainline usage (kind of).
>> 
>> It's abusage and just the fact that it exists is not an argument by
>> itself.
>
> What we want is a count of the interrupts to see if we're having an
> interrupt storm from the TPM device (some seem to be wired to fire the
> interrupt even when there's no event to warrant it).  Since
> kstat_irqs_user() does the correct RCU locking, should we be using that
> instead?

If we need to export it, yes. But I still have to understand the
value. See my other reply.

Thanks,

        tglx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
