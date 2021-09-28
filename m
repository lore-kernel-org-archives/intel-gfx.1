Return-Path: <SRS0=KIcH=OS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB621C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Sep 2021 20:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93CDF60ED7
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Sep 2021 20:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93CDF60ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233B06E995;
	Tue, 28 Sep 2021 20:51:35 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA5A89109
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Sep 2021 20:51:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="222910907"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="222910907"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 13:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="554299796"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2021 13:51:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 21:51:31 +0100
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.012;
 Tue, 28 Sep 2021 13:51:29 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Deak, Imre" <imre.deak@intel.com>
Thread-Topic: [PATCH 12/13] drm/i915/tc: Drop extra TC cold blocking from
 intel_tc_port_connected()
Thread-Index: AQHXrn7psepLRg91JECewY6TWsUUt6u6by+A
Date: Tue, 28 Sep 2021 20:51:29 +0000
Message-ID: <68991b76d1896f6e7a246793a8a7a398e1243730.camel@intel.com>
References: <20210921002313.1132357-1-imre.deak@intel.com>
 <20210921002313.1132357-13-imre.deak@intel.com>
In-Reply-To: <20210921002313.1132357-13-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <88AFAC1281A6C843AF58091ECFEF34A3@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 12/13] drm/i915/tc: Drop extra TC cold
 blocking from intel_tc_port_connected()
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

T24gVHVlLCAyMDIxLTA5LTIxIGF0IDAzOjIzICswMzAwLCBJbXJlIERlYWsgd3JvdGU6DQo+IEFm
dGVyIHRoZSBwcmV2aW91cyBwYXRjaCB0aGUgZHJpdmVyIGhvbGRzIGEgcG93ZXIgZG9tYWluIGJs
b2NraW5nDQo+IFRDLWNvbGQgd2hlbmV2ZXIgdGhlIHBvcnQgaXMgbG9ja2VkLCBzbyB3ZSBjYW4g
cmVtb3ZlIHRoZSBleHRyYSBibG9ja2luZw0KPiBhcm91bmQgdGhlIGxvY2svdW5sb2NrIHNlcXVl
bmNlLg0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBp
bnRlbC5jb20+DQoNCj4gDQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdGMuYyB8
IDQgLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF90Yy5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF90Yy5jDQo+IGluZGV4IDNmZWZkMDBlMDQ2ODUuLjk5
YjY2YzI4NTJlNTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfdGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Rj
LmMNCj4gQEAgLTcxOSwxNiArNzE5LDEyIEBAIGJvb2wgaW50ZWxfdGNfcG9ydF9jb25uZWN0ZWQo
c3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIpDQo+ICB7DQo+ICAJc3RydWN0IGludGVsX2Rp
Z2l0YWxfcG9ydCAqZGlnX3BvcnQgPSBlbmNfdG9fZGlnX3BvcnQoZW5jb2Rlcik7DQo+ICAJYm9v
bCBpc19jb25uZWN0ZWQ7DQo+IC0JZW51bSBpbnRlbF9kaXNwbGF5X3Bvd2VyX2RvbWFpbiBkb21h
aW47DQo+IC0JaW50ZWxfd2FrZXJlZl90IHRjX2NvbGRfd3JlZjsNCj4gIA0KPiAgCWludGVsX3Rj
X3BvcnRfbG9jayhkaWdfcG9ydCk7DQo+IC0JdGNfY29sZF93cmVmID0gdGNfY29sZF9ibG9jayhk
aWdfcG9ydCwgJmRvbWFpbik7DQo+ICANCj4gIAlpc19jb25uZWN0ZWQgPSB0Y19wb3J0X2xpdmVf
c3RhdHVzX21hc2soZGlnX3BvcnQpICYNCj4gIAkJICAgICAgIEJJVChkaWdfcG9ydC0+dGNfbW9k
ZSk7DQo+ICANCj4gLQl0Y19jb2xkX3VuYmxvY2soZGlnX3BvcnQsIGRvbWFpbiwgdGNfY29sZF93
cmVmKTsNCj4gIAlpbnRlbF90Y19wb3J0X3VubG9jayhkaWdfcG9ydCk7DQo+ICANCj4gIAlyZXR1
cm4gaXNfY29ubmVjdGVkOw0KDQo=
