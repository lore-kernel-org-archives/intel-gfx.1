Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68492CDE000
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Jun 2026 12:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE4C10F290;
	Thu, 25 Jun 2026 12:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxkEk6xZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5A10F290
 for <intel-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 12:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782391120; x=1813927120;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=ba3etDmdB/eC0t836NRayCDZwFpsSudxtDdlQcDozAo=;
 b=WxkEk6xZ5PxWcjmAACGFrlWZPoDSKsCVdypwfGCL/0xeerW9R4bq48cm
 awW8q2MhvpgtZe47857ek2x5xY5n4xbR3N0cfjByx1Uu0uhOTIPLyjtbI
 fxll8NhH9WvljXXYIWU68DbEfXKM8JQ44TfjnJkmO2Uv6YZhQsSU6Iy+K
 ueBi3mhoYLJkM2igGWPZGmQlMwg+/puOImIFgoVaOMTsDE+qYLp10klFC
 VE/7fot5GnHheCXU6mr5cfnaiB66HaGc6ySTbF2ODWswa7u+ouyQ2FVpl
 JZ0jFepqTnfDTyE3AlHn4hQIH5ke+DY6c7SVh1TWhEGY5VvN7yl1BdOwl g==;
X-CSE-ConnectionGUID: HRcvylUnRgeuwGLng1qJ+g==
X-CSE-MsgGUID: US7vEgv+Tb6OhooUfkZjHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="87010358"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="87010358"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 05:38:40 -0700
X-CSE-ConnectionGUID: ryUGkgg0RS+c8B9HKvw5hw==
X-CSE-MsgGUID: B+RK9uaMTgmTqlW7G1Ymbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="247464798"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.75])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 05:38:38 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260623221521.1183124-1-jia.yao@intel.com>
References: <20260623221521.1183124-1-jia.yao@intel.com>
Subject: Re: [PATCH v7] drm/i915/dg2: Add per-context control for
 Wa_22013059131
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jia Yao <jia.yao@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maciej Plewka <maciej.plewka@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
To: Jia Yao <jia.yao@intel.com>, intel-gfx@lists.freedesktop.org
Date: Thu, 25 Jun 2026 15:38:35 +0300
Message-ID: <178239111512.123473.311792859568377409@jlahtine-mobl>
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

Being uAPI patch, probably should keep dri-devel in the Cc. That'd also
pull in Sashiko for review.

Quoting Jia Yao (2026-06-24 01:15:21)
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
> v7:
> - Reject ioctl with -ENODEV on non-DG2-G11 platforms
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

It's good practice to either ask for refresh or amend "# v2" here I
think, given Matt has not commented on the latest versions.

<SNIP>

> +++ b/include/uapi/drm/i915_drm.h
> @@ -2172,6 +2172,16 @@ struct drm_i915_gem_context_param {
>   * Note that this is a debug API not available on production kernel buil=
ds.
>   */
>  #define I915_CONTEXT_PARAM_CONTEXT_IMAGE       0xf
> +
> +/*
> + * I915_CONTEXT_PARAM_WA_22013059131:
> + *
> + * Default value 0 means the kernel programs Wa_22013059131 for this con=
text.
> + * Set to 1 to inform the kernel that userspace is taking responsibility=
 for
> + * applying the preferred workaround implementation, so the kernel progr=
amming
> + * of LSC_CHICKEN_BIT_0 bit 15 is not needed for this context. DG2-G11 o=
nly.
> + */
> +#define I915_CONTEXT_PARAM_WA_22013059131      0x10

I see we dropped the "half" terminology based on Matt's review comments.

There's still one part of the 22013059131 that remains to be implemented
by KMD, LSC_CHICKEN_BIT_0_UDW, only LSC_CHICKEN_BIT_0 is omitted.

Thus, I'm not entirely sold on the description here.

Regards, Joonas
