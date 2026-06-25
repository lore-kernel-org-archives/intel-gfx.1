Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD96CDE000
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Jun 2026 12:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA5310F279;
	Thu, 25 Jun 2026 12:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOAiF4Ku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8D010F279
 for <intel-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782389505; x=1813925505;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=4RTKbkitcOMjvGsAIVLHY1k5xkmU4W3qB9H7A5Crcx8=;
 b=hOAiF4Ku+kwbfDg57HKSyKYp0nrt3JbkJxxNf7B3mGt0wxS0XQXlYGAp
 fYK59MzSv5QZ5jO/3+pjksbMqg5LbPAxB7uuOYxyzGvjAyUidVIskYDrM
 eyiZtv2q0rbgptP+IdgKwA1u3TOQ7YHWg244JZ39U/9ulIwcCuqJky+Wg
 Oh7wHUi23Aih+cY+OzDtNJqM9Mdvf8C8lifCCHw8YFt8uO2A9EIL+sakb
 2S8rkxXNEaSMjGi31q473td7IDtP48hBtsuia8aoXiyKbi1McUm7s1i2f
 Dbl5MvfLxkeQlQpDK//R0zmhkQK7Qyk0z+buIptPC9fMH9VCWgpEqm+lX w==;
X-CSE-ConnectionGUID: zdMF6FkfSaqnsUkfkEmCxA==
X-CSE-MsgGUID: ++xn7iH5SLOhWz2xNoDQIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94282435"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="94282435"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 05:11:45 -0700
X-CSE-ConnectionGUID: B7sQKSidSg2K32SffHmesQ==
X-CSE-MsgGUID: lz2jBwjFRDqWegUGolBNTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="255557697"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.75])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 05:11:42 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ajznzdwvxSv2YNHp@zenone.zhora.eu>
References: <20260624090940.74840-1-joonas.lahtinen@linux.intel.com>
 <178230031953.112641.4817434529385736057@jlahtine-mobl>
 <ajvTjodx7LLj_BPO@zenone.zhora.eu>
 <178236741262.19845.6184407491878204182@jlahtine-mobl>
 <ajznzdwvxSv2YNHp@zenone.zhora.eu>
Subject: Re: [PATCH] drm/i915: Return NULL on error in active_instanceg
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>, Martin Hodo <martin.hodo@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
To: Andi Shyti <andi.shyti@kernel.org>
Date: Thu, 25 Jun 2026 15:11:39 +0300
Message-ID: <178238949911.113301.5828200905284576123@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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

Quoting Andi Shyti (2026-06-25 11:50:50)
> On Thu, Jun 25, 2026 at 09:03:32AM +0300, Joonas Lahtinen wrote:

<SNIP>

> The bug team is a different matter. Here we're talking about the
> review process.

What comes to the review process, you're entitled to express your
opinion how things should be.

If you do a rundown of average time spent on mailing list after R-b
before merge split per subsystem / driver and show some stats for
patches that are less than 10 lines, and we can maybe talk further.

Don't see the point otherwise. You do you, and me do me.

> > That's exactly what was done here. That's a fair ask, but asking for
> > maintainers not to merge any code because of false positives is simply
> > not.
>=20
> False positive or not, controversial or not, easy or difficult,
> patches have *always* been blocked when BAT was red.

There's a very clear difference between random noise in BAT and something
being wrong in BAT due to the patch. The whole reason for BAT to be establi=
shed
was to have a fast litmus test if the patch would break the world.

Original motivation was to avoid spinning up the more expensive shard
runs if the litmus test doesn't pass. And it was recognized back then
that we absolutely can't have false positives in BAT for things to work
out reasonably.

> Otherwise, we might as well stop running automatic tests for
> patches considered "non-controversial" and save CI resources.

Now that you bring it up, that's exactly what we should be targeting.

There is zero point in forcibly attaching test results to an individual
patch if that patch has exactly zero coverage in the test set.

So for example here, if we would have some nice automated code coverage
analysis that would have declared our tests don't have any coverage for
the patch in question and skipped shards, that would have absolutely
made sense (always allowing user to force the run, still).

The shard test run for this specific patch offers no other value than
an completely disconnected idle run of the test set. A completely
disconnected idle run would probably be even more valuable as it
wouldn't connect false positives to unrelated patch.

But I don't think we're there yet. So in the meanwhile let's try to
live with limitations of reality and fix some bugs.

Regards, Joonas
