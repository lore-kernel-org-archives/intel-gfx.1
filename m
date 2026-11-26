Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD0F606A31E
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2026 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=MsmEhmbw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C33D10E142;
	Thu, 26 Nov 2026 16:22:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237AB10E142
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2026 16:21:55 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so69092005e9.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2026 08:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1795710113; x=1796314913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=B+C3HRxsmw6OBtj34ACJP428vkmyaq/nQrWROm8KZkM=;
 b=MsmEhmbwrfDLGtyjWZ+L//oCRtlf/BCBWy1njCyygllUMXv+Iqu+F2H5zgWUkHUyhL
 BPdzTF/e6/DHUdQclKJ/ohTdQIpmCxKKQOy5Mbf/pEwjYcnCUXf12XPL+AeOJrLtHa3K
 JwFWR2cYP3D2xXoq2lJs1WC+JYFpM6p/sB7dBlOaYkMzpCaKwoOYo5Ue6utchuGPdP8c
 CXhZ6tLR5MpEjsB2WqLHAxCnir7A/7CmGvykRVw6PoIXYYVmXlpYv3RGTm3uVtYW7z2y
 Z/3NF66ax4iFWbMbfyd6mwkP7lGENmtUPdUH07B+oerkzHmIYXzOzR6ndVnkOZGUT/bv
 OsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795710113; x=1796314913;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B+C3HRxsmw6OBtj34ACJP428vkmyaq/nQrWROm8KZkM=;
 b=TbQZ4zexgPw20iA+y/GQQW22Jg37/a1ZIT7vTmiAYjJxqb1su/ggcx7Zt28e8YodTt
 6cnUCKpWjO7uCbdnzIyxZ/LI2A+zZwHZAi4Ue7UftGgFBnAf3XZBNa02FSvtiuHYw4qv
 QuksIUCjaWtofqsMeKGti2mGh0VHqDMeKtJkxtWuie+2Sup/BCGHZwVmQBWiDl/mdF1P
 yFexjLnFbWsbv1/4XuxfGJBPWP5GcuqB7TfMyYxkvaE6UlLztItIfyf8yqwznUEBlkLP
 eGKUnyhJi47J3UuPIxxEa+fPTaNSGbvEhLDCmwf6O8p7X/87pnm/tYuQdjO9MsGctd9s
 6hNw==
X-Forwarded-Encrypted: i=1;
 AL+hErEvcbtx6ptYM1Lnkd3iWJpbbhJK/Y2NvmbmER9ib4cVFbNKb+aQst029HB+g5dgkFUk7F0k14ycCHU=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8WXf9GbDsJ0GIiYdYNqTUbbws4TSbK80QjQXwQ+YrBchZphSfM
 KRiIxm61CsrKoTsO+bDzyklALN3eRUe4JulCqGCPRAUf1APyrOEzaK/7eCL936My8qw=
X-Gm-Gg: AZFdTZe4g6JVYEtKsljoOk1fUz0IfYp+fPOb3bqQwYWB+Gy3tKBua0b8l+iSyb2Kx+b
 QOSMmt/HccHBcfD8DOMoQEiI9damzdnE2N+fGBR/tfwRp41WQF/5J8RL0EaqLqmZRhEwrkQkVJr
 wSeDx1eM05T/qCPWWkZL1+J2ErtIEqwShAFKvTVGyrysLBbJXPgrr7KfLLfgBZQeFHqxDfCAOhy
 1d/Ly6y323kaPIKtA5tXyKdI+OKi5Wcfzo6w3XRrcE9DGdkdGoIql21VQlNvRXq4ZkW3zCmbor4
 a0o0D49/caj66ZzgAYo4rK4kEk8NYJR57y0KTcoDUK/H3bPDOqsUohXEBAMmOTrHuoZQl1Q7OKx
 /gH+fOrM6goa04yIUoXSP9QGNozbRc86boQbUKEhgpxyadegg5Y9PyTsUmp/sI3fTwZsQ3W6C6m
 OuWdiJXaa9iWWXqPG78TvAdC0U68/edlYN+bb6fz+MyS2mbkZ7i9uLnkkN9qg0J3b2qwRvAN6lc
 isA+E770PqYW1kQVMJIeK53dsRAr6aCqpB8VMFodSju6RG5RK+xpsfHyx1KEZoK8hL+d4Du2jDJ
 vpyMBoq0u7VIwAuXZKvOATrUPJj1hxmk1hCDnNWCEsMZqA==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id
 5b1f17b1804b1-4bb8881c741mr502941925e9.6.1795710113237; 
 Thu, 26 Nov 2026 08:21:53 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb90660cb4sm574182015e9.2.2026.11.26.08.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 08:21:52 -0800 (PST)
Message-ID: <31feca61-7439-4006-91f3-2dedb3dca27a@ursulin.net>
Date: Thu, 26 Nov 2026 16:21:52 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Reject relocation writes to RO userptr
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>
Cc: Zakaria Belkadi <zakaria.belkadi@inria.fr>, stable@vger.kernel.org,
 Matthew Auld <matthew.william.auld@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20261126094444.52858-1-joonas.lahtinen@linux.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20261126094444.52858-1-joonas.lahtinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26/11/2026 09:44, Joonas Lahtinen wrote:
> Read-only userptr BOs shouldn't be allowed to have relocation
> addresses written back to them. Enforce that.
> 
> The relocation slow path where this could have happened has been
> in place, reverted and then re-introduced. GPU relocations path
> protected against this via ppGTT flags was also reverted at point.
> 
> There's no legimate use-case for this, so instead of trying to track
> which kernel versions were impacted and which not, just outright
> reject with EFAULT on all kernels with RO userptr support.
> 
> Reported-by: Zakaria Belkadi <zakaria.belkadi@inria.fr>
> Fixes: 0b100760e3e8 ("drm/i915/userptr: Enable read-only support on gen8+")
> Cc: <stable@vger.kernel.org> # v4.19+
> Cc: Matthew Auld <matthew.william.auld@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index c41e1b9a40bc..7ed23dc392b8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -511,6 +511,10 @@ eb_validate_vma(struct i915_execbuffer *eb,
>   	if (unlikely(entry->flags & eb->invalid_flags))
>   		return -EINVAL;
>   
> +	if (unlikely(i915_gem_object_is_readonly(vma->obj) &&
> +		     entry->relocation_count))
> +		return -EFAULT;
> +
>   	if (unlikely(entry->alignment &&
>   		     !is_power_of_2_u64(entry->alignment)))
>   		return -EINVAL;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

