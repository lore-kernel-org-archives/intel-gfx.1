Return-Path: <SRS0=ktOb=HY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA01C433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 05:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8083364E57
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Feb 2021 05:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8083364E57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3636E900;
	Mon, 22 Feb 2021 05:58:58 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CBB6E900
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Feb 2021 05:58:57 +0000 (UTC)
IronPort-SDR: FXCeM6VJSqr+NQeJa/h0sM6GPmAQWvJLSFSYXXdWoKv65BRNqmxJnJTk357IIrtxLUem5nnzx1
 fIle9VqZOiVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9902"; a="269275656"
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; d="scan'208";a="269275656"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2021 21:58:56 -0800
IronPort-SDR: gNPdGXe4ck5OBR74F8TN+TZQPCB49+/KHcpO4kM45cUgtLLECZzWV/74DNkZkMUPHyjlAk4VJO
 DTQ3+IjjYzWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; d="scan'208";a="441273570"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by orsmga001.jf.intel.com with ESMTP; 21 Feb 2021 21:58:53 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 05:58:51 +0000
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2106.002;
 Mon, 22 Feb 2021 11:28:50 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH v3 5/9] drm/i915/reg: add stream splitter
 configuration definitions
Thread-Index: AQHXAIWePCTpKHQPv0aex82P5ioG0KpjvlZw
Date: Mon, 22 Feb 2021 05:58:50 +0000
Message-ID: <25a367036994445ea3d1c0f080f97656@intel.com>
References: <cover.1613054234.git.jani.nikula@intel.com>
 <443ad1fbf908800ee4e09315cb6a7ba26c64d136.1613054234.git.jani.nikula@intel.com>
In-Reply-To: <443ad1fbf908800ee4e09315cb6a7ba26c64d136.1613054234.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v3 5/9] drm/i915/reg: add stream splitter
 configuration definitions
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Varide,
 Nischal" <nischal.varide@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Jani Nikula
> Sent: Thursday, February 11, 2021 8:22 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Varide, Nischal <nischal.varide@intel.com>
> Subject: [Intel-gfx] [PATCH v3 5/9] drm/i915/reg: add stream splitter configuration
> definitions
> 
> The splitter configuration is required for eDP MSO.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Bspec: 50174
> Cc: Nischal Varide <nischal.varide@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 224ad897af34..e5dd0203991b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -11448,6 +11448,9 @@ enum skl_power_gate {
>  #define  BIG_JOINER_ENABLE			(1 << 29)
>  #define  MASTER_BIG_JOINER_ENABLE		(1 << 28)
>  #define  VGA_CENTERING_ENABLE			(1 << 27)
> +#define  SPLITTER_CONFIGURATION_MASK		REG_GENMASK(26, 25)
> +#define  SPLITTER_CONFIGURATION_2_SEGMENT
> 	REG_FIELD_PREP(SPLITTER_CONFIGURATION_MASK, 0)
> +#define  SPLITTER_CONFIGURATION_4_SEGMENT
> 	REG_FIELD_PREP(SPLITTER_CONFIGURATION_MASK, 1)
> 
>  #define _ICL_PIPE_DSS_CTL2_PB			0x78204
>  #define _ICL_PIPE_DSS_CTL2_PC			0x78404
> --
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
