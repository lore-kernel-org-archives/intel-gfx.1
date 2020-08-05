Return-Path: <SRS0=TleC=BP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27645C433DF
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 13:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0204E22CA1
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 13:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0204E22CA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7164689C89;
	Wed,  5 Aug 2020 13:32:56 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC3389C89
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2020 13:32:55 +0000 (UTC)
IronPort-SDR: 1IAl3XD40YSleLgGkmV+Vj4MXspzc7oU6EJvbAdu+8hIMT6y/M/g0vLaR633xkAksu9lE2NfL5
 Xw7yK2dtr+BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="237392781"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="237392781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 06:32:54 -0700
IronPort-SDR: JaMztrifs7bPTCtvJk0n34wXLJlfgta7EJ9y7GBW2ezqYHT6AVHFpc58hBVvtt53aulrbn7DJd
 I3NDMxQaO8gw==
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="467466993"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 06:32:52 -0700
Date: Wed, 5 Aug 2020 19:02:29 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200805133229.GB8131@intel.com>
References: <20200805114521.867-1-anshuman.gupta@intel.com>
 <20200805114521.867-3-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805114521.867-3-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/hdcp: No direct access to
 power_well desc
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 2020-08-05 at 17:15:21 +0530, Anshuman Gupta wrote:
> HDCP code doesn't require to access power_well internal stuff,
> instead it should use the intel_display_power_well_is_enabled()
> to get the status of desired power_well.
> No functional change.
> 
> v2:
> - used with_intel_runtime_pm instead of get/put. [Jani]
> v3:
> - rebased.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
LGTM.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

-Ram

> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index a1e0d518e529..e76b049618db 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -148,9 +148,8 @@ static int intel_hdcp_poll_ksv_fifo(struct intel_digital_port *dig_port,
>  
>  static bool hdcp_key_loadable(struct drm_i915_private *dev_priv)
>  {
> -	struct i915_power_domains *power_domains = &dev_priv->power_domains;
> -	struct i915_power_well *power_well;
>  	enum i915_power_well_id id;
> +	intel_wakeref_t wakeref;
>  	bool enabled = false;
>  
>  	/*
> @@ -162,17 +161,9 @@ static bool hdcp_key_loadable(struct drm_i915_private *dev_priv)
>  	else
>  		id = SKL_DISP_PW_1;
>  
> -	mutex_lock(&power_domains->lock);
> -
>  	/* PG1 (power well #1) needs to be enabled */
> -	for_each_power_well(dev_priv, power_well) {
> -		if (power_well->desc->id == id) {
> -			enabled = power_well->desc->ops->is_enabled(dev_priv,
> -								    power_well);
> -			break;
> -		}
> -	}
> -	mutex_unlock(&power_domains->lock);
> +	with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref)
> +		enabled = intel_display_power_well_is_enabled(dev_priv, id);
>  
>  	/*
>  	 * Another req for hdcp key loadability is enabled state of pll for
> -- 
> 2.26.2
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
