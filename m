Return-Path: <SRS0=lJ7G=P5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FED3C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 10:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F33CC61027
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 10:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F33CC61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB586E904;
	Wed, 10 Nov 2021 10:45:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E0A6E904
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Nov 2021 10:45:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="318847320"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="318847320"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:45:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="503918065"
Received: from rahuldut-mobl.amr.corp.intel.com (HELO localhost)
 ([10.249.33.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:45:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: William Tseng <william.tseng@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20211110010217.26759-1-william.tseng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211109082458.13740-1-william.tseng@intel.com>
 <20211110010217.26759-1-william.tseng@intel.com>
Date: Wed, 10 Nov 2021 12:44:58 +0200
Message-ID: <87r1bo47dh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/dsi: transmit brightness
 command in HS state
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
Cc: William Tseng <william.tseng@intel.com>,
 Cooper Chiou <cooper.chiou@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021, William Tseng <william.tseng@intel.com> wrote:
> In Video Mode, if DSI transcoder is set to transmit packets
> in LP Escape mode, screen flickering would be obseved when
> brightness commands are continuously and quickly transmitted
> to a panel.
>
> The problem may be resolved by changing the mode to transmit
> packets from Low Power to HS.
>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Cc: Cooper Chiou <cooper.chiou@intel.com>
> Signed-off-by: William Tseng <william.tseng@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
> index f61ed82e8867..7d234429e71e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
> @@ -71,6 +71,7 @@ static void dcs_set_backlight(const struct drm_connector_state *conn_state, u32
>  	u8 data[2] = {};
>  	enum port port;
>  	size_t len = panel->backlight.max > U8_MAX ? 2 : 1;
> +	unsigned long mode_flags;
>  
>  	if (len == 1) {
>  		data[0] = level;
> @@ -81,8 +82,11 @@ static void dcs_set_backlight(const struct drm_connector_state *conn_state, u32
>  
>  	for_each_dsi_port(port, intel_dsi->dcs_backlight_ports) {
>  		dsi_device = intel_dsi->dsi_hosts[port]->device;
> +		mode_flags = dsi_device->mode_flags;
> +		dsi_device->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  		mipi_dsi_dcs_write(dsi_device, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
>  				   &data, len);
> +		dsi_device->mode_flags = mode_flags;

I realize we don't really have a clear picture how to manage
->mode_flags or MIPI_DSI_MODE_LPM in particular, but this seems like the
safest option for now.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

I'll push once CI results are in; had to request a re-run.



>  	}
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
