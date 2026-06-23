Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696C3CDB46F
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Jun 2026 09:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EF910EA40;
	Tue, 23 Jun 2026 09:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSzgl9xu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B1C10EA56
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782207225; x=1813743225;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=JXP/XkI5gBoqazVsz7e7sr9P0SM6FYURd1FwfpNow94=;
 b=MSzgl9xutwXQoJSAMyKB07TSwfJljWpOiDyNw7jYUW0w1OHRTmtMJFbh
 xiNsXI00wiP6mRws3Vi7wyth2lmoD2yer3Nq0Ztysd66rAYogN+riIlN0
 iAIPK38HxUBjAT2GoCSerXykMTFmMgNR1OI2Uwno/baU82OMWILsBClez
 8J5E4GRnlSFJlpAtQ0LivMHJeb9D3n7REhhH8sOdrC7O9t9/bVuN0JWvs
 N2gE1M27QUek3ovWZYpZLACmoACx31Ln3IKVIzHnP3h6NYJgb2GnjD+nf
 pNogPXonvWDG5hbTdWrZg3B5lahu8+S6GKbl6yGspq3cGLGA0m2U5IvLF w==;
X-CSE-ConnectionGUID: SXa8q2a/S3246j06Qj4u0g==
X-CSE-MsgGUID: FzBQYVgjS8qaH/H9gXN3ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93534783"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="93534783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:32:52 -0700
X-CSE-ConnectionGUID: Of0tbuiYSpWqIMtbgXyDWw==
X-CSE-MsgGUID: 7e7aI5BwTRqOSSk0ctCFIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="245107095"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.242])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:32:49 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260623034319.1105828-1-jia.yao@intel.com>
References: <20260623034319.1105828-1-jia.yao@intel.com>
Subject: Re: [PATCH v6] drm/i915/dg2: Add per-context control for
 Wa_22013059131
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jia Yao <jia.yao@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maciej Plewka <maciej.plewka@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
To: Jia Yao <jia.yao@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 23 Jun 2026 12:32:46 +0300
Message-ID: <178220716617.41312.16710406829870115283@jlahtine-mobl>
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

Quoting Jia Yao (2026-06-23 06:43:19)
> Wa_22013059131 sets FORCE_1_SUB_MESSAGE_PER_FRAGMENT in LSC_CHICKEN_BIT_0
> at engine init, but this is known to cause GPU hangs in certain workloads.
> Add I915_CONTEXT_PARAM_WA_22013059131 so userspace that handles the
> workaround itself (e.g. by limiting SLM size) can set it to 1 to let the
> kernel know bit 15 programming is not needed for that context.
>=20
> LSC_CHICKEN_BIT_0 is not context-saved by hardware, so the kernel restores
> the correct value on every context switch via the indirect context
> batchbuffer to avoid leaking state between contexts. The old unconditional
> application of Wa22013059131 in intel_workarounds.c is removed.
>=20
> v6:
> - Remove excessive blank lines
>=20
> v5:
> - Remove fix and stable
>=20
> v4:
> - Add a link of the userspace using this API
>=20
> v3:
> - Kernel-internal context will not change workaround settings
>=20
> Bspec: 54833
> Link: https://github.com/intel/compute-runtime/pull/919
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maciej Plewka <maciej.plewka@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 12 ++++++
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
>  drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
>  drivers/gpu/drm/i915/gt/intel_lrc.c           | 43 ++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 10 ++---
>  include/uapi/drm/i915_drm.h                   | 10 +++++
>  6 files changed, 71 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.c
> index 6ac0f23570f3..d24e449f1eb3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -911,6 +911,15 @@ static int set_proto_ctx_param(struct drm_i915_file_=
private *fpriv,
>                         ret =3D -EINVAL;
>                 break;
> =20
> +       case I915_CONTEXT_PARAM_WA_22013059131:
> +               if (args->size)
> +                       ret =3D -EINVAL;

Should we also reject this call on any non-impacted SKU? That way this
uAPI usage can't spread accidentally and if we end up tweaking it
further, we're certain the scope is limited.

Basically, to extract the check for if W/A applies to given SKU to
helper, and then reject setting the value if current SKU is not impacted.

Regards, Joonas

> +               else if (args->value)
> +                       pc->user_flags |=3D BIT(UCONTEXT_WA_22013059131);
> +               else
> +                       pc->user_flags &=3D ~BIT(UCONTEXT_WA_22013059131);
> +               break;
> +
