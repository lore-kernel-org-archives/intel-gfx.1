Return-Path: <SRS0=qNAp=D3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB42EC433E7
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 09:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66CC0206DC
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 09:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66CC0206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCBF6EC1C;
	Tue, 20 Oct 2020 09:42:15 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5C56E151;
 Tue, 20 Oct 2020 09:42:13 +0000 (UTC)
IronPort-SDR: JuyC79M5KdmpQ5XoBA4X3GE30sq5026AN1Ac83qDsGCjMFxhldp8rh4aY2eS2rnM/HBUjmsQAc
 rHYEEAF5sJTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="154966212"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="154966212"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 02:42:13 -0700
IronPort-SDR: 5tf1kAds3w0K86cn6S/DbmSpDt6y4OYQYFYk/KKcm46vGdLAbGw20ZLOjMA2cFgsVnJqF84uTa
 oT99qABn3jNA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="532990956"
Received: from bneville-mobl5.ger.corp.intel.com (HELO localhost)
 ([10.252.6.14])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 02:42:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20201019071259.24566-1-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201019071259.24566-1-anshuman.gupta@intel.com>
Date: Tue, 20 Oct 2020 12:42:05 +0300
Message-ID: <8736299qtu.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [RFC] drm/hdcp: Max MST content streams
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
Cc: Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 19 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Let's define Maximum MST content streams up to four
> generically which can be supported by modern display
> controllers.
>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Hey drm-misc maintainers,

I'd like to get an ack to merge this via drm-intel as part of [1].

Thanks,
Jani.



[1] http://lore.kernel.org/r/20201014045252.13608-1-anshuman.gupta@intel.com



> ---
>  include/drm/drm_hdcp.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index fe58dbb46962..ac22c246542a 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -101,11 +101,11 @@
>  
>  /* Following Macros take a byte at a time for bit(s) masking */
>  /*
> - * TODO: This has to be changed for DP MST, as multiple stream on
> - * same port is possible.
> - * For HDCP2.2 on HDMI and DP SST this value is always 1.
> + * TODO: HDCP_2_2_MAX_CONTENT_STREAMS_CNT is based upon actual
> + * H/W MST streams capacity.
> + * This required to be moved out to platform specific header.
>   */
> -#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	1
> +#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	4
>  #define HDCP_2_2_TXCAP_MASK_LEN			2
>  #define HDCP_2_2_RXCAPS_LEN			3
>  #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
