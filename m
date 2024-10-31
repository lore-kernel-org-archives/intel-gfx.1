Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04824E68974
	for <intel-gfx@archiver.kernel.org>; Thu, 31 Oct 2024 10:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9AD10E85D;
	Thu, 31 Oct 2024 10:56:18 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33FB10E85D
 for <intel-gfx@lists.freedesktop.org>; Thu, 31 Oct 2024 10:56:17 +0000 (UTC)
Received: from 91-155-254-140.elisa-laajakaista.fi ([91.155.254.140]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t6Sqe-00000001BIH-2SMj; Thu, 31 Oct 2024 12:56:16 +0200
Message-ID: <a26cf220d39a9898a8856c042e5c70542bc41be1.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Thu, 31 Oct 2024 12:56:15 +0200
In-Reply-To: <20241030192313.4030617-6-imre.deak@intel.com>
References: <20241030192313.4030617-1-imre.deak@intel.com>
 <20241030192313.4030617-6-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/5] drm/i915/adlp+/dp_mst: Align master transcoder
 disabling with spec wrt. DP2 config
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

On Wed, 2024-10-30 at 21:23 +0200, Imre Deak wrote:
> On ADLP+ during modeset disabling, disable the DP2 configuration for MST
> master transcoders as required by the specification.
>=20
> Bspec: 55424, 54128, 65448, 68849

Just curious how this change is related to so many bspecs...?


> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index d82bc1bf8b68f..6adbc7d0b90d9 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3062,6 +3062,8 @@ static void intel_ddi_post_disable_dp(struct intel_=
atomic_state *state,
> =20
>  	intel_dp_sink_set_fec_ready(intel_dp, old_crtc_state, false);
> =20
> +	intel_ddi_config_transcoder_dp2(old_crtc_state, false);
> +
>  	/*
>  	 * From TGL spec: "If single stream or multi-stream master transcoder:
>  	 * Configure Transcoder Clock select to direct no clock to the

Regardless:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
