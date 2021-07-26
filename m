Return-Path: <SRS0=Qdda=MS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC385C4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 15:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56DFE60E08
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 15:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56DFE60E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jlekstrand.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80356E980;
	Mon, 26 Jul 2021 15:23:21 +0000 (UTC)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F966ED84
 for <intel-gfx@lists.freedesktop.org>; Mon, 26 Jul 2021 15:23:20 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id g76so15439250ybf.4
 for <intel-gfx@lists.freedesktop.org>; Mon, 26 Jul 2021 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VYni6LxPY5IYpOTqFxP6J2SxNh56/QyuzJ13NMi4XkY=;
 b=oPGcCMZjLgxVsJEqoec2xz906Y9EeQRM+FpeBbDFS8RJk/erKW7GWK9cp4lQEaMvYz
 5GI6r9j2xBemFHM7YWffSBqOejWjRPmnPCKJu0098Yoi9sPPSU9ZE37fWAbu6+Wk0N57
 Myo0QInItSJqa/GI/iqSt317HacAzmFrk9RoKIHpMKfdtU+WMXL3hP4MhmitpHqXWbVG
 YlY/7HR54vE13IfxvoZ7BEPtOW2bWknpf2XyDDZtclt38hBkGdgK7UNL9MLCsHBsBXAB
 8HNaAdamwrZEPNpouWlNinfJ/JYlJTsf1WeRdnss1uQrr29WxMrz033MCoPE5EGe0vW+
 pFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VYni6LxPY5IYpOTqFxP6J2SxNh56/QyuzJ13NMi4XkY=;
 b=rUa66us+WA5LSukUFi0VN9nd7Puy9HUSeA5ECym0ueTswbgmjPbEYv23ee/cBUlEUE
 M4zobYdndZzbnbVT+FuLmxlQk5jDT0RdNyIh9C1XRGHDQqTbjVxl9+xTUWOMGlROQAPP
 AM3Bn078NG7GLqmwaK70NvHeP2VDZArpVEl0dOFojgHU2rw0bmH3EEUIu6RMtS2a2WEg
 kiTZQT1MQ988HZ5rtlRnOGyIHuOpa1AzjX8wvsgF38s836NKfG6LiZLxE1bw2ioXB99x
 AtgQBmKJCErtQ2ph1AA+2NBR6opK3ZmmKnRe37r5HbPFHZ8FGYeV6kxcASaSbbycF0S4
 TCCg==
X-Gm-Message-State: AOAM533A/w3UYbjxPzjaCHpaxWlakD8qNjnrdnWS9ZOp/eaiGxtq0KHv
 3nJ13LCNJUCcLT0JECnex3D0nVLzDG94AsGX7bUqrg==
X-Google-Smtp-Source: ABdhPJyjXUJIEr5ZiJh3TsNDgqayxwC2GYIE0gA4BkBOIjBwUfkE94PCY5Kuu1jjidwn2xFIjIDvU/if+Likv9ug+dw=
X-Received: by 2002:a25:b708:: with SMTP id t8mr3562702ybj.139.1627312999994; 
 Mon, 26 Jul 2021 08:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:23:08 -0500
Message-ID: <CAOFGe97wB=1Jx9CMZt=H8Di7EAv1XmU0=5ohJGCBaN1vcGPv=A@mail.gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 01/10] drm/i915: Check for nomodeset in
 i915_init() first
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 2:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> When modesetting (aka the full pci driver, which has nothing to do
> with disable_display option, which just gives you the full pci driver
> without the display driver) is disabled, we load nothing and do
> nothing.
>
> So move that check first, for a bit of orderliness. With Jason's
> module init/exit table this now becomes trivial.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

> ---
>  drivers/gpu/drm/i915/i915_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 48ea23dd3b5b..0deaeeba2347 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1292,9 +1292,9 @@ static const struct {
>     int (*init)(void);
>     void (*exit)(void);
>  } init_funcs[] = {
> +       { i915_check_nomodeset, NULL },
>         { i915_globals_init, i915_globals_exit },
>         { i915_mock_selftests, NULL },
> -       { i915_check_nomodeset, NULL },
>         { i915_pmu_init, i915_pmu_exit },
>         { i915_register_pci_driver, i915_unregister_pci_driver },
>         { i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> --
> 2.32.0
>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
