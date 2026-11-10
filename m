Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC599606A31C
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MI4RP2Zk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787E510E24F;
	Tue, 10 Nov 2026 13:42:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CB310E132
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794318156; x=1825854156;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=n80JJCWZJ2ZLU0kH8OxfXsR+EmFdElZQjsdr7O90TI8=;
 b=MI4RP2ZkuETUcyt4PrfFsDum6jZC4pMRBdBWgnt2itz4ga9priZWJfcM
 EyB0b5kfjwTF5g3OUEaXTUK67YsQZWa2+Ee7GTxSMUJQsV5PXkqDZEp3J
 M6qoqhw5owCbtFpXf1rEQhzVxBf2hx4kCIPb7aSXdttYOBF949gZONRLQ
 YMqH/a+tiApK1TaYumFjuzQ1ms2x21FNUu53K5vTI5gbBb7FfYOozAxG0
 4HH/nfX7fGnX9bn3y/DVyuj4c1TFMcJVG5lZ2qgJ9YO5RxuyC73x0oORJ
 FzPV4ETH6KymxOrsaDXaHiimHrbbBvPaJGpvnbTR0jK82ncu5gvifQiGD A==;
X-CSE-ConnectionGUID: x3vJgei8QLy3HAFlJmh9zw==
X-CSE-MsgGUID: 38yGzhAHSIOyrAqyUGh2SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2950044"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2950044"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:42:35 -0800
X-CSE-ConnectionGUID: WeB8FLa4RMmso6VUokx1sA==
X-CSE-MsgGUID: +UyFOQfZSViWLisojg0PSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8042445"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.4])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:42:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i915: Unconfuse i915_get_vblank_counter()
 variables
In-Reply-To: <20261110125942.11010-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261110125942.11010-1-ville.syrjala@linux.intel.com>
 <20261110125942.11010-3-ville.syrjala@linux.intel.com>
Date: Tue, 10 Nov 2026 15:42:31 +0200
Message-ID: <6f6ffe63af9a3e37d3ae635f6a7bd8a913518038@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 10 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Using the same 'frame' variable for both the raw register
> value and the decoded frame counter value is confusing,
> and potentially fragile since we need to make sure the
> pixel counter has been extracted from the raw register
> value before we clobber it with the frame counter extraction.
> Use separate variables for each to make the code less
> confusing/fragile. The frame counter is only 24 bits, so
> using a u64 is also unnecessary.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_vblank.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index 1d4753605675..4aa6536986e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -77,8 +77,8 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
>  	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>  	const struct drm_display_mode *mode =3D &vblank->hwmode;
>  	enum pipe pipe =3D to_intel_crtc(crtc)->pipe;
> -	u32 pixel, vbl_start, hsync_start, htotal;
> -	u64 frame;
> +	u32 frame, pixel, vbl_start, hsync_start, htotal;
> +	u64 val;
>=20=20
>  	/*
>  	 * On i965gm TV output the frame counter only works up to
> @@ -109,11 +109,11 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
>  	 * we get a low value that's stable across two reads of the high
>  	 * register.
>  	 */
> -	frame =3D intel_de_read64_2x32_volatile_fw(display, PIPEFRAMEPIXEL(disp=
lay, pipe),
> -						 PIPEFRAMEHIGH(display, pipe));
> +	val =3D intel_de_read64_2x32_volatile_fw(display, PIPEFRAMEPIXEL(displa=
y, pipe),
> +					       PIPEFRAMEHIGH(display, pipe));
>=20=20
> -	pixel =3D REG_FIELD_GET(PIPE_PIXEL_MASK, frame);
> -	frame =3D REG_FIELD_GET64(PIPE_FRAME_MASK, frame);
> +	pixel =3D REG_FIELD_GET(PIPE_PIXEL_MASK, val);
> +	frame =3D REG_FIELD_GET64(PIPE_FRAME_MASK, val);
>=20=20
>  	/*
>  	 * The frame counter increments at beginning of active.

--=20
Jani Nikula, Intel
