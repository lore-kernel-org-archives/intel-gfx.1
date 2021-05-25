Return-Path: <SRS0=ggpC=KU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A44C2B9F8
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 18:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 855D2613FA
	for <intel-gfx@archiver.kernel.org>; Tue, 25 May 2021 18:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 855D2613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E0E6EAA7;
	Tue, 25 May 2021 18:15:10 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139E86EAA3;
 Tue, 25 May 2021 18:15:09 +0000 (UTC)
IronPort-SDR: U/Dgs1lzvDxRrW2vVZzLn37b1jRLz4tUPq6CEIUkxH+G3uALYe9ceWfxwYL1bzHR1U1WdwV2+O
 ZMmVxw7nayTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202018479"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="202018479"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 11:15:08 -0700
IronPort-SDR: +TonCVBy33lblcew7grfUF/jrmEp4B09psRwN0nfLjcBx15BhZQ+uwXA7EvSwQstBek7EkOKgJ
 JD3bM9LdYkBw==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="396961915"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 11:15:08 -0700
Date: Tue, 25 May 2021 11:08:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20210525180800.GA23177@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-16-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-16-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [RFC PATCH 15/97] drm/i915/guc: Relax CTB response
 timeout
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

On Thu, May 06, 2021 at 12:13:29PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> In upcoming patch we will allow more CTB requests to be sent in
> parallel to the GuC for procesing, so we shouldn't assume any more
> that GuC will always reply without 10ms.
> 
> Use bigger value from CONFIG_DRM_I915_HEARTBEAT_INTERVAL instead.
> 

I think this should be its own config option or we combine it with a
config option suggested in patch 37.

What do you think Michal? If you agree I can fix this up in the post of
these patches.

Matt

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index c87a0a8bef26..a4b2e7fe318b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -436,17 +436,23 @@ static int ct_write(struct intel_guc_ct *ct,
>   */
>  static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  {
> +	long timeout;
>  	int err;
>  
>  	/*
>  	 * Fast commands should complete in less than 10us, so sample quickly
>  	 * up to that length of time, then switch to a slower sleep-wait loop.
>  	 * No GuC command should ever take longer than 10ms.
> +	 *
> +	 * However, there might be other CT requests in flight before this one,
> +	 * so use @CONFIG_DRM_I915_HEARTBEAT_INTERVAL as backup timeout value.
>  	 */
> +	timeout = max(10, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
> +
>  #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
>  	err = wait_for_us(done, 10);
>  	if (err)
> -		err = wait_for(done, 10);
> +		err = wait_for(done, timeout);
>  #undef done
>  
>  	if (unlikely(err))
> -- 
> 2.28.0
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
