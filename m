Return-Path: <SRS0=tjjx=FZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBB1C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Dec 2020 10:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2AC322AEC
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Dec 2020 10:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2AC322AEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D05389BDB;
	Mon, 21 Dec 2020 10:45:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B14D89BDB;
 Mon, 21 Dec 2020 10:45:19 +0000 (UTC)
IronPort-SDR: dBVCJ6/HnpVXSSKUNBsD9zKacnXCscYk8fKWtjSg3L52l5dicNfr8Q/S8VODj8s8eiXcops8y0
 SRI9x7tIfqdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="175808112"
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; d="scan'208";a="175808112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 02:45:18 -0800
IronPort-SDR: ZODuh0OKQljf/hwkTEiJ33OuF5btRldPRBpVYmZAtMTXfLP9vghePckPqDcvxMtK8CqpZRLrVB
 jZYfWCZNCm1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; d="scan'208";a="342590019"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2020 02:45:18 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Dec 2020 02:45:17 -0800
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Dec 2020 02:45:16 -0800
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Mon, 21 Dec 2020 10:45:15 +0000
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Souza, Jose" <jose.souza@intel.com>
Thread-Topic: [PATCH v9 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Thread-Index: AQHW1W4k7mV++aGVbUyNQlBZoTRQZqoBYcSA
Date: Mon, 21 Dec 2020 10:45:14 +0000
Message-ID: <b713c416c19e577482dd6407d6cbfb40364c25a8.camel@intel.com>
References: <20201218184701.111857-1-jose.souza@intel.com>
In-Reply-To: <20201218184701.111857-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.253.164]
Content-ID: <8724E50D3ECCA84A9497E838236EBF98@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v9 1/5] drm: Add function to convert rect in
 16.16 fixed format to regular format
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIwLTEyLTE4IGF0IDEwOjQ2IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBNdWNoIG1vcmUgY2xlYXIgdG8gcmVhZCBvbmUgZnVuY3Rpb24gY2FsbCB0aGFu
IGZvdXIgbGluZXMgZG9pbmcgdGhpcw0KPiBjb252ZXJzaW9uLg0KPiANCj4gdjc6DQo+IC0gZnVu
Y3Rpb24gcmVuYW1lZA0KPiAtIGNhbGN1bGF0aW5nIHdpZHRoIGFuZCBoZWlnaHQgYmVmb3JlIHRy
dW5jYXRlDQo+IC0gaW5saW5lZA0KPiANCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvZHJtL2RybV9yZWN0LmggfCAxMyArKysrKysrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9yZWN0LmggYi9pbmNsdWRlL2RybS9kcm1fcmVjdC5oDQo+IGluZGV4
IGU3ZjRkMjRjZGQwMC4uN2ViODRhZjRhODE4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9k
cm1fcmVjdC5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9yZWN0LmgNCj4gQEAgLTIwNiw2ICsy
MDYsMTkgQEAgc3RhdGljIGlubGluZSBib29sIGRybV9yZWN0X2VxdWFscyhjb25zdCBzdHJ1Y3QN
Cj4gZHJtX3JlY3QgKnIxLA0KPiAgCQlyMS0+eTEgPT0gcjItPnkxICYmIHIxLT55MiA9PSByMi0+
eTI7DQo+ICB9DQo+ICANCj4gKy8qKg0KPiArICogZHJtX3JlY3RfZnBfdG9faW50IC0gQ29udmVy
dCBhIHJlY3QgaW4gMTYuMTYgZml4ZWQgcG9pbnQgZm9ybSB0bw0KPiBpbnQgZm9ybS4NCj4gKyAq
IEBkZXN0aW5hdGlvbjogcmVjdCB0byBiZSBzdG9yZWQgdGhlIGNvbnZlcnRlZCB2YWx1ZQ0KPiAr
ICogQHNvdXJjZTogcmVjdCBpbiAxNi4xNiBmaXhlZCBwb2ludCBmb3JtDQo+ICsgKi8NCj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBkcm1fcmVjdF9mcF90b19pbnQoc3RydWN0IGRybV9yZWN0ICpkZXN0
aW5hdGlvbiwNCj4gKwkJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKnNvdXJjZSkNCm90
aGVyIGRybV9yZWN0IGZ1bmN0aW9ucyB1c2UgaW5wdXQgcGFyYW1ldGVyIG5hbWVzIGFzIHNyYywg
ZHN0Lg0KKCBleC4gZHJtX3JlY3RfY2xpcF9zY2FsZWQoKSwgZHJtX3JlY3RfY2FsY19oc2NhbGUo
KSwNCmRybV9yZWN0X2NhbGNfdnNjYWxlKCkgKQ0KaWYgdGhlIG5hbWVzIGNoYW5nZSB0byBzcmMg
YW5kIGRzdCwgb3RoZXIgcGFydHMgc2VlbSBnb29kIHRvIG1lLg0KUmV2aWV3ZWQtYnk6IEd3YW4t
Z3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4gK3sNCj4gKwlkcm1fcmVj
dF9pbml0KGRlc3RpbmF0aW9uLCBzb3VyY2UtPngxID4+IDE2LCBzb3VyY2UtPnkxID4+IDE2LA0K
PiArCQkgICAgICBkcm1fcmVjdF93aWR0aChzb3VyY2UpID4+IDE2LA0KPiArCQkgICAgICBkcm1f
cmVjdF9oZWlnaHQoc291cmNlKSA+PiAxNik7DQo+ICt9DQo+ICsNCj4gIGJvb2wgZHJtX3JlY3Rf
aW50ZXJzZWN0KHN0cnVjdCBkcm1fcmVjdCAqciwgY29uc3Qgc3RydWN0IGRybV9yZWN0DQo+ICpj
bGlwKTsNCj4gIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMs
IHN0cnVjdCBkcm1fcmVjdA0KPiAqZHN0LA0KPiAgCQkJICBjb25zdCBzdHJ1Y3QgZHJtX3JlY3Qg
KmNsaXApOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
