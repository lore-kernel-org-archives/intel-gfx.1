Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C484FD3762
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Feb 2026 14:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4067E10E0D0;
	Wed, 25 Feb 2026 14:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sx/BBdqO";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AF210E0D0;
 Wed, 25 Feb 2026 14:41:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7C3AC409D1;
 Wed, 25 Feb 2026 14:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D46C116D0;
 Wed, 25 Feb 2026 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772030476;
 bh=aVTY17tMnwUKrtn7cYLbaqsiDtGlfzEBFX0+Lpz9dvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sx/BBdqO1jCT/XpzOZpQhRiqaTPGyD0DaVQDZ1M7r5/+ts5AuTtHrn3ECk7gheRkT
 fi1W5v3OGnXASUc+EP3Ua37UrF59D3aXuqdm+iZuU/yuO762Ijk5XqfDHCBmDX4boP
 KILiy8HeUo0XucvswtG1D7nN8Lyz53K+uccUFgiNbbfrezMiIbgKGA0Wblh0wZ9W5r
 H+pxwNiH0JwcVcvgPGd0UGkF3VI1VTI2mR8es6DL12OjPhadhWVIy75YK4WgqOaxnz
 fzQKO2i/c3j6M9eRNyRpWfJLSIuUAzX76foUa0JIbkFeea+zljefYmTmc9oIej1je/
 57rVeF1I1p/XA==
Date: Wed, 25 Feb 2026 15:41:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Krzysztof Karas <krzysztof.karas@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915: Fix potential overflow of shmem scatterlist
 length
Message-ID: <aZ7h4pJlB70wf7In@zenone.zhora.eu>
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,

...

> @@ -153,8 +153,12 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
>  			}
>  		} while (1);
>  

Perhaps we could add here:

	max_pages = max_segment >> PAGE_SHIFT;
	/* Just to be paranoic, but not necessary */
	if (!max_pages)
		max_pages = 1;


> -		nr_pages = min_t(unsigned long,
> -				folio_nr_pages(folio), page_count - i);
> +		nr_pages = min_array(((unsigned long[]) {
> +					folio_nr_pages(folio),
> +					page_count - i,
> +					max_segment / PAGE_SIZE,

max_segment >> PAGE_SHIFT ?

For clarity this can be written as

		nr_pages = min_t(unsigned long,
				folio_nr_pages(folio), page_count - i);
		nr_pages = min_t(unsigned long, nr_pages, max_pages);

But these are nitpicks, it's then up to you to choose the style.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> +				      }), 3);
> +
