Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681BDC433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Mar 2022 17:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38D310FD11;
	Fri,  4 Mar 2022 17:31:20 +0000 (UTC)
X-Greylist: delayed 347 seconds by postgrey-1.36 at gabe;
 Fri, 04 Mar 2022 17:31:17 UTC
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39BE10F951;
 Fri,  4 Mar 2022 17:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D22E7408A9;
 Fri,  4 Mar 2022 18:25:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3Vjh5jF4ANB; Fri,  4 Mar 2022 18:25:27 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8D68740657;
 Fri,  4 Mar 2022 18:25:27 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="gCXtasJd";
 dkim-atps=neutral
Received: from [192.168.0.209] (unknown [192.55.54.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 638F63602D9;
 Fri,  4 Mar 2022 18:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1646414727; bh=mR4aNrIzdnBiHfLDuZWLgPKjbJzB0irlhj9gZaGh+dY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gCXtasJdhkNe7J5/0mugiM2UyL+maeUWcFnTJ0LuZLQ+aabLZu/a28SHpfnNfU7az
 EBqQGqbqLoZSA0N2FAfyx30cmJ6CRV39Xmf7d8ht4OgpsBTy1BJ67xbIXca21SsZiF
 +jDmorJ13tQj+jIxcQx+sm7Psr/ewOpwTh04AP0o=
Message-ID: <bcc30997-a759-ca1b-c3d5-38b7de856146@shipmail.org>
Date: Fri, 4 Mar 2022 18:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220303100229.839282-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220303100229.839282-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gtt: reduce overzealous alignment
 constraints for GGTT
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 3/3/22 11:02, Matthew Auld wrote:
> Currently this will enforce both 2M alignment and padding for any LMEM
> pages inserted into the GGTT. However, this was only meant to be applied
> to the compact-pt layout with the ppGTT. For the GGTT we can reduce the
> alignment and padding to 64K.
>
> Bspec: 45015
> Fixes: 87bd701ee268 ("drm/i915: enforce min GTT alignment for discrete cards")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Robert Beckett <bob.beckett@collabora.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gt/intel_gtt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 4bcdfcab3642..a5f5b2dda332 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -234,7 +234,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   	memset64(vm->min_alignment, I915_GTT_MIN_ALIGNMENT,
>   		 ARRAY_SIZE(vm->min_alignment));
>   
> -	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915)) {
> +	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915) &&
> +	    subclass == VM_CLASS_PPGTT) {
>   		vm->min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_2M;
>   		vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_2M;
>   	} else if (HAS_64K_PAGES(vm->i915)) {
