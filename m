Return-Path: <SRS0=Vy2F=QG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E5AC433FE
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Nov 2021 14:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0336120A
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Nov 2021 14:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C0336120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76966E20F;
	Fri, 19 Nov 2021 14:13:55 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009D6E20F
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Nov 2021 14:13:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="231899724"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="231899724"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 06:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="507912812"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2021 06:13:54 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Nov 2021 06:13:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Nov 2021 06:13:53 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Fri, 19 Nov 2021 06:13:53 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [PATCH 1/2] Revert "drm/i915: Implement Wa_1508744258"
Thread-Index: AQHX3U8DNcVUSnJPl0e3FnHnkFbOcqwLawaA
Date: Fri, 19 Nov 2021 14:13:53 +0000
Message-ID: <a74ffeccb1ce87fff026ce40464022e280a80d9c.camel@intel.com>
References: <20211119140931.32791-1-jose.souza@intel.com>
In-Reply-To: <20211119140931.32791-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2703C9EE0A81FD498B58F80358EAC623@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "drm/i915: Implement
 Wa_1508744258"
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTExLTE5IGF0IDA2OjA5IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBUaGlzIHdvcmthcm91bmRzIGFyZSBjYXVzaW5nIGhhbmdzLCBiZWNhdXNlIEkg
bWlzc2VkIHRoZSBmYWN0IHRoYXQgaXQNCj4gbmVlZHMgdG8gYmUgZW5hYmxlZCBmb3IgYWxsIGNh
c2VzIGFuZCBkaXNhYmxlZCB3aGVuIGRvaW5nIGEgcmVzb2x2ZQ0KPiBwYXNzLg0KPiANCj4gU28g
S01EIG9ubHkgbmVlZHMgdG8gd2hpdGVsaXN0IGl0IGFuZCBVTUQgd2lsbCBiZSB0aGUgb25lIHNl
dHRpbmcgaXQNCj4gb24gcGVyIGNhc2UuDQo+IA0KPiBUaGlzIHJldmVydHMgY29tbWl0IDI4ZWMw
MmM5Y2JlYmYzZmVlYWYyMWE1OWRmOWRmYmMwMmJkYTMzNjIuDQoNCk1pc3NlZCBhOg0KDQpGaXhl
czogMjhlYzAyYzljYmViICgiZHJtL2k5MTU6IEltcGxlbWVudCBXYV8xNTA4NzQ0MjU4IikNCg0K
U28gdGhpcyBjYW4gYmUgcHJvcGFnYXRlZCB0byBvbGRlciBrZXJuZWxzLCB3aWxsIGFkZCB3aGls
ZSBhcHBseWluZy4NCg0KPiANCj4gRml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaW50ZWwvLS9pc3N1ZXMvNDE0NQ0KPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF93b3JrYXJvdW5kcy5jIHwgNyAtLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF93b3JrYXJvdW5kcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfd29ya2Fyb3VuZHMuYw0KPiBpbmRleCBhOTcyNzQ0N2MwMzc5Li5jZDI5MzViOWU3YzgxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF93b3JrYXJvdW5kcy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3dvcmthcm91bmRzLmMNCj4g
QEAgLTYzNywxMyArNjM3LDYgQEAgc3RhdGljIHZvaWQgZ2VuMTJfY3R4X3dvcmthcm91bmRzX2lu
aXQoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lLA0KPiAgCSAgICAgICBGRl9NT0RFMl9H
U19USU1FUl9NQVNLLA0KPiAgCSAgICAgICBGRl9NT0RFMl9HU19USU1FUl8yMjQsDQo+ICAJICAg
ICAgIDAsIGZhbHNlKTsNCj4gLQ0KPiAtCS8qDQo+IC0JICogV2FfMTQwMTIxMzEyMjc6ZGcxDQo+
IC0JICogV2FfMTUwODc0NDI1ODp0Z2wscmtsLGRnMSxhZGwtcyxhZGwtcA0KPiAtCSAqLw0KPiAt
CXdhX21hc2tlZF9lbih3YWwsIEdFTjdfQ09NTU9OX1NMSUNFX0NISUNLRU4xLA0KPiAtCQkgICAg
IEdFTjlfUkhXT19PUFRJTUlaQVRJT05fRElTQUJMRSk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2
b2lkIGRnMV9jdHhfd29ya2Fyb3VuZHNfaW5pdChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdp
bmUsDQoNCg==
