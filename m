Return-Path: <SRS0=/3Pa=EQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC574C55ABD
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 10:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C94207D3
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2020 10:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C94207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A59895EE;
	Tue, 10 Nov 2020 10:13:16 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4362B895EE
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 10:13:15 +0000 (UTC)
IronPort-SDR: NXRE/mIxGwcsXyNXcnu9k8v8GQ5nY9D1irZAKzXirOxYUsbnt+4hNaiBLsajv/TB1LiL2lG3WA
 JhAFbpLipvXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="170059931"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="170059931"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 02:13:14 -0800
IronPort-SDR: 14G14p/vjz8VJpqOvse7tpxFLaixb1iBorfvQnBWu8Y27P9toD5zTjGXZ36BlzLQlvj46SvU6L
 vmaLjLIWcCSQ==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="541270542"
Received: from ideacone-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.80.124])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 02:13:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20201022222709.29386-2-manasi.d.navare@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201022222709.29386-1-manasi.d.navare@intel.com>
 <20201022222709.29386-2-manasi.d.navare@intel.com>
Date: Tue, 10 Nov 2020 12:13:09 +0200
Message-ID: <87361htt8q.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 01/11] drm/i915: Add REG_FIELD_PREP to VRR
 register def
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

On Thu, 22 Oct 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
> VRR_CTL register onloy had a GENMASK but no field prep
> define for TRANS_VRR_CTL_LINE_COUNT field so add that

For the subject, I think mentioning VRR_CTL_LINK_COUNT is more important
than REG_FIELD_PREP.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Cc: Aditya Swarup <aditya.swarup@intel.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index d4952c9875fb..9792c931b4c5 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -4348,6 +4348,7 @@ enum {
>  #define   VRR_CTL_IGN_MAX_SHIFT		REG_BIT(30)
>  #define   VRR_CTL_FLIP_LINE_EN		REG_BIT(29)
>  #define   VRR_CTL_LINE_COUNT_MASK	REG_GENMASK(10, 3)
> +#define   VRR_CTL_LINE_COUNT(x)		REG_FIELD_PREP(VRR_CTL_LINE_COUNT_MASK, (x))
>  #define   VRR_CTL_SW_FULLLINE_COUNT	REG_BIT(0)
>  
>  #define _TRANS_VRR_VMAX_A		0x60424

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
