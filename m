Return-Path: <SRS0=af43=FK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7051C4361B
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Dec 2020 16:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D439230FA
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Dec 2020 16:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D439230FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E516E4B5;
	Sun,  6 Dec 2020 16:40:15 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0236E4B5;
 Sun,  6 Dec 2020 16:40:14 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607272812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UxNaH561nB/6wMCKxSCm/5bzqrWkopP59aHNwUEfXOY=;
 b=irjdflqS5FY9QNzj8yWEc0CGDtedfGm3Fed9wbR37X8mUImXyniJAr95CnF8GzZQfXPL0X
 PF8CaqXUSMNzdW0Pk5EjFxOefJpKJ3q3FteUSVIxsIh0Tc+r/DvdDXVXEekB7Piyhl2Y2/
 Gt6wt90XA8kc70biQYfl8nJgw5azvWQAre113wb8dQ4k/leC2xHkd42Np/DB3pHQ8JwYjV
 tKN3xbJJnA2QouLmBbFNOoNP9DVqPqs0g7GIv84jSvSfjBgHClBYSImwFnKBXNfnDoKkHT
 3AfpN0IihmtNwDDfzVtbHgz0bMyHh9rNP9EjmiJ6abzZUKHhSANtj2DSe6AZvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607272812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UxNaH561nB/6wMCKxSCm/5bzqrWkopP59aHNwUEfXOY=;
 b=YoGEF3MW5EHD8I8tGxLjV2l9qtp6ZTGOjeT+9EUTRn+dmQaP6rZR+5yqYKsCV/sMsQA4cM
 60KKUekD3ZhH0TBQ==
To: Jarkko Sakkinen <jarkko@kernel.org>, Jerry Snitselaar <jsnitsel@redhat.com>
In-Reply-To: <20201205103954.GA17088@kernel.org>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-2-jsnitsel@redhat.com>
 <20201205103954.GA17088@kernel.org>
Date: Sun, 06 Dec 2020 17:40:11 +0100
Message-ID: <87360i99ck.fsf@nanos.tec.linutronix.de>
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
 dri-devel@lists.freedesktop.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Yunfeng Ye <yeyunfeng@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sat, Dec 05 2020 at 12:39, Jarkko Sakkinen wrote:
> On Fri, Dec 04, 2020 at 06:43:37PM -0700, Jerry Snitselaar wrote:
>> To try and detect potential interrupt storms that
>> have been occurring with tpm_tis devices it was suggested
>> to use kstat_irqs() to get the number of interrupts.
>> Since tpm_tis can be built as a module it needs kstat_irqs
>> exported.
>
> I think you should also have a paragraph explicitly stating that
> i915_pmu.c contains a duplicate of kstat_irqs() because it is not
> exported as of today. It adds a lot more weight to this given that
> there is already existing mainline usage (kind of).

It's abusage and just the fact that it exists is not an argument by
itself.

Thanks,

        tglx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
