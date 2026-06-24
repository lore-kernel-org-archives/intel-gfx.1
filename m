Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67CCCDB479
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Jun 2026 12:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F78B10E0AB;
	Wed, 24 Jun 2026 12:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TyVTDuvq";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58310E0AB
 for <intel-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 12:59:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 82F77429EE;
 Wed, 24 Jun 2026 12:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8500E1F000E9;
 Wed, 24 Jun 2026 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782305975;
 bh=V1cmYLSXROW5IXWNTGx3/nUqf+/aKOiIIR3ymVREkxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=TyVTDuvqe512D15DGXpPqu0lhG4ucutzo1uWi8OvhK2EYovjwUoh5f29YR06CFlma
 sJg5bj5xGeXab8pHxQ+cGoeRH7AVknASKAwebj8Zy/YQjCTOj7SMJeR+O5ThqJIUga
 AWTy2QeJq0EXsi8BzPc8ms8LCNM7gaTBMMC1ppTi3AYE6YZmlDKLVCOegKghLIBdbg
 r+hd8as1Cn9Ne1Xwq52xgCa/umeAnd7/y788DJqrlI5PRnBDS9hiGgEYR8PmUt2hyf
 9kqByNq/tU7WPtsX52sI2k9MSZkIYjPL4mxSMdO0RAlWdmgqngUgBf2vhWy9QC1NnF
 IGdpZWHQw7hPg==
Date: Wed, 24 Jun 2026 14:59:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>, Martin Hodo <martin.hodo@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Return NULL on error in active_instance
Message-ID: <ajvTjodx7LLj_BPO@zenone.zhora.eu>
References: <20260624090940.74840-1-joonas.lahtinen@linux.intel.com>
 <178230031953.112641.4817434529385736057@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178230031953.112641.4817434529385736057@jlahtine-mobl>
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

On Wed, Jun 24, 2026 at 02:25:19PM +0300, Joonas Lahtinen wrote:
> Pushed to drm-intel-gt-next, thanks for the reviews.

please, next time:

- Give people more time to review the patch. Only two hours
  passed between posting it and pushing it (during lunch time,
  BTW).

- There were BAT failures. They were unrelated, but so far we
  have generally held back patches until BAT was green, even for
  the most obvious changes.

Thanks,
Andi
