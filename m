Return-Path: <SRS0=l6T8=HD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36A4C4332B
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Feb 2021 10:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4626F64E9C
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Feb 2021 10:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4626F64E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32DE6E3DA;
	Mon,  1 Feb 2021 10:55:09 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A596E3DA
 for <intel-gfx@lists.freedesktop.org>; Mon,  1 Feb 2021 10:55:08 +0000 (UTC)
IronPort-SDR: 2qnF1O5fXv9V6DAfnJ9Ry7iGpU/9rB5UpzUjPW4tHA4DO3Hq59iN4sFrd3sis8VH5db3HVOiwt
 FOI7ZazVdrSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="167771464"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="167771464"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 02:55:02 -0800
IronPort-SDR: Dy++hpB4fWFMVHyICYGk7e900pGxAcX7af9oH+VLM/GpxIp0z2jokQgr8BqL/mcmWadqwGUIT9
 qdtQvi9TtpJQ==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="371506047"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.200.40])
 ([10.215.200.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 02:54:59 -0800
To: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210129080043.24614-1-anshuman.gupta@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <9dffbc85-a52d-e1e4-60f9-5d3f92807dfa@intel.com>
Date: Mon, 1 Feb 2021 16:24:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129080043.24614-1-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/debugfs: HDCP capability enc NULL
 check
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 1/29/2021 1:30 PM, Anshuman Gupta wrote:
> DP-MST connector encoder initializes at modeset
> Adding a connector->encoder NULL check in order to
> avoid any NULL pointer dereference.
> intel_hdcp_enable() already handle this but debugfs
> can also invoke the intel_{hdcp,hdcp2_capable}.
> Handling it gracefully.
>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_hdcp.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index ae1371c36a32..58af323d189a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -135,11 +135,16 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
>   /* Is HDCP1.4 capable on Platform and Sink */
>   bool intel_hdcp_capable(struct intel_connector *connector)
>   {
> -	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> +	struct intel_digital_port *dig_port;
>   	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
>   	bool capable = false;
>   	u8 bksv[5];
>   
> +	if (!connector->encoder)
> +		return -ENODEV;
> +

For connector->encoder check, I feel the correct place should be in 
function:
enc_to_dig_port(), where we should return if encoder is NULL in 
display_types.h
Currently we assume encoder is not NULL and try to check encoder->type, 
which might break in case of MST.
With that change, we can simply check NULL check for 'dig_port', as 
intel_attached_dig_port(connector) might still return NULL.

Regards,
Ankit

> +	dig_port = intel_attached_dig_port(connector);
> +
>   	if (!shim)
>   		return capable;
>   
> @@ -156,11 +161,16 @@ bool intel_hdcp_capable(struct intel_connector *connector)
>   /* Is HDCP2.2 capable on Platform and Sink */
>   bool intel_hdcp2_capable(struct intel_connector *connector)
>   {
> -	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> +	struct intel_digital_port *dig_port;
>   	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>   	struct intel_hdcp *hdcp = &connector->hdcp;
>   	bool capable = false;
>   
> +	if (!connector->encoder)
> +		return -ENODEV;
> +
> +	dig_port = intel_attached_dig_port(connector);
> +
>   	/* I915 support for HDCP2.2 */
>   	if (!hdcp->hdcp2_supported)
>   		return false;
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
