Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA3ACA5FC5
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 21:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC9310E10B;
	Wed, 30 Sep 2026 21:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LPSuTTzN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A293A10E10B
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 21:54:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 400E84374D;
 Wed, 30 Sep 2026 21:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294E21F00898;
 Wed, 30 Sep 2026 21:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790805271;
 bh=W0/Q3DhH4vc3kouAzmm1uMD/yoO+2sSMop3UJKvRkVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=LPSuTTzNF6/noYbJP6kN37juXn5LFUg0Ip/20jugvsSrUrmVskzXPquR7xU2IQMR6
 j2D5HiuU7UL8iwz9Hjm+qBY6PtXcUqYYomAr3iCC+RSzJ5eWR7Rquxsw0ssUopgjus
 P6vn6OnBjRFwp4EnXxDZnKP7RfcFricaW8vIR604ZCXWjlcRSeQQJP1Uai/xKHYDnk
 vG+0BfQQhg2dfLScrynanvP5MGZJmkPrsk/4VpnoimhFST1bWiAdImOF81Px1zcuQn
 5/8YlKxc8gg0kC/Gl1LakOAVdNi8gVDLR1uucU1O+fBBgOVq1mAvu6Un19lFg6QDQs
 DyhgFcr8ei/+A==
Date: Wed, 30 Sep 2026 23:54:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: size shmem writeback budget to the object
Message-ID: <ar2EyVGO4JgWgkM1@zenone.zhora.eu>
References: <20260915062924.2410550-1-matthias.goergens@gmail.com>
 <179014701977.1658553.16622035964431254845.budget@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179014701977.1658553.16622035964431254845.budget@gmail.com>
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

Hi Matthias,

thanks for your patch!

On Wed, Sep 23, 2026 at 03:04:01PM +0800, Matthias Goergens wrote:
> A gentle ping on this fix. CI appears to have stopped because my address
> isn't on the allowlist; could a project owner trigger a retest?

I restarted the tests on your patch. I just want to know: what
kind of issue have you seen here?

Thanks,
Andi
