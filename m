Return-Path: <SRS0=Kzal=OO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94AFC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 24 Sep 2021 09:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 692686124C
	for <intel-gfx@archiver.kernel.org>; Fri, 24 Sep 2021 09:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 692686124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C3A6E1D3;
	Fri, 24 Sep 2021 09:03:58 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945646EE09;
 Fri, 24 Sep 2021 09:03:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="204190003"
X-IronPort-AV: E=Sophos;i="5.85,319,1624345200"; d="scan'208";a="204190003"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 02:03:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,319,1624345200"; d="scan'208";a="551509027"
Received: from sambroox-mobl.ger.corp.intel.com (HELO [10.213.245.2])
 ([10.213.245.2])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 02:03:54 -0700
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210923153311.225307347@linutronix.de>
 <20210923153339.808080761@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c459f1ec-446e-317e-2835-4e9dbef44f64@linux.intel.com>
Date: Fri, 24 Sep 2021 10:03:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923153339.808080761@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [patch 07/11] drm/i915/pmu: Use
 hrtimer_forward_now()
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


On 23/09/2021 17:04, Thomas Gleixner wrote:
> hrtimer_forward() is about to be removed from the public
> interfaces. Replace it with hrtimer_forward_now() which provides the same
> functionality.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -439,7 +439,7 @@ static enum hrtimer_restart i915_sample(
>   	engines_sample(gt, period_ns);
>   	frequency_sample(gt, period_ns);
>   
> -	hrtimer_forward(hrtimer, now, ns_to_ktime(PERIOD));
> +	hrtimer_forward_now(hrtimer, ns_to_ktime(PERIOD));
>   
>   	return HRTIMER_RESTART;
>   }
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
