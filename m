Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC264C433ED
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 10:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C456109E
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 10:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77C456109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54A26ECB7;
	Thu,  6 May 2021 10:06:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345A16ECB5
 for <intel-gfx@lists.freedesktop.org>; Thu,  6 May 2021 10:06:53 +0000 (UTC)
IronPort-SDR: xiowcqkGibjM3EZQ3NIk1bhrQlGwxE6rMSQnXs6KAdgtKKkOypKs9IS+Gd2bEraFFf7O9pZtPr
 7AtMM6+6waJw==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178671870"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="178671870"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 03:06:52 -0700
IronPort-SDR: +O4WjygB6xO5jd0sK8pIvbF1kURRmNL94GTi2bsZAQZQtSpsczH7wTB006xPLw7UaTdwKFQ5Gj
 zv/fFvJcs3Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="434276450"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 06 May 2021 03:06:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 6 May 2021 03:06:52 -0700
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 6 May 2021 03:06:51 -0700
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.2106.013;
 Thu, 6 May 2021 11:06:49 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Souza, Jose" <jose.souza@intel.com>
Thread-Topic: [PATCH] drm/i915/display: Disable PSR2 sel fetch in TGL
 pre-production
Thread-Index: AQHXQfaI1INUfMfRA0mdcjrnhEYpLqrWKlwA
Date: Thu, 6 May 2021 10:06:49 +0000
Message-ID: <03d1e7eba6260afcb03a38a80cf8be2e6849e6ca.camel@intel.com>
References: <20210505213801.80772-1-jose.souza@intel.com>
In-Reply-To: <20210505213801.80772-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.253.164]
Content-ID: <FE7C49601B65594BAF8CF84C151AE85D@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Disable PSR2 sel fetch in
 TGL pre-production
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4N
Ck9uIFdlZCwgMjAyMS0wNS0wNSBhdCAxNDozOCAtMDcwMCwgSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSB3cm90ZToNCj4gVGhlIGltcGxlbWVudGF0aW9uIG9mIHR3byB3b3JrYXJvdW5kcyBhcmUgbWlz
c2luZyBjYXVzaW5nIGZhaWx1cmVzDQo+IGluIENJIHdpdGggcHJlLXByb2R1Y3Rpb24gSFcuDQo+
IA0KPiBDYzogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyB8
IDcgKysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCBlM2MzMGRj
YWRjZDEuLjQwNmJhOWE3MTJhOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Bzci5jDQo+IEBAIC03MjAsNiArNzIwLDEzIEBAIHN0YXRpYyBib29sDQo+IGludGVs
X3BzcjJfc2VsX2ZldGNoX2NvbmZpZ192YWxpZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gwqDCoMKgwqDCoMKgwqDCoH0N
Cj4gwqANCj4gK8KgwqDCoMKgwqDCoMKgLyogV2FfMTQwMTAyNTQxODUgV2FfMTQwMTAxMDM3OTIg
Ki8NCj4gK8KgwqDCoMKgwqDCoMKgaWYgKElTX1RHTF9ESVNQTEFZX1NURVAoZGV2X3ByaXYsIFNU
RVBfQTAsIFNURVBfQjEpKSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1f
ZGJnX2ttcygmZGV2X3ByaXYtPmRybSwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlBTUjIgc2VsIGZldGNoIG5vdCBlbmFibGVkLCBtaXNz
aW5nIHRoZQ0KPiBpbXBsZW1lbnRhdGlvbiBvZiBXQXNcbiIpOw0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOw0KPiArwqDCoMKgwqDCoMKgwqB9DQo+ICsNCj4g
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0Y2gg
PSB0cnVlOw0KPiDCoH0NCj4gwqANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ2Z4Cg==
