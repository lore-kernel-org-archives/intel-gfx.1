Return-Path: <SRS0=+tRi=KT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E98C2B9F8
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 12:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 387316128D
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 12:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 387316128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163B06E1B7;
	Mon, 24 May 2021 12:00:01 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DF36E1AA;
 Mon, 24 May 2021 11:59:59 +0000 (UTC)
IronPort-SDR: NjszljHVu0TD+wOGNcz49pMkqoVrMqrI2jze31cZ4bdpzIFKerdiiRv14blfxuOJaP15seXWxd
 Q4ovfxB1aAaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="189299256"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="189299256"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 04:59:58 -0700
IronPort-SDR: AjZGMKs2Oaj7YwspYf9LjaD5WtFZwGmEaC4iXKRf10OBlrG5dnkB2RII/6Tx9Jwu84atnfVlcf
 Czc2AvPTjdCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="632599321"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga005.fm.intel.com with ESMTP; 24 May 2021 04:59:55 -0700
Received: from [10.249.134.123] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.123])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14OBxsRX023225; Mon, 24 May 2021 12:59:54 +0100
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-36-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <7916ebfd-ebbe-c1a9-11b1-30587ca7a009@intel.com>
Date: Mon, 24 May 2021 13:59:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-36-matthew.brost@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [RFC PATCH 35/97] drm/i915/guc: Improve error
 message for unsolicited CT response
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



On 06.05.2021 21:13, Matthew Brost wrote:
> Improve the error message when a unsolicited CT response is received by
> printing fence that couldn't be found, the last fence, and all requests
> with a response outstanding.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 217ab3ebd1af..a76603537fa8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -703,12 +703,16 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>  		found = true;
>  		break;
>  	}
> -	spin_unlock_irqrestore(&ct->requests.lock, flags);
> -
>  	if (!found) {
>  		CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
> -		return -ENOKEY;
> +		CT_ERROR(ct, "Could not find fence=%u, last_fence=%u\n", fence,
> +			 ct->requests.last_fence);

nit: this new wording may suggest that it's our fault, but that's not
necessary true

> +		list_for_each_entry(req, &ct->requests.pending, link)
> +			CT_ERROR(ct, "request %u awaits response\n",
> +				 req->fence);

usually we don't send multiple requests that expects responses, so it's
very likely that list with pending requests will be empty, and even if
list is not empty, I'm not sure what is the relation between those
pending requests to this unsolicited response, thus wondering how these
extra errors could improve our debugging experience ?

> +		err = -ENOKEY;
>  	}
> +	spin_unlock_irqrestore(&ct->requests.lock, flags);
>  
>  	if (unlikely(err))
>  		return err;
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
