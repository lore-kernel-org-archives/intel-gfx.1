Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467B0105D98D
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Apr 2026 09:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC73E10E5EC;
	Wed,  8 Apr 2026 09:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtBrUXLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332A810E5EC
 for <intel-gfx@lists.freedesktop.org>; Wed,  8 Apr 2026 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775640362; x=1807176362;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dLG3tnuplcJy1rVUYA/jBEe3O0gyAvc45m0izzfVDBw=;
 b=LtBrUXLn514Z67cOx1Y8TYPfCI8G6+WwOLGaFYknRty8GP9+r0Gy7Epc
 FLziG2aYvebaSyNGTguYCkTNhuYkXS2CXqG/hkg0pyn2qHjU0r3YrBxr3
 5oSR7hj1Fc3AoDd6nMNVNBogg2QX94eankfgL6unC4hMiLAKS5WbfXSdD
 b7ceflJZSgyEGRIw4FP/uX0QIC4lKrETNP7yyKZu7e3qjxRp7gkVIm+rE
 zfIyuNjCM8lmHFdoHIwB4M5T6D+w1tZcDE09tCTyCQOUwsM5nTnRjq/SJ
 UbIEF2IvAcWC4BeAeUyeKvfl4x4rMxm/HJmD+bOfNaSDWE2SP1qDjDVej A==;
X-CSE-ConnectionGUID: L7yarB5KR5m16UrTuQQUKQ==
X-CSE-MsgGUID: +DfG676ISIqB4ALOC0s3+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76629671"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76629671"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:26:01 -0700
X-CSE-ConnectionGUID: LBYQnlyXTeSvZsT7MUAI4Q==
X-CSE-MsgGUID: FOJvWrijRoWri0g4H3Xj2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="232454306"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.38])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:25:59 -0700
Message-ID: <a08456f530c079c01d7a7e860635039d7aa620f7.camel@linux.intel.com>
Subject: Re: [PATCH v4 2/2] drm/i915/selftests: Run vma tests only if
 current->mm is present
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Sebastian Brzezinka	
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Date: Wed, 08 Apr 2026 11:25:56 +0200
In-Reply-To: <20260408083034.2060372-3-krzysztof.karas@intel.com>
References: <20260408083034.2060372-1-krzysztof.karas@intel.com>
 <20260408083034.2060372-3-krzysztof.karas@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
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

Hi Krzysztof,

As a continuation of my comment to patch 1/1, ...

On Wed, 2026-04-08 at 08:30 +0000, Krzysztof Karas wrote:
> This set of tests require userspace memory to map objects, so
> run them only if this that memory is available.
>=20
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers=
/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 9d454d0b46f2..0752e758b01b 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -1847,11 +1847,12 @@ static int igt_mmap_revoke(void *arg)
>  int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
>  {
>  	int ret;
> -	bool unuse_mm =3D false;
>  	static const struct i915_subtest tests[] =3D {
>  		SUBTEST(igt_partial_tiling),
>  		SUBTEST(igt_smoke_tiling),
>  		SUBTEST(igt_mmap_offset_exhaustion),
> +	};
> +	static const struct i915_subtest vma_tests[] =3D {
>  		SUBTEST(igt_mmap),
>  		SUBTEST(igt_mmap_migrate),
>  		SUBTEST(igt_mmap_access),
> @@ -1859,15 +1860,12 @@ int i915_gem_mman_live_selftests(struct drm_i915_=
private *i915)
>  		SUBTEST(igt_mmap_gpu),
>  	};
> =20
> -	if (!current->mm) {
> -		kthread_use_mm(current->active_mm);
> -		unuse_mm =3D true;
> -	}
> -
>  	ret =3D i915_live_subtests(tests, i915);
> +	if (ret)
> +		return ret;
> =20
> -	if (unuse_mm)
> -		kthread_unuse_mm(current->active_mm);
> +	if (current->mm)

Since we have now a working method for providing current->mm, we should=C2=
=A0
warn (and then trigger CI dmesg-warn result) if it is missing, I believe.

Thanks,
Janusz

> +		ret =3D i915_live_subtests(vma_tests, i915);
> =20
>  	return ret;
>  }
