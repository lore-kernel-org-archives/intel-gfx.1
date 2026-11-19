Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762C4606A325
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LiUHAO9N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9D31124D6;
	Thu, 19 Nov 2026 14:44:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1891F1124D6
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795099473; x=1826635473;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zaB5H5Xt+hmBzpq2T3l2aEjBgtBIAoDPe/6hiX0w0zs=;
 b=LiUHAO9Nhl8cgBV4pkEh8OTEyZecfZzTaHnVOsElOIewv5h69/g6uNdL
 HpscWlPraAI6yuVVnmOly8Pl4M5UEJFikwwamIZ7HlHzoVmF13189/BWb
 5g2qK1x2E1lKzlwywTONud04GomIgch3PlBByE12mUw6peellNy2GvjA/
 SwESYKysl5X5RcLE5hJBE71yoxv6hz02w/+D5CG/sUENzDNImqiCVleE/
 1dYdaLnS9OE8XGtBIObtrunn029qcoX5UIIEEbkSA+LXJDi1LBEYJVXKx
 5aP20P7q5l6RsePBRmAAsTbMtZS8EpZM6YjFBmTW0FSzYgwP3Olkvcqy7 Q==;
X-CSE-ConnectionGUID: Fkvy+rWUQtudc4pzXQj/CA==
X-CSE-MsgGUID: YZ5+MiU9TqalFM6C1dPyqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3980263"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3980263"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:44:33 -0800
X-CSE-ConnectionGUID: 6l6JTLMeQx2b9+6ip1Z5+w==
X-CSE-MsgGUID: GXzJWAg0QW29wqqrmojhgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10341925"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:44:30 -0800
Date: Thu, 19 Nov 2026 16:44:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Annotate flexible array members that
 require minimal changes
Message-ID: <av8LS_GQwNClLaJ0@intel.com>
References: <20261119143510.2971237-1-krzysztof.karas@intel.com>
 <20261119143510.2971237-2-krzysztof.karas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119143510.2971237-2-krzysztof.karas@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 02:35:09PM +0000, Krzysztof Karas wrote:
> Annotate flexible array members with __counted_by() attribute.
> For starters, follow path of least resistance and pick the
> entries that require minimal changes to the code.
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bios.c            | 8 ++++++--

Display stuff should be in a patch of its own.

>  drivers/gpu/drm/i915/gem/i915_gem_context.c          | 6 ++++--
>  drivers/gpu/drm/i915/gem/i915_gem_context_types.h    | 2 +-
>  drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h     | 2 +-
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 ++++--
>  5 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 7b6a6f8c3cf19..4c14593b7a000 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -148,7 +148,8 @@ static u32 raw_block_offset(const void *bdb, enum bdb_block_id section_id)
>  struct bdb_block_entry {
>  	struct list_head node;
>  	enum bdb_block_id section_id;
> -	u8 data[];
> +	size_t data_size;
> +	u8 data[] __counted_by(data_size);
>  };
>  
>  static const void *
> @@ -468,6 +469,7 @@ init_bdb_block(struct intel_display *display,
>  	void *temp_block = NULL;
>  	const void *block;
>  	size_t block_size;
> +	size_t data_size;
>  
>  	block = find_raw_section(bdb, section_id);
>  
> @@ -492,12 +494,14 @@ init_bdb_block(struct intel_display *display,
>  	if (section_id == BDB_MIPI_SEQUENCE && *(const u8 *)block >= 3)
>  		block_size += 5;
>  
> -	entry = kzalloc_flex(*entry, data, max(min_size, block_size) + 3);
> +	data_size = max(min_size, block_size) + 3;
> +	entry = kzalloc_flex(*entry, data, data_size);
>  	if (!entry) {
>  		kfree(temp_block);
>  		return;
>  	}
>  
> +	entry->data_size = data_size;

Are we actually going to do something with this, or what's point?

>  	entry->section_id = section_id;
>  	memcpy(entry->data, block - 3, block_size + 3);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index c58ffa5a8fa6f..2efcc5d5d5ac1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1114,6 +1114,7 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
>  	if (!e)
>  		return NULL;
>  
> +	e->num_engines = count;
>  	i915_sw_fence_init(&e->fence, engines_notify);
>  	return e;
>  }
> @@ -1124,6 +1125,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
>  	const unsigned int max = I915_NUM_ENGINES;
>  	struct intel_engine_cs *engine;
>  	struct i915_gem_engines *e, *err;
> +	unsigned int num_engines = 0;
>  
>  	e = alloc_engines(max);
>  	if (!e)
> @@ -1147,7 +1149,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
>  		}
>  
>  		e->engines[engine->legacy_idx] = ce;
> -		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
> +		num_engines = max(num_engines, engine->legacy_idx + 1);
>  
>  		if (engine->class == RENDER_CLASS)
>  			sseu = rcs_sseu;
> @@ -1159,6 +1161,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
>  		}
>  
>  	}
> +	e->num_engines = num_engines;
>  
>  	return e;
>  
> @@ -1211,7 +1214,6 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>  	e = alloc_engines(num_engines);
>  	if (!e)
>  		return ERR_PTR(-ENOMEM);
> -	e->num_engines = num_engines;
>  
>  	for (n = 0; n < num_engines; n++) {
>  		struct intel_context *ce, *child;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 0267c924634b0..951b46ae559fc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -51,7 +51,7 @@ struct i915_gem_engines {
>  	unsigned int num_engines;
>  
>  	/** @engines: Array of engines */
> -	struct intel_context *engines[];
> +	struct intel_context *engines[] __counted_by(num_engines);
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
> index 22818bbb139d5..1bee91df73ea8 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
> @@ -11,7 +11,7 @@
>  
>  struct mock_dmabuf {
>  	int npages;
> -	struct page *pages[];
> +	struct page *pages[] __counted_by(npages);
>  };
>  
>  static inline struct mock_dmabuf *to_mock(struct dma_buf *buf)
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 841f719326756..ed3fc9b84f219 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -201,7 +201,7 @@ struct virtual_engine {
>  
>  	/* And finally, which physical engines this virtual engine maps onto. */
>  	unsigned int num_siblings;
> -	struct intel_engine_cs *siblings[];
> +	struct intel_engine_cs *siblings[] __counted_by(num_siblings);
>  };
>  
>  static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
> @@ -3931,6 +3931,7 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>  	if (!ve)
>  		goto err;
>  
> +	ve->num_siblings = 0;
>  	ve->base.i915 = i915;
>  	ve->base.gt = siblings[0]->gt;
>  	ve->base.uncore = siblings[0]->uncore;
> @@ -4009,7 +4010,8 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>  		GEM_BUG_ON(RB_EMPTY_NODE(&ve->nodes[sibling->id].rb));
>  		RB_CLEAR_NODE(&ve->nodes[sibling->id].rb);
>  
> -		ve->siblings[ve->num_siblings++] = sibling;
> +		ve->num_siblings++;
> +		ve->siblings[ve->num_siblings - 1] = sibling;
>  		ve->base.mask |= sibling->mask;
>  		ve->base.logical_mask |= sibling->logical_mask;
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
