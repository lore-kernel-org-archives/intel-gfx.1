Return-Path: <SRS0=dFBv=KA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB35C43460
	for <intel-gfx@archiver.kernel.org>; Wed,  5 May 2021 10:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73A161222
	for <intel-gfx@archiver.kernel.org>; Wed,  5 May 2021 10:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73A161222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC6C6E45E;
	Wed,  5 May 2021 10:17:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4BD6E45E;
 Wed,  5 May 2021 10:17:37 +0000 (UTC)
IronPort-SDR: ro1042UnXZlM8+8VMx1v4JzBL2S1cMVHN1I9CiGhiB+ste4U3pxmzXctOqfGoEvpa8+Gu/lMSl
 01g6SM7Hqn+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="198233253"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="198233253"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 03:17:37 -0700
IronPort-SDR: WeJo6OE47B5MG8/tRuB6r+H7FEUNoUKOCw6h0Kh9WZs7DH1FFmri16pnnV03JDdepJj1yknsq5
 7ig55i4+G66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="531717347"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 05 May 2021 03:17:31 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 05 May 2021 13:17:30 +0300
Date: Wed, 5 May 2021 13:17:30 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <YJJwukxJfi9gGKcf@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503154647.142551-9-hdegoede@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 8/9] usb: typec: altmodes/displayport:
 Notify drm subsys of hotplug events
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
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Hans,

On Mon, May 03, 2021 at 05:46:46PM +0200, Hans de Goede wrote:
> Use the new drm_connector_find_by_fwnode() and
> drm_connector_oob_hotplug_event() functions to let drm/kms drivers
> know about DisplayPort over Type-C hotplug events.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Add missing depends on DRM to TYPEC_DP_ALTMODE Kconfig entry
> ---
>  drivers/usb/typec/altmodes/Kconfig       |  1 +
>  drivers/usb/typec/altmodes/displayport.c | 40 +++++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> index 60d375e9c3c7..1a6b5e872b0d 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -4,6 +4,7 @@ menu "USB Type-C Alternate Mode drivers"
>  
>  config TYPEC_DP_ALTMODE
>  	tristate "DisplayPort Alternate Mode driver"
> +	depends on DRM
>  	help
>  	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
>  	  displays and adapters to be attached to the USB Type-C
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index aa669b9cf70e..f00dfc5c14b6 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -11,8 +11,10 @@
>  #include <linux/delay.h>
>  #include <linux/mutex.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_dp.h>
> +#include <drm/drm_connector.h>
>  #include "displayport.h"
>  
>  #define DP_HEADER(_dp, ver, cmd)	(VDO((_dp)->alt->svid, 1, ver, cmd)	\
> @@ -62,12 +64,30 @@ struct dp_altmode {
>  	struct work_struct work;
>  	struct typec_altmode *alt;
>  	const struct typec_altmode *port;
> +	struct fwnode_handle *connector_fwnode;
>  };
>  
> +static void dp_altmode_notify_connector(struct dp_altmode *dp)
> +{
> +	struct drm_connector_oob_hotplug_event_data data = { };
> +	u8 pin_assign = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
> +
> +	data.connected = dp->data.status & DP_STATUS_HPD_STATE;
> +	data.orientation = typec_altmode_get_orientation(dp->alt);
> +
> +	if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
> +		data.dp_lanes = 4;
> +	else if (pin_assign & DP_PIN_ASSIGN_MULTI_FUNC_MASK)
> +		data.dp_lanes = 2;
> +
> +	drm_connector_oob_hotplug_event(dp->connector_fwnode, &data);
> +}
> +
>  static int dp_altmode_notify(struct dp_altmode *dp)
>  {
>  	unsigned long conf;
>  	u8 state;
> +	int ret;
>  
>  	if (dp->data.conf) {
>  		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
> @@ -76,7 +96,12 @@ static int dp_altmode_notify(struct dp_altmode *dp)
>  		conf = TYPEC_STATE_USB;
>  	}
>  
> -	return typec_altmode_notify(dp->alt, conf, &dp->data);
> +	ret = typec_altmode_notify(dp->alt, conf, &dp->data);
> +	if (ret)
> +		return ret;
> +
> +	dp_altmode_notify_connector(dp);

That is now going to be always called after configuration, right? The
HPD is not necessarily issued at that point.

I think that should be called from dp_altmode_status_update(), and
probable only if there really is HPD IRQ or HPD State changes... I
think?

> +	return 0;
>  }

thanks,

-- 
heikki
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
