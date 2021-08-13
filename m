Return-Path: <SRS0=Fb8f=NE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D09C4338F
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Aug 2021 14:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467BA60FC4
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Aug 2021 14:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 467BA60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB41889C9C;
	Fri, 13 Aug 2021 14:21:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3730889C86
 for <intel-gfx@lists.freedesktop.org>; Fri, 13 Aug 2021 14:21:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="215294644"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="215294644"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 07:21:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="518176369"
Received: from rekhagax-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.37.167])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 07:21:24 -0700
Date: Fri, 13 Aug 2021 10:21:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <YRZ/4mXaNPcCSoEN@intel.com>
References: <20210813115610.20010-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813115610.20010-1-jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mst: use intel_de_rmw() to
 simplify VC payload alloc set/clear
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

On Fri, Aug 13, 2021 at 02:56:10PM +0300, Jani Nikula wrote:
> Less is more, fewer lines to wonder about.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

although sometimes I get myself wondering we might get in some
case where our check inside the rmw function, to avoid writing the
same value, could cause some situation where we should perform
the write operation regardless.

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 8d13d7b26a25..9859c0334ebc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -396,7 +396,6 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
>  		to_intel_connector(old_conn_state->connector);
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	bool last_mst_stream;
> -	u32 val;
>  
>  	intel_dp->active_mst_links--;
>  	last_mst_stream = intel_dp->active_mst_links == 0;
> @@ -412,12 +411,8 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
>  
>  	clear_act_sent(encoder, old_crtc_state);
>  
> -	val = intel_de_read(dev_priv,
> -			    TRANS_DDI_FUNC_CTL(old_crtc_state->cpu_transcoder));
> -	val &= ~TRANS_DDI_DP_VC_PAYLOAD_ALLOC;
> -	intel_de_write(dev_priv,
> -		       TRANS_DDI_FUNC_CTL(old_crtc_state->cpu_transcoder),
> -		       val);
> +	intel_de_rmw(dev_priv, TRANS_DDI_FUNC_CTL(old_crtc_state->cpu_transcoder),
> +		     TRANS_DDI_DP_VC_PAYLOAD_ALLOC, 0);
>  
>  	wait_for_act_sent(encoder, old_crtc_state);
>  
> -- 
> 2.20.1
> 
