Return-Path: <SRS0=MV7T=MT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64926C4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 22:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27BE960F5E
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 22:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27BE960F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90836E08E;
	Tue, 27 Jul 2021 22:07:00 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E596E08E
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Jul 2021 22:06:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="212260317"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="212260317"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 15:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="663045627"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2021 15:06:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 27 Jul 2021 15:06:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 15:06:57 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2242.010;
 Tue, 27 Jul 2021 15:06:57 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH 1/1] drm/i915/dmc: Bump ADLP DMC version to
 v2.11
Thread-Index: AQHXgxjxvkQ7T+pkrEK7kazuxohBYKtX19eA
Date: Tue, 27 Jul 2021 22:06:57 +0000
Message-ID: <e510eb572397df58b92547c1fa30ad65f83dbbb1.camel@intel.com>
References: <20210727185505.17276-1-anusha.srivatsa@intel.com>
 <20210727185505.17276-2-anusha.srivatsa@intel.com>
In-Reply-To: <20210727185505.17276-2-anusha.srivatsa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-ID: <0771BFC211E15243A6F869C968019303@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/dmc: Bump ADLP DMC version to
 v2.11
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

T24gVHVlLCAyMDIxLTA3LTI3IGF0IDExOjU1IC0wNzAwLCBBbnVzaGEgU3JpdmF0c2Egd3JvdGU6
DQo+IFJlbGVhc2Ugbm90ZXMgbWVudGlvbiB0aGF0IHRoaXMgdmVyaW9uIGhhczoNCj4gLSBGaXhl
cyBmb3IgREM2diBpc3N1ZS4NCj4gLSBGbGlwIHF1ZXVlIGVuYWJsZWQgb24gcGlwZSBDIGFuZCBw
aXBlIEQuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NCg0KPiANCj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogQW51c2hhIFNyaXZhdHNhIDxhbnVzaGEuc3JpdmF0c2FAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZG1jLmMg
fCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kbWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZG1jLmMNCj4gaW5k
ZXggOTg5NWZkOTU3ZGY5Li42MDFjMzBiOTI3MzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZG1jLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kbWMuYw0KPiBAQCAtNDUsOCArNDUsOCBAQA0KPiAgDQo+ICAjZGVm
aW5lIEdFTjEyX0RNQ19NQVhfRldfU0laRQkJSUNMX0RNQ19NQVhfRldfU0laRQ0KPiAgDQo+IC0j
ZGVmaW5lIEFETFBfRE1DX1BBVEgJCQlETUNfUEFUSChhZGxwLCAyLCAxMCkNCj4gLSNkZWZpbmUg
QURMUF9ETUNfVkVSU0lPTl9SRVFVSVJFRAlETUNfVkVSU0lPTigyLCAxMCkNCj4gKyNkZWZpbmUg
QURMUF9ETUNfUEFUSAkJCURNQ19QQVRIKGFkbHAsIDIsIDExKQ0KPiArI2RlZmluZSBBRExQX0RN
Q19WRVJTSU9OX1JFUVVJUkVECURNQ19WRVJTSU9OKDIsIDExKQ0KPiAgTU9EVUxFX0ZJUk1XQVJF
KEFETFBfRE1DX1BBVEgpOw0KPiAgDQo+ICAjZGVmaW5lIEFETFNfRE1DX1BBVEgJCQlETUNfUEFU
SChhZGxzLCAyLCAwMSkNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ2Z4Cg==
