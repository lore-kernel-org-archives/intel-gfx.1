Return-Path: <SRS0=F6ds=ML=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E09C07E9D
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 17:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 734BC6113A
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 17:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 734BC6113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFBE6E1F5;
	Mon, 19 Jul 2021 17:37:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C472F6E1F5
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Jul 2021 17:37:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="190688988"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="190688988"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 10:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="500001663"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2021 10:37:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 10:37:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 10:37:49 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.010;
 Mon, 19 Jul 2021 10:37:49 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH 6/7] drm/i915/rkl: Wa_1408330847 no longer
 applies to RKL
Thread-Index: AQHXesqp/O4byA3vBEy4RSfFqThUH6tLCoeA
Date: Mon, 19 Jul 2021 17:37:47 +0000
Message-ID: <c893096415ccfff670570886b2076a9610247681.camel@intel.com>
References: <20210717051426.4120328-1-matthew.d.roper@intel.com>
 <20210717051426.4120328-7-matthew.d.roper@intel.com>
In-Reply-To: <20210717051426.4120328-7-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-ID: <374D79B39DD2014098AE76FC931E52A4@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/rkl: Wa_1408330847 no longer
 applies to RKL
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

T24gRnJpLCAyMDIxLTA3LTE2IGF0IDIyOjE0IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBS
S0wgZG9lc24ndCBoYXZlIFBTUjIgc3VwcG9ydCwgc28gUFNSMi1yZWxhdGVkIHdvcmthcm91bmRz
IG5vIGxvbmdlcg0KPiBhcHBseS4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291
emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBCc3BlYzogNTMyNzMNCj4gU2lnbmVk
LW9mZi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIHwgMTAgKysrKy0tLS0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCBkNDM2
NDkwYWIyOGMuLjBhM2Q0MmM4ZDQ3ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jDQo+IEBAIC01OTIsOSArNTkyLDggQEAgc3RhdGljIHZvaWQgaHN3X2Fj
dGl2YXRlX3BzcjIoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkNCj4gIAkJdmFsIHw9IEVEUF9Q
U1IyX1NVX1NEUF9TQ0FOTElORTsNCj4gIA0KPiAgCWlmIChpbnRlbF9kcC0+cHNyLnBzcjJfc2Vs
X2ZldGNoX2VuYWJsZWQpIHsNCj4gLQkJLyogV0EgMTQwODMzMDg0NyAqLw0KPiAtCQlpZiAoSVNf
VEdMX0RJU1BMQVlfU1RFUChkZXZfcHJpdiwgU1RFUF9BMCwgU1RFUF9BMCkgfHwNCj4gLQkJICAg
IElTX1JLTF9ESVNQTEFZX1NURVAoZGV2X3ByaXYsIFNURVBfQTAsIFNURVBfQTApKQ0KPiArCQkv
KiBXYV8xNDA4MzMwODQ3ICovDQo+ICsJCWlmIChJU19UR0xfRElTUExBWV9TVEVQKGRldl9wcml2
LCBTVEVQX0EwLCBTVEVQX0EwKSkNCj4gIAkJCWludGVsX2RlX3JtdyhkZXZfcHJpdiwgQ0hJQ0tF
Tl9QQVIxXzEsDQo+ICAJCQkJICAgICBESVNfUkFNX0JZUEFTU19QU1IyX01BTl9UUkFDSywNCj4g
IAkJCQkgICAgIERJU19SQU1fQllQQVNTX1BTUjJfTUFOX1RSQUNLKTsNCj4gQEAgLTEzMzksMTAg
KzEzMzgsOSBAQCBzdGF0aWMgdm9pZCBpbnRlbF9wc3JfZGlzYWJsZV9sb2NrZWQoc3RydWN0IGlu
dGVsX2RwICppbnRlbF9kcCkNCj4gIAlpbnRlbF9wc3JfZXhpdChpbnRlbF9kcCk7DQo+ICAJaW50
ZWxfcHNyX3dhaXRfZXhpdF9sb2NrZWQoaW50ZWxfZHApOw0KPiAgDQo+IC0JLyogV0EgMTQwODMz
MDg0NyAqLw0KPiArCS8qIFdhXzE0MDgzMzA4NDcgKi8NCj4gIAlpZiAoaW50ZWxfZHAtPnBzci5w
c3IyX3NlbF9mZXRjaF9lbmFibGVkICYmDQo+IC0JICAgIChJU19UR0xfRElTUExBWV9TVEVQKGRl
dl9wcml2LCBTVEVQX0EwLCBTVEVQX0EwKSB8fA0KPiAtCSAgICAgSVNfUktMX0RJU1BMQVlfU1RF
UChkZXZfcHJpdiwgU1RFUF9BMCwgU1RFUF9BMCkpKQ0KPiArCSAgICBJU19UR0xfRElTUExBWV9T
VEVQKGRldl9wcml2LCBTVEVQX0EwLCBTVEVQX0EwKSkNCj4gIAkJaW50ZWxfZGVfcm13KGRldl9w
cml2LCBDSElDS0VOX1BBUjFfMSwNCj4gIAkJCSAgICAgRElTX1JBTV9CWVBBU1NfUFNSMl9NQU5f
VFJBQ0ssIDApOw0KPiAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAo=
