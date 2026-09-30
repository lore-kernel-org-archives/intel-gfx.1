Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BCCC9830E
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 05:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA5910E0FB;
	Wed, 30 Sep 2026 05:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="J+TLPdjf";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1061B10E0FB
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 05:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790746948;
 bh=Jek1kb268guNfeuBCk77W0feJkIiX/IL5zOJYKgFG6U=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=J+TLPdjfMa/929b0qdAr4TfCgUQhsKEU0z8sro6bbEbDEC5scDvbfo5xVzospZ5xQ
 0b0hafRVyI4j8hD4U0ZmK6ZBrNLaIfnG53DQqD4t7WdFjHr1tgmS0p2d8Kd4iTPImv
 nYXjPQ+OEwODPHu2uuUxmlDi0duXBl7j9hVX1Eb+I55OHFSQCj2ApxCG9gCZ3rM2dR
 aHVlDSDJcjjkJJEECBDQXFEl4hjxBBIZRFBzIlNXUZf9Se4G1m++3DSUlLY/OSiIcI
 cIPg3PBwbNcK3kQqjhARX0MP3ADyNtdLvKmygUMmoKMV2ws1YYFqV02AYG5pkluuZ7
 XDr3goujsX8mA==
Message-ID: <2510da80-8bf6-4d6a-b5b6-45d343c9c3c1@lankhorst.se>
Date: Wed, 30 Sep 2026 07:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/i915/pmu: Disable on PREEMPT_RT
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, vinay.belgaumkar@intel.com
References: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
 <20260929190147.2886670-6-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260929190147.2886670-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

When sending patches that have a different author,
you need to add your own signed-off-by as well when
sending those patches as well.

In this case, it's sufficient to add signed-off-by manually by
replying with Signed-off-by: .... , but next time it's better
to add immediately when applying, by using git am --signoff

Kind regards,
~Maarten Lankhorst

On 9/29/26 21:01, Umesh Nerlige Ramappa wrote:
> From: Maarten Lankhorst <dev@lankhorst.se>
> 
> I tried to come up with alternative and lockless approaches
> to make pmu work, but since the perf events are run in
> atomic context on PREEMPT_RT, ordinary spinlocks no longer
> work and forcewake and register accesses become problematic.
> 
> Disable perf events on PREEMPT_RT for now, without affecting
> !PREEMPT_RT users.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
> v2: s/reeturn/return/
> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 1c3bafda9c70..9ea5626399e5 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -1156,6 +1156,16 @@ void i915_pmu_register(struct drm_i915_private *i915)
>  	};
>  	int ret = -ENOMEM;
>  
> +	/*
> +	 * PREEMPT_RT has problems with forcewake. Forcewake is used by the
> +	 * engine 'busy' event when guc submission is enabled, and to measure
> +	 * rc6 residency.
> +	 *
> +	 * Disable pmu events on PREEMPT_RT entirely to prevent deadlocks.
> +	 */
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +		return;
> +
>  	spin_lock_init(&pmu->lock);
>  	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	init_rc6(pmu);

