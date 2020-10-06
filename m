Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3892C41604
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 18:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DC3206F7
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 18:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DC3206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5286E4EC;
	Tue,  6 Oct 2020 18:02:59 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137A6E4F3;
 Tue,  6 Oct 2020 18:02:58 +0000 (UTC)
IronPort-SDR: 4s9W5dd8xcr5+TDsl/5ITxgejyDwb2q9tixg/clXrtTb8VFq8DC1utR3jtARpJpect7kTZaynm
 1fZjn0wXw4jQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249318248"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="249318248"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 11:02:49 -0700
IronPort-SDR: 3HhHpV7oZNfZCDY39mZ7OqD50LEkGC+YyX/sCR3RQNPTY9CP/7oTK7ZCZrRtqUmbni1GpHoN6Y
 1p5oH5pM57kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="517350660"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 06 Oct 2020 11:02:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 11:02:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 11:02:46 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Tue, 6 Oct 2020 11:02:46 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "chris@chris-wilson.co.uk"
 <chris@chris-wilson.co.uk>
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/Fk90H9Qy56XkSH4h+5RqsAv6mLT7oA////iICAAAIGAIAAAu0A
Date: Tue, 6 Oct 2020 18:02:46 +0000
Message-ID: <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
In-Reply-To: <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <B9D12F80D52D2947930B85A4065E1D64@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 2020-10-06 at 10:55 -0700, Vivi, Rodrigo wrote:
> 
> > On Oct 6, 2020, at 10:48 AM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > 
> > Quoting Souza, Jose (2020-10-06 18:46:45)
> > > +Rodrigo and Jani
> > > 
> > > On Tue, 2020-10-06 at 14:56 +0000, Kamati Srinivas wrote:
> > > > Removing force probe protection from EHL platform. Did
> > > > not observe warnings, errors, flickering or any visual
> > > > defects while doing ordinary tasks like browsing and
> > > > editing documents in a two monitor setup.
> > > 
> > > One of the requirements was also to have CI BAT all green and shards as green is possible but EHL don't show up in CI results, we actually have one
> > > single EHL machine in CI but I guess it is not able to run all tests that shards do:
> > > https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9097/filelist.html
> > 
> > https://intel-gfx-ci.01.org/tree/drm-tip/drmtip-alt.html
> 
> we are really close to that point. We just need to fix some w/a and rc6 issues
> before applying this change.
> 
> > -Chris
> 

Huum okay we have drm-tip results for EHL but if someone sends a patch that breaks EHL it will not be caught in pre-merge testing.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
