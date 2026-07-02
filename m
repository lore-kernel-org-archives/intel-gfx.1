Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9B8C43458
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Jul 2026 16:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A698B10E4FB;
	Thu,  2 Jul 2026 16:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N7jteUps";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58B610E4FB
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Jul 2026 16:08:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A9E1601CA
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Jul 2026 16:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5314F1F000E9
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Jul 2026 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783008497;
 bh=Bzy1J1V+dDbAXSe9VNKFZZLD3StrFvFap/aDNXgh0Kw=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=N7jteUpsjB0YPyXezVVFHJPJ7lfQafQbmDA0VBcSu6e8UIGAtqRYVr6RPHLCQs0SL
 4jeUlBOBKF/7wVwp3rfXW1NijAwXwAWh6PBE2Zwp2+v6+Jm/rcln9ckV81JBSX22hl
 2BGFBFgV4+bWY874S0+Uu5gb4PtNYBEiFqz+vVWaMGcxf4dszMG4YmvCDEwWh5wfb/
 YWwiw0ejyIqnK6sSgFBqd/BBSWWOMv3y+j01bDe3qw4vKTb+y0OIHfUiUhCoanZawS
 ZH7bt6andaiuSdlhjrbyjKmPW9oVwnimtMtFeu48MWXwT16vh/ed8Ytr8S4bLUvms6
 E/tpbPcHa6FuA==
Date: Thu, 2 Jul 2026 17:08:10 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: intel-gfx@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJVSUxE?= =?utf-8?Q?=3A?= failure for
 convert more vm_flags_t users to vma_flags_t
Message-ID: <akaM1e1uO3tK_oGI@lucifer>
References: <cover.1782760670.git.ljs@kernel.org>
 <178294864427.140838.2153415744306457038@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178294864427.140838.2153415744306457038@6beec6c84f66>
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

On Wed, Jul 01, 2026 at 11:30:44PM +0000, Patchwork wrote:
> == Series Details ==
>
> Series: convert more vm_flags_t users to vma_flags_t
> URL   : https://patchwork.freedesktop.org/series/169610/
> State : failure
>
> == Summary ==
>
> Error: patch https://patchwork.freedesktop.org/api/1.0/series/169610/revisions/1/mbox/ not applied
> Applying: mm: introduce vma_flags_can_grow() and vma_can_grow()
> Applying: mm/vma: update do_mmap() to use vma_flags_t
> Applying: mm: convert __get_unmapped_area() to use vma_flags_t
> Applying: mm: update generic_get_unmapped_area[_topdown]() to use vma_flags_t
> Applying: mm: prefer mm->def_vma_flags in mm logic
> error: sha1 information is lacking or useless (mm/debug.c).
> error: could not build fake ancestor
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> Patch failed at 0005 mm: prefer mm->def_vma_flags in mm logic
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> Build failed, no error log produced
>
>

This will likely be because this series has a dependency on the 30 patch monster
series I sent which hasn't been merged anyway :)
