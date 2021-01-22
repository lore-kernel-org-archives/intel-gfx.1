Return-Path: <SRS0=EOwD=GZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A098C433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 08:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F5D1235F9
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 08:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F5D1235F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35276E02E;
	Fri, 22 Jan 2021 08:48:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68756E02E
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Jan 2021 08:48:36 +0000 (UTC)
IronPort-SDR: QzQ6Rb+KGkuCWk+4AdwuI84pYU1Z/IraiMssWx8Z57CWe434GXOulufPn9Djzv4hj6idC4xf11
 rSchqduUUWqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="176843746"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="176843746"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 00:48:36 -0800
IronPort-SDR: GX0x+Z7kaipFjMu90iH3waR8TqmEAc0q+dxurZktgCYI9mDEw+vEEnc9UY50wGTo1Cfy42721z
 CxclX/0hzmMw==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="385674530"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.197.159])
 ([10.215.197.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 00:48:34 -0800
To: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210119064655.1605-1-anshuman.gupta@intel.com>
 <20210119064655.1605-2-anshuman.gupta@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <d699bc59-91f2-4d50-464d-51d3cf5b9151@intel.com>
Date: Fri, 22 Jan 2021 14:18:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119064655.1605-2-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915/hdcp: Fix WARN_ON(data->k >
 INTEL_NUM_PIPES)
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

Looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 1/19/2021 12:16 PM, Anshuman Gupta wrote:
> Initialize no. of streams transmitted on a port to zero
> such that intel_hdcp_required_content_stream() can
> prepared the content stream after subsequemt attmept to
> enable hdcp after a HDCP failure.
>
> v2:
> - Initialize k at top level instead of else branch. [Jani]
>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_hdcp.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index db8dff2eeb0a..581ccb038b87 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -53,6 +53,8 @@ intel_hdcp_required_content_stream(struct intel_digital_port *dig_port)
>   	bool enforce_type0 = false;
>   	int k;
>   
> +	data->k = 0;
> +
>   	if (dig_port->hdcp_auth_status)
>   		return 0;
>   
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
