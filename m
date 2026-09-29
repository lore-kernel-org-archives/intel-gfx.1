Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4598ECA5FA5
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 23:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B502A10E0DB;
	Tue, 29 Sep 2026 23:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jAKtQmjY";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF75B10E0DB;
 Tue, 29 Sep 2026 23:40:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 95C98437C3;
 Tue, 29 Sep 2026 23:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC071F000FF;
 Tue, 29 Sep 2026 23:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790725234;
 bh=ogInYPJ7IzklVNC9KkLosJhFkWWy1wrM3/rgX1sltDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=jAKtQmjY9fva7wQ2tNXxrk+GDJW63Fvyey214fzstlIQtSoQkXK7qqtXH0uyA+iOA
 SfVsepNe0S/VKUPRlBqWnIVou0/4Vw1XARoG1sOyVwtJd158zbIrzuKxh4pnbTc+p3
 xedLFvdNEF/WX4+fnL14fQ/6QCKi+YamOg+vyqc+bbu7m5pKKeZe7r46Yj/Oyy/oKD
 kIg7uJAfPGUhijCYu4lqbntrGMxzkUycXZ7wBx92eP364CzvBYMVmnKGVDgGImPOD8
 sAOd+o2P43xTNDSWty5MRvVV1P/4O/Tqxd0SOfH27PiWcrAdFT4t2ENpUK8LJvyR5c
 bTa05m49ICV7A==
Date: Wed, 30 Sep 2026 01:40:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 drm/i915: Use %p for pointer formatting
Message-ID: <arxMSppUR-8Xrgum@zenone.zhora.eu>
References: <20260918103725.cfYzL1Wt@linutronix.de>
 <178973392516.181279.7948382320786706476@61270ab9df2a>
 <20260918124402.iotQ8TLn@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918124402.iotQ8TLn@linutronix.de>
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

Hi Sebastian,

> >   **FAILURE**
> > 
> >   Serious unknown changes coming with Patchwork_174505v1 absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in Patchwork_174505v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174505v1/index.html
> 
> This looks unrelated. Halp.

yes, it's unrelated. I restarted the tests

Andi
