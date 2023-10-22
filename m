Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12327CDB474
	for <intel-gfx@archiver.kernel.org>; Sun, 22 Oct 2023 18:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C69B10E0EF;
	Sun, 22 Oct 2023 18:16:38 +0000 (UTC)
X-Greylist: delayed 1889 seconds by postgrey-1.36 at gabe;
 Sun, 22 Oct 2023 18:16:35 UTC
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BF310E0EF
 for <intel-gfx@lists.freedesktop.org>; Sun, 22 Oct 2023 18:16:35 +0000 (UTC)
Received: from 91-155-254-243.elisa-laajakaista.fi ([91.155.254.243]
 helo=hazy.lan)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1qucVa-000000007pa-2aHd; Sun, 22 Oct 2023 20:45:04 +0300
Message-ID: <61677b04c028f3aa1773abce175a07106d8255fa.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jouni =?ISO-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Sun, 22 Oct 2023 20:45:01 +0300
In-Reply-To: <20231016111658.3432581-2-jouni.hogander@intel.com>
References: <20231016111658.3432581-1-jouni.hogander@intel.com>
 <20231016111658.3432581-2-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 01/24] drm/i915/display: Add framework to
 add parameters specific to display
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
> Currently all module parameters are handled by i915_param.c/h. This
> is a problem for display parameters when Xe driver is used. Add
> a mechanism to add parameters specific to the display. This is mainly
> copied from i915_[debugfs]_params.[ch]. Parameters are not yet moved. Thi=
s
> is done by subsequent patches.
>=20
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---

Looks generally good, but I have a couple of comments:

[...]
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs_params.h =
b/drivers/gpu/drm/i915/display/intel_display_debugfs_params.h
> new file mode 100644
> index 000000000000..0e33f4e90ddc
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs_params.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_DISPLAY_DEBUGFS_PARAMS__
> +#define __INTEL_DISPLAY_DEBUGFS_PARAMS__
> +
> +struct dentry;

It doesn't seem like you need dentry here...


> +struct drm_i915_private;
> +
> +void intel_display_debugfs_params(struct drm_i915_private *i915);
> +
> +#endif /* __INTEL_DISPLAY_DEBUGFS_PARAMS__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/driver=
s/gpu/drm/i915/display/intel_display_device.c
> index 2b1ec23ba9c3..e80842d1e7c7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -12,6 +12,7 @@
>  #include "intel_de.h"
>  #include "intel_display.h"
>  #include "intel_display_device.h"
> +#include "intel_display_params.h"
>  #include "intel_display_power.h"
>  #include "intel_display_reg_defs.h"
>  #include "intel_fbc.h"
> @@ -937,6 +938,13 @@ void intel_display_device_probe(struct drm_i915_priv=
ate *i915)
>  		DISPLAY_RUNTIME_INFO(i915)->ip.rel =3D rel;
>  		DISPLAY_RUNTIME_INFO(i915)->ip.step =3D step;
>  	}
> +
> +	intel_display_params_copy(&i915->display.params);
> +}
> +
> +void intel_display_device_remove(struct drm_i915_private *i915)
> +{
> +	intel_display_params_free(&i915->display.params);
>  }
>=20

Why can't you just store the parameters as module globals? They are
always associated with the module anyway.  Then you don't need to worry
about the lifetime.


[...]
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/driver=
s/gpu/drm/i915/display/intel_display_params.h
> new file mode 100644
> index 000000000000..1b347365988c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef _INTEL_DISPLAY_PARAMS_H_
> +#define _INTEL_DISPLAY_PARAMS_H_
> +
> +struct drm_printer;
> +
> +/*
> + * Invoke param, a function-like macro, for each intel display param, wi=
th
> + * arguments:
> + *
> + * param(type, name, value, mode)
> + *
> + * type: parameter type, one of {bool, int, unsigned int, unsigned long,=
 char *}
> + * name: name of the parameter
> + * value: initial/default value of the parameter
> + * mode: debugfs file permissions, one of {0400, 0600, 0}, use 0 to not =
create
> + *       debugfs file
> + */
> +#define INTEL_DISPLAY_PARAMS_FOR_EACH(param)

I don't get this.  Here you create a macro that expands to nothing...

> +
> +#define MEMBER(T, member, ...) T member;
> +struct intel_display_params {
> +	INTEL_DISPLAY_PARAMS_FOR_EACH(MEMBER);

...so doesn't this become empty in the end?

[...]

--
Cheers,
Luca.
