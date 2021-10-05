Return-Path: <SRS0=U9P+=OZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC6FC433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 00:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55A1561407
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 00:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55A1561407
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C89D6EABE;
	Tue,  5 Oct 2021 00:03:47 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9FB6EABE
 for <intel-gfx@lists.freedesktop.org>; Tue,  5 Oct 2021 00:03:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633392225; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PXW3o4AZmsJh5ii/yOZhTQ1+5uA4Slexg39ac4jUnUM=;
 b=uihTmXQFRIxqfz5eFYfNTm5VcyJEqBvV1F/4dfW2UMWNFL+RQkrFToJKwhgpEV9KEEq+r5ae
 6WYDzP76UzKjgTp8uhuN3JM3sUUy0HmzjZIaxfLG7CtlSBC5D9syTlvpeQ2VTZD3LkGj8QMq
 UeL553HfX/1pdKS49Si/kcUWlmw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5MzZmYyIsICJpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615b965d713d5d6f9653556d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 00:03:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CD524C43619; Tue,  5 Oct 2021 00:03:40 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2776C43460;
 Tue,  5 Oct 2021 00:03:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Oct 2021 17:03:39 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, swboyd@chromium.org,
 jani.nikula@linux.intel.com, Sean Paul <seanpaul@chromium.org>, Jani Nikula
 <jani.nikula@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20211001151145.55916-4-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-4-sean@poorly.run>
Message-ID: <589f66332a718c7d752cb7714d10a4c6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Intel-gfx] [Freedreno] [PATCH v3 03/14] drm/hdcp: Update
 property value on content type and user changes
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

On 2021-10-01 08:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch updates the connector's property value in 2 cases which were
> previously missed:
> 
> 1- Content type changes. The value should revert back to DESIRED from
>    ENABLED in case the driver must re-authenticate the link due to the
>    new content type.
> 
> 2- Userspace sets value to DESIRED while ENABLED. In this case, the
>    value should be reset immediately to ENABLED since the link is
>    actively being encrypted.
> 
> To accommodate these changes, I've split up the conditionals to make
> things a bit more clear (as much as one can with this mess of state).
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-4-sean@poorly.run
> #v1
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-4-sean@poorly.run
> #v2
> 
> Changes in v2:
> -None
> Changes in v3:
> -Fixed indentation issue identified by 0-day
> ---
>  drivers/gpu/drm/drm_hdcp.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index dd8fa91c51d6..8c851d40cd45 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -487,21 +487,29 @@ bool drm_hdcp_atomic_check(struct drm_connector
> *connector,
>  		return true;
> 
>  	/*
> -	 * Nothing to do if content type is unchanged and one of:
> -	 *  - state didn't change
> +	 * Content type changes require an HDCP disable/enable cycle.
> +	 */
> +	if (new_conn_state->hdcp_content_type != 
> old_conn_state->hdcp_content_type) {
> +		new_conn_state->content_protection =
> +			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return true;
> +	}
> +
> +	/*
> +	 * Ignore meaningless state changes:
>  	 *  - HDCP was activated since the last commit
> -	 *  - attempting to set to desired while already enabled
> +	 *  - Attempting to set to desired while already enabled
>  	 */
> -	if (old_hdcp == new_hdcp ||
> -	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	if ((old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
>  	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
>  	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
>  	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
> -		if (old_conn_state->hdcp_content_type ==
> -				new_conn_state->hdcp_content_type)
> -			return false;
> +		new_conn_state->content_protection =
> +			DRM_MODE_CONTENT_PROTECTION_ENABLED;
> +		return false;
>  	}
> 
> -	return true;
> +	/* Finally, if state changes, we need action */
> +	return old_hdcp != new_hdcp;
>  }
>  EXPORT_SYMBOL(drm_hdcp_atomic_check);
