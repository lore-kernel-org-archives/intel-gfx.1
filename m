Return-Path: <SRS0=YXNx=ED=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F42C4363A
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2020 12:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DAB924709
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2020 12:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DAB924709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FB86E508;
	Wed, 28 Oct 2020 12:20:48 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58CF6E508
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Oct 2020 12:20:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22822845-1500050 for multiple; Wed, 28 Oct 2020 12:20:45 +0000
MIME-Version: 1.0
In-Reply-To: <20201028111731.137873-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20201028111731.137873-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 28 Oct 2020 12:20:42 +0000
Message-ID: <160388764295.31056.16690430323368192220@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/jsl: Disable cursor clock gating
 in HDR mode
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
Cc: hariom.pandey@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Tejas Upadhyay (2020-10-28 11:17:31)
> Display underrun in HDR mode when cursor is enabled.
> RTL fix will be implemented CLKGATE_DIS_PSL_A bit 28-46520h.
> As per W/A 1604331009, Disable cursor clock gating in HDR mode.
> 
> Bspec : 33451
> 
> Cc: Souza Jose <jose.souza@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 32 ++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_reg.h              |  5 +++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index f41b6f8b5618..73c4a43e6e31 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -541,6 +541,19 @@ icl_wa_scalerclkgating(struct drm_i915_private *dev_priv, enum pipe pipe,
>                                intel_de_read(dev_priv, CLKGATE_DIS_PSL(pipe)) & ~DPFR_GATING_DIS);
>  }
>  
> +/* Wa_1604331009:jsl */
> +static void
> +jsl_wa_cursorclkgating(struct drm_i915_private *dev_priv, enum pipe pipe,
> +                      bool enable)
> +{
> +       if (enable)
> +               intel_de_write(dev_priv, CLKGATE_DIS_PSL(pipe),
> +                              intel_de_read(dev_priv, CLKGATE_DIS_PSL(pipe)) | CURSOR_GATING_DIS);
> +       else
> +               intel_de_write(dev_priv, CLKGATE_DIS_PSL(pipe),
> +                              intel_de_read(dev_priv, CLKGATE_DIS_PSL(pipe)) & ~CURSOR_GATING_DIS);

intel_de_rmw(i915, CLKGATE_DIS_PSL(pipe),
	CURSOR_GATING_DIS, enable ? CURSOR_GATING_DIS : 0);
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
