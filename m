Return-Path: <SRS0=5tEz=EK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BE3C2D0A3
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 23:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E1C2074B
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 23:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E1C2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4CC6E05C;
	Wed,  4 Nov 2020 23:30:28 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FF66E05C
 for <Intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2020 23:30:26 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22896640-1500050 for multiple; Wed, 04 Nov 2020 23:30:20 +0000
MIME-Version: 1.0
In-Reply-To: <20201104134743.916027-2-tvrtko.ursulin@linux.intel.com>
References: <20201104134743.916027-1-tvrtko.ursulin@linux.intel.com>
 <20201104134743.916027-2-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 04 Nov 2020 23:30:18 +0000
Message-ID: <160453261800.17472.1591297091381831846@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [RFC 2/2] drm/i915: Use ABI engine class in error
 state ecode
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

Quoting Tvrtko Ursulin (2020-11-04 13:47:43)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Instead of printing out the internal engine mask, which can change between
> kernel versions making it difficult to map to actual engines, present a
> bitmask of hanging engines ABI classes. For example:
> 
>   [drm] GPU HANG: ecode 9:24dffffd:8, in gem_exec_schedu [1334]
> 
> Notice the swapped the order of ecode and bitmask which makes the new
> versus old bug reports are obvious.
> 
> Engine ABI class is useful to quickly categorize render vs media etc hangs
> in bug reports. Considering virtual engine even more so than the current
> scheme.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_gpu_error.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 857db66cc4a3..e7d9af184d58 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1659,17 +1659,16 @@ static u32 generate_ecode(const struct intel_engine_coredump *ee)
>  static const char *error_msg(struct i915_gpu_coredump *error)
>  {
>         struct intel_engine_coredump *first = NULL;
> +       unsigned int hung_classes = 0;
>         struct intel_gt_coredump *gt;
> -       intel_engine_mask_t engines;
>         int len;
>  
> -       engines = 0;
>         for (gt = error->gt; gt; gt = gt->next) {
>                 struct intel_engine_coredump *cs;
>  
>                 for (cs = gt->engine; cs; cs = cs->next) {
>                         if (cs->hung) {
> -                               engines |= cs->engine->mask;
> +                               hung_classes |= BIT(cs->engine->uabi_class);

Your argument makes sense.

>                                 if (!first)
>                                         first = cs;
>                         }
> @@ -1677,9 +1676,11 @@ static const char *error_msg(struct i915_gpu_coredump *error)
>         }
>  
>         len = scnprintf(error->error_msg, sizeof(error->error_msg),
> -                       "GPU HANG: ecode %d:%x:%08x",
> -                       INTEL_GEN(error->i915), engines,
> -                       generate_ecode(first));
> +                       "GPU HANG: ecode %d:%08x:%x",
> +                       INTEL_GEN(error->i915),
> +                       generate_ecode(first),
> +                       hung_classes);

I vote for keeping gen:engines:ecode order, for me that is biggest to
smallest.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
