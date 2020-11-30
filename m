Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63A5C64E7B
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 21:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F8820857
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 21:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F8820857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2BB6E8D3;
	Mon, 30 Nov 2020 21:57:13 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DA66E8D3
 for <intel-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 21:57:11 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23168621-1500050 for multiple; Mon, 30 Nov 2020 21:57:08 +0000
MIME-Version: 1.0
In-Reply-To: <20201130212200.2811939-4-imre.deak@intel.com>
References: <20201130212200.2811939-1-imre.deak@intel.com>
 <20201130212200.2811939-4-imre.deak@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 21:57:07 +0000
Message-ID: <160677342757.12351.14998665573486802935@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 3/9] drm/i915: Track power references taken
 for enabled CRTCs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Imre Deak (2020-11-30 21:21:54)
> Add wakeref tracking for display power domain references taken for
> enabled CRTCs.
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  | 38 ++++++++-----------
>  .../drm/i915/display/intel_display_types.h    |  2 +-
>  2 files changed, 17 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index d80d15d96d4c..a6043197171b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7575,25 +7575,25 @@ modeset_get_crtc_power_domains(struct intel_crtc_state *crtc_state)
>         enum intel_display_power_domain domain;
>         u64 domains, new_domains, old_domains;
>  
> -       old_domains = crtc->enabled_power_domains;
> -       crtc->enabled_power_domains = new_domains =
> -               get_crtc_power_domains(crtc_state);
> +       domains = get_crtc_power_domains(crtc_state);
>  
> -       domains = new_domains & ~old_domains;
> +       new_domains = domains & ~crtc->enabled_power_domains.mask;
> +       old_domains = crtc->enabled_power_domains.mask & ~domains;

new / old denote the changes.

>  
> -       for_each_power_domain(domain, domains)
> -               intel_display_power_get(dev_priv, domain);
> +       for_each_power_domain(domain, new_domains)
> +               intel_display_power_get_in_set(dev_priv,
> +                                              &crtc->enabled_power_domains,
> +                                              domain);
>  
> -       return old_domains & ~new_domains;
> +       return old_domains;

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
