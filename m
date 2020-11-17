Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA93C388F9
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 00:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118BD2078E
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 00:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118BD2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782AC6E0B8;
	Tue, 17 Nov 2020 00:31:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A8D6E0B8
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 00:31:27 +0000 (UTC)
IronPort-SDR: 3hBSjPpIXEB7Tke6RcsERnG6no1iwi+C+zRXdOc6sfeK8ZLZFWkBZYibIhzifirAkf/+KA0+M2
 O+Unqoh1sP0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="167328405"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="167328405"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 16:31:22 -0800
IronPort-SDR: zsAT/+NUjHBzRky9x/7CCrwlPDOVZf7N/EqK2qYSwqfPyxsg+a+kxW5nBc95/OtH+tdY3tIhq+
 JA/NjH5ntpJw==
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="324969638"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 16:31:21 -0800
Date: Mon, 16 Nov 2020 16:33:50 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20201117003343.GB29332@labuser-Z97X-UD5H>
References: <20201113220358.24794-1-ville.syrjala@linux.intel.com>
 <20201113220358.24794-22-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113220358.24794-22-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Intel-gfx] [PATCH 21/23] drm/i915: Fix cursor src/dst
 rectangle with bigjoiner
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 12:03:56AM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> We can't call drm_plane_state_src() this late for the slave plane since
> it would consult the wrong uapi state. We've alreayd done the correct
> uapi->hw copy earlier, so let's just preserve the unclipped src/dst
> rects using a temp copy across the intel_atomic_plane_check_clipping()
> call.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 19e9c3795265..7607bcd9b7fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -11651,6 +11651,8 @@ static int intel_check_cursor(struct intel_crtc_s=
tate *crtc_state,
>  {
>  	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
>  	struct drm_i915_private *i915 =3D to_i915(plane_state->uapi.plane->dev);
> +	const struct drm_rect src =3D plane_state->uapi.src;
> +	const struct drm_rect dst =3D plane_state->uapi.dst;
>  	int ret;
>  =

>  	if (fb && fb->modifier !=3D DRM_FORMAT_MOD_LINEAR) {
> @@ -11666,8 +11668,8 @@ static int intel_check_cursor(struct intel_crtc_s=
tate *crtc_state,
>  		return ret;
>  =

>  	/* Use the unclipped src/dst rectangles, which we program to hw */
> -	plane_state->uapi.src =3D drm_plane_state_src(&plane_state->uapi);
> -	plane_state->uapi.dst =3D drm_plane_state_dest(&plane_state->uapi);
> +	plane_state->uapi.src =3D src;
> +	plane_state->uapi.dst =3D dst;

We get this for both slave and master? No slave condition needed?

Manasi

>  =

>  	ret =3D intel_cursor_check_surface(plane_state);
>  	if (ret)
> -- =

> 2.26.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
