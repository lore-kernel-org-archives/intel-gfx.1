Return-Path: <SRS0=5A7x=FI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73742C433FE
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 09:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FE432255F
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 09:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FE432255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519946E135;
	Fri,  4 Dec 2020 09:02:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76756E135;
 Fri,  4 Dec 2020 09:02:37 +0000 (UTC)
IronPort-SDR: J4zrkhhb+FuXTnLtnq2jzYJlFadYSQSta/ZvFHWEEwc8S8X0LIouZeubnWNiWAgaJ/4CumOFwe
 t18MAGc+4oEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="170781561"
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="170781561"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 01:02:36 -0800
IronPort-SDR: 93oqj+yMLNMQ6nd884NHkOlG8oEZ7fcduNJhMBIPxZsM9iPL2giNKQJ/CZOjQMkBesBWV75T0A
 1LumlZ9EsPxw==
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="540619939"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 01:02:33 -0800
Date: Fri, 4 Dec 2020 14:32:16 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20201204090216.GA5336@intel.com>
References: <20201126073722.19107-1-anshuman.gupta@intel.com>
 <20201126073722.19107-5-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126073722.19107-5-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH v6 04/18] drm/i915/hdcp: No HDCP when
 encoder is't initialized
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 2020-11-26 at 13:07:08 +0530, Anshuman Gupta wrote:
> There can be situation when DP MST connector is created without
> mst modeset being done, in those cases connector->encoder will be
> NULL. MST connector->encoder initializes after modeset.

This patch is to reject the HDCP request on MST connector without
encoder initialized(modeset). But userspace are not supposed to request hdcp at such
scenario right?.

Ram

> Don't enable HDCP in such cases to prevent any crash.
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Juston Li <juston.li@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index b9d8825e2bb1..7d63e9495956 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2106,6 +2106,12 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  	if (!hdcp->shim)
>  		return -ENOENT;
>  
> +	if (!connector->encoder) {
> +		drm_err(&dev_priv->drm, "[%s:%d] encoder is not initialized\n",
> +			connector->base.name, connector->base.base.id);
> +		return -ENODEV;
> +	}
> +
>  	mutex_lock(&hdcp->mutex);
>  	mutex_lock(&dig_port->hdcp_mutex);
>  	drm_WARN_ON(&dev_priv->drm,
> -- 
> 2.26.2
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
