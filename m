Return-Path: <SRS0=cmqZ=OV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC918C433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Oct 2021 11:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71CE46136A
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Oct 2021 11:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71CE46136A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038116E519;
	Fri,  1 Oct 2021 11:11:49 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF786E519
 for <intel-gfx@lists.freedesktop.org>; Fri,  1 Oct 2021 11:11:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="247960262"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="247960262"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 04:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="520989392"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 01 Oct 2021 04:11:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 01 Oct 2021 14:11:43 +0300
Date: Fri, 1 Oct 2021 14:11:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <YVbs71EKg3PklL8T@intel.com>
References: <20211001100316.26441-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211001100316.26441-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH] drm/i915/reg: add AUD_TCA_DP_2DOT0_CTRL
 registers
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

On Fri, Oct 01, 2021 at 01:03:16PM +0300, Jani Nikula wrote:
> For controlling the audio SDP split.
> 
> Bspec: 63837
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 3a20a55d2512..0d2d89ea376b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9763,6 +9763,11 @@ enum {
>  #define   AUDIO_CP_READY(trans)		((1 << 1) << ((trans) * 4))
>  #define   AUDIO_ELD_VALID(trans)	((1 << 0) << ((trans) * 4))
>  
> +#define _AUD_TCA_DP_2DOT0_CTRL		0x650bc
> +#define _AUD_TCB_DP_2DOT0_CTRL		0x651bc
> +#define AUD_DP_2DOT0_CTRL(trans)	_MMIO_TRANS(trans, _AUD_TCA_DP_2DOT0_CTRL, _AUD_TCB_DP_2DOT0_CTRL)
> +#define  AUD_ENABLE_SDP_SPLIT		REG_BIT(31)

Don't need the other bits? Most of the do say we don't need to
program then. But the hblank guardband thing looks like maybe
we might need it in some cases?

Either way, what you have here matches my spec so
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +
>  #define HSW_AUD_CHICKENBIT			_MMIO(0x65f10)
>  #define   SKL_AUD_CODEC_WAKE_SIGNAL		(1 << 15)
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
