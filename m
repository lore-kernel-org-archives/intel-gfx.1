Return-Path: <SRS0=tFHw=MF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557CDC07E95
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 20:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BFC76135A
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 20:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BFC76135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62C76E030;
	Tue, 13 Jul 2021 20:17:36 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7760C6E030
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Jul 2021 20:17:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="271348534"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="271348534"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 13:17:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="493244902"
Received: from juhyungn-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.129.73])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 13:17:25 -0700
Date: Tue, 13 Jul 2021 13:17:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <20210713201725.ulgnwmbjy3fllovk@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210713184421.9493-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713184421.9493-1-juhapekka.heikkila@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix wm params for ccs
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

On Tue, Jul 13, 2021 at 09:44:21PM +0300, Juha-Pekka Heikkila wrote:
>skl_compute_plane_wm_params() didn't take into account ccs
>modifiers on graphics ver >= 12
>
>Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/intel_pm.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
>index 0cbb79452fcf..540a7ecbf004 100644
>--- a/drivers/gpu/drm/i915/intel_pm.c
>+++ b/drivers/gpu/drm/i915/intel_pm.c
>@@ -5249,11 +5249,9 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
>
> 	wp->y_tiled = modifier == I915_FORMAT_MOD_Y_TILED ||
> 		      modifier == I915_FORMAT_MOD_Yf_TILED ||
>-		      modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
>-		      modifier == I915_FORMAT_MOD_Yf_TILED_CCS;
>+		      is_ccs_modifier(modifier);
> 	wp->x_tiled = modifier == I915_FORMAT_MOD_X_TILED;
>-	wp->rc_surface = modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
>-			 modifier == I915_FORMAT_MOD_Yf_TILED_CCS;
>+	wp->rc_surface = is_ccs_modifier(modifier);
> 	wp->is_planar = intel_format_info_is_yuv_semiplanar(format, modifier);
>
> 	wp->width = width;
>-- 
>2.28.0
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
