Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD6C606A320
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRxKzTF2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4BE10EB34;
	Thu, 19 Nov 2026 14:42:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509E10EB34
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:42:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9CFA94419A;
 Thu, 19 Nov 2026 14:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ABF1F000C6;
 Thu, 19 Nov 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795099347;
 bh=+dPV+KpM8mB/D7CLDuhCnn1mUpzdgwZu4v/L4qGMIfc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DRxKzTF2C2KVOxmjD2CSCQrPkhz5pYLc17Zes8JsJnNSJQHpynhZ40aIDqeGECGLU
 JFVlUuy4G9/XX4YAKsqUKAvdAhgRDJ6pJ6oxRiJKUjDAk1Njghf9F+h7iCXFCO9e5b
 Rh7kOtee3qCPv54QyH+DDKhKtsuxd98buOka9kkXjC0eT7jnVpE+JCZtvBYLPwDXLc
 I3IH110X4RBhuUL6dktH58GlSvqHNzEgtbLo2BhNUOV7MF7+gui3pR4gUyUCwqH+G8
 82lmMHLw6KtPKG7JSW1xFC8btsAhc50L1unZfFMflGKH97OotIjR8rBofKQwspAnvj
 KYTeLQGZjGazw==
Message-ID: <sashiko-outbox-223310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/query: Use __counted_by() to annotate
 flexible arrays
To: "Krzysztof Karas" <krzysztof.karas@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20261119143510.2971237-3-krzysztof.karas@intel.com>
References: <20261119143510.2971237-1-krzysztof.karas@intel.com>
 <20261119143510.2971237-3-krzysztof.karas@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 14:42:26 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/i915/query: out-of-bounds regions[] access in
  query_memregion_info()
--

commit b2640bf13b3424df44fa1f7fb0465d67b8308127
Author: Krzysztof Karas <krzysztof.karas@intel.com>

drm/i915/query: Use __counted_by() to annotate flexible arrays

This commit annotates flexible array members in struct
drm_i915_query_engine_info and struct drm_i915_query_memory_regions with
__counted_by(), and allocates temporary kernel buffers in
query_engine_info() and query_memregion_info() before copying the results
to user space.

> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i91=
5_query.c
> index 11157fb14db31..46fee1591e489 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c

[ ... ]

> @@ -466,70 +467,74 @@ static int query_memregion_info(struct drm_i915_pri=
vate *i915,
>  {
>  	struct drm_i915_query_memory_regions __user *query_ptr =3D
>  		u64_to_user_ptr(query_item->data_ptr);
> -	struct drm_i915_memory_region_info __user *info_ptr =3D
> -		&query_ptr->regions[0];
> -	struct drm_i915_memory_region_info info =3D { };
> -	struct drm_i915_query_memory_regions query;
> +	struct drm_i915_query_memory_regions *query;
> +	struct drm_i915_query_memory_regions hdr;
>  	struct intel_memory_region *mr;
> +	unsigned int num_regions =3D 0;
> +	int ret, id, i, n =3D 0;
>  	u32 total_length;
> -	int ret, id, i;
> =20
>  	if (query_item->flags !=3D 0)
>  		return -EINVAL;
> =20
> -	total_length =3D sizeof(query);
>  	for_each_memory_region(mr, i915, id) {
>  		if (mr->private)
>  			continue;
> =20
> -		total_length +=3D sizeof(info);
> +		num_regions++;
>  	}
> +	total_length =3D struct_size(query, regions, num_regions);
> =20
> -	ret =3D copy_query_item(&query, sizeof(query), total_length, query_item=
);
> +	ret =3D copy_query_item(&hdr, sizeof(hdr), total_length, query_item);
>  	if (ret !=3D 0)
>  		return ret;
> =20
> -	if (query.num_regions)
> +	if (hdr.num_regions)
>  		return -EINVAL;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(query.rsvd); i++) {
> -		if (query.rsvd[i])
> +	for (i =3D 0; i < ARRAY_SIZE(hdr.rsvd); i++) {
> +		if (hdr.rsvd[i])
>  			return -EINVAL;
>  	}
> =20
> +	query =3D kzalloc_flex(*query, regions, num_regions);
> +	if (!query)
> +		return -ENOMEM;
> +
> +	query->num_regions =3D num_regions;
> +
>  	for_each_memory_region(mr, i915, id) {
> +		struct drm_i915_memory_region_info *info =3D &query->regions[n++];
> +
>  		if (mr->private)
>  			continue;

[Severity: High]
Can indexing query->regions[n++] before checking mr->private access past
the end of query->regions[]?

num_regions only counts non-private regions, so when the second loop hits
a private stolen memory region (set up with mem->private =3D true in
i915_gem_stolen_smem_setup() or i915_gem_stolen_lmem_setup()), n is
incremented on the skipped region and &query->regions[n++] indexes
query->regions[num_regions], triggering a CONFIG_UBSAN_BOUNDS splat (or
writing past the end of the kzalloc_flex() buffer if a non-private region
follows a private one).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119143510.2971=
237-1-krzysztof.karas@intel.com?part=3D2
