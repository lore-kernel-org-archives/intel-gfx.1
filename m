Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7798CA600C
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2026 11:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC9B10E7D9;
	Thu,  8 Oct 2026 11:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIfQzzNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA3210E7D9
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Oct 2026 11:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791460159; x=1822996159;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=4l8WNwM3FkRIrQcTvMLqh3nZzoCLcvv2ZbfNeZfwcEA=;
 b=KIfQzzNfZ1VNmZiATAJ217iJkzO/xWGA/aAjDnY1cDlXxjTDu7E4p2br
 qG54uIeUtJUipLVEX2O3AycwydeXpzxPnJkS9Kg385I4z1us6XVlJ/V5o
 Ao+5czaxUTw3Mc0q/37//6eI9SsQVcgEamAvpIL3cicPrXv01fwJRrUe0
 /5x/e8E7QSDG0EnUbtjQFltw7x0hR6W8rF2NWpDa2tK9WPy1zynicJkyx
 hr4EpMD0WaJbh/uvCV8l79b0iKyWyDTX6BFzXXWp4Fg9ikwj0bgKHzf+w
 lPARGb0Hc7gsgLhjwVNX7Ea6QDOveft8m44r2N7+IjBPjm0gWWUdt2lUE A==;
X-CSE-ConnectionGUID: DFvB4QufS6uGfO8joegCJQ==
X-CSE-MsgGUID: HCBSNPYnRLiXt6qxP5TFXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="249214"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="249214"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 04:49:18 -0700
X-CSE-ConnectionGUID: UR6grtPYQXCOILvmZIk+1w==
X-CSE-MsgGUID: 2FubQe1HTCe69q/jNIZ7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="352996"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 04:49:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "jp_2422-git@yahoo.com" <jp_2422-git@yahoo.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: adlp_tc_phy_connect [i915] floods logs with
 drm_WARN_ON(tc->mode == TC_PORT_LEGACY) call traces
In-Reply-To: <348041964.128703.1791459745347@mail.yahoo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <348041964.128703.1791459745347.ref@mail.yahoo.com>
 <348041964.128703.1791459745347@mail.yahoo.com>
Date: Thu, 08 Oct 2026 14:49:15 +0300
Message-ID: <fd77de823c5d30b4587676a7a71962f517979616@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 08 Oct 2026, "jp_2422-git@yahoo.com" <jp_2422-git@yahoo.com> wrote:
> The issue discussed at https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/12246 affects a number of laptops and Bios combinations, and appears to be the result of buggy Bios'es where the Intel VBT table is listing non-existent Display Ports on Alder Lake laptops.
>
> The following patch skips the creation of the non-existent port early
> on in intel_ddi_init(), so preventing the logs from being flooded with
> the warnings. It uses a new i915 display parameter to allow the user
> to select the type c port to skip with a boot option, and fixes the
> problem. Please can you advise whether you would accept this patch.

Thanks for the patch, but sorry, module parameters aren't the solution
to work around issues.

BR,
Jani.

>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index a46ab5d3d..5b9ebdecd 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -50,6 +50,7 @@
> #include "intel_ddi_buf_trans.h"
> #include "intel_de.h"
> #include "intel_dip.h"
> +#include "intel_display_params.h"
> #include "intel_display_power.h"
> #include "intel_display_regs.h"
> #include "intel_display_types.h"
> @@ -5239,6 +5240,24 @@ static const char *intel_ddi_encoder_name(struct intel_display *display,
> return seq_buf_str(s);
> }
>
> +static enum port get_skip_tc_port_param(struct intel_display *display)
> +{
> + const char *param;
> + enum port port;
> +
> + param=display->params.skip_tc_port;
> +
> + if(param==NULL)
> + return PORT_NONE;
> +
> + for_each_port(port) {
> + if (port_name(port)==*param)
> + return port;
> + }
> +
> + return PORT_NONE;
> +}
> +
> void intel_ddi_init(struct intel_display *display,
> const struct intel_bios_encoder_data *devdata)
> {
> @@ -5249,11 +5268,20 @@ void intel_ddi_init(struct intel_display *display,
> enum port port;
> enum phy phy;
> u32 ddi_buf_ctl;
> + enum port skip_tc_port_param;
>
> port = intel_bios_encoder_port(devdata);
> if (port == PORT_NONE)
> return;
>
> + skip_tc_port_param=get_skip_tc_port_param(display);
> +
> + if(port == skip_tc_port_param) {
> + drm_dbg_kms(display->drm,
> + "Skipping creation of Port %c due to the skip_tc_port parameter\n", port_name(port));
> + return;
> + }
> +
> if (!port_strap_detected(display, port)) {
> drm_dbg_kms(display->drm,
> "Port %c strap not detected\n", port_name(port));
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
> index ca0ef466b..2f516ca4e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -143,6 +143,10 @@ intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
> "(-1=use per-chip default, 0=disabled, 1=enabled, 2=match any register, 3=always locked) "
> "Default: -1");
>
> +intel_display_param_named_unsafe(skip_tc_port, charp, 0400,
> + "Skip the use of the specified Type-C port "
> + " (single letter in the range [A - I])");
> +
> __maybe_unused
> static void _param_print_bool(struct drm_printer *p, const char *driver_name,
> const char *name, bool val)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
> index 5c5a1a135..6356438f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -51,6 +51,7 @@ struct drm_printer;
> param(bool, psr_safest_params, false, 0400) \
> param(bool, enable_psr2_sel_fetch, true, 0400) \
> param(int, enable_dmc_wl, -1, 0400) \
> + param(char *, skip_tc_port, NULL, 0400) \
> /*
> * Debugfs-only knob (per-device): no matching module_param is registered
> * in intel_display_params.c on purpose. Runtime-toggle via debugfs.
>
>
>
>
>
>
>
>
>
>

-- 
Jani Nikula, Intel
