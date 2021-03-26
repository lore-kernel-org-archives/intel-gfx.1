Return-Path: <SRS0=K65z=IY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CF9C433C1
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 16:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD8D619B4
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 16:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBD8D619B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4596F400;
	Fri, 26 Mar 2021 16:22:27 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B776F400
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 16:22:25 +0000 (UTC)
IronPort-SDR: oM6KnqNzaIGRKN6FuUYp9/XcKM+NTVH0y+SUiUqi2z8zsg6xJeptO/Bq0OCP/vhaEs7XMz6u+x
 PBo7LzkSwt+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="252530112"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="252530112"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 09:22:24 -0700
IronPort-SDR: foCuMoAhJfbSOEJPsMYYAhbLLSY/a+lG6G6o5/scypjF5Wmu+9aLQ6Ncs5sz6ZG2aVaSCzN1Ao
 T/kiEPZGRP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="414600532"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 26 Mar 2021 09:22:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 26 Mar 2021 18:22:21 +0200
Date: Fri, 26 Mar 2021 18:22:21 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Message-ID: <YF4KPXWC9Ixw3/fK@intel.com>
References: <20210325214808.2071517-1-imre.deak@intel.com>
 <20210325214808.2071517-16-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325214808.2071517-16-imre.deak@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH v2 15/25] drm/i915/intel_fb: Factor out
 calc_plane_normal_size()
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

On Thu, Mar 25, 2021 at 11:47:58PM +0200, Imre Deak wrote:
> Factor out to a new function the logic to calculate an FB plane's
> normal-view size.
> =

> Instead of using intel_remapped_plane_info, which is related only to
> remapping, add a helper to get the tile pitch and rows for an FB plane,
> so these helpers can be used both by the normal size calculation and the
> remapping code.
> =

> Also add a new fb_plane_view_dims struct in which we can pass around the
> view (either FB plane or plane source) and tile dimensions conveniently
> to functions calculating further view parameters.
> =

> v2:
> - Add back the +1 tile adjustment for x!=3D0 in calc_plane_normal_size().=
 (Ville)
> - s/pages/tiles/ in calc_plane_normal_size(). (Ville)
> - Add a helper for the plane view width calculation. (Ville)
> - Return tiles as unsigned int from calc_plane_normal_size().
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 97 +++++++++++++++++++------
>  1 file changed, 76 insertions(+), 21 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index 1400a31f0dd6b..6f8206769c3df 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -632,6 +632,74 @@ static u32 setup_fb_rotation(int plane, const struct=
 intel_remapped_plane_info *
>  	return plane_info->width * plane_info->height;
>  }
>  =

