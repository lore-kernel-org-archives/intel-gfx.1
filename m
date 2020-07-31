Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DAAC433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 07:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E6B207F5
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 07:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myUndLhn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E6B207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA636EA0F;
	Fri, 31 Jul 2020 07:53:45 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F716EA0F
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 07:53:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q76so7154134wme.4
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0psmwajGcXOL84pLN4Gz093pgl80GmuNkldwWTZ4VNA=;
 b=myUndLhnJi0EnXd6Uw5pBhPcBAsVxtsQRj3bOByXC+tkvO0hvwqQgj3iR5soPm9nuK
 PXwg4PVLwcG5j5fWYj6xI2GMMqj3yGf/Gbe61shhQ11qcoXYUMiX4H8tFthtUs4f2sbw
 qHypybDHdwNn20v+gItZUpF7jsC03dlQ2jBLIV1gCBAQLDPj4bIhHAR1uelLPPnW48xO
 99xYRTj+wNwRPqzSQ7GQbYO3zIVLNrA5eGyRY1zTFOUrZDR75CdaPzCzdo786HYB8vOW
 XEaYKnjbxalDguAOdgEJ8bGaFhdGaUQRK2Dzql0T2HcUD4vAoV2+xCb9n7b524GTyrqj
 0NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0psmwajGcXOL84pLN4Gz093pgl80GmuNkldwWTZ4VNA=;
 b=TdxeX/ILP0Pt4W+YOfMcHfRkVRQXpiC76NP/Ouhb5Pw5b5HMzsvsmY81SuelVJsIvz
 UhCs7PoL9B4cexudULHr3zFKISm9VQQy6k8VjAUDxomT3qlbWRKHBdIRNesuyyuVUFeZ
 BBwmXrsN7P/VLZyXu87eTQPp5pOHnT/o7U0TDebhO+8/6BgbMc9VPpZcD0fgQf2qzFRO
 5TW11RiG619hQOYcG2hF2PMz5R+FVOnXM7MUZcdKuVLArNY9hoymBwsMs+uDhgSjFyAF
 MkoFOSPjLJA36upBr9v0qaE4mihnRB4HaIZHYphKFzDU3IpuC/ziJbJnJoNFn1hrcvwo
 9Fyw==
X-Gm-Message-State: AOAM5301vA4guUxzr6wNO0UpmA8bXtMofK2xMdG14Ogyk+S/VC5L7wt6
 1J8YzeThphzXezYscKwuwPOl8Qn5qZZxPkMSNj0=
X-Google-Smtp-Source: ABdhPJxfZf0ivO0j0nF6vwaFqX2r6X1O8i5QJZ7LFRLYe0A9+QQcf3lHo+XAbKXaZeWukCbFroJY1m+Kfsq1K8pmcIw=
X-Received: by 2002:a1c:b785:: with SMTP id h127mr2047951wmf.100.1596182023397; 
 Fri, 31 Jul 2020 00:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200612204734.3674650-1-matthew.d.roper@intel.com>
In-Reply-To: <20200612204734.3674650-1-matthew.d.roper@intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Fri, 31 Jul 2020 00:53:31 -0700
Message-ID: <CAKi4VAJz1SWT64SWwZSfASmmRLsNru7wZpFeXgmMbnWHrEpH8w@mail.gmail.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Update bw_buddy pagemask table
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 1:47 PM Matt Roper <matthew.d.roper@intel.com> wrote:
>
> A recent bspec update removed the LPDDR4 single channel entry from the
> buddy register table, but added a new four-channel entry.
>
> Workaround 1409767108 hasn't been updated with any guidance for four
> channel configurations, so we leave that alternate table unchanged for
> now.
>
> Bspec 49218
> Fixes: 3fa01d642fa7 ("drm/i915/tgl: Program BW_BUDDY registers during display init")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Matches spec.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 24a2aa1fdc9c..a592a7dd71a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -5240,10 +5240,10 @@ struct buddy_page_mask {
>  };
>
>  static const struct buddy_page_mask tgl_buddy_page_masks[] = {
> -       { .num_channels = 1, .type = INTEL_DRAM_LPDDR4, .page_mask = 0xE },
>         { .num_channels = 1, .type = INTEL_DRAM_DDR4,   .page_mask = 0xF },
>         { .num_channels = 2, .type = INTEL_DRAM_LPDDR4, .page_mask = 0x1C },
>         { .num_channels = 2, .type = INTEL_DRAM_DDR4,   .page_mask = 0x1F },
> +       { .num_channels = 4, .type = INTEL_DRAM_LPDDR4, .page_mask = 0x38 },
>         {}
>  };
>
> --
> 2.24.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



-- 
Lucas De Marchi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
