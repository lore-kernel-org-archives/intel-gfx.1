Return-Path: <SRS0=c+lk=PH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A0EC433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Oct 2021 13:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D92D61372
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Oct 2021 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D92D61372
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C2A6E117;
	Tue, 19 Oct 2021 13:14:30 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B1A6E0F5;
 Tue, 19 Oct 2021 13:14:29 +0000 (UTC)
Date: Tue, 19 Oct 2021 15:14:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1634649266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aUwJnRlQIydP6O6GVfSH+3WoGr2kIJwC1oiJFgiHODw=;
 b=EhgM6eYXFwC6NvEBasBiEOix6PVjwKhCBZxMczMzbOUCcSn89O7nNyYurnJWGrUWlKnASD
 Fe5RufL6n5Pt+MZfHBKfSeQUEIKhJ1FFy7GO4/BjRNVon+IM2AoQ8hBBcVeltX2oCEMDDN
 aLtsIGnzpbMF5u8DiWtq21+E4sSkuZQ39p/UPJUw6L9X49YfjuURLY8MzwDeqgXW4VWu4t
 pHFEvzfwFfRiJHT5Aq3rP5k3Iv9MZ9j3dICKuYozeFWkX2wlw1fNV0fZw7ab1zj/Hm13aI
 /9ObEogdhB28D7xfsMEgi8bOBM9kIrB8rskg0/Tx3BF+LCWanPZkHFEE6qzzgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1634649266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aUwJnRlQIydP6O6GVfSH+3WoGr2kIJwC1oiJFgiHODw=;
 b=LB3eRL6h0UBYPckGkO/uTNkKsIS6ExMCv4kO8ja+5JP+3ywgtSFvCEXtMNwBuS5edYexCF
 GdkX7eygQEgE4DDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20211019131424.k5hn467ut3g6fh4z@linutronix.de>
References: <20211005065151.828922-1-bigeasy@linutronix.de>
 <YWbK8wSxNjVu9OLm@phenom.ffwll.local>
 <20211013123525.5nijgyx5ivnuujes@linutronix.de>
 <YWbXvvTzMF1EZ5c7@phenom.ffwll.local>
 <20211013173548.nldcwheo4t52dgvp@linutronix.de>
 <YWgu0v5iPDFViHXS@phenom.ffwll.local>
 <20211014134731.4a5vgdklj3sjyfks@linutronix.de>
 <YW64/Y8RgU63BYY2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YW64/Y8RgU63BYY2@phenom.ffwll.local>
Subject: Re: [Intel-gfx] [RFC PATCH] drm: Increase DRM_OBJECT_MAX_PROPERTY
 by 18.
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

On 2021-10-19 14:24:29 [+0200], Daniel Vetter wrote:
> 
> Ah dmesg help me understand what's going on. Does the below patch help? If
> it's this one that would also explain why intel CI hasn't hit it - it's a
> leak between tests and we run them all individually instead of once at
> boot-up.

Yes, it does. Thank you.

Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Cheers, Daniel

Sebastian
