Return-Path: <SRS0=5W5W=OU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200A6C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 15:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC295615E5
	for <intel-gfx@archiver.kernel.org>; Thu, 30 Sep 2021 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC295615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=acc.umu.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD076E42C;
	Thu, 30 Sep 2021 15:16:27 +0000 (UTC)
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400CD6E424
 for <intel-gfx@lists.freedesktop.org>; Thu, 30 Sep 2021 14:50:20 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by amavisd-new (Postfix) with ESMTP id 77C0744B92;
 Thu, 30 Sep 2021 16:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=acc.umu.se; s=mail1;
 t=1633013417; bh=AouqioL2lxnri5ub1dgqNPA2hUHAAazfLMuQb3snPvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x8Brwc5Bj7K98jTXO2cWimlxRSI1CJaJMq7XxACUJ/tsVO/rL9MDgLekHTZN03ri8
 Na1aH59kY2EBlFbyOlUbB3k5wtV94W5jN0YxV7hhRtg1HFeALfdMw15QonjVU1XF2U
 vc+WZYVYgiAmp2/m8QAv/JbYOEkCGHzk/NXbFLBv82/jV1CmZurtOxbw1nqCV8LW1J
 uA+SDATA772BuMsy09hPKsTc/+f7oXrRRcaZfNV08zOF+ZofM6R6mfmOzIkFF0ENPk
 lOeoDdztrsKYxiVtV8CoJsHMfPMikCRA/04VFNNUeqMrJB+C8MRHP6ZkajAZ2BykEl
 DrSSs15zB5N3A==
Received: by mail.acc.umu.se (Postfix, from userid 24471)
 id 2440644B93; Thu, 30 Sep 2021 16:50:17 +0200 (CEST)
Date: Thu, 30 Sep 2021 16:50:16 +0200
From: Anton Lundin <glance@acc.umu.se>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <20210930145016.GJ108031@montezuma.acc.umu.se>
References: <20210929160659.GI108031@montezuma.acc.umu.se>
 <20210930133751.pouqnfklay4etup2@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930133751.pouqnfklay4etup2@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 30 Sep 2021 15:16:26 +0000
Subject: Re: [Intel-gfx] Picture stutter on i915 Graphics P630]
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

On 30 September, 2021 - Sebastian Andrzej Siewior wrote:

> On 2021-09-29 18:07:00 [+0200], Anton Lundin wrote:
> > Hi.
> Hi,
> 
> > While I was chasing some other bugs I tested 5.15-rc3-rt5 and noted your
> > code e446c2038b58 ("drm/i915/gt: Use spin_lock_irq() instead of
> > local_irq_disable() + spin_lock()") and noted that this patch created a
> > lot of visual glitches, freeze-frames for about 0.5s every couple of
> > seconds.
> > 
> > The card identifies itself as: (if that matters)
> > Intel Corporation CoffeeLake-S GT2 [UHD Graphics P630] [8086:3e96]
> > 
> > Reverting that patch resolved quite a lot of the glitches but there are
> > still a couple of minor ones left, that I'm trying to chase down.
> > 
> > 
> > None of those glitches are there on the same workload on a regular
> > 5.15-rc3 kernel.
> 
> You are talking about that commit and 5.15-rc3-rt5 with PREEMPT_RT
> enabled?

Yes, with that commit and a PREEMPT_RT, there's a lot if visual
glitches. With that commit reverted, there are still minor glitches
which comes from somewhere else in the PREEMPT_RT codepaths,
that I haven't found yet, but with that patch reverted the i915 output
is almost usable.


//Anton
