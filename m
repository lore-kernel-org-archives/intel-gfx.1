Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FF0CDB46F
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Jun 2026 14:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2D710E6FD;
	Mon, 22 Jun 2026 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJ0nKmK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924CB10E720
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782137683; x=1813673683;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=JJTcTYcU1S0DB2xI4m+XRHxd41CNHfLNweQXEByHWaY=;
 b=OJ0nKmK6L8aad7WLJQpEfICDxgNtNFg3xIP5MFvpM7g0atxcB9lzSfNu
 GpsniV5TLvH+gvJ6ubvtk8/9OEdQ278UaN189C+dtTR6m5aNhf3MjBe0Z
 HHDdYotW5caihQipgbPeMVWD1/3K47lwdc4f1iZef/mWu0KyR5f4df40t
 qrwKnZHpd6pU5iPzRiZde5IblnjbY7GwhpR7lPii9NfngP5gPZuOaR7B2
 6IzBqHam/352fNdEc6uhkuCSMYdBpaKftgciSIk3QyE2lGlWIlF45lwZr
 LelhnUvzfcNJG6usKTSr9zeIT3cyKA748cRj9Duhyp3XKb7GkfrGuz4Jz A==;
X-CSE-ConnectionGUID: j/wkWWq3SZ6TCBQCA3cNMA==
X-CSE-MsgGUID: CtmyJtKbQGCGViRX9bT4EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93233138"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93233138"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 07:14:43 -0700
X-CSE-ConnectionGUID: FrdoXwZiQ321sXxzf51NAg==
X-CSE-MsgGUID: 8jQMf4ZdTb+ZFL8Gp8/XJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="245091358"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.69])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 07:14:41 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260622132539.165558-1-joonas.lahtinen@linux.intel.com>
References: <20260622132539.165558-1-joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Add missing nospec on parallel submit slot
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Martin Hodo <martin.hodo@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
To: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>
Date: Mon, 22 Jun 2026 17:14:38 +0300
Message-ID: <178213767858.188877.6438226827707234635@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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

(Correct mail for Tvrtko, dim fixes not handling .mailmap?)

Quoting Joonas Lahtinen (2026-06-22 16:25:39)
> Add missing Spectre mitigation for userspace controlled parallel
> submission slot.
>=20
> Discovered using AI-assisted static analysis confirmed by Intel
> Product Security.
>=20
> Reported-by: Martin Hodo <martin.hodo@intel.com>
> Fixes: e5e32171a2cf ("drm/i915/guc: Connect UAPI to GuC multi-lrc interfa=
ce")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.c
> index 6ac0f23570f3..aeafe1742d30 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -613,6 +613,7 @@ set_proto_ctx_engines_parallel_submit(struct i915_use=
r_extension __user *base,
>                 return -EINVAL;
>         }
> =20
> +       slot =3D array_index_nospec(slot, set->num_engines);
>         if (set->engines[slot].type !=3D I915_GEM_ENGINE_TYPE_INVALID) {
>                 drm_dbg(&i915->drm,
>                         "Invalid placement[%d], already occupied\n", slot=
);
> --=20
> 2.54.0
>
