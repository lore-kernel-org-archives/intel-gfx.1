Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DFAC2D0E4
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 23:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D85472463B
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 23:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D85472463B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CF389E65;
	Tue, 17 Nov 2020 23:45:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802BF89E65
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 23:45:25 +0000 (UTC)
IronPort-SDR: 4c66cdngwPxsM3YupRNNcbo20ioPM/N3pOhjUfWG2BnAQgGBl6dznU5pB0RmMh49p7cQ6mDYJ1
 zwO/62rf2uXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="170252888"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="170252888"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 15:45:24 -0800
IronPort-SDR: yzrh1vJlvINV2VQRnAl6w3I94mh3q6qWaqTPS6PdQ0rONMp4HxHHaEJdso4kfbNSbfLoyFyLop
 V5uVVP58ALKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="368267756"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 17 Nov 2020 15:45:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 15:45:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 15:45:23 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Tue, 17 Nov 2020 15:45:23 -0800
From: "Hampson, Steven T" <steven.t.hampson@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Thread-Topic: [Intel-gfx] [PATCH] i915/gem_flink_race: Fix error in buffer
 usage
Thread-Index: AQHWvTBCR2wrJZMkz0yKes60mRjn1KnNbbmA//+PVeY=
Date: Tue, 17 Nov 2020 23:45:23 +0000
Message-ID: <4EE61155-0590-4677-952B-17E4E21BF3D3@intel.com>
References: <20201117222308.31551-1-steven.t.hampson@intel.com>,
 <160565211968.4536.839020621876876215@build.alporthouse.com>
In-Reply-To: <160565211968.4536.839020621876876215@build.alporthouse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] i915/gem_flink_race: Fix error in buffer
 usage
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

DQoNClNlbnQgZnJvbSBteSBpUGhvbmUNCg0KPiBPbiBOb3YgMTcsIDIwMjAsIGF0IDI6MjggUE0s
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToNCj4gDQo+IO+7
v1F1b3RpbmcgU3RldmUgSGFtcHNvbiAoMjAyMC0xMS0xNyAyMjoyMzowOCkNCj4+IEEgYnVmZmVy
IGluIGZ1bmN0aW9uIHRlc3RfZmxpbmtfbmFtZSB3YXMgYm90aCB0b28gc21hbGwgYW5kIG5ldmVy
DQo+PiBjaGVja2VkIGZvciBvdmVyZmxvdy4gIEJvdGggZXJyb3JzIGFyZSBmaXhlZC4NCj4gDQo+
IFRoYXQgbWFueSBudW1iZXJzIGlzIG5vdCBpbnRlcmVzdGluZy4gU2hvdyB0aGUgcmFuZ2UgYW5k
IG1lZGlhbiBpbnN0ZWFkLg0KPiAtQ2hyaXMNCg0KSSBkb27igJl0IHVuZGVyc3RhbmQgd2hhdCB5
b3UgYXJlIHRhbGtpbmcgYWJvdXQuICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ2Z4Cg==
