Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C7C624A4
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 13:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188A410E8DF;
	Mon, 31 Aug 2026 13:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQ3fQwKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5AB10E8DF
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788184158; x=1819720158;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YuXBHzLS783YlaUL/UF6Ahmt3a8uGIOK+ssIPgeN8xU=;
 b=KQ3fQwKpFytb3Hla4AK0kNnemCYj8jnhS01uHqnSNeYbNKqHq3hPQdCX
 1WXAf3UJqzy7MgDoHJGfZ8a8bT+CyraNy2o9tPzmqI1D6qN5FjSS3iKHZ
 Q5v0SLisizBJiM5VhQW+KbrtQuaxi7wHe7A2RD/Cykl0SB0vaNGOvp7EJ
 ePCv5MkulyRXjorbV+RrndibwnPNROwsQ3v3NIAjxAFOA43OOWXGK3wXp
 MoKRNVASLpeTeKvqKaBp5CYUKaixjqJeyR3/djVg6NVzaZ2a1gjykdb1Y
 eXrf8d8/26kfJS4nTmXlk48m25LorQnLLAeGE5Ap5JddwefaL1wQ255nz w==;
X-CSE-ConnectionGUID: n9mN4Lp/QJGa06cC8/ISJQ==
X-CSE-MsgGUID: ENoDuvZjQa+gkY5BGeR63w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99192984"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="99192984"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 06:49:17 -0700
X-CSE-ConnectionGUID: f/MfKr/ARyyjuZKYGuvq4w==
X-CSE-MsgGUID: z7jfFmy7RhW+xq3tWDLumg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="272600402"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 06:49:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Naladala Ramanaidu
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH v1 1/2] drm/i915/hdmi: Add debugfs support to force EDID
 reads over GPIO
In-Reply-To: <20260826152444.2822821-2-ramanaidu.naladala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260826152444.2822821-1-ramanaidu.naladala@intel.com>
 <20260826152444.2822821-2-ramanaidu.naladala@intel.com>
Date: Mon, 31 Aug 2026 16:49:12 +0300
Message-ID: <e00778c3952491affb0a5e41f585122df5258acb@intel.com>
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
> Add an i915_hdmi_force_bit_banging debugfs control for HDMI
> connectors to allow EDID reads to be forced over GPIO bit-banging.

The primary question the commit message *must* answer is *why*.

It takes me under a minute to look at the patch and deduce the *what*,
and even that does not match the commit message. There is no support for
actually forcing anything here, it's just the non-functional debugfs
being added.

I still have no clue why.

>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  .../drm/i915/display/intel_display_debugfs.c  |  1 +
>  .../drm/i915/display/intel_display_types.h    |  3 ++
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 51 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_hdmi.h     |  2 +
>  4 files changed, 57 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 3e302f23f247..c991f224b4be 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -1335,6 +1335,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
>  	intel_dp_link_training_debugfs_add(connector);
>  	intel_dp_link_caps_debugfs_add(connector);
>  	intel_link_bw_connector_debugfs_add(connector);
> +	intel_hdmi_connector_debugfs_add(connector);
>  
>  	if (DISPLAY_VER(display) >= 11 &&
>  	    ((connector_type == DRM_MODE_CONNECTOR_DisplayPort && !connector->mst.dp) ||
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 20a07ea06b5e..58983e31c5ef 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1689,6 +1689,9 @@ struct intel_hdmi {
>  	} dp_dual_mode;
>  	struct intel_connector *attached_connector;
>  	struct cec_notifier *cec_notifier;
> +
> +	/* Debugfs knob to force EDID reads over GPIO bit-banging. */

Is that comment helpful?

> +	bool force_bit_banging;
>  };
>  
>  struct intel_dp_mst_encoder;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 9b637e38a1a5..38915f19d3e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -26,6 +26,7 @@
>   *	Jesse Barnes <jesse.barnes@intel.com>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/hdmi.h>
>  #include <linux/i2c.h>
> @@ -3112,6 +3113,56 @@ void intel_infoframe_init(struct intel_digital_port *dig_port)
>  	}
>  }
>  
> +static int i915_hdmi_force_bit_banging_show(void *data, u64 *val)

Please don't use i915_ naming.

> +{
> +	struct intel_connector *connector = to_intel_connector(data);
> +
> +	*val = READ_ONCE(intel_attached_hdmi(connector)->force_bit_banging);
> +
> +	return 0;
> +}
> +
> +static int i915_hdmi_force_bit_banging_write(void *data, u64 val)
> +{
> +	struct intel_connector *connector = to_intel_connector(data);
> +	struct intel_display *display = to_intel_display(connector);
> +	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(connector);
> +
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	drm_dbg_kms(display->drm,
> +		    "[CONNECTOR:%d:%s] %sabling forced GPIO bit-banging for EDID reads\n",
> +		    connector->base.base.id, connector->base.name,
> +		    val ? "en" : "dis");

I see this cute "%sabling" and val ? "en" : "dis" but it's just too
clever for its own good. str_enable_disable() is close enough.

> +
> +	WRITE_ONCE(intel_hdmi->force_bit_banging, val);
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(i915_hdmi_force_bit_banging_fops,
> +			 i915_hdmi_force_bit_banging_show,
> +			 i915_hdmi_force_bit_banging_write, "%llu\n");
> +
> +/**
> + * intel_hdmi_connector_debugfs_add - add HDMI specific connector debugfs files
> + * @connector: pointer to a registered intel_connector
> + *
> + * Cleanup will be done by drm_connector_unregister() through a call to
> + * drm_debugfs_connector_remove().
> + */
> +void intel_hdmi_connector_debugfs_add(struct intel_connector *connector)
> +{
> +	struct dentry *root = connector->base.debugfs_entry;
> +
> +	if (connector->base.connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +	    connector->base.connector_type != DRM_MODE_CONNECTOR_HDMIB)
> +		return;
> +
> +	debugfs_create_file("i915_hdmi_force_bit_banging", 0644, root,
> +			    connector, &i915_hdmi_force_bit_banging_fops);

Please no new i915_ prefixed naming for shared display code. Please just
use intel_.

> +}
> +
>  bool intel_hdmi_init_connector(struct intel_digital_port *dig_port,
>  			       struct intel_connector *intel_connector)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index c95ed37bcc0c..752cccf5ccee 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -78,4 +78,6 @@ void intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_s
>  int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector);
>  int intel_hdmi_sink_dsc_max_frl_rate(struct drm_connector *connector);
>  
> +void intel_hdmi_connector_debugfs_add(struct intel_connector *connector);
> +
>  #endif /* __INTEL_HDMI_H__ */

-- 
Jani Nikula, Intel
