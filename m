Return-Path: <SRS0=PXPa=IP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D193FC433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 19:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D3264E77
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 19:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74D3264E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34A26E081;
	Wed, 17 Mar 2021 19:23:16 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330B56E081
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 19:23:16 +0000 (UTC)
IronPort-SDR: wVgP2hr316i47VLJXpuRFTIZ3ebdzq8O78kgm8F9sU6mEUk4PvO212qqutrIaHVp8HKNHbfakl
 K1kvXX16w71Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="169448288"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="169448288"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 12:23:15 -0700
IronPort-SDR: /52I58DWI4Kn+44AsEw6Q6mxIPmJDLoaspcM9EmZMKraasXnkvVCn582zKCUpEITCrYH418x36
 Rt84cKt9BTaA==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="602354640"
Received: from jksalasr-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.42.17])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 12:23:15 -0700
Date: Wed, 17 Mar 2021 12:23:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20210317192314.55oa2jblpenl7uzl@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <cover.1615998927.git.jani.nikula@intel.com>
 <17288137452f731a820e737582672f836660a26f.1615998927.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17288137452f731a820e737582672f836660a26f.1615998927.git.jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 03/14] drm/i915/bios: reduce indent in
 sanitize_ddc_pin and sanitize_aux_ch
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:36:42PM +0200, Jani Nikula wrote:
>Reduce indent with an early return. No functional changes.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_bios.c | 86 +++++++++++------------
> 1 file changed, 41 insertions(+), 45 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
>index 824148063451..5e7dc0899ab1 100644
>--- a/drivers/gpu/drm/i915/display/intel_bios.c
>+++ b/drivers/gpu/drm/i915/display/intel_bios.c
>@@ -1525,31 +1525,29 @@ static void sanitize_ddc_pin(struct drm_i915_private *i915,
> 		return;
>
> 	p = get_port_by_ddc_pin(i915, info->alternate_ddc_pin);
>-	if (p != PORT_NONE) {
>-		drm_dbg_kms(&i915->drm,
>-			    "port %c trying to use the same DDC pin (0x%x) as port %c, "
>-			    "disabling port %c DVI/HDMI support\n",
>-			    port_name(port), info->alternate_ddc_pin,
>-			    port_name(p), port_name(p));
>+	if (p == PORT_NONE)
>+		return;
>
>-		/*
>-		 * If we have multiple ports supposedly sharing the
>-		 * pin, then dvi/hdmi couldn't exist on the shared
>-		 * port. Otherwise they share the same ddc bin and
>-		 * system couldn't communicate with them separately.
>-		 *
>-		 * Give inverse child device order the priority,
>-		 * last one wins. Yes, there are real machines
>-		 * (eg. Asrock B250M-HDV) where VBT has both
>-		 * port A and port E with the same AUX ch and
>-		 * we must pick port E :(
>-		 */
>-		info = &i915->vbt.ddi_port_info[p];
>+	drm_dbg_kms(&i915->drm,
>+		    "port %c trying to use the same DDC pin (0x%x) as port %c, "
>+		    "disabling port %c DVI/HDMI support\n",
>+		    port_name(port), info->alternate_ddc_pin,
>+		    port_name(p), port_name(p));
>
>-		info->supports_dvi = false;
>-		info->supports_hdmi = false;
>-		info->alternate_ddc_pin = 0;
>-	}
>+	/*
>+	 * If we have multiple ports supposedly sharing the pin, then dvi/hdmi
>+	 * couldn't exist on the shared port. Otherwise they share the same ddc
>+	 * bin and system couldn't communicate with them separately.
>+	 *
>+	 * Give inverse child device order the priority, last one wins. Yes,
>+	 * there are real machines (eg. Asrock B250M-HDV) where VBT has both
>+	 * port A and port E with the same AUX ch and we must pick port E :(
>+	 */
>+	info = &i915->vbt.ddi_port_info[p];
>+
>+	info->supports_dvi = false;
>+	info->supports_hdmi = false;
>+	info->alternate_ddc_pin = 0;
> }
>
> static enum port get_port_by_aux_ch(struct drm_i915_private *i915, u8 aux_ch)
>@@ -1577,30 +1575,28 @@ static void sanitize_aux_ch(struct drm_i915_private *i915,
> 		return;
>
> 	p = get_port_by_aux_ch(i915, info->alternate_aux_channel);
>-	if (p != PORT_NONE) {
>-		drm_dbg_kms(&i915->drm,
>-			    "port %c trying to use the same AUX CH (0x%x) as port %c, "
>-			    "disabling port %c DP support\n",
>-			    port_name(port), info->alternate_aux_channel,
>-			    port_name(p), port_name(p));
>+	if (p == PORT_NONE)
>+		return;
>
>-		/*
>-		 * If we have multiple ports supposedlt sharing the
>-		 * aux channel, then DP couldn't exist on the shared
>-		 * port. Otherwise they share the same aux channel
>-		 * and system couldn't communicate with them separately.
>-		 *
>-		 * Give inverse child device order the priority,
>-		 * last one wins. Yes, there are real machines
>-		 * (eg. Asrock B250M-HDV) where VBT has both
>-		 * port A and port E with the same AUX ch and
>-		 * we must pick port E :(
>-		 */
>-		info = &i915->vbt.ddi_port_info[p];
>+	drm_dbg_kms(&i915->drm,
>+		    "port %c trying to use the same AUX CH (0x%x) as port %c, "
>+		    "disabling port %c DP support\n",
>+		    port_name(port), info->alternate_aux_channel,
>+		    port_name(p), port_name(p));
>
>-		info->supports_dp = false;
>-		info->alternate_aux_channel = 0;
>-	}
>+	/*
>+	 * If we have multiple ports supposedlt sharing the aux channel, then DP

and another typo: supposedly. Might as well be a patch on top fixing
these, up to you.

Lucas De Marchi

>+	 * couldn't exist on the shared port. Otherwise they share the same aux
>+	 * channel and system couldn't communicate with them separately.
>+	 *
>+	 * Give inverse child device order the priority, last one wins. Yes,
>+	 * there are real machines (eg. Asrock B250M-HDV) where VBT has both
>+	 * port A and port E with the same AUX ch and we must pick port E :(
>+	 */
>+	info = &i915->vbt.ddi_port_info[p];
>+
>+	info->supports_dp = false;
>+	info->alternate_aux_channel = 0;
> }
>
> static const u8 cnp_ddc_pin_map[] = {
>-- 
>2.20.1
>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
