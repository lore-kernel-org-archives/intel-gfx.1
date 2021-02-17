Return-Path: <SRS0=t69m=HT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFC6C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 10:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 222E964E24
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 10:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 222E964E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E296E4C4;
	Wed, 17 Feb 2021 10:36:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6836E4C4
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Feb 2021 10:36:15 +0000 (UTC)
IronPort-SDR: NlehFDBd+n5InQb+/dHtKshabwr9wo6d/rxoM2SbzP3vaHc8yA1RUxQ4X1ovyg+NxtqTMsM9cA
 v/ANJ8Ei5CfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162293842"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="162293842"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 02:36:14 -0800
IronPort-SDR: 2INRq4SZoquCpQPJ/wAOYvMsyb3qqFZbhwfbVHrNoCkU8y3YFlmzSDGf4csCIcZZXOtg/p3eXe
 o+GWd4WnNCfQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399907213"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 02:36:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210216181925.650082-1-tomas.winkler@intel.com>
Date: Wed, 17 Feb 2021 12:36:07 +0200
Message-ID: <87k0r7asmg.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [RFC PATCH 0/9] drm/i915/spi: discrete graphics
 internal spi
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
Cc: linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
> Intel discrete graphic devices have internal spi storage, that holds
> firmware and oprom images. The spi device is exposed to the user space
> via mtd framework to be accessed during manufacturing.
> The device is hardware locked after manufacturing and only read access
> is provided.
>
> The i915 plays role of a multi function device (mfd) and spi device
> is exposed as its child device. i915_spi platform driver binds to 
> this device.

What's the plan wrt i915/spi maintainership?

BR,
Jani.

>
> Because the graphic card may undergo reset at any time and basically hot
> unplug all its child devices, this series also provides a fix to the mtd
> framework to make the reset graceful.
>
> Tomas Winkler (9):
>   drm/i915/spi: add spi device for discrete graphics
>   drm/i915/spi: intel_spi_region map
>   drm/i915/spi: add driver for on-die spi device
>   drm/i915/spi: implement region enumeration
>   drm/i915/spi: implement spi access functions
>   drm/i915/spi: spi register with mtd
>   drm/i915/spi: mtd: implement access handlers
>   drm/i915/spi: serialize spi access
>   mtd: use refcount to prevent corruption
>
>  drivers/gpu/drm/i915/Kconfig             |   3 +
>  drivers/gpu/drm/i915/Makefile            |   6 +
>  drivers/gpu/drm/i915/i915_drv.c          |   9 +
>  drivers/gpu/drm/i915/i915_drv.h          |   4 +
>  drivers/gpu/drm/i915/i915_reg.h          |   1 +
>  drivers/gpu/drm/i915/spi/intel_spi.c     |  62 +++
>  drivers/gpu/drm/i915/spi/intel_spi.h     |  24 +
>  drivers/gpu/drm/i915/spi/intel_spi_drv.c | 675 +++++++++++++++++++++++
>  drivers/mtd/mtdcore.c                    |  63 ++-
>  drivers/mtd/mtdcore.h                    |   1 +
>  drivers/mtd/mtdpart.c                    |  13 +-
>  include/linux/mtd/mtd.h                  |   2 +-
>  12 files changed, 831 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
>  create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h
>  create mode 100644 drivers/gpu/drm/i915/spi/intel_spi_drv.c

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
