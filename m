Return-Path: <SRS0=QaN2=QC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CBCC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 19:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52D9636D5
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 19:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E52D9636D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABE66E10C;
	Mon, 15 Nov 2021 19:05:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26726E10C
 for <intel-gfx@lists.freedesktop.org>; Mon, 15 Nov 2021 19:05:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="296937319"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="296937319"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 11:05:02 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="506048667"
Received: from rakeshr1-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.37.176])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 11:05:01 -0800
Date: Mon, 15 Nov 2021 14:05:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <YZKvXNyv1bAcU2Xx@intel.com>
References: <20211112193813.8224-1-ville.syrjala@linux.intel.com>
 <20211112193813.8224-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211112193813.8224-2-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/9] drm/i915: Bump DSL linemask to 20 bits
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 09:38:05PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Since tgl PIPE_DSL has 20 bits for the scanline. Let's bump our
> definition to match. And while at it let's also add the define
> for the current field readback.
> 
> We can also get rid of the gen2 vs. gen3+ nonsense since none
> of the extra bits ever did anything and just always read
> as zero.

You are stepping over reserved bits on older platforms here.

I understand that must probably hw is not using this for anything
and the reads are only zero. But I'm always afraid of opening
precedence for this kind of assumptions and end up stepping
over some reserved bit that hw is using for something else
but not documented.

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 10 ++--------
>  drivers/gpu/drm/i915/i915_irq.c              |  7 ++-----
>  drivers/gpu/drm/i915/i915_reg.h              |  4 ++--
>  3 files changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 0ceee8ac6671..6073f94632ab 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -348,16 +348,10 @@ static bool pipe_scanline_is_moving(struct drm_i915_private *dev_priv,
>  {
>  	i915_reg_t reg = PIPEDSL(pipe);
>  	u32 line1, line2;
> -	u32 line_mask;
>  
> -	if (DISPLAY_VER(dev_priv) == 2)
> -		line_mask = DSL_LINEMASK_GEN2;
> -	else
> -		line_mask = DSL_LINEMASK_GEN3;
> -
> -	line1 = intel_de_read(dev_priv, reg) & line_mask;
> +	line1 = intel_de_read(dev_priv, reg) & PIPEDSL_LINE_MASK;
>  	msleep(5);
> -	line2 = intel_de_read(dev_priv, reg) & line_mask;
> +	line2 = intel_de_read(dev_priv, reg) & PIPEDSL_LINE_MASK;
>  
>  	return line1 != line2;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 038a9ec563c1..eb8c92324aee 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -836,10 +836,7 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		vtotal /= 2;
>  
> -	if (DISPLAY_VER(dev_priv) == 2)
> -		position = intel_de_read_fw(dev_priv, PIPEDSL(pipe)) & DSL_LINEMASK_GEN2;
> -	else
> -		position = intel_de_read_fw(dev_priv, PIPEDSL(pipe)) & DSL_LINEMASK_GEN3;
> +	position = intel_de_read_fw(dev_priv, PIPEDSL(pipe)) & PIPEDSL_LINE_MASK;
>  
>  	/*
>  	 * On HSW, the DSL reg (0x70000) appears to return 0 if we
> @@ -858,7 +855,7 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
>  
>  		for (i = 0; i < 100; i++) {
>  			udelay(1);
> -			temp = intel_de_read_fw(dev_priv, PIPEDSL(pipe)) & DSL_LINEMASK_GEN3;
> +			temp = intel_de_read_fw(dev_priv, PIPEDSL(pipe)) & PIPEDSL_LINE_MASK;
>  			if (temp != position) {
>  				position = temp;
>  				break;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 686f0a1b7860..f5d54ed2efc1 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6165,8 +6165,8 @@ enum {
>  
>  /* Pipe A */
>  #define _PIPEADSL		0x70000
> -#define   DSL_LINEMASK_GEN2	0x00000fff
> -#define   DSL_LINEMASK_GEN3	0x00001fff
> +#define   PIPEDSL_CURR_FIELD	REG_BIT(31) /* ctg+ */
> +#define   PIPEDSL_LINE_MASK	REG_GENMASK(19, 0)
>  #define _PIPEACONF		0x70008
>  #define   PIPECONF_ENABLE	(1 << 31)
>  #define   PIPECONF_DISABLE	0
> -- 
> 2.32.0
> 
