Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB83460A260E
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WR/sV8se
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8671410F700;
	Tue, 24 Nov 2026 15:29:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633C210F649
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 15:29:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AF3436271A;
 Tue, 24 Nov 2026 15:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910D61F01570;
 Tue, 24 Nov 2026 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795534168;
 bh=EoDtmswLaGcDTyDm/59lSg5cFDZAk/D/CDV6egZ73H4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=WR/sV8seIjm+QQwnw67/XtD5JcRYt022RLcVMtSjIWwDYUWPqgKjasqfgh4IdLL9O
 GOXhzyvISG1LYy8oPtiReS5pmdZpfS3WcVhgg0ACbJqUgCoNhe3VnXen9f/4mcnc1s
 WluvRFq1Df7A+emQWmPd1T3IraQiz5AgTaYTsQtlQkxTjVu3hmRo+QGjt9dhdYhhaS
 lqCXHUjwTdwOjVYswDpbtD/tqOGhhK2I2V7wc5yyeWbgC7DyXv0ErCl2ucV7BwfUgs
 wH0hOOsoEb5KQyPLB1BnF2ZyRldS9KlVF770LcuZSlCoQlQNjQ4QJT3rTIbwHOkbC6
 6wpirG0+Ztwqw==
Date: Tue, 24 Nov 2026 16:29:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/query: Use __counted_by() to annotate
 flexible arrays
Message-ID: <awWqb-vl8UPdjYFL@zenone.zhora.eu>
References: <20261123120137.3460155-1-krzysztof.karas@intel.com>
 <20261123120137.3460155-3-krzysztof.karas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123120137.3460155-3-krzysztof.karas@intel.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 12:01:37PM +0000, Krzysztof Karas wrote:
> Annotate flexible array members to facilitate bounds-checking
> coverage (memcpy() - CONFIG_FORTIFY_SOURCE) and enable
> array-bounds sanitizer (CONFIG_UBSAN_BOUNDS).
> Use temporary buffers to allow compiler bound instrumentation.
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_query.c | 102 ++++++++++++++++--------------
>  include/uapi/drm/i915_drm.h       |   9 ++-
>  2 files changed, 61 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 11157fb14db31..8a0f237b6442f 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -132,12 +132,11 @@ query_engine_info(struct drm_i915_private *i915,
>  {
>  	struct drm_i915_query_engine_info __user *query_ptr =
>  				u64_to_user_ptr(query_item->data_ptr);
> -	struct drm_i915_engine_info __user *info_ptr;
> -	struct drm_i915_query_engine_info query;
> -	struct drm_i915_engine_info info = { };
> +	struct drm_i915_query_engine_info *query;
> +	struct drm_i915_query_engine_info hdr;
>  	unsigned int num_uabi_engines = 0;
>  	struct intel_engine_cs *engine;
> -	int len, ret;
> +	int len, ret, n = 0;

All this renaming makes the patch look a bit bigger, but I have
to admit that the end result is a bit clearer.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
