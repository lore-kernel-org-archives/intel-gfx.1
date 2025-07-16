Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78184C83F1B
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Jul 2025 05:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB4610E251;
	Wed, 16 Jul 2025 05:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NQNIePjk";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FD210E251
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Jul 2025 05:11:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38C4B4570E;
 Wed, 16 Jul 2025 05:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88DFC4CEF0;
 Wed, 16 Jul 2025 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1752642661;
 bh=EYmnTGKvWT8Uoww3+lr/cpfCl/laJO6m6Fud+dY+KIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQNIePjkCitiM3kzzpanxGDjSUtkICO233c8f+R7ABFdpE0znLdeW2nhFALlTZnKZ
 uA69ccOcFUvD/a1jIVSM/Mkh/M5Ek86/fKYPrgmdxXi4HEp0znbGIWFwTz5TElO4In
 1qNQepU6fdfouWart3HxM0Z0c/sAbRaHLB5cU4TM=
Date: Wed, 16 Jul 2025 07:10:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: Re: [PATCH 1/2] mei: me: Add exported function to check ME device
 availabiliy
Message-ID: <2025071622-frequency-sneer-0ad9@gregkh>
References: <20250715225959.488109-4-daniele.ceraolospurio@intel.com>
 <20250715225959.488109-5-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715225959.488109-5-daniele.ceraolospurio@intel.com>
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

On Tue, Jul 15, 2025 at 04:00:01PM -0700, Daniele Ceraolo Spurio wrote:
> The intel GFX drivers (i915/xe) interface with the ME device for some of
> their features (e.g. PXP, HDCP) via the component interface. Given that
> the MEI device can be hidden by BIOS/Coreboot, the GFX drivers need a
> way to check if the device is available before attempting to bind the
> component, otherwise they'll go ahead and initialize features that will
> never work.
> The simplest way to check if the device is available is to check the
> available devices against the PCI ID list of the mei_me driver. To avoid
> duplication of the list, the function to do such a check is added to
> the mei_me driver and exported so that the GFX driver can call it
> directly.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/misc/mei/pci-me.c | 17 +++++++++++++++++
>  include/linux/mei_me.h    | 20 ++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 include/linux/mei_me.h
> 
> diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
> index 3f9c60b579ae..16e9a11eb286 100644
> --- a/drivers/misc/mei/pci-me.c
> +++ b/drivers/misc/mei/pci-me.c
> @@ -18,6 +18,7 @@
>  #include <linux/pm_runtime.h>
>  
>  #include <linux/mei.h>
> +#include <linux/mei_me.h>
>  
>  #include "mei_dev.h"
>  #include "client.h"
> @@ -133,6 +134,22 @@ static const struct pci_device_id mei_me_pci_tbl[] = {
>  
>  MODULE_DEVICE_TABLE(pci, mei_me_pci_tbl);
>  
> +/**
> + * mei_me_device_present - check if an ME device is present on the system
> + *
> + * Other drivers (e.g., i915, xe) interface with the ME device for some of their
> + * features (e.g., PXP, HDCP). However, the ME device can be hidden by
> + * BIOS/coreboot, so this function offers a way for those drivers to check if
> + * the device is available before attempting to interface with it.
> + *
> + * Return: true if an ME device is available, false otherwise
> + */
> +bool mei_me_device_present(void)
> +{
> +	return pci_dev_present(mei_me_pci_tbl);

And what happens if the device goes away right after you call this?

> +}
> +EXPORT_SYMBOL(mei_me_device_present);

EXPORT_SYMBOL_GPL()?  I have to ask, sorry.

And where is patch 2/2?

thanks,

greg k-h
