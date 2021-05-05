Return-Path: <SRS0=dFBv=KA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8E9C433B4
	for <intel-gfx@archiver.kernel.org>; Wed,  5 May 2021 17:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95EBA606A5
	for <intel-gfx@archiver.kernel.org>; Wed,  5 May 2021 17:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95EBA606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A396EC2E;
	Wed,  5 May 2021 17:37:00 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3CD6EC27
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 May 2021 17:36:59 +0000 (UTC)
IronPort-SDR: xBg2suzRD3SqrGyXMs+XFQZoTbNklNl+c2HKdaUbUipK8im/KAR/Cj1Ix16tzh9o9CX6lcFLKx
 UoJY3TghEIzg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="198319364"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="198319364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 10:36:44 -0700
IronPort-SDR: dvOf49XmUOgycLYYuv1VzyqnUTalb6mIo10eLnoGILaPxumAjLZSNapHnBY6w4OSYAagI3Hhm6
 AuIoMSr4i08w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="433932193"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 05 May 2021 10:36:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 5 May 2021 10:36:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 5 May 2021 10:36:43 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2106.013;
 Wed, 5 May 2021 10:36:43 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH 0/3] Pipe DMC Prep patches
Thread-Index: AQHXPHNFcoW8PxQ9BEypxmNctvpWIqrSjD2AgAJjXQCAAEBGsA==
Date: Wed, 5 May 2021 17:36:43 +0000
Message-ID: <8235ee914ee5408199275b3573dfead9@intel.com>
References: <20210428211249.11037-1-anusha.srivatsa@intel.com>
 <87fsz3znxm.fsf@intel.com> <87lf8ty975.fsf@intel.com>
In-Reply-To: <87lf8ty975.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 0/3] Pipe DMC Prep patches
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Tuesday, May 4, 2021 11:41 PM
> To: Srivatsa, Anusha <anusha.srivatsa@intel.com>; intel-
> gfx@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH 0/3] Pipe DMC Prep patches
> 
> On Mon, 03 May 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Wed, 28 Apr 2021, Anusha Srivatsa <anusha.srivatsa@intel.com>
> wrote:
> >> This series adds the prep work needed before the actual Pipe DMC
> >> implementation.
> >
> > When should we rename csr to dmc all over the place?
> 
> To elaborate, I think it's pretty confusing that we use both CSR and DMC
> acronyms in code. There may be a distinction, but we don't respect that in
> the usage. Sure, the spec mentions both, but I don't think we follow the
> naming there either.
> 
> I think we should just rename all CSR references to DMC, including the file
> name and the function and struct names.
>
Just eyeballing the source file, it looks like it is a good way to go. We have function names like parse_csr_fw_dmc which can be changed to just parse_dmc_fw_header or something on those lines...

> I wonder if it would be better to do the renames first before starting to build
> a lot of changes on top.

Yes. The renames will affect some things that this series touches as well.

Anusha
> BR,
> Jani.
> 
> 
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
