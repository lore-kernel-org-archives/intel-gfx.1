Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF37BC07E9B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 09:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661CA61001
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 09:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661CA61001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B07F6E897;
	Wed, 21 Jul 2021 09:18:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478816E897;
 Wed, 21 Jul 2021 09:18:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="198605570"
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="198605570"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 02:18:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="496547579"
Received: from jcornall-mobl.ger.corp.intel.com (HELO [10.213.197.250])
 ([10.213.197.250])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 02:18:27 -0700
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210720232014.3302645-1-lucas.demarchi@intel.com>
 <20210720232014.3302645-3-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <207065f0-c55a-fa1c-b995-5784d0a0342d@linux.intel.com>
Date: Wed, 21 Jul 2021 10:18:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720232014.3302645-3-lucas.demarchi@intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/gt: nuke unused legacy engine
 hw_id
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
Cc: Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 21/07/2021 00:20, Lucas De Marchi wrote:
> The engine hw_id is only used by RING_FAULT_REG(), which is not used
> since GRAPHICS_VER == 8. We tend to keep adding new defines just to be
> consistent, but let's try to remove them and let them defined to 0 when
> not used.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 4 ----
>   drivers/gpu/drm/i915/gt/intel_engine_types.h | 4 ----
>   2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index d561573ed98c..a11f69f2e46e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -80,7 +80,6 @@ static const struct engine_info intel_engines[] = {
>   		},
>   	},
>   	[VCS1] = {
> -		.hw_id = VCS1_HW,
>   		.class = VIDEO_DECODE_CLASS,
>   		.instance = 1,
>   		.mmio_bases = {
> @@ -89,7 +88,6 @@ static const struct engine_info intel_engines[] = {
>   		},
>   	},
>   	[VCS2] = {
> -		.hw_id = VCS2_HW,
>   		.class = VIDEO_DECODE_CLASS,
>   		.instance = 2,
>   		.mmio_bases = {
> @@ -97,7 +95,6 @@ static const struct engine_info intel_engines[] = {
>   		},
>   	},
>   	[VCS3] = {
> -		.hw_id = VCS3_HW,
>   		.class = VIDEO_DECODE_CLASS,
>   		.instance = 3,
>   		.mmio_bases = {
> @@ -114,7 +111,6 @@ static const struct engine_info intel_engines[] = {
>   		},
>   	},
>   	[VECS1] = {
> -		.hw_id = VECS1_HW,
>   		.class = VIDEO_ENHANCEMENT_CLASS,
>   		.instance = 1,
>   		.mmio_bases = {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 1cb9c3b70b29..a107eb58ffa2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -34,10 +34,6 @@
>   #define VCS0_HW		1
>   #define BCS0_HW		2
>   #define VECS0_HW	3
> -#define VCS1_HW		4
> -#define VCS2_HW		6
> -#define VCS3_HW		7
> -#define VECS1_HW	12
>   
>   /* Gen11+ HW Engine class + instance */
>   #define RENDER_CLASS		0
> 

Story checks out AFAICS.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
