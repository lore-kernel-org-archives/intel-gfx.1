Return-Path: <SRS0=1UtA=IB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A409BC433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Mar 2021 19:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467A964EBA
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Mar 2021 19:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 467A964EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98086E9C1;
	Wed,  3 Mar 2021 19:51:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4876E9C1
 for <intel-gfx@lists.freedesktop.org>; Wed,  3 Mar 2021 19:51:30 +0000 (UTC)
IronPort-SDR: VvggncHEOZGKiBI9yELxXB7HIYL3zMI5MW8eB3RouejE+xDuRZzIfbCsEUnJsjYY9SYXJVDsOf
 mbGNUetCXobQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="174906823"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; d="scan'208";a="174906823"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:51:23 -0800
IronPort-SDR: O+16lU7512S6LH9HUaC+J1222xrNcyOUuDUoK6aG9cMKOQkk7niLMG1ubpUdJAz2g1T6nBspvP
 LEi8JOfBgAqQ==
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; d="scan'208";a="435330891"
Received: from aginocch-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.198.113])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:51:20 -0800
Date: Wed, 3 Mar 2021 14:51:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <YD/oviNOSta1Q584@intel.com>
References: <20210301193200.1369-1-daniele.ceraolospurio@intel.com>
 <20210301193200.1369-2-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301193200.1369-2-daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 01/16] drm/i915/pxp: Define PXP component
 interface
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

On Mon, Mar 01, 2021 at 11:31:45AM -0800, Daniele Ceraolo Spurio wrote:
> This will be used for communication between the i915 driver and the mei
> one. Defining it in a stand-alone patch to avoid circualr dependedencies
> between the patches modifying the 2 drivers.
> =

> Split out from an original patch from  Huang, Sean Z
> =

> v2: rename the component struct (Rodrigo)
> =

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/drm/i915_component.h         |  1 +
>  include/drm/i915_pxp_tee_interface.h | 45 ++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 include/drm/i915_pxp_tee_interface.h
> =

> diff --git a/include/drm/i915_component.h b/include/drm/i915_component.h
> index 55c3b123581b..c1e2a43d2d1e 100644
> --- a/include/drm/i915_component.h
> +++ b/include/drm/i915_component.h
> @@ -29,6 +29,7 @@
>  enum i915_component_type {
>  	I915_COMPONENT_AUDIO =3D 1,
>  	I915_COMPONENT_HDCP,
> +	I915_COMPONENT_PXP
>  };
>  =

>  /* MAX_PORT is the number of port
> diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_=
tee_interface.h
> new file mode 100644
> index 000000000000..09b8389152af
> --- /dev/null
> +++ b/include/drm/i915_pxp_tee_interface.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Authors:
> + * Vitaly Lubart <vitaly.lubart@intel.com>
> + */
> +
> +#ifndef _I915_PXP_TEE_INTERFACE_H_
> +#define _I915_PXP_TEE_INTERFACE_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/device.h>
> +
> +/**
> + * struct i915_pxp_component_ops - ops for PXP services.
> + * @owner: Module providing the ops
> + * @send: sends data to PXP
> + * @receive: receives data from PXP
> + */
> +struct i915_pxp_component_ops {
> +	/**
> +	 * @owner: owner of the module provding the ops
> +	 */
> +	struct module *owner;
> +
> +	int (*send)(struct device *dev, const void *message, size_t size);
> +	int (*recv)(struct device *dev, void *buffer, size_t size);
> +};
> +
> +/**
> + * struct i915_pxp_component - Used for communication between i915 and T=
EE
> + * drivers for the PXP services
> + * @tee_dev: device that provide the PXP service from TEE Bus.
> + * @pxp_ops: Ops implemented by TEE driver, used by i915 driver.
> + */
> +struct i915_pxp_component {
> +	struct device *tee_dev;
> +	const struct i915_pxp_component_ops *ops;
> +
> +	/* To protect the above members. */
> +	struct mutex mutex;
> +};
> +
> +#endif /* _I915_TEE_PXP_INTERFACE_H_ */
> -- =

> 2.29.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
