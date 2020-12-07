Return-Path: <SRS0=NHSF=FL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEDEC433FE
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Dec 2020 10:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A191023339
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Dec 2020 10:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A191023339
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165516E821;
	Mon,  7 Dec 2020 10:51:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97796E5A3
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Dec 2020 10:51:31 +0000 (UTC)
IronPort-SDR: T2zsrHPyaaTT2I5BWV2pCGTtNvfNlxZ5W3DfsIRvthoZzFJZqy8Cg8phVDs0dKbjAecyMHd+e2
 XR+rcXEBaDAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="235280774"
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="235280774"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 02:51:31 -0800
IronPort-SDR: T44YlzhgrPEL2njKDLh3T9sxHyDjHGohGlA7Q3QdYV7zoyAmY7hV+mohoUvMhFXV0Piy32sNiE
 rUwQBSAloiyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="539687831"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2020 02:51:30 -0800
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 02:51:29 -0800
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 16:21:27 +0530
Received: from bgsmsx606.gar.corp.intel.com ([10.67.234.8]) by
 BGSMSX606.gar.corp.intel.com ([10.67.234.8]) with mapi id 15.01.1713.004;
 Mon, 7 Dec 2020 16:21:27 +0530
From: "C, Ramalingam" <ramalingam.c@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx
 <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/gt: Fixing the error handling of
 shmem_pin_map
Thread-Index: AQHWzIO0R+0S/7QeXUKimC7N9gh2NqnrF0YAgABdQ6A=
Date: Mon, 7 Dec 2020 10:51:27 +0000
Message-ID: <067737b0a95b4504b9faa1d32acaa845@intel.com>
References: <20201207102812.29931-1-ramalingam.c@intel.com>
 <160733800487.5306.9887780208080081595@build.alporthouse.com>
In-Reply-To: <160733800487.5306.9887780208080081595@build.alporthouse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Fixing the error handling of
 shmem_pin_map
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

In that case can we merge the series http://intel-gfx-pw.fi.intel.com/series/6611/ ?
If so please provide your R-b/Ack


> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Monday, December 7, 2020 4:17 PM
> To: C, Ramalingam <ramalingam.c@intel.com>; intel-gfx <intel-
> gfx@lists.freedesktop.org>
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Fixing the error handling of
> shmem_pin_map
> 
> Quoting Ramalingam C (2020-12-07 10:28:12)
> > Since i was size_t, at error handling if i is 0, then --i >= 0.
> > Making i as int.
> 
> The problem here is that size_t is 64b, but int 32b.
> There's a patch by Colin King that does the trick.
> -Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
