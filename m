Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3BB606A31E
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 15:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ds9IDrAe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3349310E0CF;
	Tue, 24 Nov 2026 15:17:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAAB10EB43
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 15:17:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 32788444F6;
 Tue, 24 Nov 2026 15:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0788D1F000C4;
 Tue, 24 Nov 2026 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795533419;
 bh=xwAQgiCjwxF9GXThIiQDV3MPDj847Iq6LBHd+p8Dq8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ds9IDrAe5LH5gGev/YX0ThEksWrtVgU0uuM24LMCylnOOBZqGhce/zNVnFqV2wKdn
 SVQkzrwB9+BSDl25fvm0+j5Nz2c1oB/6oJntzs6vQRajoIh0EZE56I4wWio+TFUV96
 4wBwH0L298mT+RLzu88WVNngsS05HAaH6tpWoXbJRzfj8hrAukBMLBbsvbsI6ZZ76Y
 QKDQ4cKpf3vEPN6WmD0ouBYPjkR9xBBzqn1+s72n/51nC1vWGiLc6IRPfaXBOBSy0e
 3Vecf3jlipbTsBGxggVxp0XljmaRIQVRsaSu2MlCLpijKqXJ+P4SB0uuzR8svCCSWn
 B3o4SDEVJZ3Rw==
Date: Tue, 24 Nov 2026 16:16:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: Annotate flexible array members that
 require minimal changes
Message-ID: <awWqQD5BmwLPpuKG@zenone.zhora.eu>
References: <20261123120137.3460155-1-krzysztof.karas@intel.com>
 <20261123120137.3460155-2-krzysztof.karas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123120137.3460155-2-krzysztof.karas@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

...

> @@ -1124,6 +1125,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
>  	const unsigned int max = I915_NUM_ENGINES;
>  	struct intel_engine_cs *engine;
>  	struct i915_gem_engines *e, *err;
> +	unsigned int num_engines = 0;

what is the point for declaring this local num_engines?

Thanks,
Andi

>  
>  	e = alloc_engines(max);
>  	if (!e)
