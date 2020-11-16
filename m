Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149B1C4742C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 10:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C8C20674
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 10:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C8C20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1C589DEA;
	Mon, 16 Nov 2020 10:46:59 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0975589DEA
 for <Intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 10:46:59 +0000 (UTC)
IronPort-SDR: M1SMxcw4cBw22B7ftAkt5x9thkgskPVAcyoafH0UhyTjKjggCf4nujX6Dy1iXa50oYl+8do4KL
 K7xJcEhsM+UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="255439257"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="255439257"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 02:46:58 -0800
IronPort-SDR: YQtV088GQD7JQYyGVl0VlWPdFiVM2xpmERy1l4Zvxd+2PkUw5gxZbPbaD92jVI8cI+eKxLqnVr
 xJuoifxlXkrQ==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="533373572"
Received: from joejam1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.3.39])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 02:46:57 -0800
MIME-Version: 1.0
In-Reply-To: <20201115210815.5272-23-sean.z.huang@intel.com>
References: <20201115210815.5272-1-sean.z.huang@intel.com>
 <20201115210815.5272-23-sean.z.huang@intel.com>
To: "Huang, Sean Z" <sean.z.huang@intel.com>, Intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160552361446.10586.17624770348766864713@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 16 Nov 2020 12:46:54 +0200
Subject: Re: [Intel-gfx] [PATCH 23/27] mei: bus: enable pavp device.
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
Cc: Tomas Winkler <tomas.winkler@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Obviously needs to be reviewed in the right mailing lists and as there
don't seem to be any code dependencies should be merged there too.

Regards, Joonas

Quoting Huang, Sean Z (2020-11-15 23:08:11)
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> Enable protected audio video path client on mei client
> bus.
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> ---
>  drivers/misc/mei/bus-fixup.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/misc/mei/bus-fixup.c b/drivers/misc/mei/bus-fixup.c
> index 4e30fa98fe7d..042399b397c9 100644
> --- a/drivers/misc/mei/bus-fixup.c
> +++ b/drivers/misc/mei/bus-fixup.c
> @@ -33,6 +33,9 @@ static const uuid_le mei_nfc_info_guid = MEI_UUID_NFC_INFO;
>  #define MEI_UUID_HDCP UUID_LE(0xB638AB7E, 0x94E2, 0x4EA2, \
>                               0xA5, 0x52, 0xD1, 0xC5, 0x4B, 0x62, 0x7F, 0x04)
>  
> +#define MEI_UUID_PAVP UUID_LE(0xfbf6fcf1, 0x96cf, 0x4e2e, 0xA6, \
> +                             0xa6, 0x1b, 0xab, 0x8c, 0xbe, 0x36, 0xb1)
> +
>  #define MEI_UUID_ANY NULL_UUID_LE
>  
>  /**
> @@ -488,6 +491,7 @@ static struct mei_fixup {
>         MEI_FIXUP(MEI_UUID_MKHIF_FIX, mei_mkhi_fix),
>         MEI_FIXUP(MEI_UUID_HDCP, whitelist),
>         MEI_FIXUP(MEI_UUID_ANY, vt_support),
> +       MEI_FIXUP(MEI_UUID_PAVP, whitelist),
>  };
>  
>  /**
> -- 
> 2.17.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
