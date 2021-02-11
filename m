Return-Path: <SRS0=TgQB=HN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C92FC433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 11:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F35A64E23
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 11:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F35A64E23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745FA6EE1D;
	Thu, 11 Feb 2021 11:01:36 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CDD6EE1D
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Feb 2021 11:01:35 +0000 (UTC)
IronPort-SDR: PYva6dS2YYFfb4MC/AxIv/De4w2/KRb9OBu6FRkikgfwb+R9dpDvahCstUikFppvnBzjdZmBYx
 elsQde5v7ADA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="181448232"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="181448232"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 03:01:31 -0800
IronPort-SDR: jp1YEHKFVonGgI0Qkmwk1liXyXi8mFFxpscrI4ZE2fuMyOBqVRlvS1VXs41ZkcvUiSp6ljmjlD
 Wl9rZzR1mnew==
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="375822980"
Received: from aleski-mobl.ger.corp.intel.com (HELO [10.249.155.40])
 ([10.249.155.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 03:01:30 -0800
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210210190106.8586-1-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <06bb7241-3da4-ac24-95ce-130d2f8a6722@intel.com>
Date: Thu, 11 Feb 2021 13:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210210190106.8586-1-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] i915/perf: Drop the check for report reason
 in OA
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

On 10/02/2021 21:01, Umesh Nerlige Ramappa wrote:
> After fixing the OA_TAIL_PTR corruption, there are no more reports with
> reason field of zero. Drop the check for report reason.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


I thought I push this patch already :|

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


> ---
>   drivers/gpu/drm/i915/i915_perf.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 93f3e2c5c89a..c15bead2dac7 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -725,11 +725,6 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
>   			  (IS_GEN(stream->perf->i915, 12) ?
>   			   OAREPORT_REASON_MASK_EXTENDED :
>   			   OAREPORT_REASON_MASK));
> -		if (reason == 0) {
> -			if (__ratelimit(&stream->perf->spurious_report_rs))
> -				DRM_NOTE("Skipping spurious, invalid OA report\n");
> -			continue;
> -		}
>   
>   		ctx_id = report32[2] & stream->specific_ctx_id_mask;
>   


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
