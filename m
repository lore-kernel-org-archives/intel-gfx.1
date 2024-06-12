Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4A9C27C53
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Jun 2024 13:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE6E10E0F7;
	Wed, 12 Jun 2024 13:35:44 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929C110E0F7
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Jun 2024 13:35:41 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sHO8Y-00000001aUd-1T3Q; Wed, 12 Jun 2024 16:35:38 +0300
Message-ID: <8714585171d2fe7b8df27971486f44747fc94786.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 12 Jun 2024 16:35:36 +0300
In-Reply-To: <20240611153351.3013235-1-imre.deak@intel.com>
References: <20240611153351.3013235-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH] drm/i915/dp_mst: Fix DSC input BPP computation
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

Hi Imre,

On Tue, 2024-06-11 at 18:33 +0300, Imre Deak wrote:
> The branch or sink device decompressing a stream may have a limitation
> on the input/uncompressed BPP, which is lower than the base line BPP
> (determined by the sink's EDID). In some cases a stream with an input
> BPP higher than this limit will be converted automatically by the device
> decompressing the stream, by truncating the BPP, however in some cases
> - seen at least in Dell dock's DP->HDMI converters - the decompression
> will fail.
>=20
> Fix the above by limiting the input BPP correctly. This is done already
> correctly for SST outputs.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 00fdcbc28e9b7..15c20bedea091 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -349,6 +349,8 @@ static int intel_dp_dsc_mst_compute_link_config(struc=
t intel_encoder *encoder,
>  	if (max_bpp > sink_max_bpp)
>  		max_bpp =3D sink_max_bpp;
> =20
> +	crtc_state->pipe_bpp =3D max_bpp;
> +
>  	max_compressed_bpp =3D intel_dp_dsc_sink_max_compressed_bpp(connector,
>  								  crtc_state,
>  								  max_bpp / 3);

Wouldn't it be better to make the assignment in
intel_dp_dsc_sink_max_compressed_bpp(), since that function is already
making modifications to crtc_state? There is another caller, but I
think it may benefit from the same check.

But this is just a nitpick.  Either way, you have:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
