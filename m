Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5156C35FFA
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Mar 2025 17:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7968210E55B;
	Wed, 19 Mar 2025 17:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.b="V9hZbCuI";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C796F10E55B
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Mar 2025 17:13:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 54730A4924A;
 Wed, 19 Mar 2025 17:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2540C4CEE9;
 Wed, 19 Mar 2025 17:13:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="V9hZbCuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1742404414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezPW8Ofll5jcvPOM6XGPTr1u1TQa1b4BIgp62sYV2Oo=;
 b=V9hZbCuIKbNh2yo4Rio59GzMwMrTXLGYBYQenS3/BjJcent7rcxiADyKHRY1TBhfNbN4xD
 lQvl3aDfhRCsnB87O19jWcftG8jD09Nx5fK7wQsxNQth0OO/Jps3aZEpX5VniaiGSr56xl
 BmZM3I+d4zomsVUol/OMthurcaTEUYU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1495fefb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 19 Mar 2025 17:13:33 +0000 (UTC)
Date: Wed, 19 Mar 2025 18:13:29 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Markus Theil <theil.markus@gmail.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org, tytso@mit.edu
Subject: Re: [PATCH v2 1/3] drm/i915/selftests: use prandom in selftest
Message-ID: <Z9r7ORwztMxsNyF4@zx2c4.com>
References: <CAHmME9oqvWp_Nd1Gwgyw52qy8wxztMyCpNsjByH=VnRaXqczww@mail.gmail.com>
 <20250211063332.16542-1-theil.markus@gmail.com>
 <20250211063332.16542-2-theil.markus@gmail.com>
 <Z64pkN7eU6yHPifn@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z64pkN7eU6yHPifn@ashyti-mobl2.lan>
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

Hi Andi,

On Thu, Feb 13, 2025 at 06:19:12PM +0100, Andi Shyti wrote:
> Hi Markus,
> 
> On Tue, Feb 11, 2025 at 07:33:30AM +0100, Markus Theil wrote:
> > This is part of a prandom cleanup, which removes
> > next_pseudo_random32 and replaces it with the standard PRNG.
> > 
> > Signed-off-by: Markus Theil <theil.markus@gmail.com>
> 
> I merged just this patch in drm-intel-gt-next.

This is minorly annoying for me... What am I supposed to do with patches
2 and 3? Take them through my tree for 6.16 in like half a year? Can I
just take the v1 into my tree and we can get this done with straight
forwardly? Or do you have a different suggestion for me?

Jason
