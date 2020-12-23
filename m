Return-Path: <SRS0=gLHY=F3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB8FC433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 10:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A45F207F7
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 10:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A45F207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCECE6E8F9;
	Wed, 23 Dec 2020 10:52:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B186F6E8F9
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Dec 2020 10:52:05 +0000 (UTC)
IronPort-SDR: Pk/UDX9p9g1QwKVKH9ltsE2zRKmr55OpOZeeYVlMzqKOSzAlApsE+fEDrnkl2ZgMcRooUjEthb
 cREF6HHYIq2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="194446331"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="194446331"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 02:52:05 -0800
IronPort-SDR: BrNMrkEzdnq+J6IM7qVboeTY0mlje1wkzsdju/U3mD+eeshSpQRwyiVvoHIARkbbzRuySzVdYT
 DZ6nkOsExp3Q==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="345009964"
Received: from odonov3x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.250.144])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 02:52:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20201223103917.14687-1-chris@chris-wilson.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201223103917.14687-1-chris@chris-wilson.co.uk>
Date: Wed, 23 Dec 2020 12:51:58 +0200
Message-ID: <87a6u4okvl.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Bitwise or the conversion
 colour specifier together
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 23 Dec 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> drivers/gpu/drm/i915/display/intel_dp.c:6922 intel_dp_update_420() warn: should this be a bitwise op?
> drivers/gpu/drm/i915/display/intel_dp.c:6922 intel_dp_update_420() warn: should this be a bitwise op?
> drivers/gpu/drm/i915/display/intel_dp.c:6923 intel_dp_update_420() warn: should this be a bitwise op?
>
> Inside drm_dp_downstream_rgb_to_ycbcr_conversion(), that paramter
> 'color_spc' is used as return port_cap[3] & color_spc, implying that it
> is indeed a mask and not a boolean value.

So this one belongs in topic/dp-hdmi-2.1-pcon branch.

Purely based on the context this is the right thing to do, so:

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Ankit, please test the patch in case it uncovers some other
issues. It'll impact the RGB to YCbCr conversion.

BR,
Jani.


>
> Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8b4b2ea52859..157a850a83a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6918,8 +6918,8 @@ intel_dp_update_420(struct intel_dp *intel_dp)
>  							intel_dp->downstream_ports);
>  	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
>  								 intel_dp->downstream_ports,
> -								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
> -								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
> +								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV |
> +								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV |
>  								 DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
>  
>  	if (INTEL_GEN(i915) >= 11) {

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