> +struct fb_plane_view_dims {
> +	unsigned int width, height;
> +	unsigned int tile_width, tile_height;
> +};
> +
> +static void init_plane_view_dims(const struct intel_framebuffer *fb, int=
 color_plane,
> +				 unsigned int width, unsigned int height,
> +				 struct fb_plane_view_dims *dims)
> +{
> +	dims->width =3D width;
> +	dims->height =3D height;
> +
> +	intel_tile_dims(&fb->base, color_plane, &dims->tile_width, &dims->tile_=
height);
> +}
> +
> +static unsigned int
> +plane_view_stride_tiles(const struct intel_framebuffer *fb, int color_pl=
ane,
> +			const struct fb_plane_view_dims *dims)
> +{
> +	return DIV_ROUND_UP(fb->base.pitches[color_plane],
> +			    dims->tile_width * fb->base.format->cpp[color_plane]);
> +}
> +
> +static unsigned int
> +plane_view_width_tiles(const struct intel_framebuffer *fb, int color_pla=
ne,
> +		       const struct fb_plane_view_dims *dims,
> +		       int x)
> +{
> +	return DIV_ROUND_UP(x + dims->width, dims->tile_width);
> +}
> +
> +static unsigned int
> +plane_view_height_tiles(const struct intel_framebuffer *fb, int color_pl=
ane,
> +			const struct fb_plane_view_dims *dims,
> +			int y)
> +{
> +	return DIV_ROUND_UP(y + dims->height, dims->tile_height);
> +}
> +
> +/* Return number of tiles @color_plane needs. */
> +static unsigned int
> +calc_plane_normal_size(const struct intel_framebuffer *fb, int color_pla=
ne,
> +		       const struct fb_plane_view_dims *dims,
> +		       int x, int y)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(fb->base.dev);
> +	unsigned int tiles;
> +
> +	if (is_surface_linear(&fb->base, color_plane)) {
> +		unsigned int size;
> +
> +		size =3D (y + dims->height) * fb->base.pitches[color_plane] +
> +		       x * fb->base.format->cpp[color_plane];
> +		tiles =3D DIV_ROUND_UP(size, intel_tile_size(i915));
> +	} else {
> +		tiles =3D plane_view_stride_tiles(fb, color_plane, dims) *
> +			plane_view_height_tiles(fb, color_plane, dims, y);
> +		/*
> +		 * If the plane isn't horizontally tile aligned,
> +		 * we need one more tile.
> +		 */
> +		if (x !=3D 0)
> +			tiles++;
> +	}
> +
> +	return tiles;
> +}
> +
>  int intel_fill_fb_info(struct drm_i915_private *i915, struct drm_framebu=
ffer *fb)
>  {
>  	struct intel_framebuffer *intel_fb =3D to_intel_framebuffer(fb);
> @@ -642,6 +710,7 @@ int intel_fill_fb_info(struct drm_i915_private *i915,=
 struct drm_framebuffer *fb
>  	unsigned int tile_size =3D intel_tile_size(i915);
>  =

>  	for (i =3D 0; i < num_planes; i++) {
> +		struct fb_plane_view_dims view_dims;
>  		unsigned int width, height;
>  		unsigned int cpp, size;
>  		u32 offset;
> @@ -667,6 +736,8 @@ int intel_fill_fb_info(struct drm_i915_private *i915,=
 struct drm_framebuffer *fb
>  		if (ret)
>  			return ret;
>  =

> +		init_plane_view_dims(intel_fb, i, width, height, &view_dims);
> +
>  		/*
>  		 * First pixel of the framebuffer from
>  		 * the start of the normal gtt mapping.
> @@ -678,38 +749,22 @@ int intel_fill_fb_info(struct drm_i915_private *i91=
5, struct drm_framebuffer *fb
>  =

>  		if (!is_surface_linear(fb, i)) {
>  			struct intel_remapped_plane_info plane_info;
> -			unsigned int tile_width, tile_height;
> -
> -			intel_tile_dims(fb, i, &tile_width, &tile_height);
>  =

>  			plane_info.offset =3D offset;
> -			plane_info.stride =3D DIV_ROUND_UP(fb->pitches[i],
> -							 tile_width * cpp);
> -			plane_info.width =3D DIV_ROUND_UP(x + width, tile_width);
> -			plane_info.height =3D DIV_ROUND_UP(y + height,
> -							 tile_height);
> -
> -			/* how many tiles does this plane need */
> -			size =3D plane_info.stride * plane_info.height;
> -			/*
> -			 * If the plane isn't horizontally tile aligned,
> -			 * we need one more tile.
> -			 */
> -			if (x !=3D 0)
> -				size++;
> +			plane_info.stride =3D plane_view_stride_tiles(intel_fb, i, &view_dims=
);
> +			plane_info.width =3D plane_view_width_tiles(intel_fb, i, &view_dims, =
x);
> +			plane_info.height =3D plane_view_height_tiles(intel_fb, i, &view_dims=
, y);
>  =

>  			gtt_offset_rotated +=3D
>  				setup_fb_rotation(i, &plane_info,
>  						  gtt_offset_rotated,
>  						  x, y, width, height,
>  						  tile_size,
> -						  tile_width, tile_height,
> +						  view_dims.tile_width, view_dims.tile_height,
>  						  fb);
> -		} else {
> -			size =3D DIV_ROUND_UP((y + height) * fb->pitches[i] +
> -					    x * cpp, tile_size);
>  		}
>  =

> +		size =3D calc_plane_normal_size(intel_fb, i, &view_dims, x, y);
>  		/* how many tiles in total needed in the bo */
>  		max_size =3D max(max_size, offset + size);
>  	}
> -- =

> 2.25.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
