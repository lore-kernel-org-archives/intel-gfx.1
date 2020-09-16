Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395CBC433E2
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB52A206B6
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:41:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPvSHpRX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB52A206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250AC6EAB1;
	Wed, 16 Sep 2020 17:41:14 +0000 (UTC)
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFC16EA74
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 17:41:12 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 7so4537290vsp.6
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IcIt6h02qzApmrr/8N1I1DMxWP6A9FljKeLWzTiB+Z0=;
 b=XPvSHpRXpoPp2GhE2MXqtYoc8csc50c3LhnququRL8oM4z4N4fPlRH37mYcV3wRrcz
 zVTPy53HdH/3qQn4CYBOxK7egML6lywwyMFloacBbRA5kdVpmxFDpWZ1ZBWiAEOWlZ72
 oDIA88A96qPHBLdpJMNNbby7jfUPE7uX47ClUY26Zd/EFwHNmuqh5tPeOchl3yf9BuCV
 xBJpwHaxU3mF/Qf8818FF9mHDFB5/T7VYkXWu5039CqVvrI/2TEaHnQvcNqQ+faPnJFj
 ircC5R5n+p16gGsgJr3xjxe6Vv0i2jQHouDMxYwhWu2Vc2gwSFaK+R5UURY4CrgBF2dz
 BtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IcIt6h02qzApmrr/8N1I1DMxWP6A9FljKeLWzTiB+Z0=;
 b=k77u/gaQcFgxEipllIZjwD6G86xIhyGZXNhh1z8eBNEXSY4gE0B200aGqACxqe8vlt
 38XKD8P8UBprEEW3CN18/y+yvV34z7up13wAq8P39PWtQMpCgA3MOdfSu7Tq+4S7nfRO
 jKBJurMUbOkFJrljVjiWWPVExN3AF+E3R8q3Z8JueWi+NuS8NzDOE8eOt5/i2K7X+dDn
 NaM128AQfYofSnkSKy/0Hl3etQqqUSiPRd7dy3A6RK+1Dy5znZosJVrUAn1KuKFKPh7a
 baw/J8EJR82jUhARYAbFD+NonNImfFUwkji36O78DPZoxZ2s1it3FwB9M3RScwhGP0fR
 ut3g==
X-Gm-Message-State: AOAM533P3lJZw87bOkvzbxqkDWSOsNbnJTrDCgoysvgFqrOFvu1GQZAb
 gps4AdLFB++SqKZOpTheaVcWLqXDj2Jo3M+GPjq0dbKXIcpVGA==
X-Google-Smtp-Source: ABdhPJzzjIiueXJEXxNvU5gge+CVnqDfE9PWbHUskA6iuMo2dYzXM64S2JeB7SDrZsDEKxD2b0ACVhCIN0Kos/wWHGY=
X-Received: by 2002:a67:e3d4:: with SMTP id k20mr5740607vsm.60.1600278071791; 
 Wed, 16 Sep 2020 10:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200916094607.409-1-chris@chris-wilson.co.uk>
 <20200916094607.409-3-chris@chris-wilson.co.uk>
In-Reply-To: <20200916094607.409-3-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 16 Sep 2020 18:40:45 +0100
Message-ID: <CAM0jSHMdcGgtTD1DWVxoi2zG8_rLEmn51MvvMmcO8-OGKV9Sfg@mail.gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/gt: Retire cancelled requests
 on unload
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 16 Sep 2020 at 10:46, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> If we manage to hit the intel_gt_set_wedged_on_fini() while active, i.e.
> module unload during a stress test, we may cancel the requests but not
> clean up. This leads to a slow module unload as we wait for something or
> other to trigger the retirement flushing. Instead if we explicitly
> cancel then cleanup on an active unload, it should be instant.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
