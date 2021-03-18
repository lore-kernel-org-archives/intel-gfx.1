Return-Path: <SRS0=MMuT=IQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BDBC433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 18:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E71264F1D
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 18:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E71264F1D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8C36E950;
	Thu, 18 Mar 2021 18:15:28 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD556E950;
 Thu, 18 Mar 2021 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=8Fkbd93Aq1q97jNctPteNuHQ9DD1eBmwgRUQ35hJ0rA=; b=V0w6Kb4Fi43X4zYOIkAMdjTWsk
 S9/vwlXjY6r4HCHXAEod+UTbZPkMX5fKjVvWVYOUjuNn03/jt6cXDp6ak6qm4VNCeaG/GiMiZPC3M
 3IOkP8pCB7HSMBqq/6N9uBCJhEswE3SBi23EvX0mQl+/elBrvJkoAkpg4Yfk/mClpAXKprmfhZg/R
 Z5QLOm4hyncuW1Seq0UZ2Tn2FwvaqduQXZNOcxYHn/WxVHgH7irSLMfQrLXEwtfvg69rjsJdlZDMM
 1vapm1DHm6hQlhM4BWMwkuzdYWV3CeM/qvUkfbFjhJt3zbSLhlYMM3+t/Q+HMLPDbLYHT14t5JyLQ
 HQhG7hRg==;
Received: from [2601:1c0:6280:3f0::9757]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMxAm-003Kqs-Se; Thu, 18 Mar 2021 18:15:07 +0000
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com,
 chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com,
 mika.kuoppala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20210318101932.19894-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <027de4bd-cefc-0988-bd3b-b0bcc12d93b0@infradead.org>
Date: Thu, 18 Mar 2021 11:15:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318101932.19894-1-unixbhaskar@gmail.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: A typo fix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 3/18/21 3:19 AM, Bhaskar Chowdhury wrote:
> 
> s/bariers/barriers/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/i915/gt/intel_timeline.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> index 037b0e3ccbed..25fc7f44fee0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -435,7 +435,7 @@ void intel_timeline_exit(struct intel_timeline *tl)
>  	spin_unlock(&timelines->lock);
> 
>  	/*
> -	 * Since this timeline is idle, all bariers upon which we were waiting
> +	 * Since this timeline is idle, all barriers upon which we were waiting
>  	 * must also be complete and so we can discard the last used barriers
>  	 * without loss of information.
>  	 */
> --
> 2.26.2
> 


-- 
~Randy

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
