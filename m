Return-Path: <SRS0=KOmL=OR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F68FC433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 22:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FDF60E73
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 22:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1FDF60E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521BF89D5C;
	Mon, 27 Sep 2021 22:02:27 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00C589D5C
 for <intel-gfx@lists.freedesktop.org>; Mon, 27 Sep 2021 22:02:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="204722379"
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="204722379"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 15:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="706167430"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2021 15:02:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 27 Sep 2021 23:02:22 +0100
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Mon, 27 Sep 2021 15:02:21 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Deak, Imre" <imre.deak@intel.com>
Thread-Topic: [PATCH 10/13] drm/i915/icl/tc: Remove the ICL special casing
 during TC-cold blocking
Thread-Index: AQHXrn7oll9ZhsADzkC1Bzo3FR3uEau48KYA
Date: Mon, 27 Sep 2021 22:02:21 +0000
Message-ID: <63811f47b365ba59c118ee855af7043ce55eb4ad.camel@intel.com>
References: <20210921002313.1132357-1-imre.deak@intel.com>
 <20210921002313.1132357-11-imre.deak@intel.com>
In-Reply-To: <20210921002313.1132357-11-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E4668D33E4B9242B57BF0B7B8F1C891@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 10/13] drm/i915/icl/tc: Remove the ICL
 special casing during TC-cold blocking
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

T24gVHVlLCAyMDIxLTA5LTIxIGF0IDAzOjIzICswMzAwLCBJbXJlIERlYWsgd3JvdGU6DQo+IFdo
aWxlIGEgVHlwZUMgcG9ydCBtb2RlIGlzIGxvY2tlZCBhIERJU1BMQVlfQ09SRSBwb3dlciBkb21h
aW4gcmVmZXJlbmNlDQo+IGlzIGhlbGQsIHdoaWNoIGltcGxpZXMgYSBydW50aW1lIFBNIHJlZi4g
QnkgcmVtb3ZpbmcgdGhlIElDTCAhbGVnYWN5DQo+IHBvcnQgc3BlY2lhbCBjYXNpbmcsIGEgVENf
Q09MRF9PRkYgcG93ZXIgZG9tYWluIHJlZmVyZW5jZSB3aWxsIGJlIHRha2VuDQo+IGZvciBzdWNo
IHBvcnRzLCB3aGljaCBhbHNvIHRyYW5zbGF0ZXMgdG8gYSBydW50aW1lIFBNIHJlZiBvbiB0aGF0
DQo+IHBsYXRmb3JtLiBBIGZvbGxvdy11cCBjaGFuZ2Ugd2lsbCBzdG9wIGhvbGRpbmcgdGhlIERJ
U1BMQVlfQ09SRSBwb3dlcg0KPiBkb21haW4gd2hpbGUgdGhlIHBvcnQgaXMgbG9ja2VkLg0KDQpU
aGlzIHNob3VsZCBiZSBzcXVhc2hlZCB0byAnZHJtL2k5MTUvdGM6IFJlZmFjdG9yIFRDLWNvbGQg
YmxvY2svdW5ibG9jayBoZWxwZXJzJyBvdGhlcndpc2UgZG9tYWluIGlzIG5vdCBpbml0aWFsaXpl
ZCBmb3IgdGhpcyBjYXNlLiANCg0KPiANCj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpv
c2Uuc291emFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVh
a0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF90Yy5jIHwgNiAtLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdGMuYw0KPiBpbmRleCBiMmEzZDI5
N2JmYzE5Li44ZDc5OWNmN2NjZWZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3RjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF90Yy5jDQo+IEBAIC03MSw5ICs3MSw2IEBAIHRjX2NvbGRfYmxvY2tfaW5fbW9kZShz
dHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICpkaWdfcG9ydCwgZW51bSB0Y19wb3J0X21vZGUgbW9k
DQo+ICB7DQo+ICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KGRpZ19w
b3J0LT5iYXNlLmJhc2UuZGV2KTsNCj4gIA0KPiAtCWlmIChESVNQTEFZX1ZFUihpOTE1KSA9PSAx
MSAmJiAhZGlnX3BvcnQtPnRjX2xlZ2FjeV9wb3J0KQ0KPiAtCQlyZXR1cm4gMDsNCj4gLQ0KPiAg
CSpkb21haW4gPSB0Y19jb2xkX2dldF9wb3dlcl9kb21haW4oZGlnX3BvcnQsIG1vZGUpOw0KPiAg
DQo+ICAJcmV0dXJuIGludGVsX2Rpc3BsYXlfcG93ZXJfZ2V0KGk5MTUsICpkb21haW4pOw0KPiBA
QCAtMTA4LDkgKzEwNSw2IEBAIGFzc2VydF90Y19jb2xkX2Jsb2NrZWQoc3RydWN0IGludGVsX2Rp
Z2l0YWxfcG9ydCAqZGlnX3BvcnQpDQo+ICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUg
PSB0b19pOTE1KGRpZ19wb3J0LT5iYXNlLmJhc2UuZGV2KTsNCj4gIAlib29sIGVuYWJsZWQ7DQo+
ICANCj4gLQlpZiAoRElTUExBWV9WRVIoaTkxNSkgPT0gMTEgJiYgIWRpZ19wb3J0LT50Y19sZWdh
Y3lfcG9ydCkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+ICAJZW5hYmxlZCA9IGludGVsX2Rpc3BsYXlf
cG93ZXJfaXNfZW5hYmxlZChpOTE1LA0KPiAgCQkJCQkJIHRjX2NvbGRfZ2V0X3Bvd2VyX2RvbWFp
bihkaWdfcG9ydCwNCj4gIAkJCQkJCQkJCSAgZGlnX3BvcnQtPnRjX21vZGUpKTsNCg0K
