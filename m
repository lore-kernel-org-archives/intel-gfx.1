Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A905CDB47F
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Jun 2026 08:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE15C10F1B9;
	Thu, 25 Jun 2026 08:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ElZBykRK";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4D310F1B9
 for <intel-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 08:50:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 47D1B60217;
 Thu, 25 Jun 2026 08:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343A21F000E9;
 Thu, 25 Jun 2026 08:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782377455;
 bh=94j9tcH3gHmgqgGGvo6s8vTq5w3oHDWpmmtffj7Lr/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ElZBykRKpnvAKp8ZpTdCQ5/E8HvExus66+R6Tx1kILNRrlqkzWC7m0Yul3nArpEAD
 Q/1HB8S2T2juGjR53x0A/0VtMbZ63cDvKch3NMj+PALadhSfCAXyA3Df5Op4oAt/jI
 3Jkrc9BEBd6+edUqKT8UHd8TuEFmOf+Y+i6h7bs0MDPI22AveLGmK8b+tr31CUiyFP
 vQDpBRxltp9BW5DLMC6pRP+wEs3oGoGWhTSf7UW96I0xBL3hINlLN9zeo6n/sVFxnG
 eMJJh8Z+JOTRvqe7PvBg8ow0WoZaZVboKdNZjos39hG8Mnk059SgZ2t0878rRk0BSF
 LrWU5s1+rGyIA==
Date: Thu, 25 Jun 2026 10:50:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>, Martin Hodo <martin.hodo@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Return NULL on error in active_instanceg
Message-ID: <ajznzdwvxSv2YNHp@zenone.zhora.eu>
References: <20260624090940.74840-1-joonas.lahtinen@linux.intel.com>
 <178230031953.112641.4817434529385736057@jlahtine-mobl>
 <ajvTjodx7LLj_BPO@zenone.zhora.eu>
 <178236741262.19845.6184407491878204182@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178236741262.19845.6184407491878204182@jlahtine-mobl>
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

Hi Joonas,

On Thu, Jun 25, 2026 at 09:03:32AM +0300, Joonas Lahtinen wrote:
> Quoting Andi Shyti (2026-06-24 15:59:30)
> > On Wed, Jun 24, 2026 at 02:25:19PM +0300, Joonas Lahtinen wrote:
> > > Pushed to drm-intel-gt-next, thanks for the reviews.
> > 
> > please, next time:
> > 
> > - Give people more time to review the patch. Only two hours
> >   passed between posting it and pushing it
> 
> And why exactly is that a problem? I got the review from the original
> patch author and a yet another person on top while it's a very
> uncontroversial and trivial patch. Two reviewers per patch is already
> quite a high bar to clear if you look at git history.
> 
> > (during lunch time, BTW).
> 
> Sorry, I did not know there is a universally agreed 2 hour lunch window
> in UTC timezone that I should follow. I've missed that memo.

It's not a matter of how many reviewers there are or how
controversial a patch may be. A patch needs to stay on the list
long enough for the whole community to have a chance to review
it. Give it one or two days.

Even if you and the other reviewers don't see anything wrong,
someone else might. As submitters and maintainers, we need to
give people a reasonable amount of time to look at every patch.
Two hours, at any time of the day, are definitely not enough.

We often complain when people send new revisions too early for
exactly the same reason.

> > - There were BAT failures. They were unrelated, but so far we
> >   have generally held back patches until BAT was green, even for
> >   the most obvious changes.
> 
> Strong disagree here. That'd have caused the patch to miss -next-fixes
> PR just due to random noise of CI.

We shouldn't care. The rules are the same for everyone, including
maintainers. Very often I've been told to wait until the next
cycle and very often I've asked others to do the same.

Besides, it's unfair to keep a patch on the list for only two
hours just to avoid missing the current cycle, while everyone
else is expected to wait.

> If there was a reasonable doubt about the impact of the patch on the
> failure, that'd of course be different, but here there was absolutely
> none in this case.
> 
> As per patchwork automated mail reply:
> 
> > If you think the reported changes have nothing to do with the changes
> > introduced in Patchwork_169089v1, please notify your bug team

The bug team is a different matter. Here we're talking about the
review process.

> That's exactly what was done here. That's a fair ask, but asking for
> maintainers not to merge any code because of false positives is simply
> not.

False positive or not, controversial or not, easy or difficult,
patches have *always* been blocked when BAT was red. The shard
tests don't even start if BAT is red.

Otherwise, we might as well stop running automatic tests for
patches considered "non-controversial" and save CI resources.

Andi

> Regards, Joonas
> 
> > 
> > Thanks,
> > Andi
