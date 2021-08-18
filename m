Return-Path: <SRS0=K2GL=NJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B25AC4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 21:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4A3610CD
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Aug 2021 21:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D4A3610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AE06E8D1;
	Wed, 18 Aug 2021 21:37:40 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721308930E
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Aug 2021 21:35:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="277455512"
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="277455512"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 14:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="424381175"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 18 Aug 2021 14:35:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 18 Aug 2021 14:35:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 18 Aug 2021 14:35:55 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.010;
 Wed, 18 Aug 2021 14:35:55 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/adl_p: Also disable underrun
 recovery with MSO
Thread-Index: AQHXkt8er5cYewL2BUeH2Hdz2e63J6t6QwYA
Date: Wed, 18 Aug 2021 21:35:55 +0000
Message-ID: <44704aac36d264f17d5673bf844310d1154ea49e.camel@intel.com>
References: <20210816204112.2960624-1-matthew.d.roper@intel.com>
In-Reply-To: <20210816204112.2960624-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B4A4F3C4848954E907790BB0403E609@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/adl_p: Also disable underrun
 recovery with MSO
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

T24gTW9uLCAyMDIxLTA4LTE2IGF0IDEzOjQxIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
bmUgb2YgdGhlIGNhc2VzIHRoYXQgdGhlIGJzcGVjIGxpc3RzIGZvciB3aGVuIHVuZGVycnVuIHJl
Y292ZXJ5IG11c3QgYmUNCj4gZGlzYWJsZWQgaXMgIkNPRzsiIHRoYXQgbm90ZSBhY3R1YWxseSBy
ZWZlcnMgdG8gZURQIG11bHRpLXNlZ21lbnRlZA0KPiBvcGVyYXRpb24gKE1TTykuICBMZXQncyBl
bnN1cmUgdGhlIHRoaXMgYWRkaXRpb25hbCByZXN0cmljdGlvbiBpcw0KPiBob25vcmVkIGJ5IHRo
ZSBkcml2ZXIuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4NCg0KPiANCj4gQnNwZWM6IDUwMzUxDQo+IENjOiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBGaXhlczogYmEzYjA0OWY0Nzc0
ICgiZHJtL2k5MTUvYWRsX3A6IEFsbG93IHVuZGVycnVuIHJlY292ZXJ5IHdoZW4gcG9zc2libGUi
KQ0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5j
IHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGluZGV4IGEyNTdl
NWRjMzgxYy4uMTM0YTZhY2JkOGZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBAQCAtMjIyNiw2ICsyMjI2LDkgQEAgc3RhdGljIGJv
b2wgdW5kZXJydW5fcmVjb3Zlcnlfc3VwcG9ydGVkKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0
YXRlICpjcnRjX3N0YXQNCj4gIAlpZiAoY3J0Y19zdGF0ZS0+aGFzX3BzcjIpDQo+ICAJCXJldHVy
biBmYWxzZTsNCj4gIA0KPiArCWlmIChjcnRjX3N0YXRlLT5zcGxpdHRlci5lbmFibGUpDQo+ICsJ
CXJldHVybiBmYWxzZTsNCj4gKw0KPiAgCXJldHVybiB0cnVlOw0KPiAgfQ0KPiAgDQoNCg==
