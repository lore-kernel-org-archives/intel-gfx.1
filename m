Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CAAEB64DA
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jun 2023 12:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223F910E0D6;
	Mon, 26 Jun 2023 12:19:00 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EFD10E04B
 for <intel-gfx@lists.freedesktop.org>; Mon, 26 Jun 2023 12:18:58 +0000 (UTC)
Received: from 91-155-254-218.elisa-laajakaista.fi ([91.155.254.218]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1qDlBE-009GRl-Of;
 Mon, 26 Jun 2023 15:18:53 +0300
Message-ID: <e1bef6bb59b788b737ed9f461b2aa525f46d2e8b.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Mon, 26 Jun 2023 15:18:52 +0300
In-Reply-To: <20230626082821.2085-1-stanislav.lisovskiy@intel.com>
References: <20230626082821.2085-1-stanislav.lisovskiy@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fail if DSC compression
 requirement is less than platform supports
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

On Mon, 2023-06-26 at 11:28 +0300, Stanislav Lisovskiy wrote:
> Currently we just clamp that value to the highest supported one, however =
that
> means, we are not able to fit this into our available bandwidth range, so=
 we
> might see glitches or FIFO underruns.
> While choosing less compressed bpp than min bpp required to handle the mo=
de is
> harmless and might even save some bandwidth, choosing higher compressed b=
pp than
> min bpp required to handle the required mode config, can cause issues.
> So in that case lets just conclude that even with DSC, we are not able to=
 comply
> with bandwidth requirements and fail.
>=20
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 9f40da20e88d..8696a1f02805 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -713,8 +713,17 @@ u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_p=
rivate *i915, u32 bpp, u32 p
> =20
>  		/*
>  		 * According to BSpec, 27 is the max DSC output bpp,
> -		 * 8 is the min DSC output bpp
> +		 * 8 is the min DSC output bpp.
> +		 * While we can still clamp higher bpp values to 27, saving bandwidth,
> +		 * if it is required to oompress up to bpp < 8, means we can't do

Small typo, "compress".


> +		 * that and probably means we can't fit the required mode, even with
> +		 * DSC enabled.
>  		 */
> +		if (bits_per_pixel < 8) {
> +			drm_dbg_kms(&i915->drm, "Unsupported BPP %u, min 8\n",
> +				    bits_per_pixel);
> +			return 0;
> +		}
>  		bits_per_pixel =3D clamp_t(u32, bits_per_pixel, 8, 27);

I guess you don't need to clamp anymore but could use min_t(u32,
bits_per_pixel, 27) now, right? Actually, you don't even need to type
it, so min(bits_per_pixel, 27) should suffice.


>  	} else {
>  		/* Find the nearest match in the array of known BPPs from VESA */

--
Cheers,
Luca.
