Return-Path: <SRS0=5tEz=EK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882ACC2D0A3
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 12:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D12A6208C7
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 12:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D12A6208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D256ECFA;
	Wed,  4 Nov 2020 12:31:05 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360076ECFA
 for <Intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2020 12:31:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22891629-1500050 for multiple; Wed, 04 Nov 2020 12:30:58 +0000
MIME-Version: 1.0
In-Reply-To: <20201104122043.876567-1-tvrtko.ursulin@linux.intel.com>
References: <20201104122043.876567-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 04 Nov 2020 12:30:55 +0000
Message-ID: <160449305596.15691.8814203162337051600@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [RFC 1/2] drm/i915: Improve record of hung engines
 in error state
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

Quoting Tvrtko Ursulin (2020-11-04 12:20:42)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Between events which trigger engine and GPU resets and capturing the error
> state we lose information on which engine triggered the reset. Improve
> this by passing in the hung engine mask down to error capture.
> 
> Result is that the list of engines in user visible "GPU HANG: ecode
> <gen>:<engines>:<ecode>, <process>" is now a list of hanging and not just
> active engines. Most importantly the displayed process is now the one
> which was actually hung.

You could also suggest to only include the hanging engine in the report,
as is intended to be the normal means of generating the report

> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
> index 0220b0992808..3a7ca90a3436 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
> @@ -59,6 +59,7 @@ struct i915_request_coredump {
>  struct intel_engine_coredump {
>         const struct intel_engine_cs *engine;
>  
> +       bool hung;
>         bool simulated;
>         u32 reset_count;
>  
> @@ -218,8 +219,10 @@ struct drm_i915_error_state_buf {
>  __printf(2, 3)
>  void i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...);
>  
> -struct i915_gpu_coredump *i915_gpu_coredump(struct drm_i915_private *i915);
> -void i915_capture_error_state(struct drm_i915_private *i915);
> +struct i915_gpu_coredump *i915_gpu_coredump(struct intel_gt *gt,
> +                                           intel_engine_mask_t engine_mask);
> +void i915_capture_error_state(struct intel_gt *gt,
> +                             intel_engine_mask_t engine_mask);

Don't forget the stubs.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
