Return-Path: <SRS0=x7Pm=FN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680A5C4167B
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 17:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A49723C30
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Dec 2020 17:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A49723C30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0E46EAE3;
	Wed,  9 Dec 2020 17:11:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047598913D;
 Tue,  8 Dec 2020 17:43:50 +0000 (UTC)
Date: Tue, 8 Dec 2020 19:43:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607449429;
 bh=4jaDJ4cW63InYyAcO+7Mk8fItHOLvl2IgoGj31CddDo=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kjwf8bc9wBpKUStdt/Oyw4IP3gAG4BibCF9WYfQgVPv+530xR3xCu2Guf/wEDpTZv
 odhZaT7q1+aavhFe4b2TwB68KYqEcC1kF2y9aUSB5cXcJiD941XmhB0McgOaLPIEJZ
 W6EZWxrOQyyvxUrb5Mf1z7g3bFls0bNk46P43gtUy1NO6N+uFlxU64F95VY7/6AWyG
 OWgWWRXFITVRhgvY37HEXXKb0NHWftCC9dIlynHB6m10QZ3d/yFn87P6/tvsnbzcv+
 57bNV7FET+rx6QNmQmTuf5rn0vCg/xB205fxkg3kHIYDsPhCRE+KLbVn//7RPnEhKi
 ZsEcFzQdWFaPA==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Message-ID: <20201208174344.GC58213@kernel.org>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-4-jsnitsel@redhat.com>
 <87tusy7n3b.fsf@nanos.tec.linutronix.de>
 <20201207192803.GH5487@ziepe.ca>
 <db6ccb14819c4c7a32e886eade144884fafc55fe.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db6ccb14819c4c7a32e886eade144884fafc55fe.camel@HansenPartnership.com>
X-Mailman-Approved-At: Wed, 09 Dec 2020 17:11:02 +0000
Subject: Re: [Intel-gfx] [PATCH v3 3/4] tpm_tis: Disable interrupts if
 interrupt storm detected
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
Cc: intel-gfx@lists.freedesktop.org, Jerry Snitselaar <jsnitsel@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Matthew Garrett <mjg59@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 11:58:44AM -0800, James Bottomley wrote:
> On Mon, 2020-12-07 at 15:28 -0400, Jason Gunthorpe wrote:
> > On Sun, Dec 06, 2020 at 08:26:16PM +0100, Thomas Gleixner wrote:
> > > Just as a side note. I was looking at tpm_tis_probe_irq_single()
> > > and that function is leaking the interrupt request if any of the
> > > checks afterwards fails, except for the final interrupt probe check
> > > which does a cleanup. That means on fail before that the interrupt
> > > handler stays requested up to the point where the module is
> > > removed. If that's a shared interrupt and some other device is
> > > active on the same line, then each interrupt from that device will
> > > call into the TPM code. Something like the below is needed.
> > > 
> > > Also the X86 autoprobe mechanism is interesting:
> > > 
> > > 	if (IS_ENABLED(CONFIG_X86))
> > > 		for (i = 3; i <= 15; i++)
> > > 			if (!tpm_tis_probe_irq_single(chip, intmask, 0,
> > > i))
> > > 				return;
> > > 
> > > The third argument is 'flags' which is handed to request_irq(). So
> > > that won't ever be able to probe a shared interrupt. But if an
> > > interrupt number > 0 is handed to tpm_tis_core_init() the interrupt
> > > is requested with IRQF_SHARED. Same issue when the chip has an
> > > interrupt number in the register. It's also requested exclusive
> > > which is pretty likely to fail on ancient x86 machines.
> > 
> > It is very likely none of this works any more, it has been repeatedly
> > reworked over the years and just left behind out of fear someone
> > needs it. I've thought it should be deleted for a while now.
> > 
> > I suppose the original logic was to try and probe without SHARED
> > because a probe would need exclusive access to the interrupt to tell
> > if the TPM was actually the source, not some other device.
> > 
> > It is all very old and very out of step with current thinking, IMHO.
> > I skeptical that TPM interrupts were ever valuable enough to deserve
> > this in the first place.
> 
> For what it's worth, I agree.  Trying to probe all 15 ISA interrupts is
> last millennium thinking we should completely avoid.  If it's not
> described in ACPI then you don't get an interrupt full stop.
> 
> James

Maybe you could add this as part of your patches?

/Jarkko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
