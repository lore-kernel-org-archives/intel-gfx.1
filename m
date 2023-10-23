Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F01ECDB474
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Oct 2023 13:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE8310E0A3;
	Mon, 23 Oct 2023 13:57:47 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBC910E0A3
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Oct 2023 13:57:45 +0000 (UTC)
Received: from 91-155-254-243.elisa-laajakaista.fi ([91.155.254.243]
 helo=pinhengc-mobl2.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1quvR8-000000008bs-1eU6; Mon, 23 Oct 2023 16:57:42 +0300
Message-ID: <0028e7315ced4bef8e98926f61f2d5fc2ef2ea75.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jouni =?ISO-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Mon, 23 Oct 2023 16:57:41 +0300
In-Reply-To: <20231016111658.3432581-21-jouni.hogander@intel.com>
References: <20231016111658.3432581-1-jouni.hogander@intel.com>
 <20231016111658.3432581-21-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 20/24] drm/i915/display: Use device
 parameters instead of module in I915_STATE_WARN
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

On Mon, 2023-10-16 at 14:16 +0300, Jouni H=C3=B6gander wrote:
> Also make module parameter as non writable.
>=20
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.h | 2 +-
>  drivers/gpu/drm/i915/i915_params.c           | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/d=
rm/i915/display/intel_display.h
> index 0e5dffe8f018..ba3548f9768d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -552,7 +552,7 @@ bool assert_port_valid(struct drm_i915_private *i915,=
 enum port port);
>  	struct drm_device *drm =3D &(__i915)->drm;			\
>  	int __ret_warn_on =3D !!(condition);				\
>  	if (unlikely(__ret_warn_on))					\
> -		if (!drm_WARN(drm, i915_modparams.verbose_state_checks, format)) \
> +		if (!drm_WARN(drm, __i915->params.verbose_state_checks, format)) \
>  			drm_err(drm, format);				\
>  	unlikely(__ret_warn_on);					\
>  })
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i9=
15_params.c
> index 3205c6b62670..4e8c088c69fd 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -93,8 +93,7 @@ i915_param_named(mmio_debug, int, 0400,
>  	"Enable the MMIO debug code for the first N failures (default: off). "
>  	"This may negatively affect performance.");
> =20
> -/* Special case writable file */
> -i915_param_named(verbose_state_checks, bool, 0600,
> +i915_param_named(verbose_state_checks, bool, 0400,
>  	"Enable verbose logs (ie. WARN_ON()) in case of unexpected hw state con=
ditions.");
> =20
>  i915_param_named_unsafe(nuclear_pageflip, bool, 0400,

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
