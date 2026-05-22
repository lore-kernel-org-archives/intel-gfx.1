Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F46CD5BB0
	for <intel-gfx@archiver.kernel.org>; Fri, 22 May 2026 11:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A5A10F554;
	Fri, 22 May 2026 11:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3vkmebk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AA310F554
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 May 2026 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779449904; x=1810985904;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FC0M9i5xnJMwyKOa2/NMfu0dmZaYSZHcyjuhvwOMH0s=;
 b=L3vkmebk1/5APfwz0PEDMRCuTNPjR15XdoCdZtZnLBF/3S2UxlT0N/XG
 r/qA9BQ4xRxws03teY2I95g9AIUXMuYJxxuzlzFJ5fHYW29HVWJMwLCtD
 pzz4YmKBrANqMP/G2/tRa/IO04aszbaQQ9Zjw759MEz506JvZ9SGYFIeY
 6yE95EDM7thGxd0eIQ0wu4NRMeHnFh+klxETWe7v0C2p9/y0LdWyL0/yf
 ILcdAUv+ZYlZnM74fHRNS3abfX1CRrOjXLganDgyNvnqqGID3eP+F1Z4G
 TxiH9vCsXF7iPxMEzSw+FKSK+my0MUth6R5Ld7UOKTH9DuWqzYj+Tj/e7 w==;
X-CSE-ConnectionGUID: ebXioTz9TzCdo/tAuqcf5g==
X-CSE-MsgGUID: CVXppIwnR4e19D9OLJlOVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91486526"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91486526"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 04:38:24 -0700
X-CSE-ConnectionGUID: JXhGYrRxRAWaBwxj2L1WUQ==
X-CSE-MsgGUID: gj3dAVu7QwGKJgDnwM63qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="236668794"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.1])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 04:38:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-gfx@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Remove useless comment about MTRR.
In-Reply-To: <20260522104548.980226-1-dev@lankhorst.se>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260522104548.980226-1-dev@lankhorst.se>
Date: Fri, 22 May 2026 14:38:20 +0300
Message-ID: <4f1a1b0020a584e7f15e4b82e61d912c5ad2558e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 22 May 2026, Maarten Lankhorst <dev@lankhorst.se> wrote:
> Commit 792d2b9a1259 ("drm: drop mtrr from i915"), added this comment,
> drop it since it since MTRR no longer exists since 2013 and is removed
> by commit 281856477cda ("drm: rip out drm_core_has_MTRR checks").
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/i915_driver.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index f06b2e8cf7d4b..0363dbd231b75 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1869,9 +1869,6 @@ static const struct drm_ioctl_desc i915_ioctls[] =
=3D {
>  #define DRIVER_PATCHLEVEL	0
>=20=20
>  static const struct drm_driver i915_drm_driver =3D {
> -	/* Don't use MTRRs here; the Xserver or userspace app should
> -	 * deal with them for Intel hardware.
> -	 */
>  	.driver_features =3D
>  	    DRIVER_GEM |
>  	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ |

--=20
Jani Nikula, Intel
