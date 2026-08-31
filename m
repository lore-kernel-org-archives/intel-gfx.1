Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A571AC624A4
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 14:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C3E10E6D9;
	Mon, 31 Aug 2026 14:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAum9NZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42F910E6D9
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 14:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788184940; x=1819720940;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3Lnaa8A5vb4eH76fct7//P/o8V+CF5ZV/Hy+TEirOg0=;
 b=RAum9NZVIL0/NL/iUq3Z982KXRyZcbNli1cuTAbKvXYRet68cUyeP9Lz
 jVgBHIfKFD9q6F9/N5zvYRYupBjKJiClwUgWBpnnJPNKtUlxclmka4wBH
 LEyPrf6DX4Gp6ocJ8lWo17+LS38ZGcAyZ7UiW44RTDC0LacFh9OcUCS/l
 FAsiaIXslXN+lKGj7Ev02I1hukrueqPPNjrqchbTX/9/t0Nebzb/TuezR
 FsexSq664Mo4T5WpbUWct4pKQiq3z8uuWOH3oIGK6doVRGxq2wMsZCGov
 FCllH7hNJT9z2842XBBY6qaVxSkp9CHkyXQwIky+YEJbcT13ZvtXwtdcH A==;
X-CSE-ConnectionGUID: k4lQJ90sSU6Frd5glcx0pw==
X-CSE-MsgGUID: TEqlC6Q8QEq3eof5t9XqlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="111365335"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="111365335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:02:20 -0700
X-CSE-ConnectionGUID: Cq5Z15U1Q7u1r9oWKKYw/w==
X-CSE-MsgGUID: OmImv8H7T8CFKJz5YM2j2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="267003221"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:02:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Naladala Ramanaidu
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH v1 2/2] drm/i915/hdmi: Read EDID over GPIO when the
 debugfs flag is set
In-Reply-To: <20260826152444.2822821-3-ramanaidu.naladala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260826152444.2822821-1-ramanaidu.naladala@intel.com>
 <20260826152444.2822821-3-ramanaidu.naladala@intel.com>
Date: Mon, 31 Aug 2026 17:02:14 +0300
Message-ID: <9166040c46d8ec390662b19c9b4268311dc05896@intel.com>
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

On Wed, 26 Aug 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
> Normally the EDID is read over GMBUS, and GPIO bit-banging is only used
> if that read fails. Now the debugfs flag is checked first. If it is set,
> the DDC adapter is put in bit-banging mode before the read and put back
> after it.
>
> The flag is read once with READ_ONCE(), so the enable and the restore
> always match even if the flag changes at the same time. The GMBUS retry
> is not needed in this case, because the read already used GPIO.

This should just be folded to one patch that actually does something
with the debugfs.

>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 38915f19d3e5..462ccfc840d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2555,13 +2555,23 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
>  	struct i2c_adapter *ddc = connector->base.ddc;
>  	struct ref_tracker *wakeref;
>  	const struct drm_edid *drm_edid;
> +	bool force_bit_banging = READ_ONCE(intel_hdmi->force_bit_banging);
>  	bool connected = false;
>  
>  	wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
>  
> +	if (force_bit_banging) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] HDMI EDID read forced to GPIO bit-banging\n",
> +			    connector->base.base.id, connector->base.name);
> +		intel_gmbus_force_bit(ddc, true);
> +	}
> +

Okay, now that I see the implementation... why is any of this HDMI
specific? You could make it independent of the connector type. There are
other connectors that use intel_gmbus_force_bit().

And you could just call intel_gmbus_force_bit() directly from the
debugfs handler. It already supports nesting with a count. You don't
have to modify any of this code, at all. The debug logging is there in
intel_gmbus_force_bit(). Everything is taken care of.

BR,
Jani.


>  	drm_edid = drm_edid_read_ddc(&connector->base, ddc);
>  
> -	if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
> +	if (force_bit_banging)
> +		intel_gmbus_force_bit(ddc, false);
> +	else if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>  		drm_dbg_kms(display->drm,
>  			    "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
>  		intel_gmbus_force_bit(ddc, true);

-- 
Jani Nikula, Intel
