Return-Path: <SRS0=oW1W=D4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86841C55179
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 16:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1803D20870
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2020 16:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1803D20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2546EDD1;
	Wed, 21 Oct 2020 16:31:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6B6EDCF;
 Wed, 21 Oct 2020 16:30:58 +0000 (UTC)
IronPort-SDR: bsPVV37kzUY+YmMhPZmD5zrDiiUAJUcFNOgWzXfdPSjedibX2oXYGZ4nyGvYO1aPFVc9onWa5E
 L5SmDCH4solQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="146688407"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="146688407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 09:30:43 -0700
IronPort-SDR: 61Srs2vs/ES4Iarg8t6dDwOOiDG7E0QCeTdqIc6oC7mgZXWWxhthxLYe1LsvG48lOgIjPZRf5e
 HAqYPxMVDxKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="533591284"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga005.jf.intel.com with ESMTP; 21 Oct 2020 09:30:42 -0700
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Oct 2020 17:30:41 +0100
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Wed, 21 Oct 2020 19:30:40 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Thread-Topic: [PATCH v2 09/15] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer
 len
Thread-Index: AQHWpufsfNKyarP4z0uf8+3JcaA4gqmgnrQAgAGYOtA=
Date: Wed, 21 Oct 2020 16:30:40 +0000
Message-ID: <893382423183475abc19a3cbd9777a73@intel.com>
References: <20201020133906.23710-1-anshuman.gupta@intel.com>
 <20201020133906.23710-10-anshuman.gupta@intel.com> <87tuuo929d.fsf@intel.com>
In-Reply-To: <87tuuo929d.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 09/15] misc/mei/hdcp: Fix AUTH_STREAM_REQ
 cmd buffer len
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
Cc: "seanpaul@chromium.org" <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


> 
> On Tue, 20 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > Fix the size of WIRED_REPEATER_AUTH_STREAM_REQ cmd buffer size.
> > It is based upon the actual number of MST streams and size of
> > wired_cmd_repeater_auth_stream_req_in.
> > Excluding the size of hdcp_cmd_header.
> >
> > Cc: Tomas Winkler <tomas.winkler@intel.com>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Tomas, ack to merge this via drm-intel?

I have no problem with merging it via drm-intel,  just see a little nitpick bellow:
> Thanks,
> Jani.
> 
> > ---
> >  drivers/misc/mei/hdcp/mei_hdcp.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c
> > b/drivers/misc/mei/hdcp/mei_hdcp.c
> > index 9ae9669e46ea..b10d266fb60a 100644
> > --- a/drivers/misc/mei/hdcp/mei_hdcp.c
> > +++ b//
> > @@ -569,8 +569,7 @@ static int mei_hdcp_verify_mprime(struct device
> *dev,
> >  	verify_mprime_in->header.api_version = HDCP_API_VERSION;
> >  	verify_mprime_in->header.command_id =
> WIRED_REPEATER_AUTH_STREAM_REQ;
> >  	verify_mprime_in->header.status = ME_HDCP_STATUS_SUCCESS;
> > -	verify_mprime_in->header.buffer_len =
> > -
> 	WIRED_CMD_BUF_LEN_REPEATER_AUTH_STREAM_REQ_MIN_IN;
> > +	verify_mprime_in->header.buffer_len = cmd_size  - sizeof(struct
> > +hdcp_cmd_header);

 I believe the following annotation would be  preferable: 
	cmd_size - sizeof(verify_mprime_in->header)

> >
> >  	verify_mprime_in->port.integrated_port_type = data->port_type;
> >  	verify_mprime_in->port.physical_port = (u8)data->fw_ddi;
> 
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
