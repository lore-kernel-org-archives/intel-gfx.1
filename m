Return-Path: <SRS0=9WF3=MB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A457EC07E96
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Jul 2021 00:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C40D61463
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Jul 2021 00:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C40D61463
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF13A6E93B;
	Fri,  9 Jul 2021 00:02:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AD06E93B;
 Fri,  9 Jul 2021 00:02:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="196896996"
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; d="scan'208";a="196896996"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 17:02:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; d="scan'208";a="492312509"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 17:02:31 -0700
Date: Thu, 8 Jul 2021 17:11:58 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20210709001153.GA19155@labuser-Z97X-UD5H>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-53-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210701202427.1547543-53-matthew.d.roper@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Intel-gfx] [PATCH 52/53] drm/i915/dg2: Update to bigjoiner path
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Jul 01, 2021 at 01:24:26PM -0700, Matt Roper wrote:
> From: Animesh Manna <animesh.manna@intel.com>
> 
> In verify_mpllb_state() encoder is retrieved from best_encoder
> of connector_state. As there will be only one connector_state
> for bigjoiner and checking encoder may not be needed for
> bigjoiner-slave. This code path related to mpll is done on dg2
> and need this fix to avoid null pointer dereference issue.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9655f1b1b41b..3f4e811145b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -9153,6 +9153,9 @@ verify_mpllb_state(struct intel_atomic_state *state,
>  	if (!new_crtc_state->hw.active)
>  		return;
>  
> +	if (new_crtc_state->bigjoiner_slave)
> +		return;
> +
>  	encoder = intel_get_crtc_new_encoder(state, new_crtc_state);
>  	intel_mpllb_readout_hw_state(encoder, &mpllb_hw_state);
>  
> -- 
> 2.25.4
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
