Return-Path: <SRS0=KMKB=H6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C982CC433E0
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Feb 2021 16:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64AA664E27
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Feb 2021 16:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64AA664E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D660B89C61;
	Sun, 28 Feb 2021 16:57:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D346E89C61
 for <intel-gfx@lists.freedesktop.org>; Sun, 28 Feb 2021 16:57:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC95364E4A;
 Sun, 28 Feb 2021 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614531453;
 bh=elywOISqfW65pI9FKoAX66OzSCyJWWigVNSkKoFG1bQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KEjl6dczglM2Qu32+hR4X5/6TO3jX5BMZyC4Kb8Inj/D5+Gd72UCJwvf3JxionpWZ
 tiHspstoFN6hEsU/xpZmelxykHOEZjMB7phV6mO956puoX/WViw543AnWJ+OBz+Zeb
 qHkMqOYSCL8GhxtxexaQwu04ANe5KNbfnkHMlG88=
Date: Sun, 28 Feb 2021 17:57:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <YDvLeslGElXdjf2t@kroah.com>
References: <3423617.kz1aARBMGD@archlinux> <YDuzbvIjMO5mFcYm@kroah.com>
 <e662d6bf-53e3-9774-37db-9e7ea88a4ec9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e662d6bf-53e3-9774-37db-9e7ea88a4ec9@redhat.com>
Subject: Re: [Intel-gfx] -stable regression in Intel graphics,
 introduced in Linux 5.10.9
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
Cc: Diego Calleja <diegocg@gmail.com>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 05:28:06PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 2/28/21 4:14 PM, Greg KH wrote:
> > On Sun, Feb 28, 2021 at 03:29:07PM +0100, Diego Calleja wrote:
> >> Hi,
> >>
> >> There is a regression in Linux 5.10.9 that does not happen in 5.10.8. It is still there as
> >> of 5.11.1
> > 
> > Is this the same issue reported here:
> > 	https://lore.kernel.org/r/f1070486-891a-8ec0-0390-b9aeb03178ce@redhat.com
> > ?
> > 
> > If so, is this a problem in 5.11 as well?
> 
> I see in the original email:
> https://lore.kernel.org/stable/3423617.kz1aARBMGD@archlinux/
> 
> That Diego is using the iGPU part of a Haswell CPU, so yes this is almost
> certainly the same issue.
> 
> Diego as I already mentioned to another arch user, it would be good if the
> arch kernel-maintainers can pick-up these 3 commits from the drm-intel tree
> as downstream patches for now:
> 
> e627d5923cae ("drm/i915/gt: One more flush for Baytrail clear residuals")
> d30bbd62b1bf ("drm/i915/gt: Flush before changing register state")
> 1914911f4aa0 ("drm/i915/gt: Correct surface base address for renderclear")
> 
> We (Fedora) have added these as downstream patches for now and we have
> multiple reports that these resolve the problem.
> 
> Chris, can you please send the 2nd and 3th commit of the above list on
> their way to Linus ASAP, so that Greg can add them to the stable series?
> 
> ATM only the 1st commit is in Linus tree (unless the others have landed
> with different hashes?)

I have queued the first one up now, thanks.

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
