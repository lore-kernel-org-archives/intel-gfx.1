Return-Path: <SRS0=3Vrl=O4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5418C433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 08:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675D06103C
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 08:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 675D06103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4B66E861;
	Fri,  8 Oct 2021 08:09:42 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EB66E861
 for <intel-gfx@lists.freedesktop.org>; Fri,  8 Oct 2021 08:09:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="223869186"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="223869186"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 01:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="624660408"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 08 Oct 2021 01:09:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 08 Oct 2021 11:09:35 +0300
Date: Fri, 8 Oct 2021 11:09:35 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: lindsey.stanpoor@gmail.com
Cc: intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
 hdegoede@redhat.com, gregkh@linuxfoundation.org, cnemo@tutanota.com
Message-ID: <YV/8v2FFcfamJoOI@kuha.fi.intel.com>
References: <20211006043257.23242-1-lindsey.stanpoor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006043257.23242-1-lindsey.stanpoor@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] usb: typec: altmodes/displayport:
 reorder dp_altmode_configured()
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

On Tue, Oct 05, 2021 at 09:32:57PM -0700, lindsey.stanpoor@gmail.com wrote:
> From: Cameron Nemo <cnemo@tutanota.com>
> 
> A recent commit [1] introduced an unintended behavioral change by
> reordering certain function calls. The sysfs_notify call for
> pin_assignment should only be invoked when the dp_altmode_notify call
> returns 0, and in the dp->data.conf == 0 case.
> 
> [1] https://lore.kernel.org/r/20210817215201.795062-8-hdegoede@redhat.com

You should refer the commit, not the mail. I think you could also use
the Fixes tag in this case, but then I guess Hans should pick this:

Fixes: fc27e04630e9 ("usb: typec: altmodes/displayport: Make dp_altmode_notify() more generic")

Either way, this is OK by me, so once you have cleaned the commit
message, please feel free to include my:
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> Signed-off-by: Cameron Nemo <cnemo@tutanota.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index c1d8c23baa39..a15ae78066e3 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -154,10 +154,17 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  
>  static int dp_altmode_configured(struct dp_altmode *dp)
>  {
> +	int ret;
> +
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
> +
> +	ret = dp_altmode_notify(dp);
> +	if (ret || !dp->data.conf)
> +		return ret;
> +
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
>  
> -	return dp_altmode_notify(dp);
> +	return 0;
>  }
>  
>  static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
> -- 
> 2.33.0

-- 
heikki
