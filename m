Return-Path: <SRS0=eU4y=EL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3ACC00A89
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 07:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BBB920825
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 07:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BBB920825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC2588065;
	Thu,  5 Nov 2020 07:19:45 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A108988065
 for <intel-gfx@lists.freedesktop.org>; Thu,  5 Nov 2020 07:19:44 +0000 (UTC)
IronPort-SDR: 9I/7fiji1bOzkXlbGT4mFvr2k50A7nNH1ltdbELQ5iwlnWPVWsv3Nn0ncSSjxGyE6uzFr4RLkH
 vpgxuxa3ZW+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="168556482"
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; d="scan'208";a="168556482"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 23:19:43 -0800
IronPort-SDR: WjQEmQNb9BdTaNnZh5y0S8C/y8FRDkmFwZzu8BRheaRBbAfq0/6ZbNve3ZysSADBenNOg6foKn
 sqKOBugU79Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; d="scan'208";a="354176998"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2020 23:19:43 -0800
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Nov 2020 23:19:41 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 5 Nov 2020 12:49:39 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 5 Nov 2020 12:49:39 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Thread-Topic: [Intel-gfx] [PATCH 1/2] drm/i915/display/tgl: Disable FBC with
 PSR2
Thread-Index: AQHWst+8uNvzKg5dCEma6k3N1EMOxKm4u6CAgABmhQA=
Date: Thu, 5 Nov 2020 07:19:39 +0000
Message-ID: <559ac462e3904e2d803fe6fc07c19a80@intel.com>
References: <20201104195604.3334-1-uma.shankar@intel.com>
 <20201104195604.3334-2-uma.shankar@intel.com>
 <20201105064209.GP29526@intel.com>
In-Reply-To: <20201105064209.GP29526@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/display/tgl: Disable FBC with
 PSR2
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> Sent: Thursday, November 5, 2020 12:12 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/display/tgl: Disable FBC with PSR2
> 
> On 2020-11-05 at 01:26:03 +0530, Uma Shankar wrote:
> > There are some corner cases wrt underrun when we enable FBC with PSR2
> > on TGL. Recommendation from hardware is to keep this combination
> > disabled.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_fbc.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c
> > b/drivers/gpu/drm/i915/display/intel_fbc.c
> > index a5b072816a7b..32c411414908 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> > @@ -799,6 +799,12 @@ static bool intel_fbc_can_activate(struct intel_crtc
> *crtc)
> >  	struct intel_fbc *fbc = &dev_priv->fbc;
> >  	struct intel_fbc_state_cache *cache = &fbc->state_cache;
> >
> > +	if (dev_priv->psr.sink_psr2_support &&
> > +	    IS_TIGERLAKE(dev_priv)) {
> IMHO we need to use state boolean crtc_state->has_psr2, we can have sink
> supports PSR2 but it may not be enabled due to any reason.

Yeah agree, will update this check. Thanks.

Regards,
Uma Shankar

> Thanks,
> Anshuman Gupta.
> > +		fbc->no_fbc_reason = "not supported with PSR2";
> > +		return false;
> > +	}
> > +
> >  	if (!intel_fbc_can_enable(dev_priv))
> >  		return false;
> >
> > --
> > 2.26.2
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
