Return-Path: <SRS0=TgQB=HN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F96C433E9
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 11:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B258864E38
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 11:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B258864E38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC1A6E02E;
	Thu, 11 Feb 2021 11:48:36 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DA16E02E
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Feb 2021 11:48:36 +0000 (UTC)
IronPort-SDR: CJc0EBHXW6wJSX3QgSNgGOSbmUXZsMzbKc3BpQROeAZqebSbEvq74oJeuTYM33dNvfiIIzXDF5
 JEupOu0PgJEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="179670008"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="179670008"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 03:48:31 -0800
IronPort-SDR: dhU+uPq/f6qxV6WeWuqiwMltx2vpupWFmZj078m2eqCZ+FbUZIZ9YuuhAYYYvYe7xqssAE89Ur
 XkAzeqRW+JSA==
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="397223564"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 03:48:28 -0800
Date: Thu, 11 Feb 2021 13:48:24 +0200
From: Imre Deak <imre.deak@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20210211114824.GA77505@ideak-desk.fi.intel.com>
References: <20210129080043.24614-1-anshuman.gupta@intel.com>
 <20210211062949.7045-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211062949.7045-1-anshuman.gupta@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/debugfs: HDCP capability enc
 NULL check
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Feb 11, 2021 at 11:59:49AM +0530, Anshuman Gupta wrote:
> DP-MST connector encoder initializes at modeset
> Adding a connector->encoder NULL check in order to
> avoid any NULL pointer dereference.
> intel_hdcp_enable() already handle this but debugfs
> can also invoke the intel_{hdcp,hdcp2_capable}.
> Handling it gracefully.
> 
> v2:
> - Use necessary lock and NULL check in
>   i915_hdcp_sink_capability_show. [Imre]
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_display_debugfs.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index d6e4a9237bda..ed5e2f65b171 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -2198,14 +2198,26 @@ DEFINE_SHOW_ATTRIBUTE(i915_panel);
>  static int i915_hdcp_sink_capability_show(struct seq_file *m, void *data)
>  {
>  	struct drm_connector *connector = m->private;
> +	struct drm_i915_private *i915 = to_i915(connector->dev);
>  	struct intel_connector *intel_connector = to_intel_connector(connector);
> +	int ret;
>  
> -	if (connector->status != connector_status_connected)
> -		return -ENODEV;
> +	ret = drm_modeset_lock_single_interruptible(&i915->drm.mode_config.connection_mutex);
> +	if (ret)
> +		return ret;
> +
> +	if (!connector->encoder || connector->status != connector_status_connected) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
>  
>  	seq_printf(m, "%s:%d HDCP version: ", connector->name,
>  		   connector->base.id);
>  	intel_hdcp_info(m, intel_connector);
> +out:
> +	drm_modeset_unlock(&i915->drm.mode_config.connection_mutex);
> +	if (ret)
> +		return ret;
>  
>  	return 0;

Could be just
	return ret;

Reviewed-by: Imre Deak <imre.deak@intel.com>

>  }
> -- 
> 2.26.2
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
