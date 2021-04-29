Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01866C433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 20:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8023E613FA
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 20:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8023E613FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260EA6F4B1;
	Thu, 29 Apr 2021 20:24:54 +0000 (UTC)
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Thu, 29 Apr 2021 20:05:05 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF606F49D;
 Thu, 29 Apr 2021 20:05:05 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id C43DD1C0BA2; Thu, 29 Apr 2021 21:58:44 +0200 (CEST)
Date: Thu, 29 Apr 2021 21:58:43 +0200
From: Pavel Machek <pavel@denx.de>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20210429195843.GA1067@bug>
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
 <CAKMK7uFONR-12CZEGJLrjgS0N-kF_v7_cXJEiSBPFoBbyRHn0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFONR-12CZEGJLrjgS0N-kF_v7_cXJEiSBPFoBbyRHn0w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Thu, 29 Apr 2021 20:24:52 +0000
Subject: Re: [Intel-gfx] [PATCH 000/190] Revertion of all of the umn.edu
 commits
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
Cc: Jean Delvare <jdelvare@suse.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Kangjie Lu <kjlu@umn.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Anholt, Eric" <eric@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, Aditya Pakki <pakki001@umn.edu>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi!

> >   Revert "drm/radeon: Fix reference count leaks caused by
> >     pm_runtime_get_sync"
> >   Revert "drm/radeon: fix multiple reference count leak"
> >   Revert "drm/amdkfd: Fix reference count leaks."
> 
> I didn't review these carefully, but from a quick look they all seem
> rather inconsequental. Either error paths that are very unlikely, or
> drivers which are very dead (looking at the entire list, not just what
> you reverted here).
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

So you are knowingly acking patch re-introducing bugs into kernel, because 
the bugs are minor? I don't believe that's an okay thing to do.

Maybe something needs reverting, but lets not introduce bugs into kernel because they are
"minor".

Best regards,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
