Return-Path: <SRS0=p/WI=DH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD321C4363D
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 22:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D51E20719
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2020 22:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D51E20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F1589C9A;
	Wed, 30 Sep 2020 22:48:14 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59F089C9A
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 22:48:13 +0000 (UTC)
IronPort-SDR: k+a30sJrlIPKg4fysWvrqdKxR3dARXKXBt+GCJO0xebSRe4OWX47LppKr8rU44lNuydA2ywfNz
 zkmhZ1LjE/3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="142573877"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="142573877"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 15:48:11 -0700
IronPort-SDR: 1/j8KScwYdHSIsDnHRtVUxZZ2V3/d7+stc44QFrgqSuWOqWHe0k7g6B6e5KGSs2iEL4yhxzxxf
 /bh6lWE6XEEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="515245123"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2020 15:48:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 30 Sep 2020 15:48:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 30 Sep 2020 15:48:09 -0700
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Wed, 30 Sep 2020 15:48:09 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Fix TGL DKL PHY DP vswing handling
Thread-Index: AQHWl3pnU8oyFszudUqF+d3Fat8oj6mCPtoA
Date: Wed, 30 Sep 2020 22:48:09 +0000
Message-ID: <3871b064c448fb07fa21efb5c2af0f5a26c841c4.camel@intel.com>
References: <20200930223642.28565-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200930223642.28565-1-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-ID: <48B422576FD3E84E8B2726F3F7DA9378@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix TGL DKL PHY DP vswing handling
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTEwLTAxIGF0IDAxOjM2ICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPA0KPiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bQ0KPiA+DQo+IA0KPiBUaGUgSERNSSB2cy4gbm90LUhETUkgY2hlY2sgZ290IGludmVydGVkIHdo
ZW0gdGhlIGJvZ3VzIGVuY29kZXItPnR5cGUNCj4gY2hlY2tzIHdlcmUgZWxpbWluYXRlZC4gU28g
bm93IHdlJ3JlIHVzaW5nIDAgYXMgdGhlIGxpbmsgcmF0ZSBvbiBEUA0KPiBhbmQgcG90ZW50aWFs
bHkgbm9uLXplcm8gb24gSERNSSwgd2hpY2ggaXMgZXhhY3RseSB0aGUgb3Bwb3NpdGUgb2YNCj4g
d2hhdCB3ZSB3YW50LiBUaGUgb3JpZ2luYWwgYm9ndXMgY2hlY2sgYWN0dWFsbHkgd29ya2VkIG1v
cmUgY29ycmVjdGx5DQo+IGJ5IGFjY2lkZW50IHNpbmNlIGlmIHdvdWxkIGFsd2F5cyBldmFsdWF0
ZSB0byB0cnVlLiBEdWUgdG8gdGhpcyB3ZQ0KPiBub3cgYWx3YXlzIHVzZSB0aGUgUkJSL0hCUjEg
dnN3aW5nIHRhYmxlIGFuZCBuZXZlciBldmVyIHRoZSBIQlIyKw0KPiB2c3dpbmcgdGFibGUuIFRo
YXQgaXMgcHJvYmFibHkgbm90IGEgZ29vZCB3YXkgdG8gZ2V0IGEgaGlnaCBxdWFsaXR5DQo+IHNp
Z25hbCBhdCBIQlIyKyByYXRlcy4gRml4IHRoZSBjaGVjayBzbyB3ZSBwaWNrIHRoZSByaWdodCB0
YWJsZS4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4NCg0KPiBDYzogDQo+IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gDQo+
IENjOiBWYW5kaXRhIEt1bGthcm5pIDwNCj4gdmFuZGl0YS5rdWxrYXJuaUBpbnRlbC5jb20NCj4g
Pg0KPiBDYzogVW1hIFNoYW5rYXIgPA0KPiB1bWEuc2hhbmthckBpbnRlbC5jb20NCj4gPg0KPiBG
aXhlczogOTQ2NDFlYjZjNjk2ICgiZHJtL2k5MTUvZGlzcGxheTogRml4IHRoZSBlbmNvZGVyIHR5
cGUgY2hlY2siKQ0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPA0KPiB2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbQ0KPiA+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RkaS5jDQo+IGluZGV4IDRkMDYxNzhjZDc2Yy4uY2RjYjdiMTAzNGFlIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gQEAgLTI3NDIsNyAr
Mjc0Miw3IEBAIHRnbF9ka2xfcGh5X2RkaV92c3dpbmdfc2VxdWVuY2Uoc3RydWN0IGludGVsX2Vu
Y29kZXIgKmVuY29kZXIsIGludCBsaW5rX2Nsb2NrLA0KPiAgCXUzMiBuX2VudHJpZXMsIHZhbCwg
bG4sIGRwY250X21hc2ssIGRwY250X3ZhbDsNCj4gIAlpbnQgcmF0ZSA9IDA7DQo+ICANCj4gLQlp
ZiAodHlwZSA9PSBJTlRFTF9PVVRQVVRfSERNSSkgew0KPiArCWlmICh0eXBlICE9IElOVEVMX09V
VFBVVF9IRE1JKSB7DQo+ICAJCXN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAgPSBlbmNfdG9faW50
ZWxfZHAoZW5jb2Rlcik7DQo+ICANCj4gIAkJcmF0ZSA9IGludGVsX2RwLT5saW5rX3JhdGU7DQo+
IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwt
Z2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
