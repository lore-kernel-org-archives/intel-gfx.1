Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF6AC4742C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 10:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09FD42068D
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 10:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09FD42068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9346989D2F;
	Mon, 16 Nov 2020 10:50:01 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51CC89D2F
 for <Intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 10:49:59 +0000 (UTC)
IronPort-SDR: vP4pTAh0drowcErjG1O3q8Lc7EVByIL6DL3Qi7JBqQJAGGVwqmOYUVM1KpbyjmheO5l1fBkvFp
 00sIZcj82B6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="168151621"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="168151621"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 02:49:57 -0800
IronPort-SDR: n9vxitHYeaSm/NZHEbSnR1HD6ihnZfHi6ucCrk1qTYq1KmWsrAQDclaLtStgp9UfRqURfOY42h
 DiEXhOl3Nvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="329645750"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 16 Nov 2020 02:49:57 -0800
Received: from hasmsx601.ger.corp.intel.com (10.184.107.141) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Nov 2020 02:49:56 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 HASMSX601.ger.corp.intel.com (10.184.107.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Nov 2020 12:49:54 +0200
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Mon, 16 Nov 2020 12:49:54 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Huang, Sean Z"
 <sean.z.huang@intel.com>, "Intel-gfx@lists.freedesktop.org"
 <Intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH 23/27] mei: bus: enable pavp device.
Thread-Index: AQHWu5NwIIdOiKFFwUKlHG56BoXq46nKcuoAgAAh8gA=
Date: Mon, 16 Nov 2020 10:49:54 +0000
Message-ID: <13ba7eabd5234380ad3ffdc33a25e150@intel.com>
References: <20201115210815.5272-1-sean.z.huang@intel.com>
 <20201115210815.5272-23-sean.z.huang@intel.com>
 <160552361446.10586.17624770348766864713@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <160552361446.10586.17624770348766864713@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Sent: Monday, November 16, 2020 11:47
> To: Huang, Sean Z <sean.z.huang@intel.com>; Intel-
> gfx@lists.freedesktop.org
> Cc: Winkler, Tomas <tomas.winkler@intel.com>
> Subject: Re: [Intel-gfx] [PATCH 23/27] mei: bus: enable pavp device.
> 
> Obviously needs to be reviewed in the right mailing lists and as there don't
> seem to be any code dependencies should be merged there too.
> 
> Regards, Joonas

I will send my patches via GregKH misc tree, but that might create a bit of disconnection. 
> 
> Quoting Huang, Sean Z (2020-11-15 23:08:11)
> > From: Tomas Winkler <tomas.winkler@intel.com>
> >
> > Enable protected audio video path client on mei client bus.
> >
> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> > ---
> >  drivers/misc/mei/bus-fixup.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/misc/mei/bus-fixup.c
> > b/drivers/misc/mei/bus-fixup.c index 4e30fa98fe7d..042399b397c9 100644
> > --- a/drivers/misc/mei/bus-fixup.c
> > +++ b/drivers/misc/mei/bus-fixup.c
> > @@ -33,6 +33,9 @@ static const uuid_le mei_nfc_info_guid =
> > MEI_UUID_NFC_INFO;  #define MEI_UUID_HDCP UUID_LE(0xB638AB7E,
> 0x94E2, 0x4EA2, \
> >                               0xA5, 0x52, 0xD1, 0xC5, 0x4B, 0x62,
> > 0x7F, 0x04)
> >
> > +#define MEI_UUID_PAVP UUID_LE(0xfbf6fcf1, 0x96cf, 0x4e2e, 0xA6, \
> > +                             0xa6, 0x1b, 0xab, 0x8c, 0xbe, 0x36,
> > +0xb1)
> > +
> >  #define MEI_UUID_ANY NULL_UUID_LE
> >
> >  /**
> > @@ -488,6 +491,7 @@ static struct mei_fixup {
> >         MEI_FIXUP(MEI_UUID_MKHIF_FIX, mei_mkhi_fix),
> >         MEI_FIXUP(MEI_UUID_HDCP, whitelist),
> >         MEI_FIXUP(MEI_UUID_ANY, vt_support),
> > +       MEI_FIXUP(MEI_UUID_PAVP, whitelist),
> >  };
> >
> >  /**
> > --
> > 2.17.1
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
